class Expense < ApplicationRecord
  belongs_to :category

  validates :amount,
            presence: true,
            length: {maximum: 20},
            numericality: { other_than: 0 }
  # validate :date_is_valid

  private

  def date_is_valid
    unless :date.is_a?(Date)
      errors.add(:date, 'must be a valid date')
    end
  end

end
