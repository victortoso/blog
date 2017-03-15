GSoC Report #6 and #7
#####################

:date: Tuesday, July 15, 2014 02:58
:modified: Wednesday, March 15, 2017 09:50
:tags: grilo, musicbrainz, acoustid
:category: blog
:slug: 1407

.. _my grief: http://sadbrazilians.tumblr.com/
.. _MusicBrainz: https://musicbrainz.org/
.. _AcoustID: http://acoustid.org/
.. _Check it out!: https://oxygene.sk/2011/01/how-does-chromaprint-work/
.. _functional-example: https://bitbucket.org/acoustid/chromaprint/src/master/examples/fpcalc.c
.. _GStreamer: http://gstreamer.freedesktop.org/
.. _manual: http://gstreamer.freedesktop.org/data/doc/gstreamer/head/manual/html
.. _Chromaprint plugin: https://oxygene.sk/2011/01/chromaprint-plug-in-for-gstreamer/
.. _here: https://bugzilla.gnome.org/show_bug.cgi?id=732879
.. _is here: https://github.com/victortoso/totem-tvshows

**Tuesday...**

Two weeks without posting again! Can I use as an excuse `my grief`_ for Brazil
in this World Cup!? :) Well, actually I was somewhat busy studying... I'll share
what in a moment.

In order to talk about what I'm working on I would like to explain one
interesting feature that Grilo has.

**Cool thing in Grilo?**

You may know that Grilo uses plugins to fetch useful data to your application!
Great. What you may not know is that Grilo can combine the use of its plugins to
resolve what the application want!

Let me explain.

The TVDB can provide tons of interesting metadata for your TV Shows but to do
so, It needs some keys in order to find your TV Show in its database like the
name of the show the season and the episode that you are watching.

Cool thing that there is a Grilo plugin called local-metadata which try to get
as much data as possible from the file name. For instance, It is easy to
local-metadata to gather all metadata necessary to The TVDB from files like:

Boardwalk.Empire.S04E01.HDTV.x264-2HD.mp4;
Adventure Time - 2x01 - It Came from the Nightosphere.mp4
etc...

**MusicBrainz**

Well, I'll be working in a `MusicBrainz`_ plugin to Grilo which will be very
useful for several applications indeed. But from a music file, how you identify
Author, Artist or anything?

One cool way is checking the audio fingerprint!

`AcoustID`_ has an Open database accessible through a webservice to get the
MusicBrainz Track ID from your audio fingerprint!

So, this is pretty much similar of the example above with the TVDB and
local-metadata. The AcoustID will provide the MusicBrainz ID of the track and
the MusicBrainz plugin will use this to get all metadata necessary. Cool, right?

Out of curiosity I read this awesome blog post which explains how the
fingerprint are calculated and how the AcoustID use that to search in its
database. `Check it out!`_

**AcoustID 1/2**

So, in order to generate the fingerprint as AcoustID needs, It is necessary to
read the entire music file while providing the raw data to the chromaprint
library.

My first attempt to do that was using the libraries of ffmpeg as I already had
some background with it and also a `functional-example`_ in hands.

Of course it was a bad decision to implement such thing without talking with
Bastien first :)

He has explained a bit of the problems of having ffmpeg as dependency...

**AcoustID 2/2**

Then I started doing one thing that I was postponing for some time: learning
`GStreamer`_.

I read the `manual`_ and in its examples in order to understand how it works and
what would be the best way to implement the AcoustID.

In the end, there was already a `Chromaprint plugin`_!

The result is smaller but faster application then my previous work with ffmpeg
:-)

You can check the current AcoustID plugin `here`_.

**Okay and what about that GNOME Video UI**

Well, yes. I'm trying.

The current code `is here`_, seriously, I want to make this work with CSS but
somehow it is not working properly.

For instance, I can change the attributes for all GtkLabel but I can't change a
specific GtkLabel alone.

I can't tell how glad I was after checking the GUADEC schedule and see the &quot;GTK
and CSS&quot; talk from Benjamin Otte. I'll be there, for sure!

I think that's all folks,

