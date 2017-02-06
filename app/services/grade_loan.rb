class GradeLoan
  attr_accessor :loan

  def initialize(loan)
    @loan = loan
  end

  def perform
    amount = update_amount_cents
    ltv = calculate_ltv
    status = set_status
    loan.update_attributes!(amount_cents: amount, ltv: ltv, status: status)

    loan
  end

  private

  def update_amount_cents
    loan.amount_cents *= 100
  end

  def calculate_ltv
    loan.ltv = loan.amount.fractional.to_f / loan.property.value.fractional.to_f * 100
  end

  def set_status
    loan.status = (loan.ltv <= 40.0) ? 'accepted' : 'rejected'
  end
end
