class Kitten < ApplicationRecord
  validates :name, :cuteness, :age, :softness, presence: true
  validates :name, length: { maximum: 20 }, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" }
  validate :age_is_smaller_than_limit

  private

  MAX_AGE = 30

  def age_is_smaller_than_limit
    return nil if age.blank?

    if age > MAX_AGE
      errors.add(:base, "Kittens cannot be older than #{MAX_AGE} ")
    end
  end
end
