defmodule Flightex.Bookings.CreateOrUpdateTest do
  use ExUnit.Case

  alias Flightex.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking
  alias Flightex.Users.CreateOrUpdate, as: CreateOrUpdateUser

  describe "call/1" do
    setup do
      Flightex.start_agents()
      user_params = %{name: "Hiduino", email: "hiduino@mail.com", cpf: "123,567,899-00"}

      {:ok, user_params: user_params}
    end

    test "When all params are valid, save booking", %{user_params: user_params} do
      {:ok, user_id} = CreateOrUpdateUser.call(user_params)

      response =
        CreateOrUpdateBooking.call(%{
          id_usuario: user_id,
          data_completa: "2020-01-09 22:09:08",
          cidade_origem: "Luanda",
          cidade_destino: "Londres"
        })

      assert {:ok, _booking_id} = response
    end

    test "When there is no user with given id, returns an error" do
      response =
        CreateOrUpdateBooking.call(%{
          id_usuario: "any_user_id",
          data_completa: "2020-01-09 22:09:08",
          cidade_origem: "Luanda",
          cidade_destino: "Londres"
        })

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
