defmodule Wabanex.Users.Get do
  alias Ecto.UUID
  alias Wabanex.{Repo, User}

  def call(id) do
    id
    |> cast_uuid()
    |> get()
  end

  defp cast_uuid(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid Input"}
      ok_response -> ok_response
    end
  end

  defp get({:ok, id}) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found"}
      user -> user
    end
  end
end
