defmodule Delivery.Users.Create do
  alias Delivery.{Error, Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result

  defp handle_insert({:error, result}) do
    # {:error, %{status: :bad_request, result: result}}
    {:error, Error.build(:bad_request, result)}
  end
end
