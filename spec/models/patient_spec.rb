require "rails_helper"

RSpec.describe Patient, :type => :model do
  let(:patient) { FactoryBot.create(:patient) }
  
  describe "validations" do 
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end
  
  describe "associations" do 
    it { should have_many(:activity_logs) }
  end

  describe "create activity_logs after update" do
    before do
      patient.update(last_name: "Travis")
    end

    it "should create activity_log after update" do
      expect(ActivityLog.count).to eq(1)
    end
    
    it "should match the activity_log text" do
      expect(ActivityLog.last.changes_text).to include("Last name", "Travis")
    end
  end
end