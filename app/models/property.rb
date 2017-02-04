# == Schema Information
#
# Table name: properties
#
#  id          :integer          not null, primary key
#  value_cents :integer
#  owner_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Property < ApplicationRecord
  belongs_to :owner, inverse_of: :properties
  has_one :loan, inverse_of: :property

  monetize :value_cents,
    allow_nil: true,
    numericality: {
    greater_than_or_equal_to: 0
  }
end
