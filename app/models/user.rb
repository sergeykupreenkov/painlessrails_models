class User < ApplicationRecord
  enum role: { default: 'default', legal_person: 'legal_person', moderator: 'moderator' }
  has_secure_password

  has_many :organizations, dependent: :nullify

end
