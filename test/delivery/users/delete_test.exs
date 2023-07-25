defmodule Delivery.Users.DeleteTest do
  use Delivery.DataCase, async: true

  import Delivery.Factory

  alias Delivery.{Error, User}
  alias Delivery.Users.Delete

  describe "call/1" do
    test "when user exists, deletes the user" do
      id = "9aad3e4f-9a5d-4cff-984e-8a4898632ff9"

      insert(:user, id: id)

      response =
        id
        |> Delete.call()

      assert {
               :ok,
               %User{
                address: "Rua das bananeiras, 15",
                age: 27,
                cep: "12345678",
                cpf: "12345678901",
                email: "tiago@botwave.com",
                id: "9aad3e4f-9a5d-4cff-984e-8a4898632ff9",
                name: "Tiago"
              }
             } = response
    end

    test "when user not exists, returns an error" do
      id = "8b41de9e-6b97-47a2-8feb-f055332ca625"

      response =
        id
        |> Delete.call()

      assert {
               :error,
               %Error{
                 result: "User not found",
                 status: :not_found
               }
             } == response
    end
  end
end
