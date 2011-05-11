class CreateWeights < ActiveRecord::Migration
  def self.up
    create_table :weights do |t|
      t.column :weighting_date,:timestamp
      t.column :user_id,:integer
      t.column   :weight,:decimal, :null => false, :precision => 8, :scale => 2
    end
  end

  def self.down
    drop_table :weights
  end
end
