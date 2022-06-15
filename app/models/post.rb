class Post < ApplicationRecord

  validates :title, :overview, :start_day, :end_day, presence: true
  validate :date_before_start, if: :start_existing?
  validate :date_before_end, if: :end_existing?

  def date_before_start
    if start_day < Date.today
      errors.add(:start_day, "開始日は今日以降を選択してください") 
    end
  end

  def date_before_end
    if end_day < Date.today
      errors.add(:end_day, "終了日は今日以降を選択してください")
    end
    if start_day > end_day
      errors.add(:end_day, "終了日は開始日以降に設定してください")
    end
  end

  def start_existing?
    start_day != nil
  end
  
  def end_existing?
    end_day != nil
  end

  scope :latest, -> {order(start_day: :asc)}
end
