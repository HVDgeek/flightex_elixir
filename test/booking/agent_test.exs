defmodule Flightex.Bookings.AgentTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Agent, as: BookingAgent

  describe "save/1" do
    setup do
      BookingAgent.start_link(%{})

      :ok
    end

    test "Save the booking" do
      booking = build(:booking)

      assert {:ok, _booking_id} = BookingAgent.save(booking)
    end
  end

  describe "get/1" do
    setup do
      BookingAgent.start_link(%{})

      :ok
    end

    test "When the booking is found, return the booking" do
      booking = build(:booking)

      {:ok, booking_id} = BookingAgent.save(booking)

      response = BookingAgent.get(booking_id)

      expected_response = {:ok, booking}

      assert response == expected_response
    end

    test "When the booking is not found, return an error" do
      response = BookingAgent.get("any_booking_id")

      expected_response = {:error, "Boooking not found!"}

      assert response == expected_response
    end
  end
end
