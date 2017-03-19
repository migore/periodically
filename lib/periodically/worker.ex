defmodule Periodically.Worker do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def init(state) do
    schedule()
    {:ok, state}
  end

  def handle_info(:work, state) do
    IO.puts "Working..."
    schedule()
    {:noreply, state}
  end

  def schedule() do
    Process.send_after(self(), :work, 1 * 1000) # 10 seconds
  end
end
