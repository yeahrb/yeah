Yeah
====
A practical Ruby game framework in its early stages.

Any version below 1.0.0 is unstable and lacks backward compatibility.

Installing
----------
Yeah depends on SDL, so you must install it. [Here are helpful instructions for installing SDL](https://github.com/rubygame/rubygame/wiki/Install).

Install Yeah with `gem install yeah`.

Overview
--------
Yeah is a collection of utilities and abstractions that aid in the creation of compelling video games.

Commands perform common utility tasks.

  * `yeah new <project name>` generates the files and folders for a project.
  * `yeah run` runs a game project.
  * `yeah build` builds ready-to-go packages for every platform available.

These intuitive abstractions are a good fit for many types of games.

  * Context - interface to media and input layers for a platform.
  * Game - manages context and stages.
  * Stage - manages entities in space.
  * Entity - acts within a stage.
  * Visual - graphical representation of an entity.
  * Vector - for representing position, size, velocity...
  * Color - accepts hex, RGB, HSV, and Wikipedia names.

Roadmap
-------
  1. Get this to the point where one can gracefully hack on crude games.
  2. Make the code clean and robust.
  3. Make the creation of retro 2D games feasible.
  4. Write the HTML5 backend.

Contributing
------------
Do you know how to improve Yeah? Open an issue!
