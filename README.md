MOVIE-SUBTITLE
==============

Ruby script to separate a movie sub-title file containing German and French
sub-title into two (2) separate files.


Requirements
------------

We have lots of subtitle files such as the ones attached. They are combined in two languages. First line: German, Second line french. I need a script which creates two new files one with only German and one with only French.

Syntax is very simple:

What is now in one file:

00:02:55,160 --> 00:02:57,160
Ich wollte zu Marina.
Je cherche Marina...

Should become two new files:

00:02:55,160 --> 00:02:57,160
Ich wollte zu Marina.

and

00:02:55,160 --> 00:02:57,160
Je cherche Marina...

I need a solution which runs on MacOS X. I think it would be the simplest way to write a AppleScript. We would be happy to get an offer with a fixed price.




Run Script
----------

    ruby <script-name> <source srt filename>

    ruby  bin/movie-subscript.rb sample-data/Abrir\ puertas\ y\ ventanas\ 1A.srt




Copyright 2012, Chris Stansbury

