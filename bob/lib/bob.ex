defmodule Bob do
  def hey(input) do
    cond do
       input =~ ~r(^\s*+\t*$)  ->
       "Fine. Be that way!"
        input =~ ~r(^[A-Z\s']*\?\s*$)  ->
        "Calm down, I know what I'm doing!"

       input =~ ~r(\?\s*$)  ->
        "Sure."
         input =~ ~r(^[1-9\,\s]*$)->
         "Whatever."
       input =~ ~r(^[^a-z]*$)->
       "Whoa, chill out!" 
       
       true -> 
       "Whatever."
    end
  end
end
