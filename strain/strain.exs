defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    keep_reduce(list, fun, [])
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    discard_reduce(list, fun, list)
  end

  @spec keep_reduce(list :: list(any), fun :: (any -> boolean), acc :: list(any)) :: list(any)
  defp keep_reduce([], _fun, acc) do
    Enum.reverse(acc)
  end

  defp keep_reduce([hd | tl], fun, acc) do
    if fun.(hd) do
      keep_reduce(tl, fun, [hd | acc])
    else
      keep_reduce(tl, fun, acc)
    end
  end

  @spec discard_reduce(list :: list(any), fun :: (any -> boolean), acc :: list(any)) :: list(any)
  defp discard_reduce([], _fun, acc) do
    acc
  end

  defp discard_reduce([hd | tl], fun, acc) do
    if fun.(hd) do
      discard_reduce(tl, fun, acc -- [hd])
    else
      discard_reduce(tl, fun, acc)
    end
  end
end
