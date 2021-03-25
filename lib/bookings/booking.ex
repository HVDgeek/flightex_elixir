defmodule Flightex.Bookings.Booking do
  alias Flightex.Users.User

  @keys [:id, :data_completa, :cidade_origem, :cidade_destino, :id_usuario]

  @enforce_keys @keys

  defstruct @keys

  def build(%User{id: id_usuario}, data_completa, cidade_origem, cidade_destino)
      when is_bitstring(cidade_origem) and is_bitstring(cidade_destino) do
    case NaiveDateTime.from_iso8601(data_completa) do
      {:ok, date} -> build_booking(id_usuario, date, cidade_origem, cidade_destino)
      {:error, :invalid_format} -> {:error, "Invalid date!"}
    end
  end

  def build(_user, _data_completa, _cidade_origem, _cidade_destino),
    do: {:error, "Invalid parameters!"}

  def build_booking(id_usuario, date, cidade_origem, cidade_destino) do
    {:ok,
     %__MODULE__{
       id: UUID.uuid4(),
       data_completa: date,
       cidade_origem: cidade_origem,
       cidade_destino: cidade_destino,
       id_usuario: id_usuario
     }}
  end
end

# "b5d6bd96-76de-4ced-bce1-535d6d558c49"
