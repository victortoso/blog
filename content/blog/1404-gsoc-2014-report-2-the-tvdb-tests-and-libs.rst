GSoC 2014 Report #2 - The TVDB - Tests and Libs
###############################################

:date: Tuesday, June 03, 2014 01:58
:modified: Wednesday, March 15, 2017 09:50
:tags: grilo, the-tvdb
:category: blog
:slug: 1404

.. _Libxml: http://xmlsoft.org/
.. _camelCase: https://twitter.com/jeresig/status/472094314995392512
.. _Libarchive: http://www.libarchive.org/
.. _about it: http://www.hadess.net/2013/12/on-beauty-of-libarchive.html
.. _with a function: https://bugzilla.gnome.org/show_bug.cgi?id=728525
.. _Libgom: https://github.com/chergert/gom/
.. _the: http://www.audidude.com/blog/2011/03/25/gom-data-mapper.html
.. _blog: http://www.hadess.net/2014/04/what-is-gom.html
.. _posts: http://www.audidude.com/blog/2014/04/12/gom.html

.. |gnome-pink| image:: /imgs/2014/gnome-pink.png
	:alt: GNOME Soap

**Keep moving!**

One of the great features of the TVDB is all the image gallery that they have
and provide. To get as much interesting data as possible using Grilo we need to
extend our source and a great way to do it is through creating custom
metadata-keys.

With these newly created metadata-keys the TVDB source can now provide an url to
the most voted Fanart, Poster and Banner of the tv show.

**Tests**

I had included a few tests in the first week but it was just to show that the
source was usable. The current version of the tests check if the source is
finding the right data in a resolve operation.

Simple enough but helped a lot finding bugs already :)

**Libs**

Well, I thought it would be nice to point a few libraries that I have never used
before implementing this source:

- `Libxml`_: Yes, never! I always choose JSON when available! :) The library has
  a nice documentation with samples but what really helped me was others sources
  in Grilo.  I've also realized that I'm not big fan of `camelCase`_.

- `Libarchive`_: I've come to know about this library in Planet feed when
  Bastien posted `about it`_. Currently it is also included in Lua-Factory `with
  a function`_ which provides 'unzip' to lua-sources in Grilo. Quite awesome.

- `Libgom`_: Awesome but not very easy. The examples and `the`_ `blog`_ `posts`_
  are the best documentation. I've started with a simple DB and at this moment
  I'm envolving from there before applying it to the TVDB.

Hopefully I'm going to finish the coding of the TVDB source soon enough and then
I'll be starting the integration with Totem GNOME Videos. I'm really excited to
see all work combined.

**Relax**

Beautiful GNOME-shaped soap. Smells so good!

|gnome-pink|

