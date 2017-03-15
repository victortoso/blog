GSoC 2014 Report #1 - The TVDB
##############################

:date: Saturday, May 24, 2014 23:34
:modified: Wednesday, March 15, 2017 09:50
:tags: grilo, the-tvdb
:category: blog
:slug: 1403

.. _part of it: https://wiki.gnome.org/Outreach/SummerOfCode/2014/Projects/VictorToso_VideosAndMusicWithGrilo
.. _The TVDB: http://thetvdb.com/
.. _House: http://thetvdb.com/?tab=series&amp;amp;id=73255
.. _Breaking Bad: http://thetvdb.com/?tab=series&amp;amp;id=81189&amp;amp;lid=7
.. _Naruto: http://thetvdb.com/?tab=series&amp;amp;id=78857&amp;amp;lid=7
.. _Evangelion: http://thetvdb.com/?tab=series&amp;amp;id=70350&amp;amp;lid=7
.. _bugzilla: https://bugzilla.gnome.org/show_bug.cgi?id=672933

**Start**

This is the first weekend since the beginning of GSoC coding period and it has
been satisfactory. For those that have no clue on what I'll be working on this
summer, `part of it`_ is implementing TV Shows support in GNOME Videos!

In order to provide all information necessary to the interface, we will be using
Grilo with the `The TVDB`_ source which is what I'm working on at the moment.

**The TVDB**

The TVDB is an &amp;quot;open database for television fans&amp;quot; and it is just awesome. This
database provides tons of information and images of series and episodes in
several languages. It is a great source for Grilo and will fulfill completely
our need.

I strongly recommend a little browsing in the image gallery which has banners,
fan art, posters like `House`_, `Breaking Bad`_. They have animes too like `Naruto`_
or `Evangelion`_.

**Grilo Source: grl-thetvdb**

The first version is up on `bugzilla`_ not ready to upstream yet but it is
functional. At this stage I'm not holding the data locally in any form. Every
time the application request something to grl-thetvdb it will fetch the data
from thetvdb.com which is poor design.

But thats all I've got for this first week!

