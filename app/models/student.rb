class Student < ApplicationRecord
  validates :email, :name, :dob, presence: true

  # student must be over 18 yrs Date.today - 18.years > dob
  validate :must_be_eighteen

  # emails must be unique
  validates :email, uniqueness: true
  # students name cannot be 'Drop Table'
  validates :name, exclusion: {in: ['Drop Table']}

  def must_be_eighteen
    if self.dob && !(Date.today - 18.years  > self.dob)
      self.errors.add(:dob, 'must be older than 18')
    end
  end


  def dog=(dog)
    puts 'hello'
  end

end
