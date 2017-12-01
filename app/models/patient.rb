class Patient < ApplicationRecord
  include Logging
  
  logable_attr :first_name, :last_name, :physician_name
  has_many :activity_logs, as: :logable
  validates :first_name, :last_name, presence: :true
end