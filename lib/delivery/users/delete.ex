defmodule Delivery.Users.Delete do
  alias Ecto.UUID
  alias Delivery.{Error, Repo, User}

  def call(id) do
    case UUID.cast(id) do
      # :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      :error -> {:error, Error.build_id_format_error()}
      {:ok, uuid} ->  delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(User, id) do
      # nil -> {:error, %{status: :not_found, result: "User not found!"}}
      nil -> {:error, Error.build_user_not_found_error()}
      user -> Repo.delete(user)
    end
  end

end
