defmodule Flightex.Bookings.Report do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking

  def create(filename \\ "report.csv", %{from_date: from_date, to_date: to_date}) do
    booking_list = build_booking_list(from_date, to_date)

    File.write(filename, booking_list)
    {:ok, "Report generated successfully"}
  end

  defp build_booking_list(from_date, to_date) do
    BookingAgent.list_bookings()
    |> Map.values()
    |> Enum.filter(fn %Booking{data_completa: date} ->
      compare_dates(date, from_date, to_date)
    end)
    |> Enum.map(fn booking -> booking_string(booking) end)
  end

  defp booking_string(%Booking{
         data_completa: data_completa,
         cidade_origem: cidade_origem,
         cidade_destino: cidade_destino,
         id_usuario: id_usuario
       }) do
    "#{id_usuario},#{cidade_origem},#{cidade_destino},#{data_completa}\n"
  end

  defp compare_dates(date, initial_date, final_date) do
    NaiveDateTime.compare(date, initial_date) in [:eq, :gt] &&
      NaiveDateTime.compare(date, final_date) in [:eq, :lt]
  end
end
