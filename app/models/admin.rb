class Admin < ApplicationRecord
  has_one :user, as: :actor
  accepts_nested_attributes_for :user
end
