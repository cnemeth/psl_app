# == Schema Information
#
# Table name: loans
#
#  id           :integer          not null, primary key
#  amount_cents :integer
#  status       :string(255)
#  ltv          :decimal(5, 2)
#  owner_id     :integer
#  property_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Loan < ApplicationRecord
  belongs_to :owner, inverse_of: :loans
  belongs_to :property, inverse_of: :loan

  STATUS = %w(pending accepted rejected).freeze

  before_create :set_ltv

  monetize :amount_cents,
    allow_nil: true,
    numericality: {
    greater_than_or_equal_to: 0
  }

  validates :status, inclusion: { in: STATUS }
  validates :ltv,
    allow_nil: true,
    numericality: {
    greater_than_or_equal_to: 0
  }

  private

  def set_ltv
    self.ltv = self.amount.fractional.to_f / self.property.value.fractional.to_f * 100
  end
end
