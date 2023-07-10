defmodule Delivery.Users.Delete do
  alias Delivery.{Error, Repo, User}

  def call(id) do
    case Repo.get(User, id) do
      # nil -> {:error, %{status: :not_found, result: "User not found!"}}
      nil -> {:error, Error.build_user_not_found_error()}
      user -> Repo.delete(user)
    end
  end

end
