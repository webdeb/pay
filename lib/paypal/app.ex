defmodule Paypal.App do 

	def start(type,args) do
		Paypal.Authentication.start(type, args)
	end
end