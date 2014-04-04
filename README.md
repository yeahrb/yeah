# Yeah
Practical Ruby video game framework in alpha stage.

It is designed to be the most productive interface for creating modern games. It takes care of the drudgery and lets you focus on the design.

Compiles to the web using Opal. Compiling to native executables (with mruby) and to Android (with Ruboto) planned in the future.

## Installation
Get the latest version with `git clone git@github.com:skofo/yeah.git`. Check out the example/s!

## Commands
  * `yeah new <game name>` generates a project.
  * `yeah build` builds runnables for every platform available (currently just the web).

## Core types
  * Game - manages context and active space.
  * Space - contains things.
  * Thing - acts in a space.
  * Visual - graphical representation for a thing.
  * Vector - represents position, size, velocity...
  * Color
