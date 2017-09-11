# Elixir command line config. To see config options, run `h IEx.configure/1`

IEx.configure(
  history_size: -1,
  colors: [
    eval_result: [:cyan, :bright]
  ]
)

#
# defmodule EctoHelpers do
#   defmacro __using__(_) do
#     quote do
#       IO.puts "importing Ecto.Query.{limit, select, where} and Ecto.Query.API.fragment"
#       import Ecto.Query, only: [limit: 2, select: 3, where: 3]
#       import Ecto.Query.API, only: [fragment: 1]
#       :ok
#     end
#   end
# end
#
# case Code.ensure_loaded(Ecto) do
#   {:module, _} -> IO.puts "\nEcto detected... get helpers in scope:\n> use EctoHelpers\n"
#   {:error,  _} -> nil
# end
