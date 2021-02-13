defmodule SaveGame do
  def save(data) do
    json = Jason.encode!(data)

    File.mkdir_p("data")
    File.cd("data")

    {:ok, file} = File.open("save.dat", [:write]) 
    IO.binwrite(file, json)
    File.close(file)
  end

  def load do
    File.cd("data")
    case File.read("save.dat") do
      {:ok, body} ->
        Jason.decode!(body)
      {:error, _reason} ->
        :first_time_playing
    end
  end
end
