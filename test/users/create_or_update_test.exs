defmodule Flightex.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      params = %{name: "Hiduino", email: "hiduino@mail.com", cpf: "123.456.789-00"}

      {:ok, params: params}
    end

    test "When all params are valid, save the user", %{params: params} do
      response = CreateOrUpdate.call(params)

      # expected_response = {:ok, "User created or update successfully!"}

      assert {:ok, _user_id} = response
    end

    test "When there are invalid params, return an error", %{params: params} do
      user = %{params | cpf: 123}

      response = CreateOrUpdate.call(user)

      expected_response = {:error, "Invalid parameters!"}

      assert response == expected_response
    end
  end
end
