# To change this template, choose Tools | Templates
# and open the template in the editor.

class AddRole <ActiveRecord::Migration
  def self.up
    add_column :users,:role,:string
  end
  def self.down
    remove_column :users, :role
  end
end
