Planet, GSoC project and Brazil
###############################

:date: Monday, June 24, 2013 02:14
:modified: Wednesday, March 15, 2017 09:50
:tags: gsoc, gnome, grilo, lua
:category: blog
:slug: 1304

.. _Alberto Ruiz: https://wiki.gnome.org/AlbertoRuiz
.. _accepted: http://www.victortoso.com/magnatune-upstream-and-gsoc.html
.. _Grilo: https://live.gnome.org/Grilo
.. _Juan Suarez: https://wiki.gnome.org/JuanSuarez
.. _Lua: http://www.lua.org/
.. _Rafael Fonseca: https://15experience.wordpress.com/
.. _Melissa Wen: https://wiki.gnome.org/MelissaWen

.. |grilo-and-lua-factory| image:: /imgs/2013/grilo-and-lua-factory.png
	:alt: Design of Grilo + Grilo Plugins with Lua-Factory and Lua sources
.. |gnome-cup| image:: /imgs/2013/gnome-cup.png
	:alt: GNOME cup

First of all, hello everybody from Planet Gnome! This is the first post that
will take place there. It is a really nice community where I've been learning
always something new from the past 5 months. I hope I can put some interesting
hacks for you guys.

Thank you `Alberto Ruiz`_ for including me.

I was `accepted`_ in GSoC this year to be working with `Grilo`_. It is a really
nice project which I'm always having some fun while coding. I'm being mentored
by `Juan Suarez`_ who has been always helpful with my problems.

Grilo is basically a framework to get content through plugins. A lot of plugins
were made already and all were written in C. My GSoC project is about making
possible to write plugins in `Lua`_.

About the project itself, I'll be writing a glue-code between Grilo and Lua.
They'll be tagged as lua-factory as the c code dealing with lua; and
grilo-library as a library written in c to be used by the lua-plugins.

I tried to make a simple design to represent how grilo and grilo-plugins works
now and where my code will take place.

|grilo-and-lua-factory|

The 'search' is one of the subset commands that Grilo can request.

The progress in the moment I'm writing this post is that the lyric plugin get
the content (by 'search' and 'browse') and I'm able to load the plugin with my
current lua-factory but can't perform any command yet.

I guest this is it about GSoC for now :)

I would also like to say to those who followed me here, we have at least three
Brazilians interns in GNOME this year: `Rafael Fonseca`_, `Melissa Wen`_ and
myself. Brazil is in such crazy historical moment right now.

If you know absolute nothing about it please do :)

To finish this post, this beautiful GNOME cup that my girlfriend gave to me in
my birthday.

|gnome-cup|

