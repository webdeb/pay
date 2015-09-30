defmodule Paypal.AuthenticationTest do
  use ExUnit.Case

  test "get token" do
    Paypal.App.start([],[])
    assert %{token: token, expires_in: _} = Paypal.Authentication.token

    assert [{"Accept", "application/json"}, {"Content-Type", "application/json"},
    {"Authorization", "Bearer " <> token}] == Paypal.Authentication.headers

  end
end
