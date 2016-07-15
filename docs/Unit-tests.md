# Unit tests guide


## Prerequisites

You must have [Rake](http://rake.rubyforge.org/) installed on your testing environment before launch unit tests, you can install it using gem.

You can see all commands possible using Rake with `rake -T`.

Before launch unit tests, you have to set 4 env vars :
* `TEST_MOUNTPOINT`: the svfs mountpoint (without slash at the end).
* `TEST_CONTAINER`: the container you want to do tests. (must be created before).
* `TEST_SEG_SIZE`: segmented file size value.
* `TEST_NSEG_SIZE`: standard file size value.


## Launch unit tests

For launch unit tests, you just have to use `rake test` command after have follow the prerequisites instructions.

You can also use and edit the script `unit-test.sh` with your conf, located in [scripts](scripts).


## Write unit tests

In first, you must follow [contribution guidelines](CONTRIBUTING.md) of SVFS and use the latest version of go.

All the tests are written in the [test directory](test), if you want add some tests you need consider the [Rakefile](Rakefile) and comment your tests like the previous written tests.
