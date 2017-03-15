function get_input_buffer(filename)
    local file = io.open(filename)
    local buffer = file:read("a")
    file:close()
    return buffer
end

function set_output_buffer(buffer, filename)
    local file = io.open(filename, "w")
    file:write(buffer)
    file:close()
end

function sanitize(title)
  return title:gsub("^[%s%W]*(.+)[%s%W]*$", "%1"):gsub("%.", " ")
end

function get_metadata(raw)
    local title = sanitize(raw:match("<title>(.*)</title>"))
    local post_info = raw:match('<div class%=%"post%-info%">(.*)</div><%!--')
    local fulldate_lastedit = sanitize(post_info:match('<%!%-%-(.-)%-%-%>'))
    local fulldate_publish = sanitize(post_info:match('%"published.->(.*)<%/abbr>'))
    local tags
    for tag in post_info:gmatch("%/tag%/.->(.-)<%/a>") do
        tags = tags and tags .. ", " or ""
        tags = string.format("%s%s", tags, tag)
    end
    return title, fulldate_lastedit, fulldate_publish, tags
end

function get_raw_article(data)
    local content = data:match('"entry%-content">(.*)<div class%="post%-info')
    content = content:gsub("<p>", "")
    content = content:gsub("</p>", "\n")
    content = content:match("%s*(.*)%s*")
    return content
end

-- Do blockquote
function _handle_html_blockquote(article)
    for meta, text in article:gmatch('(<blockquote.->(.-)<%/blockquote>)') do
        local fixed = string.format("::\n\t%s", text:gsub("\n", "\n  "))
        meta = meta:gsub("[%p]", ".")
        article = article:gsub(meta, string.format('%s\n', fixed))
    end
    return article
end

function _handle_html_images(article)
    local images = ""
    for meta, alt, src in article:gmatch('(<img.-alt="(.-)".-src="(.-)" />)') do
        local name = src:match(".*%/(.-)%.png")
        images = string.format("%s.. |%s| image:: %s\n\t:alt: %s\n",
                               images, name, src, alt)
        -- as meta will be used as pattern, we need to clean up magic chars
        meta = meta:gsub("[%p]", ".")
        article = article:gsub(meta, string.format('|%s|', name))
    end
    return article, images
end

function _handle_html_links(article)
    local links = ""
    for meta, link, name in article:gmatch('(<a.-href="(.-)">(.-)</a>)') do
        name = name:gsub("\n", " ")
        links = string.format("%s.. _%s: %s\n", links, name, link)
        -- as meta will be used as pattern, we need to clean up magic chars
        meta = meta:gsub("[%p]", ".")
        article = article:gsub(meta, string.format('`%s`_', name))
    end
    return article, links
end

-- Do some html2rst easy replacements
function _html_2_rst(article)
    local html2rst = {
        { html="<em>", rst="*" },
        { html="</em>", rst="*" },
        { html="<strong>", rst="**" },
        { html="</strong>", rst="**" },
    }
    for _, pair in ipairs(html2rst) do
        article = article:gsub(pair.html, pair.rst)
    end
    return article
end

function _handle_html_footnotes(article)
    local footnotes = ""
    for meta in article:gmatch('(<table class="docutils footnote".-</table>)') do
        for name, text in meta:gmatch('<td class="label"><a class.->(.-)</a>.-<td>(.-)</td>') do
            footnotes = string.format("%s.. _%s: %s\n", footnotes, name, text)
        end
        -- as meta will be used as pattern, we need to clean up magic chars
        meta = meta:gsub("[%p]", ".")
        article = article:gsub(meta, "")
    end
    for meta, name in article:gmatch('(<a class="footnote%-reference".->(.-)</a>)') do
        meta = meta:gsub("[%p]", ".")
        article = article:gsub(meta, string.format('`%s`_', name))
    end
    return article, footnotes
end

function _handle_html_lists(article)
    local html2remove = { "<ul class.->", "</ul>", "</li>" }
    for meta in article:gmatch('(<ul class="simple">.-<%/ul>)') do
        local fixed = meta
        for _, token in ipairs(html2remove) do
            fixed = fixed:gsub(token, "")
        end
        fixed = fixed:gsub("<li>", "\n- ")
        -- as meta will be used as pattern, we need to clean up magic chars
        meta = meta:gsub("[%p]", ".")
        article = article:gsub(meta, string.format('%s', fixed))
    end
    return article
end

function get_article(raw)
    local links = {}
    local images = {}
    local footnotes = {}

    local article = _html_2_rst(raw)
    article = _handle_html_blockquote(article)
    article = _handle_html_lists(article)
    article, footnotes = _handle_html_footnotes(article)
    article, images = _handle_html_images(article)
    article, links = _handle_html_links(article)
    return article, links, images, footnotes
end

-- input: lua pelican-html2rst.lua your-downloaded-post-in.html
-- output: your-downloaded-post-in.rst
local input = arg[1]
local output = input:gsub("(.*).html", "%1.rst")

-- As I used 4 digits as identifier for my posts, I'll use them as slug
-- e.g 1703 -> year: 2017, post 03
local slug = input:match("%d+")

-- Default category as I don't need to tweak this now
local category = "blog"

-- Clean text and formated strings for related metadata
local raw_html_data = get_input_buffer(input)
local title, lastedit, published, tags = get_metadata(raw_html_data)
local raw_article = get_raw_article(raw_html_data)
local article, links, images, footnotes = get_article(raw_article)

-- For the last modified metadata
local now = os.date("%A, %B %d, %Y %H:%M")

local template = [[
%s
%s

:date: %s
:modified: %s
:tags: %s
:category: %s
:slug: %s

%s

%s

%s

%s
]]

-- FIXME: A better way should stay on sanitize() function
published = published:gsub("(.+%d).*", "%1")
local buffer = string.format(template, title, string.rep("#", #title),
                             published, now, tags, category, slug,
                             links, images, article, footnotes)
-- FIXME: There should be a better way to do this too.
local n = 1
while n and n > 0 do
    buffer, n = buffer:gsub("%s%s%s", "\n\n")
end

-- TODO: I don't need to tweak extra arguments but --dry-run and --category
-- might be handy
if arg[2] then
    print(buffer)
else
    set_output_buffer(buffer, output)
end
