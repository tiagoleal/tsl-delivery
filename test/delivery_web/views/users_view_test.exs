defmodule DeliveryWeb.UsersViewTest do
  use DeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Delivery.Factory

  alias DeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)
    token = "xpto1234"

    response = render(UsersView, "create.json", token: token, user: user)

    assert %{
             message: "User created!",
             token: "xpto1234",
             user: %Delivery.User{
               address: "Rua das bananeiras, 15",
               age: 27,
               cep: "12345678",
               cpf: "12345678901",
               email: "tiago@botwave.com",
               id: "da804976-2ca9-43b0-a91e-74d7e916f142",
               inserted_at: nil,
               name: "Tiago",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
