defmodule Flightex.Bookings.GenerateReportTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Report

  describe "call/1" do
    test "generate report file " do
      BookingAgent.start_link(%{})

      :booking
      |> build(
        cidade_origem: "Rio de Janeiro",
        cidade_destino: "Sao Paulo",
        data_completa: ~N[2020-01-01 07:09:00]
      )
      |> BookingAgent.save()

      :booking
      |> build(
        cidade_origem: "Curitiba",
        cidade_destino: "Manaus",
        data_completa: ~N[2020-02-04 09:09:00]
      )
      |> BookingAgent.save()

      :booking
      |> build(
        cidade_origem: "Luanda",
        cidade_destino: "Porto Alegre",
        data_completa: ~N[2020-03-04 10:09:00]
      )
      |> BookingAgent.save()

      :booking
      |> build(
        cidade_origem: "Lisboa",
        cidade_destino: "Londres",
        data_completa: ~N[2020-04-09 11:19:00]
      )
      |> BookingAgent.save()

      :booking
      |> build(
        cidade_origem: "Benguela",
        cidade_destino: "Huila",
        data_completa: ~N[2020-05-10 14:19:00]
      )
      |> BookingAgent.save()

      response =
        Report.create("report_test.csv", %{
          from_date: ~N[2020-03-01 01:09:00],
          to_date: ~N[2020-04-30 01:09:00]
        })

      expected_response = {:ok, "Report generated successfully"}

      assert response == expected_response
    end
  end
end
