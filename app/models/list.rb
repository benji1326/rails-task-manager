class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :due_date, presence: true

  scope :over_due, -> { where('due_date <= ?', Date.today)}

  def task_attributes=(task_attributes)
    if task_attributes[:name].present?
    self.tasks.build(task_attributes)
    end
  end

end
