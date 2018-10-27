# Strain

Implement the `keep` and `discard` operation on collections. Given a collection
and a predicate on the collection's elements, `keep` returns a new collection
containing those elements where the predicate is true, while `discard` returns
a new collection containing those elements where the predicate is false.

For example, given the collection of numbers:

- 1, 2, 3, 4, 5

And the predicate:

- is the number even?

Then your keep operation should produce:

- 2, 4

While your discard operation should produce:

- 1, 3, 5

Note that the union of keep and discard is all the elements.

The functions may be called `keep` and `discard`, or they may need different
names in order to not clash with existing functions or concepts in your
language.

## Restrictions

Filter, reduce, and similar shortcuts aren't used in the implementation.

## Running tests

Execute the tests with:

```bash
$ elixir strain_test.exs
```

## Source

[- Conversation with James Edward Gray II](https://twitter.com/jeg2)
- [This solution on exercism](https://exercism.io/tracks/elixir/exercises/strain/solutions/92de8b508c8d41b8be7ac7104b7bfd99)
