GSoC last week, GNOME final report! :)
######################################

:date: Saturday, September 21, 2013 00:34
:modified: Wednesday, March 15, 2017 09:50
:tags: grilo, gsoc, gnome, metrolyrics, flickr
:category: blog
:slug: 1307

.. _I told before: http://www.victortoso.com/planet-gsoc-project-and-brazil.html
.. _Metrolyrics: http://www.metrolyrics.com/
.. _Flickr: https://www.flickr.com/
.. _oauth: http://en.wikipedia.org/wiki/OAuth
.. _Juan: http://www.igalia.com/nc/igalia-247/igalian/item/jasuarez/
.. _timeline: http://www.google-melange.com/gsoc/events/google/gsoc2013

.. |grilo-cricket| image:: /imgs/2013/grilo-cricket.png
	:alt: Grilo is a bug!

It's been a while since my last post just after GUADEC. I've lost some time in
August due moving to a new place in Campinas with two friends of mine. It was
three weeks ago and I'm still feeling tired (I'm taking some time to get used
with this new place).

Since then, I'm working on grilo-plugins and this post is all about what I've
accomplished and what are the next steps after GSoC.

*(The post is bigger then usual so... grab a cup of coffee !)*

As `I told before`_, Grilo has some commands that are translated to the source
like Search and Browse operations. Good part of my project was translating this
commands from Grilo to the Lua source and the result of this work was the
lua-factory plugin.

The subset of commands available to Lua sources are: Search, Browse, Query,
Resolve, May Resolve, Store and Remove. I've developed two Lua sources that
implement those commands besides the last two (Store and Remove) due a library
dependency that will be commented bellow.

Those Lua sources are `Metrolyrics`_ and `Flickr`_ which already exists as C source.

Due the limitations of the standards libraries of Lua and the need of
interaction with Grilo itself the lua library was created. This is a set of lua
modules that are helpful for the developers. Those modules could be wrappers of
C librarys or custom functions.

For instance, to be able to interact with Flickr web service a wrapper of
`oauth`_ library was created;

And all this were just the first steps;

**Current issues that should be improved**

The main goal of the GSoC project was being able to write plugins with Lua and
them should be transparent to Grilo, making no difference between a C or Lua
source. I feel that was accomplished but no without problems, lets check some of
them `[1]`_:

- The annoying userdata: To perform the callback from Lua source to the
  Application, we need to store the userdata passed from lua-factory somehow.
  There are a couple of ways of doing it but I didn't made it work before GUADEC
  and it was kind of low priority after; For instance, the Search operation in
  Lua should be a function called grl_source_search() wich have two parameters:
  (1) a Table with the data that the functions need; (2) An userdata which is a
  pointer to a structure in C (which is no useful  for Lua code); A better
  approach is storing this in the Lua stack, hiding from lua code;

- Improving the GrlNet library with the possibility to POST content to the web.
  This was the reason that I didn't implement Store and Remove in the Lua Flickr
  source :(

- A better callback implementation (or a totally different one). This is one of
  the topics I talked with `Juan`_ in GUADEC and this could actually be expanded
  to Grilo itself so, I'll keep it to another post;

- More sources! In order to be sure that this code is trustable a few more
  sources are needed; They will be implemented after the two first topics!
  `[2]`_

**The last week of GSoC Period**

This week I'm not writing much code but trying to make a useful documentation to
help other developers.

But as we can see in google's `timeline`_, next week I'll be submitting the source
code I've developed so far.

It will be the last week of GSoC but not my last in Grilo or in this project.
Hopefully, I'll have a few more improvements in the end of October!

A big thanks to Juan for all the feedback, help and insights! I've made big
steps these last three months and you help me out everytime :)

**Final considerations**

I've enjoyed a lot this period! I've learnt a lot! I've met amazing people! I've
traveled more then 10'000Km to a beautiful city to attend a super conference!
I've learnt Lua (and loving it!)

I'm lucky. Thanks to GNOME and Google for that!

Wow, you made it till here. You can reclaim a beer in the next GUADEC!

Did you know ? Grilo is a type of bug in Brazil ? A Cricket !

|grilo-cricket|

.. _[1]: If the reader see more problems not listed, feel free to comment it !
.. _[2]: If the reader want to see a source implemented to Grilo, tell me! I'm
         kind of building a small list :)

