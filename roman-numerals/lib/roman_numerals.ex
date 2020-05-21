defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
     m = div number,1000
     d = div rem(number,1000),500
     c = div rem(number,500),100
     l = div rem(number,100),50
     x = div rem(number,50),10
     v = div rem(number,10),5
     i = rem(number,5)
    
  m= String.duplicate("M",m)
  d=cond do
      d == 1 && c==4 ->
      "CM"
      c == 4 ->
      "CD" 
      true ->
      String.duplicate("D",d)<>
      String.duplicate("C",c)
      end
  l= cond do
      l == 1 && x==4 ->
      "XC"
      x == 4 ->
      "XL" 
      true ->
      String.duplicate("L",l)<>
      String.duplicate("X",x)
      end
   x= cond do
      v == 1 && i==4 ->
      "IX"
      i == 4 ->
      "IV" 
      true ->
        String.duplicate("V",v)<>
        String.duplicate("I",i)
     end

     m<>d<>l<>x


  end
end
