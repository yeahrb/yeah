Yeah
====
A practical Ruby game framework in its early stages.

Any version below 1.0.0 is unstable and lacks backward compatibility.

Installing
----------
Install Yeah with `gem install yeah`.

Overview
--------
Yeah is a collection of utilities and abstractions designed to aid in the creation of compelling video games.

Commands perform common utility tasks.

  * `yeah new <project name>` generates the files and folders for a project.
  * `yeah run` runs a game project.
  * `yeah build` builds ready-to-go packages for every platform available.

These abstractions are helpful for building video games.

  * Context - interface to media and input layers for a platform.
  * Game - manages context and stages.
  * Stage - manages entities in space.
  * Entity - acts within a stage.
  * Visual - graphical representation of an entity.
  * Vector - for representing position, size, velocity...
  * Color - accepts hex, RGB, HSV, and Wikipedia names.

The Plan
--------
  1. Game data logistics
  2. WebCanvas context
  3. Continuous improvement of framework code and API
