The unpredictable, GSoC report and next steps
#############################################

:date: Wednesday, July 17, 2013 22:56
:modified: Wednesday, March 15, 2017 09:50
:tags: gsoc, gnome, grilo, metrolyrics
:category: blog
:slug: 1305

.. _Metrolyrics: http://www.metrolyrics.com/
.. _don't remember: http://www.victortoso.com/planet-gsoc-project-and-brazil.html
.. _Soundcloud: https://soundcloud.com/
.. _Last.fm: http://www.last.fm/

Oh boy, there are things that can slow you down. It's been three weeks since my
last post, in this short period of time I had a car accident
( I'm 100% alright! ), one root canal treatment (with a good dose of pain), my
girlfriend moved to another city... Oh well, too many headaches in three weeks!

But when I was in good mood (or healthy enough) here I was, in front of this
screen trying to make good code to Grilo... and I like the achievements so far.
Lets take a look.

I started to implement the `Metrolyrics`_ plugin before writing any C code to
Grilo in order to have a lua-based plugin to use. A lot of this plugin has
changed to work with lua-factory. For those who `don't remember`_, lua-factory
is part of grilo-plugins, and it is the glue-code in charge to load-and-use the
lua-plugins.

In this moment, we can use the 'Search', 'Browse', 'Query' and 'Resolve'
operations from Grilo to this lua-plugin.

As the lua code needs some help from C to perform a few operations, lua-library
was created to be a module to lua. This module has two functions implemented:
Fetch, to perform async fetch from web and Callback, to return the content to
the application.

A lot has to be done yet. Hopefully without any personal headache :)

For instance:

# 'Store' and 'Remove' operations must be implemented in lua-factory;
# Log and Error functions to the lua-library;
# Better care with user configs, metadata-keys
# Solving some problems with UTF-8 chars

I will be writing a new lua-plugin this week and I'm trying to choose between
`Soundcloud`_ or `Last.fm`_. Both have the necessary features to be implemented
that Metrolyrics lacks for Grilo.

Well, I intend to make my next post in Brno before GUADEC and another post after
with much more GNOMExperience...

