class OfficeHour < ApplicationRecord
  belongs_to :course
  validates :course, :day, :time, presence: true
end
