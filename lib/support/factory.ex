defmodule Flightex.Factory do
  use ExMachina

  alias Flightex.Bookings.Booking
  alias Flightex.Users.User

  def user_factory do
    %User{
      id: UUID.uuid4(),
      name: "Hiduino",
      cpf: "123.456.789-00",
      email: "hiduino@mail.com"
    }
  end

  def booking_factory do
    %Booking{
      id: UUID.uuid4(),
      cidade_destino: "New York",
      cidade_origem: "Luanda",
      data_completa: ~N[2020-02-22 18:09:30],
      id_usuario: "b5d6bd96-76de-4ced-bce1-535d6d558c49"
    }
  end
end
