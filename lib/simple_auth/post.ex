defmodule SimpleAuth.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @require_fields [:title]
  @optional_fields ~w(body)a


  schema "posts" do
    belongs_to :user, SimpleAuth.User
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @require_fields ++ @optional_fields)
    |> validate_required(@require_fields)
  end
end
