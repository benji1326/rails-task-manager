class Task < ApplicationRecord
  belongs_to :list
  validates :name, presence: true

  scope :incomplete, -> { where(complete: false)}
end
