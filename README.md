# Flightex

# 💻 Sobre o desafio

Nesse desafio, você deverá criar uma aplicação de reserva de voos, onde haverá o cadastro de usuários e o cadastro de reservas para um usuário.

A struct do usuário deverá possuir os seguintes campos:

```elixir
%User{
	id: id,
	name: name,
	email: email,
	cpf: cpf
}
```

**Obs:** O Id deve ser gerado automaticamente, pode ser um inteiro ou um UUID, mas não pode se repetir.

A struct da reserva deverá possuir os seguintes campos:

```elixir
%Booking{
	id: id,
	data_completa: data_completa,
	cidade_origem: cidade_origem,
	cidade_destino: cidade_destino,
	id_usuario: id_usuario
}
```

O campo `data_completa` deverá ser uma `NaiveDateTime`, que é um formato de data sem fuso horário e com funções auxiliares. Mais detalhes sobre [NaiveDateTime aqui](https://hexdocs.pm/elixir/NaiveDateTime.html#content).

É importante que todos os dados sejam salvos em um **Agent**, de acordo com o que foi visto no módulo.

Exemplo de chamadas das funções e saídas esperadas:

```elixir
iex> Flightex.create_user(params)
...> {:ok, user_id}

iex> Flightex.create_booking(user_id, params)
...> {:ok, booking_id}

iex> Flightex.create_booking(invalid_user_id, params)
...> {:error, "User not found"}

iex> Flightex.get_booking(booking_id)
...> {:ok, %Booking{...}}

iex> Flightex.get_booking(invalid_booking_id)
...> {:error, "Flight Booking not found"}
```

Deverá ser possível também gerar relatórios das reservas de voos de acordo com o intervalo de tempo especificado na chamada da função.

Dito isso, é esperado que a função receba dois parâmetros: data inicial e data final. Todas as reservas que estiverem agendadas para esse intervalo de tempo, deve entrar no arquivo CSV do relatório.

Exemplo de chamada da função e saída esperada:

```elixir
iex> Flightex.generate_report(from_date, to_date)
...> {:ok, "Report generated successfully"}
```

O CSV deverá estar no seguinte formato:

```
user_id1,Vitória,Salvador,2021-03-22 19:29:25.607218
user_id2,São Paulo,Rio de Janeiro,2021-03-14 12:12:25.607218
user_id1,São Paulo,Londres,2021-04-18 08:45:25.607218
```

ID do usuário, cidade de origem, cidade de destino e data.

Se quiser testar a sua implementação a partir do terminal, rode `iex -S mix` dentro do diretório raiz do projeto 🚀

Para executar os testes, rode `mix test` dentro do diretório raiz do projeto.

Feito com 💜 por Hiduíno 👋
