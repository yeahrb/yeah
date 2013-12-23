Yeah
====
A practical Ruby game framework in its early stages.

Any version below 1.0.0 should be considered unstable and lacking backward compatibility.

Installing
----------
Install Yeah with `gem install yeah`.

Overview
--------
Yeah is designed to be the ideal base on which to build compelling video games.

  * Favors convention over configuration
  * Prioritizes clean and readable code
  * Comprehensively unit tested

### Command-line utilities

  * `yeah new <project name>` generates the files and folders for a project.
  * `yeah run` runs a game project.
  * `yeah build` builds ready-to-go packages for every platform available.

### Abstractions

  * Context - interface to media and input layers for a platform.
  * Game - manages context and stages.
  * Stage - manages entities in space.
  * Entity - acts within a stage.
  * Visual - graphical representation of an entity.
  * Vector - used to represent position, size, velocity...
  * Color - accepts hex, RGB, HSV, and Wikipedia names.

The Plan
--------
  1. Game data logistics
  2. WebCanvas context
  3. Continuous improvement of framework code and API
