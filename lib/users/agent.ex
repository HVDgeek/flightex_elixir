defmodule Flightex.Users.Agent do
  use Agent

  alias Flightex.Users.User

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get(user_id), do: Agent.get(__MODULE__, &get_user(&1, user_id))

  defp get_user(state, user_id) do
    case Map.get(state, user_id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  def save(%User{} = user), do: Agent.update(__MODULE__, &update_state(&1, user))

  defp update_state(state, %User{id: id} = user), do: Map.put(state, id, user)
end
