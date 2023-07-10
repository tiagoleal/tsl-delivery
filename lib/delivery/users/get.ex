defmodule Delivery.Users.Get do
  alias Ecto.UUID
  alias Delivery.{Error, Repo, User}

  def by_id(id) do
    case UUID.cast(id) do
      # :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      :error -> {:error, Error.build_id_format_error() }
      {:ok, uuid} ->  get(uuid)
    end
  end


  defp get(id) do
    case Repo.get(User, id) do
      # nil -> {:error, %{status: :not_found, result: "User not found!"}}
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end

end