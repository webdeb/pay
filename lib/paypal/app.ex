defmodule Paypal.App do
  import Supervisor.Spec 

	def start(type,args) do
    children = [
      worker(Paypal.Authentication, [[type,args], [name: __MODULE__]])
    ]
    {:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)
		#Paypal.Authentication.start(type, args)
	end
end