class CreateTrainings < ActiveRecord::Migration
  def self.up
    create_table :trainings do |t|
      t.column :id,:number
      t.column :training_type,:string
      t.column :training_date,:datetime

      t.column :description,:string
      t.column :duration,:integer
      t.column :user_id,:integer
      t.column :calories,:integer
      
      #t.timestamps
    end
  end

  def self.down
    drop_table :trainings
  end
end
