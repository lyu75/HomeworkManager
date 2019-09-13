class Course < ApplicationRecord
  belongs_to :user
  has_many :office_hours, dependent: :destroy

  accepts_nested_attributes_for :office_hours
  validates :name, presence: true
end
