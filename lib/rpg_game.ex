defmodule RpgGame do
  def start do
    game_loop(:active, %PlayerData{
      username: "mack",
      normal_balls: 100,
      special_balls: 100
    })
  end

  def game_loop(:active, data) do
    IO.puts "\nWhat do you want to do?\n(1) Search\n(2) View Stats"
    IO.gets(": ") 
      |> String.trim
      |> choice(data)
  end

  def choice("1", data) do
    IO.puts "\nSearching...\n"

    len = length(PlayerData.animals) - 1
    rng = Enum.random(0..len) 
    animal = Enum.at(PlayerData.animals, rng) 
    IO.puts("A wild " <> animal.name <> " appeared!")

    catch_loop(animal, data)

    br
  end

  def choice("2", data) do
    br
    IO.puts(data.username <> "'s Stats")
    br
    IO.puts("Level: " <> Integer.to_string(data.level))
    IO.puts("Caught: ")
    IO.inspect(data.caught)
    IO.puts("Normal Orbs: " <> Integer.to_string(data.normal_balls))
    IO.puts("Special Orbs: "<> Integer.to_string(data.special_balls))
    br
    game_loop(:active, data)
  end

  def catch_loop(animal, data) do
    IO.puts("Do you want to\n(1) Throw A Ball\n(2) Run")
    IO.gets(": ")
      |> String.trim
      |> catch_choice(animal, data)
  end

  def catch_choice("1", animal, data) do
    br
    IO.puts("What type of orb do you want to use?\n(n) Normal Orb\n(s) Special Orb")  
    IO.gets(": ")
      |> String.trim
      |> ball_choice(animal, data)
  end

  def ball_choice("n", animal, data) do
    data = Map.put(data, :normal_balls, data.normal_balls - 1)
    catch_animal(animal.catch_rate, animal, data)
  end

  def ball_choice("s", animal, data) do
    data = Map.put(data, :special_balls, data.special_balls - 1)
    catch_animal(div(animal.catch_rate, 2), animal, data)
  end

  def catch_animal(max, animal, data) do
    rng = Enum.random(0..max)    
    IO.inspect rng
    if rng === 3 do
      catch_choice(:caught, animal, data)
    else
      br
      IO.puts animal.name <> " popped out!"
      br
      catch_loop(animal, data)
    end
  end

  def catch_choice(:caught, animal, data) do
    :caught
    
    # add the animal to the player's caught list
    data = Map.put(data, :caught, [animal | data.caught])

    game_loop(:active, data)
  end

  def catch_choice("2", animal, data) do
    br
    IO.puts "You ran away!"
    br
    game_loop(:active, data)
  end

  def catch_choice(_choice, animal, data) do
    catch_loop(animal, data)
  end

  def ball_choice(_choice, animal, data) do
    :invalid
  end

  def br do
      IO.puts ""
  end

  def choice("exit", data) do
    data
  end

  def choice(choice, data) do
    IO.puts "\nchoice is invalid\n"
    game_loop(:active, data)
  end

  def game_loop(:exit, data) do
    # save data

  end
end
