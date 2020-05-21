defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()




  def rotate(<<head, tail::binary>>, shift) do
   
    
    if(tail== "") do
      if ( (head > 65 && head <122) ) do
      <<rem((head-97)+shift,26)+97>>
      else
      <<head>>
      end
    else
      cond do
        ( (head > 64 && head <91) ) ->
         <<rem((head-65)+shift,26)+65>> <> rotate(tail,shift)

        ( (head > 96 && head <123) )->
         <<rem((head-97)+shift,26)+97>> <> rotate(tail,shift)

        true ->
        <<head>> <> rotate(tail,shift)
      end
    end
    
    
    
  end

 
end
