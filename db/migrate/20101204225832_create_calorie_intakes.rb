class CreateCalorieIntakes < ActiveRecord::Migration
  def self.up
    create_table :calorie_intakes do |t|
      t.column :ci_type, :string
      t.column :date,:datetime
      t.column :description,:string
      t.column :calorie_intake,:float
      t.column :user_id,:integer
      #t.timestamps
    end
  end

  def self.down
    drop_table :calorie_intakes
  end
end
