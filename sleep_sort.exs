array = Enum.shuffle(1..10)

IO.puts "shuffle array..."
IO.inspect array

parent = self()
pids = Enum.map(array, fn(n) ->
  spawn fn -> 
    :timer.sleep n * 1000
    send parent, n
  end
end)

IO.puts "result..."
result = Enum.map(pids, fn(_) ->
  receive do
    n -> n
  end
end)
IO.inspect result
