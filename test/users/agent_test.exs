defmodule Flightex.Users.AgentTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Users.Agent, as: UserAgent

  describe "save/1" do
    test "Save the user" do
      UserAgent.start_link(%{})

      user = build(:user)

      response = UserAgent.save(user)

      assert response == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      id = "899a9f3f-f710-4198-ba3c-e7bdda1e5760"

      {:ok, user_id: id}
    end

    test "When the user is found, returns the user", %{user_id: user_id} do
      :user
      |> build(id: user_id)
      |> UserAgent.save()

      response = UserAgent.get(user_id)

      expected_response = {:ok, build(:user, id: user_id)}

      assert response == expected_response
    end

    test "When the user is not found, returns an error", %{user_id: user_id} do
      response = UserAgent.get(user_id)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
