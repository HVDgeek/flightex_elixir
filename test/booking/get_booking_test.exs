defmodule Flightex.Bookings.GetBookingTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.GetBooking

  describe "call/1" do
    setup do
      BookingAgent.start_link(%{})

      :ok
    end

    test "When the booking is found, return the booking" do
      booking = build(:booking)

      {:ok, booking_id} = BookingAgent.save(booking)

      response = GetBooking.call(%{booking_id: booking_id})

      expected_response = {:ok, booking}

      assert response == expected_response
    end

    test "When the booking is not found, return an error" do
      response = GetBooking.call(%{booking_id: "any_booking_id"})

      expected_response = {:error, "Flight Booking not found"}

      assert response == expected_response
    end
  end
end
