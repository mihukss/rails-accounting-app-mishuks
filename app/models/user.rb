class User < ApplicationRecord
  extend Enumerize
  
  enumerize :role, in: %i[simple_user admin], default: :simple_user
    
  scope :not_admins, -> { where.not(role: 'admin') }

  # belongs_to :actor, polymorphic: true
end
