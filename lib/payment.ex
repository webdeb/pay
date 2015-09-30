defprotocol Payment do
  def create_payment(payment)
  def get_status(id)
  def update_payment(payment)
  def refund_payment(payment)
  def bill_plan(bill)
  def update_plan(plan)
  def list_plan(data)
end