class Item < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :name, length: {minimum: 1}

  default_scope{order('created_at ASC')}
  scope :order_by_priority, -> {reorder('created_at DESC')}
  scope :order_by_alphabet, -> {reorder(:name)}

  def days_left
  	7 - (DateTime.now.to_date - created_at.to_date).to_i
  end
end
