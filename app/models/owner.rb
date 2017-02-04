# == Schema Information
#
# Table name: owners
#
#  id         :integer          not null, primary key
#  ssn        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Owner < ApplicationRecord
  has_many :properties, inverse_of: :owner
  has_many :loans, inverse_of: :owner

  validates :ssn, presence: true
  validates :ssn, uniqueness: true
  validates :ssn, length: { is: 9 }
  validates :ssn, format: {
    with: /\A[0-9]{9}\z/,
    message: 'only digits 0-9 are allowed'
  }
end
