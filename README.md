Pay [Work in progress]
===

Pay is an Elixir Lib to deal with Paypal and other payment solutions. The lib's main goal is to be easy to extend other payment solutions.

It also uses Maru to receive the callback from the payment, so you don't need to worry about it. Just add the function that you want to run everytime that a payment is confirmed (or denied). {TODO}

The API is based on the [ruby SDK version](https://github.com/paypal/PayPal-Ruby-SDK).

Contributing
------------

  * Fork it
  * Create your feature branch (`git checkout -b my-new-feature`)
  * Create a Pull Request

TODO
---
* Remove real calls to the API in the test and mock it.
* Support all Paypal API, including payment with Paypal (it need a callback URL).
* Add pagar.me support.
* Add pagseguro support.

