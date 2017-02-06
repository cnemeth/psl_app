require 'rails_helper'

RSpec.describe GradeLoan do
  describe 'accepted, with ltv <= 40%' do
    let(:owner) { create(:owner, ssn: '123456789') }
    let(:property) { create(:property, value: 100) }
    let(:loan) { create(:loan, amount_cents: 39, ltv: 0, status: 'pending', owner: owner, property: property) }

    before { GradeLoan.new(loan).perform }

    it 'sets the amount_cents to 100' do
      expect(loan.amount_cents).to eq 3900
    end

    it 'calculates the ltv' do
      expect(loan.ltv).to eq 39.0
    end

    it 'sets the status according to ltv' do
      expect(loan.status).to eq 'accepted'
    end
  end

  describe 'rejected, with ltv > 40%' do
    let(:owner) { create(:owner, ssn: '123456789') }
    let(:property) { create(:property, value: 100) }
    let(:loan) { create(:loan, amount_cents: 41, ltv: 0, status: 'pending', owner: owner, property: property) }

    before { GradeLoan.new(loan).perform }

    it 'sets the amount_cents to 100' do
      expect(loan.amount_cents).to eq 4100
    end

    it 'calculates the ltv' do
      expect(loan.ltv).to eq 41.0
    end

    it 'sets the status according to ltv' do
      expect(loan.status).to eq 'rejected'
    end
  end
end
