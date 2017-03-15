GSoC Report #4 and #5
#####################

:date: Wednesday, June 25, 2014 23:34
:modified: Wednesday, March 15, 2017 09:50
:tags: grilo, the-tvdb, gtk, totem
:category: blog
:slug: 1406

.. _now upstream: https://git.gnome.org/browse/grilo-plugins/commit/?id=b2b937413a26a0fe2ad18891a27a30a35b12b26b
.. _Glade: https://glade.gnome.org/
.. _here: https://github.com/victortoso/totem-tvshows

.. |totem-widget-goal| image:: /imgs/2014/totem-widget-goal.png
	:alt: Screenshot of goal
.. |totem-widget-status| image:: /imgs/2014/totem-widget-status.png
	:alt: Screenshot of current status
.. |marvin| image:: /imgs/2014/marvin.png
	:alt: Marvin is my dog :)

**Hey :)**

I usually write my posts in the weekend when I do have more time to think about
what I've done and what It is interesting to share. Sadly, two weekends ago I
was ill due something I've eaten and now I'll try to summarize two weeks in one
post!

**The TVDB**

Is `now upstream`_. Yay!

The main care after implementing the cache with Gom was handling multiple
requests of the same TV Show in a short period of time (concurrency).

For instance, you are browsing some TV Show using some application that uses
Grilo to requests metadata. It may occur several requests of the same tv show
like, episode 01, episode 02, etc.

We are handling this by fetching the TVDB only once to gather all existing data
and then resolve the later requests with the cache.

Quite nice, lots of fun implementing it.

**The Integration with the UI**

I have realized I'm really bad at building UIs and I'm also recognizing how much
effort it is necessary to make a good UI (a lot).

For that, I would like to thank the folks from `Glade`_ with the awesome and
helpful software.

Well, at the moment I'm implementing a simple program that creates a Widget to
show all interesting information we will be providing on GNOME Videos. You may
check the application `here`_.

The goal
|totem-widget-goal|

Current status!
|totem-widget-status|

**Life**

World cup is going on, traffic jam everywhere but people are in quite good mood
here in Brazil. I'm happier mostly because of my new great friend, Marvin.

|marvin|

