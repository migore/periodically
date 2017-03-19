defmodule Periodically.MacroWorker do
  require Periodically.Macro

  Periodically.Macro.periodically_macro(3) do
    IO.puts("Macro is still working")
  end
end
