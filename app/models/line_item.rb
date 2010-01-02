class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :school

  def self.from_list_item(list_item)
    li = self.new
    li.school = list_item
    li
  end

end
