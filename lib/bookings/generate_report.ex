defmodule Flightex.Bookings.GenerateReport do
  alias Flightex.Bookings.Report

  def call(%{from_date: from_date, to_date: to_date}) do
    case Report.create(%{
           from_date: from_date,
           to_date: to_date
         }) do
      response -> response
    end
  end
end
