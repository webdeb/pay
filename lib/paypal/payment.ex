defmodule Paypal.Payment do
  @moduledoc """
  This module is responsible for handle all payment calls to paypal.
  """
  @derive [Poison.Encoder]
  defstruct intent: nil, payer: nil, transactions: nil, id: nil

end

defimpl Payment, for: Paypal.Payment do

  @doc """
    Function to create a payment with Paypal. Receives a Dict with all information that is required by
    the Paypal API.

    Example of payment struct: %Paypal.Payment{"intent" => "sale", "payer" => %{"funding_instruments" => [%{"credit_card" => %{"billing_address" => %{"city" => "Saratoga", "country_code" => "US", "line1" => "111 First Street", "postal_code" => "95070", "state" => "CA"}, "cvv2" => "874", "expire_month" => 11, "expire_year" => 2018, "first_name" => "Betsy", "last_name" => "Buyer", "number" => "4417119669820331", "type" => "visa"}}], "payment_method" => "credit_card"}, "transactions" => [%{"amount" => %{"currency" => "USD", "details" => %{"shipping" => "0.03", "subtotal" => "7.41", "tax" => "0.03"}, "total" => "7.47"}, "description" => "This is the payment transaction description."}]}
    Returns a Task.
  """
  def create_payment(payment) do
    Task.async(fn -> do_create_payment(payment) end)
  end

  defp do_create_payment(payment) do 
    HTTPoison.post(Paypal.Config.url <> "/payments/payment", Poison.encode!(payment),  Paypal.Authentication.headers, timeout: :infinity, recv_timeout: :infinity)
    |> Paypal.Config.parse_response
  end
  @doc """
  Function to get the status of the payment at Paypal. It returns the API JSON as a dict.
  It receives a Paypal.Payment struct with id.

  """
  def get_status(payment) do
    HTTPoison.get(Paypal.Config.url <> "/payments/payment/" <> payment.id, Paypal.Authentication.headers, timeout: :infinity, recv_timeout: :infinity)
    |> Paypal.Config.parse_response
  end
end