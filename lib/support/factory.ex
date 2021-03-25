defmodule Flightex.Factory do
  use ExMachina

  alias Flightex.Users.User

  def user_factory do
    %User{
      id: UUID.uuid4(),
      name: "Hiduino",
      cpf: "123.456.789-00",
      email: "hiduino@mail.com"
    }
  end
end
