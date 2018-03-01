# Installation

1. Ensure you have a recent Ruby interpreter.
2. If you do not already have it installed, please run `gem install bundler`

# Usage

## Main

From the project home:
```
./lib/exploring_mars.rb [input]
```

If input file name argument is not provided, input is read from stdin.

## Tests

To run tests:
```
./lib/exploring_mars.rb [input]
```

Open `./coverage/index.html` for coverage info.

# Assumptions

If any of the lines contain syntax errors, the execution is aborted.

If plateau boundary is exceeded, the current probe is skipped, but program
execution continues.

# Initial Impression

The problem suggests and interpreter of a subset of [Logo programming language](https://simple.wikipedia.org/wiki/Logo_(programming_language)).
