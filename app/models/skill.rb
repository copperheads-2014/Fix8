class Skill < ActiveRecord::Base
  has_many  :job_skills
  has_many  :user_skills
  has_many  :jobs, through: :job_skills
  has_many  :contractors, through: :user_skills

  validates :name, presence: true

  def available_jobs
    self.jobs.reject(&:expired?)
  end

end
