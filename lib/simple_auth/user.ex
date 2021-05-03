defmodule SimpleAuth.User do
  use Ecto.Schema
  import Ecto.Changeset

  @require_fields [:email]
  @optional_fields ~w(name is_admin)a

  schema "users" do
    field :email, :string
    field :is_admin, :boolean, default: false
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string


    timestamps()
    has_many :posts, SimpleAuth.Post
  end

  @doc false
   def changeset(struct, params \\ %{}) do
     struct
     |> cast(params, @require_fields ++ @optional_fields)
     |> validate_required(@require_fields)
   end

   def registration_changeset(struct, params) do
     struct
     |> changeset(params)
     |> cast(params, [:password], [])
     |> validate_length(:password, min: 6, max: 100)
     |> hash_password
   end

   defp hash_password(changeset) do
     case changeset do
       %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
          put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
       _ ->
          changeset
     end
   end
end
