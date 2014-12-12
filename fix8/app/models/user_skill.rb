class UserSkill < ActiveRecord::Base
  belongs_to  :contractor, class_name: "User", foreign_key: "user_id"
  belongs_to  :skill

  validates :user_id, presence: true
  validates :skill_id, presence: true
end
