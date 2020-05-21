defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @vowels ["a","e","i","o","u"]

  @spec translate(phrase :: String.t()) :: String.t()

  def translate(phrase) do 
    words=String.split(phrase ," ")
    IO.puts(words)
  
    Enum.join(
      for phrase <- words do
        <<head::binary-size(1), rest::binary>>= phrase

        case head do
          x when x in ["y","x"] -> 
              <<next::binary-size(1),_::binary>>=rest
              if Enum.member?(@vowels,next) do
                rotate(phrase)
              else
                phrase <> "ay"   
              end   
          y when head in @vowels -> 
                phrase <> "ay"

          "q" ->
            <<next::binary-size(1),_::binary>>=rest
            if(next=="u") do
              rotatewithu(phrase)
            else
              rotate(phrase)
            end

          _ -> 
            <<next::binary-size(2),_::binary>>=rest
            if(next=="qu") do
              rotatewithu(phrase)
            else
              rotate(phrase)
            end
          end

      end," ")
  end


 def rotate(phrase) do
    index = getIndex(phrase,0)
    changed(phrase,index) <> "ay"
  end

 def rotatewithu(phrase) do
  <<head::binary-size(1),_::binary>>=phrase
  case head do
   "q"-> 
    <<next::binary-size(2),rest::binary>>=phrase
    rest <> next <> "ay"

   _ ->
    <<next::binary-size(3),rest::binary>>=phrase
    rest <> next <> "ay"
    end

 end



 def changed(phrase,index) do
   <<head::binary-size(index),rest::binary>>=phrase
   rest <> head
 end
   
  
  

  
  def getIndex(<<head::binary-size(1), rest::binary>>,initial ) do
    if rest == "" do
        if Enum.member?(@vowels,head) do
          initial
        else
          "at end"
        end
    else
      if Enum.member?(@vowels,head) do
        initial
          
      else
        getIndex(rest,initial+1)
      
      end
    

    end
  
  end

     
end
