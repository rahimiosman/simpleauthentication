defmodule SimpleAuthWeb.Guardian do
  use Guardian, otp_app: :simple_auth
  alias SimpleAuth.User
  alias SimpleAuth.Repo

  def subject_for_token(%User{id: id}, _claims) do
    {:ok, "#{id}"}
  end

  def subject_for_token(_, _) do
    {:error, :invalid_resource}
  end

  def resource_from_claims(%{"identities" => _, "sub" => sub}) do
    user = Repo.get!(User, sub)
    {:ok, user}
  end

  def resource_from_claims(_claims) do
    {:error, "Unauthorized"}
  end
end
