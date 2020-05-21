defmodule WordCount do
  @doc """
  Count the number of words in the sentence.
  
  Words are compared case-insensitively.
  """

  
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(~r/[\!\@\$\%\^\&\,\:]/, "")
    |> String.replace(~r/\s\s+/, " ")
    |> String.split([" ","_"])
    |> Enum.reduce(%{},&update/2)

    
  end

  def update(word,map) do
   Map.update(map, word,1, &(&1 +1))
   
    end
end
