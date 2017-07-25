class Student < ApplicationRecord
  validates :email, :name, presence: true
end
