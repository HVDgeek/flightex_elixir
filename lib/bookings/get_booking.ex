defmodule Flightex.Bookings.GetBooking do
  alias Flightex.Bookings.Agent, as: BookingAgent

  def call(%{booking_id: booking_id}) do
    case BookingAgent.get(booking_id) do
      {:ok, booking} -> {:ok, booking}
      error -> error
    end
  end
end
