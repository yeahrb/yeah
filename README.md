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
Yeah is a collection of abstractions, utilities and conventions that aid in the creation of compelling video games.

Commands perform common utility tasks.

  * `yeah new <project name>` generates the files and folders for a project.
  * `yeah run` runs a game project.
  * `yeah build` will build ready-to-go packages for every platform available.

Intuitive abstractions.

  * Game - a container for entities, communicates with a backend, can load maps.
  * Entity - an actor within a game, can be represented by a visual.
  * Visual - something that is rendered onto a screen.
  * Backend - platform bindings to media and input APIs.
  * Vector - used to represent position, size, velocity...
  * Color - will accept hex, RGB, HSV, and Wikipedia names.
  * Map - will be arrangement of entities in space.
