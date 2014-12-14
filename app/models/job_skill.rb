class JobSkill < ActiveRecord::Base
  belongs_to  :job
  belongs_to  :skill

  validates :job_id, presence: true
  validates :skill_id, presence: true
end
