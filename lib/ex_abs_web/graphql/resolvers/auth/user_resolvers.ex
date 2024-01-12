defmodule ExAbsWeb.GraphQl.Auth.UserResolvers do
  @moduledoc false

  alias ExAbs.Auth
  alias ExAbs.Auth.User

  @spec get_user(map(), map()) :: {:ok, User.t()} | {:error, term()}
  def get_user(%{id: id}, _resolution) do
    with %User{} = user <- Auth.get_user!(id) do
      {:ok, user}
    end
  end

  @spec list_users(map(), map()) :: {:ok, [User.t()]} | {:error, term()}
  def list_users(_args, _resolution) do
    {:ok, Auth.list_users()}
  end

  @spec create_user(map(), map()) :: {:ok, User.t()} | {:error, term()}
  def create_user(args, _resolution) do
    with {:ok, %User{} = user} <- Auth.create_user(args) do
      {:ok, user}
    end
  end
end
