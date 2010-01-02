class Order < ActiveRecord::Base


  PAYMENT_TYPES = [
                   # Displayed stored in db
                   [ "Check" , "check" ],
                   [ "Credit card" , "cc" ],
                   [ "Purchase order" , "po" ]
                  ]

  validates_presence_of :name, :address, :email, :pay_type
  validates_inclusion_of :pay_type, :in =>
    PAYMENT_TYPES.map {|disp, value| value}

  # ...




  has_many :line_items



  def add_line_items_from_list(list)
    list.items.each do |item|
      li = LineItem.from_list_item(item)
      line_items << li
    end
  end

end
