---
category : blog
date     : 2014-06-25T23:34:00-03:00
slug     : 1406
tags     : [grilo, the-tvdb, gtk, totem]
title    : "GSoC Report #4 and #5"
---

## Hey :)

I usually write my posts in the weekend when I do have more time to
think about what I've done and what It is interesting to share. Sadly,
two weekends ago I was ill due something I've eaten and now I'll try to
summarize two weeks in one post!

## The TVDB

Is [now
upstream](https://git.gnome.org/browse/grilo-plugins/commit/?id=b2b937413a26a0fe2ad18891a27a30a35b12b26b).
Yay!

The main care after implementing the cache with Gom was handling
multiple requests of the same TV Show in a short period of time
(concurrency).

For instance, you are browsing some TV Show using some application that
uses Grilo to requests metadata. It may occur several requests of the
same tv show like, episode 01, episode 02, etc.

We are handling this by fetching the TVDB only once to gather all
existing data and then resolve the later requests with the cache.

Quite nice, lots of fun implementing it.

## The Integration with the UI

I have realized I'm really bad at building UIs and I'm also recognizing
how much effort it is necessary to make a good UI (a lot).

For that, I would like to thank the folks from
[Glade](https://glade.gnome.org/) with the awesome and helpful software.

Well, at the moment I'm implementing a simple program that creates a
Widget to show all interesting information we will be providing on GNOME
Videos. You may check the application
[here](https://github.com/victortoso/totem-tvshows).

## The goal:

![Screenshot of goal](/images/1406-01-totem-widget-goal.png)

## Current status

![Screenshot of current status](/images/1406-02-totem-widget-status.png)

## Life

World cup is going on, traffic jam everywhere but people are in quite
good mood here in Brazil. I'm happier mostly because of my new great
friend, Marvin.

![Marvin is my dog :)](/images/1406-03-marvin.png)
