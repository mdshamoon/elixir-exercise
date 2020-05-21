defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune
  
  @earth 31557600
  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earthYear = seconds/@earth
    case planet do
      :earth -> 
        earthYear    
      :mercury -> 
        earthYear / 0.2408467   
      :venus ->
        earthYear / 0.61519726
      :mars ->
        earthYear / 1.8808158
      :jupiter ->
        earthYear / 11.862615
      :saturn ->
        earthYear / 29.447498
      :uranus ->
        earthYear / 84.016846
      :neptune ->  
        earthYear / 164.79132
        _ ->
        "not a planet"
    end   

    |> Float.round(2)

  end
end
