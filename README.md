Yeah
====
Practical Ruby video game framework in pre-alpha stage.

Installation
------------
Install Yeah with `gem install yeah`.

### Command-line utilities

  * `yeah new <project name>` generates the files and folders for a project.
  * `yeah run` runs a game project.
  * `yeah build` builds ready-to-go packages for every platform available.

### Types

  * Context - interface to media and input layers for a platform.
  * Game - manages context and active stage.
  * Stage - manages entities in space.
  * Entity - acts within a stage.
  * Visual - graphical representation for an entity.
  * Vector - used to represent position, size, velocity...
  * Color - accepts hex, RGB, HSV, and Wikipedia names.
