require 'rails_helper'

RSpec.describe Skill, :type => :model do

  describe 'Review Validations' do
    it "is valid with an name" do
      skill = Skill.new(name: "nunchaku skills")
      skill.valid?
      expect(skill.errors).to_not include("can't be blank")
    end

  end
end