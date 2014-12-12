require 'rails_helper'

RSpec.describe JobSkill, :type => :model do

  describe 'Review Validations' do
    it "is valid with an job_id and skill_id" do
      job_skill = JobSkill.new(job_id: 1, skill_id: 1)
      job_skill.valid?
      expect(job_skill.errors).to_not include("can't be blank")
    end
    it "is invalid without a job_id" do
      job_skill = JobSkill.new(job_id: nil)
      job_skill.valid?
      expect(job_skill.errors[:job_id]).to include("can't be blank")
    end
    it "is invalid without a skill_id" do
      job_skill = JobSkill.new(skill_id: nil)
      job_skill.valid?
      expect(job_skill.errors[:skill_id]).to include("can't be blank")
    end
  end
end