class ActivityLog < ApplicationRecord
  belongs_to :logable, polymorphic: true
  validates :logable_id, :logable_type, :changes_text, presence: :true
end