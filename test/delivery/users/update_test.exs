defmodule Delivery.Users.UpdateTest do
  use Delivery.DataCase, async: true

  import Delivery.Factory

  alias Delivery.{Error, User}
  alias Delivery.Users.Update

  describe "call/1" do
    test "when user exists, updates the user" do
      insert(:user)

      params = %{
        "id" => "da804976-2ca9-43b0-a91e-74d7e916f142",
        "name" => "Tiago",
        "password" => "123456"
      }

      response =
        params
        |> Update.call()

      assert {
               :ok,
               %User{
                  age: 27,
                  address: "Rua das bananeiras, 15",
                  cep: "12345678",
                  cpf: "12345678901",
                  email: "tiago@botwave.com",
                  password: "123456",
                  name: "Tiago",
                  id: "da804976-2ca9-43b0-a91e-74d7e916f142"
                }
             } = response
    end

    test "when user not exists, returns an error" do
      params = %{
        "id" => "794fc333-7f79-44c2-b4b5-e8dcc536a365",
        "name" => "Tiago Leal"
      }

      response =
        params
        |> Update.call()

     assert {
               :error,
               %Error{
                 result: "User not found",
                 status: :not_found
               }
             } = response
    end
  end
end
