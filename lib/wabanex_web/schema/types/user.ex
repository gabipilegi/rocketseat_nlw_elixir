defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation
  import_types(WabanexWeb.Schema.Types.Custom.UUID4)

  @desc "User representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end

  @desc "Input user"
  input_object :create_user_input do
    field :name, non_null(:string), description: "user name"
    field :email, non_null(:string), description: "user email"
    field :password, non_null(:string), description: "user password"
  end
end
