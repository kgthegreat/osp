class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.integer :school_id, :null => false, :options =>
        "CONSTRAINT fk_line_item_schools REFERENCES schools(id)"
      t.integer :order_id, :null => false, :options =>
        "CONSTRAINT fk_line_item_orders REFERENCES orders(id)"
      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
