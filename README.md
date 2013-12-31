Yeah
====
A practical Ruby game framework in its early stages.

Any version below 1.0.0 should be considered unstable and lacking backward compatibility.

Installing
----------
Install Yeah with `gem install yeah`.

Overview
--------
Yeah helps you build video games while keeping you as happy as possible.

  * Convention over configuration - *focus on things that matter*
  * Clean, tight, unit-tested codebase - *maximum hackability*
  * Portable and open source - *lock-in is lame*

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
