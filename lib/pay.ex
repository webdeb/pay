defmodule Pay do
  use Application

  def start(type,args) do
    case Application.get_env(:pay, :type) do
      :paypal -> Paypal.App.start(type, args)
      _ -> Paypal.App.start(type, args)
    end
  end
end
