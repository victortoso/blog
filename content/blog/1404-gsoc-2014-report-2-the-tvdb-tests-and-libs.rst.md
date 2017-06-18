---
category : blog
date     : 2014-06-03T01:58:00-03:00
slug     : 1404
tags     : [grilo, the-tvdb]
title    : "GSoC 2014 Report #2 - The TVDB - Tests and Libs"
---

## Keep moving!

One of the great features of the TVDB is all the image gallery that they
have and provide. To get as much interesting data as possible using
Grilo we need to extend our source and a great way to do it is through
creating custom metadata-keys.

With these newly created metadata-keys the TVDB source can now provide
an url to the most voted Fanart, Poster and Banner of the tv show.

## Tests

I had included a few tests in the first week but it was just to show
that the source was usable. The current version of the tests check if
the source is finding the right data in a resolve operation.

Simple enough but helped a lot finding bugs already :)

## Libs

Well, I thought it would be nice to point a few libraries that I have
never used before implementing this source:

-   [Libxml](http://xmlsoft.org/): Yes, never! I always choose JSON when
    available! :) The library has a nice documentation with samples but
    what really helped me was others sources in Grilo. I've also
    realized that I'm not big fan of
    [camelCase](https://twitter.com/jeresig/status/472094314995392512).
-   [Libarchive](http://www.libarchive.org/): I've come to know about
    this library in Planet feed when Bastien posted [about
    it](http://www.hadess.net/2013/12/on-beauty-of-libarchive.html).
    Currently it is also included in Lua-Factory [with a
    function](https://bugzilla.gnome.org/show_bug.cgi?id=728525) which
    provides 'unzip' to lua-sources in Grilo. Quite awesome.
-   [Libgom](https://github.com/chergert/gom/): Awesome but not very
    easy. The examples and
    [the](http://www.audidude.com/blog/2011/03/25/gom-data-mapper.html)
    [blog](http://www.hadess.net/2014/04/what-is-gom.html)
    [posts](http://www.audidude.com/blog/2014/04/12/gom.html) are the
    best documentation. I've started with a simple DB and at this moment
    I'm envolving from there before applying it to the TVDB.

Hopefully I'm going to finish the coding of the TVDB source soon enough
and then I'll be starting the integration with Totem GNOME Videos. I'm
really excited to see all work combined.

## Relax

Beautiful GNOME-shaped soap. Smells so good!

![GNOME Soap](/images/1404-01-gnome-pink.png)
