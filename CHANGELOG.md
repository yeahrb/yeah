0.3.5 (2014-08-24)
------------------
* Updated project structure; new entrypoint is `code/game.rb`
* `yeah build` command through new `Web::Builder`
* `yeah new` accepts name option (thanks fixnum)
* `yeah serve` accepts port option
* `Asset`: removed `#path=`, `#to_n`
* `Image`: added `#to_n`
* `Sound`: removed `#pause`, added `#stop`
* `Web::Sound` can be played multiple times simultaneously
* Benchmarking & `Vector` benchmarks (thanks meganemura)
* `Vector` optimization (partly by meganemura)
* New project game class name is based on name option.
* Various code & documentation cleanup

0.3.4 (2014-08-22)
------------------
* Fixed `yeah version` command (thanks Chris Olszewski)
* Fixed `Vector#normalize` (thanks meganemura)
* Flattened `Vector` math operator code
* `Vector#magnitude` as alias for `Vector#length`
* `Vector#unit` as alias for `Vector#normalize`
* gemspec and Gemfile minor updates
* Updated documentation

0.3.3 (2014-08-18)
------------------
* Fixed missing require for `yeah new` command (thanks audy)

0.3.2 (2014-08-18)
------------------
* First substantial working release!
