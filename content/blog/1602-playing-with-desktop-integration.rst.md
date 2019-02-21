---
category : blog
date     : 2016-06-25T15:10:00+02:00
slug     : 1602
tags     : [spice, console-kit, systemd, windows]
title    : Playing with Desktop Integration
type     : "post"
---

Thanks to a bug found in Spice's drag and drop implementation, I was
able to improve the integration of our guest agent (spice-vdagent) with
the Desktop Session on Linux and Windows. I enjoyed the process to solve
those problems so I thought a blog post could be interesting as well.

## The problem

If you use [Spice](www.spice-space.org) you might enjoy the feature of
copying files from your client machine to the guest by simply using the
drag and drop feature. It works pretty well and under the hood we are
sending this data to spice-vdagent which copies it to your Download or
Desktop folder.

The problem is that you could transfer files with drag and drop while
your guest session was Locked
([rhbz\#1323623](https://bugzilla.redhat.com/show_bug.cgi?id=1323623));
even worse, it was also possible to transfer files when your guest were
on Login Screen, when no user was logged in
([rhbz\#1328761](https://bugzilla.redhat.com/show_bug.cgi?id=1328761)).

In order to fix both issues, we need to ask (someone) about the Session
state, the following questions &quot;Is the session Locked?&quot; and
&quot;Does this session belong to a user?&quot;. Let's see how we can do
that.

## Linux Guests

In order to solve this in the best way possible, I did not want to make
integration with specific Desktop Environment (DE) so, I started looking
for a cross Desktop API.

My first try was around *org.freedesktop.ScreenSaver* interface which
worked rather well. I had a few issues that I might be able to
workaround but it did not seem right to request ScreenSaver the state of
your user session.

So I looked at
[logind](https://www.freedesktop.org/wiki/Software/systemd/logind/) from
systemd and there I could find a very promising 'Lock' and 'Unlock'
signals! I checked with *gdbus monitor* if this was being used in my
session with:

```
# get your session path with:
gdbus call --system --dest org.freedesktop.login1 \
           --object-path /org/freedesktop/login1 \
           --method org.freedesktop.login1.Manager.ListSessions

# monitor it
gdbus monitor --system --dest org.freedesktop.login1 \
              --object-path /org/freedesktop/login1/session/_31

# Lock an then Unlock your session with GNOME and see:
/org/freedesktop/login1/session/_31: org.freedesktop.login1.Session.Unlock()
```

So, the Unlock
signal was emitted but not the Lock signal. I thought it could be a bug
so a filed [\#764773](https://bugzilla.gnome.org/show_bug.cgi?id=764773)
to discuss it. It was not a bug and tracking the Lock and Unlock signals
was not the best approach.

After some discussion with halfline we agreed that extending logind
would make things easier. Lennart pointed that having a LockedHint
property with SetLockedHint method would be a nice thing to have.

This would make rather simple to programs like spice-vdagent to query
the Locked state of the Session.

The proposal was
[accepted](https://github.com/systemd/systemd/pull/3238) and works well.
One less bug to solve.

Back to the *bad* transfer over Login screen, that happens because we
have a spice-vdagent running for GDM so we can do things like resizing
the display correctly and as soon as possible.

The solution was rather simple here, all you need to do is to check your
session class. We are only interested in a session that belongs to
&quot;User&quot; and sd\_session\_get\_class() can give you that.

That's it for Linux guests. I also patched our console-kit integration
but I don't plan to comment on it. Take a look in [this
commit](https://cgit.freedesktop.org/spice/linux/vd_agent/commit/?id=49c421a82cebeeb47f268d57d30384e650734ae9)
to check for the session class and [this
one](https://cgit.freedesktop.org/spice/linux/vd_agent/commit/?id=1700c0244f37dc67a48519765543ddd7c3f4c17b)
to check if we are in a Locked session.

Many many thanks to halfline for his time and help, it was really fun.

## Windows

I wasn't excited on the windows part so I postpone for some time but in
the end, It was surprisingly easy. We only have one bug here due the
design difference between our agents: the transfer while Guest is in
Locked screen.

On Windows you can subscribe for session notifications and the event
[WTSRegisterSessionNotification](https://msdn.microsoft.com/en-us/library/aa383841(v=vs.85).aspx)
has WTS\_SESSION\_LOCK and WTS\_SESSION\_UNLOCK types. Very handy.
Minimum requirements say 'Windows Vista' but it works on 'Windows XP' as
well. Super!

As we were already listening to sessions notifications, I only had to
handle the lock/unlock events type
([here](https://cgit.freedesktop.org/spice/win32/vd_agent/commit/?id=5907b6cbb5c724f9729da59a644271b4258d122e)).

## Conclusion

I'm naive. I thought I would have much more work with *Desktop
integration* on Windows then on Linux! I'll be more careful with my
thoughts next time :)

Bugs bugs bugs.
