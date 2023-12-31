defmodule Delivery.Users.Get do
  alias Delivery.{Error, Repo, User}

  def by_id(id) do
    case Repo.get(User, id) do
      # nil -> {:error, %{status: :not_found, result: "User not found!"}}
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end

end
