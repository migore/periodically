defmodule Periodically.Macro do
  defmacro periodically_macro(time, do: expression) do
    quote do
      use GenServer
      def start_link() do
        GenServer.start_link(__MODULE__, [])
      end

      def init(state) do
        IO.puts(unquote(time))
        schedule()
        {:ok, state}
      end

      def handle_info(:work, state) do
        unquote(expression)
        schedule()
        {:noreply, state}
      end

      def schedule() do
        Process.send_after(self(), :work, (unquote(time)) * 1000)
      end
    end
  end
end
