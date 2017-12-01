require "rails_helper"

RSpec.describe ActivityLog, :type => :model do
  
  describe "validations" do 
    it { should validate_presence_of(:logable_type) }
    it { should validate_presence_of(:logable_id) }
    it { should validate_presence_of(:changes_text) }
  end
  
  describe "associations" do 
    it { should belong_to(:logable) }
  end
end