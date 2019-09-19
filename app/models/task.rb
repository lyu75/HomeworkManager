class Task < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :course, :user, :description, presence: true
end
