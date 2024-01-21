A simple add-on dynamic library for more complex arithmetic operations in Souffle-Datalog
(https://souffle-lang.github.io).

Current coverage:
 - 256-bit arithmetic (for crypto)

Dependencies:
 - Souffle: https://github.com/souffle-lang/souffle
 - Boost libraries

Usage:

    $ make                          # builds all, sets libfunctors.so as a link to libsoufflenum.so
    $ export LD_LIBRARY_PATH=`pwd`  # or wherever you want to put the resulting libfunctors.so

and use a Souffle program with the num256functors.dl definitions. For compiled execution, libfunctors.so (i.e., at least a
link to the real .so) should be in the compilation directory.

A sample Souffle client program can be found under directory dlexample.  
