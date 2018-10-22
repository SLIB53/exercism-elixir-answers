defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    # create intermediate representation, encode as {symbol, run length}
    run_ir =
      String.to_charlist(string)
      |> List.foldr(
        [{nil, 0}],
        fn
          # update top run by incrementing counter (+1)
          c, [{c, counter} | prev_runs] ->
            [{c, counter + 1} | prev_runs]

          # push new run
          c, acc ->
            [{c, 1} | acc]
        end
      )

    # format intermediate representation as string
    Enum.map(
      run_ir,
      fn
        {_symbol, 0} ->
          ""

        {symbol, 1} ->
          <<symbol>>

        {symbol, run_length} ->
          to_string(run_length) <> <<symbol>>
      end
    )
    |> to_string()
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    # parse encoded symbols
    encoded_symbols = Regex.scan(~r/\d+.|./, string)

    # create intermediate representation, decode each encoded symbol
    decode_ir =
      Enum.map(encoded_symbols, fn [enc_symbol] ->
        case String.length(enc_symbol) do
          len when len > 1 ->
            # split digits from character
            [[digit], [char]] = Regex.scan(~r/\d+|./, enc_symbol)

            # expand
            {run_len, _} = Integer.parse(digit)
            for _ <- 1..run_len, do: char

          len when len === 1 ->
            [enc_symbol]
        end
      end)

    # format intermediate representation as string
    to_string(decode_ir)
  end
end
