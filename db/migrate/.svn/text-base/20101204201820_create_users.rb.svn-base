class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :username,:string
      t.column :password,:string
      t.column :salt,:string
      t.timestamps
    end
    User.create(:username=>'edi',:password=>'edi');
  end

  def self.down
    drop_table :users
  end
end
