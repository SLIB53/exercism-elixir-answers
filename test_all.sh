#!/bin/env sh

# Runs tests for each exercise, exiting with 1 if a test fails. Tests are found
# by convention, where the test is an elixir script ending with "_test.exs".

for item in $(find . -name "*_test.exs" | sort)
do
    if ! elixir $item; then
        echo "A test in $item failed."
        exit 1
    fi
done
