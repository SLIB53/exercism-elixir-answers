Exercism Elixir Answers
================================================================================

[![Build Status](https://travis-ci.com/SLIB53/exercism-elixir-answers.svg?branch=master)](https://travis-ci.com/SLIB53/exercism-elixir-answers)

[Exercism.io][exercism] provides practice problems and mentorship for just about any programming langauge. This repository contains my solutions to the ["Elixir Track"][exercism-elixir-track]. Solving problems in Elixir is vastly different from solving problems in the more C like languages, so these exercises are a great way to engage in the Erlang/Elixir way of thinking.

Each folder contains a solution and the corresponding tests from exercism. If you are an exercism member, you can click the link in the "Source" section of a solution's README to view the solution I submitted on exercism.

I usually attempted to idiomatically write solutions, but sometimes I chose to find a unique or more interesting way instead. There really is no clear set of design goals for my solutions. In the end, it's really just whatever I felt like writing that day, and having fun with Elixir!

Running Tests
--------------------------------------------------------------------------------

You might have noticed that this is not a mix project. To run each test, simply run the test found in each solution folder as an Elixir script.

```sh
elixir <solution_dir>/<solution_name>_test.exs
```

To run all the tests, use the `test_all.sh` script.

```sh
sh test_all.sh
```

[exercism]: https://exercism.io
[exercism-elixir-track]: https://exercism.io/tracks/elixir
