class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'cannot be repeated by the same artist in the same year'
  }
  validates :released, inclusion: { in: [true, false]}

  validate :has_release_year_if_released
  validate :release_year_not_in_future

  def has_release_year_if_released
    if released && !release_year
      errors.add(:release_year, "must be included if song is released")
    end
  end

  def release_year_not_in_future
    if release_year != nil && release_year > Date.today.year
      errors.add(:release_year, "cannot be in the future")
    end
  end
end
