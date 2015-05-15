class Item < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :name, length: {minimum: 1}

  default_scope{order('created_at ASC')}
  scope :order_by_priority, -> {reorder('created_at DESC')}
  scope :order_by_alphabet, -> {reorder(:name)}
  scope :order_by_updated, -> {reorder('updated_at DESC')}

  def days_left
  	(7 - (Time.now - created_at) / 86400).floor
  end

  def hours_left
    ((168 - (Time.now - created_at) / 3600) - days_left * 24).floor
  end
end
