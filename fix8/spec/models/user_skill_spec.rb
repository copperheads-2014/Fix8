require 'rails_helper'

RSpec.describe UserSkill, :type => :model do

  describe 'Review Validations' do
    it "is valid with an user_id and skill_id" do
      user_skill = UserSkill.new(user_id: 1, skill_id: 1)
      user_skill.valid?
      expect(user_skill.errors).to_not include("can't be blank")
    end
    it "is invalid without a user_id" do
      user_skill = UserSkill.new(user_id: nil)
      user_skill.valid?
      expect(user_skill.errors[:user_id]).to include("can't be blank")
    end
    it "is invalid without a skill_id" do
      user_skill = UserSkill.new(skill_id: nil)
      user_skill.valid?
      expect(user_skill.errors[:skill_id]).to include("can't be blank")
    end
  end
end