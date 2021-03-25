defmodule Flightex.Users.UserTest do
  use ExUnit.Case

  alias Flightex.Users.User

  describe "build/3" do
    test "When all params are valid, returns the user" do
      response = User.build("Hiduino", "hiduino@mail.com", "123.456.789-00")

      assert {:ok, _user} = response
    end

    test "When there are invalid params, return an error" do
      response = User.build("Hiduino", "hiduino@mail.com", 123_456)

      expected_response = {:error, "Invalid parameters!"}

      assert response == expected_response
    end
  end
end
