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

require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { should belong_to(:owner).inverse_of(:loans) }
  it { should belong_to(:property).inverse_of(:loan) }

  it { is_expected.to monetize(:amount).with_currency(:usd) }
  it { should validate_numericality_of(:amount) }
  it { should allow_value(0).for(:amount) }
  it { should allow_value(9999999999).for(:amount) }
  it { should_not allow_value(-99).for(:amount) }

  it { should allow_value('accepted').for(:status) }
  it { should allow_value('rejected').for(:status) }
  it { should allow_value('pending').for(:status) }
  it { should_not allow_value('').for(:status) }
  it { should_not allow_value('blah').for(:status) }

  it { should allow_value(99).for(:ltv) }
  it { should allow_value(999.9999).for(:ltv) }
  it { should allow_value('99.9').for(:ltv) }
  it { should allow_value(0.999).for(:ltv) }
  it { should_not allow_value(-25.9).for(:ltv) }

  describe 'set_ltv' do
    let!(:owner) {
      create(:owner,
             ssn: '123456789')
    }
    let!(:property) {
      create(:property,
             value: 100,
             owner: owner)
    }
    let!(:loan) {
      create(:loan,
             ltv: 0.0,
             amount: 30,
             status: 'pending',
             owner: owner,
             property: property)
    }

    it'sets the ltv' do
      expect(loan.ltv).to eq 30.0
    end
  end
end
