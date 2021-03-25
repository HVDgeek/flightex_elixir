defmodule Flightex.Bookings.BookingTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Booking

  describe "build/4" do
    setup do
      user = build(:user)
      {:ok, user: user}
    end

    test "When all params are valid, returns the booking", %{user: user} do
      response = Booking.build(user, "2020-05-09 17:00:00", "Sao Paulo", "Brasilia")

      assert {:ok,
              %Booking{
                data_completa: ~N[2020-05-09 17:00:00],
                cidade_origem: "Sao Paulo",
                cidade_destino: "Brasilia"
              }} = response
    end

    test "When all params are invalid, return an error", %{user: user} do
      response = Booking.build(user, "2020-05-09 17:00:00", 45, "Brasilia")

      expected_response = {:error, "Invalid parameters!"}

      assert response == expected_response
    end

    test "When 'data_completa' is invalid, return an error", %{user: user} do
      response = Booking.build(user, "invalid_date", "Sao Paulo", "Brasilia")

      expected_response = {:error, "Invalid date!"}

      assert response == expected_response
    end
  end
end
