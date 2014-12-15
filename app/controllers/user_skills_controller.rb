 class UserSkillsController < ApplicationController

  def create
    add_skills
    remove_skills
    redirect_to home_path
  end

  private

  def add_skills
    selected_skills.each do |skill|
      unless @user.skills.include?(skill)
        @user.skills << skill
      end
    end
  end

  def remove_skills
    unselected_skills.each do |skill|
      if @user.skills.include?(skill)
        @user.user_skills.find_by(skill: skill).destroy
      end
    end
  end

  def selected_skills
    Skill.pluck(:name).map do |skill|
      Skill.find_by(name: skill) if params[:user_skill][skill] == "1"
    end.compact
  end

  def unselected_skills
    Skill.all - selected_skills
  end

end
