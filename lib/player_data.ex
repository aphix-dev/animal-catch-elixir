defmodule PlayerData do
  defstruct(
    username: "",
    level: 1,
    caught: [],
    normal_balls: 100,
    special_balls: 100,
  )

  def animals do
    [
      %Animal{
        id: 0,        
        name: "(-_- )",
        rarity: 3
      },
      %Animal{
        id: 1,        
        name: "Timmy",
        rarity: 2
      },
      %Animal{
        id: 2,        
        name: "Cocoa",
        rarity: 2
      },
      %Animal{
        id: 3,        
        name: "Bird",
        rarity: 1
      },
      %Animal{
        id: 4,        
        name: "Sea Hawk",
        rarity: 4
      },
      %Animal{
        id: 5,        
        name: "King of the World",
        rarity: 5
      },
      %Animal{
        id: 6,        
        name: "Kow",
        rarity: 3
      },
    ]
  end
end
