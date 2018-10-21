defmodule Queens do
  @type t :: %Queens{black: {integer, integer}, white: {integer, integer}}
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new(white_and_black, white_and_black) do
    raise ArgumentError, message: "invalid positions"
  end

  def new(white, black) do
    %{
      black: {_x, _y} = black,
      white: {_x, _y} = white
    }
  end

  def new do
    new({0, 3}, {7, 3})
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens) do
    to_board_image_index = fn {x, y} ->
      x * 16 + y * 2
    end

    base_board_image =
      String.trim("""
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      """)

    _final_board_image =
      base_board_image
      |> String.to_charlist()
      |> List.replace_at(to_board_image_index.(queens.white), ?W)
      |> List.replace_at(to_board_image_index.(queens.black), ?B)
      |> Kernel.to_string()
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%{black: {bx, by}, white: {wx, wy}}) do
    bx === wx or by === wy or abs(bx - wx) === abs(by - wy)
  end
end
