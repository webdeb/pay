defmodule Paypal.PaymentTest do
	use ExUnit.Case

  @tag timeout: :infinity
  test "create and get payment" do
    Paypal.App.start([],[])
    
  	{:ok, result} = Task.await(Payment.create_payment(%Paypal.Payment{intent: "sale", payer: %{"funding_instruments" => [%{"credit_card" => %{"billing_address" => %{"city" => "Saratoga", "country_code" => "US", "line1" => "111 First Street", "postal_code" => "95070", "state" => "CA"}, "cvv2" => "874", "expire_month" => 11, "expire_year" => 2018, "first_name" => "Betsy", "last_name" => "Buyer", "number" => "4417119669820331", "type" => "visa"}}], "payment_method" => "credit_card"}, transactions: [%{"amount" => %{"currency" => "USD", "details" => %{"shipping" => "0.03", "subtotal" => "7.41", "tax" => "0.03"}, "total" => "7.47"}, "description" => "This is the payment transaction description."}]}), 10000000)
  	assert "approved" == result["state"]

    {:ok, status} = Payment.get_status %Paypal.Payment{id: result["id"]}
    assert "approved" == status["state"]
  end
end