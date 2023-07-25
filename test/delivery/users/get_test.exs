defmodule Delivery.Users.GetTest do
  use Delivery.DataCase, async: true

  import Delivery.Factory

  alias Delivery.{Error, User}
  alias Delivery.Users.Get

  describe "by_id/1" do
    test "when user exists, returns the user" do
      id = "7bd9a991-014b-47e5-a06c-8bd01bee9999"

      insert(:user, id: id)

      response =
        id
        |> Get.by_id()

      assert {:ok,
              %User{
                address: "Rua das bananeiras, 15",
                age: 27,
                cep: "12345678",
                cpf: "12345678901",
                email: "tiago@botwave.com",
                id: "7bd9a991-014b-47e5-a06c-8bd01bee9999",
                name: "Tiago"
              }} = response
    end

    test "when the user not exits, returns an error" do
      id = "7bd9a991-014b-47e5-a06c-8bd01bee9999"

      response =
        id
        |> Get.by_id()

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
