class Skill < ActiveRecord::Base
  has_many  :job_skills
  has_many  :user_skills
  has_many  :contractors, through: :user_skills
end
