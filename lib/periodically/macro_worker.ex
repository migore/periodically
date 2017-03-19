defmodule Periodically.MacroWorker do
  import Periodically.Macro

  periodically_macro(3) do
    IO.puts("Macro is still working")
  end
end
