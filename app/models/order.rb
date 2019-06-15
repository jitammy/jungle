class Order < ActiveRecord::Base

  def first

  end

  def last
    # generate sql
    # SELECT self.table_name + '*' FROM self.table_name ORDERBY...
    # Order.new(total_cents: 2)
  end

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

end
