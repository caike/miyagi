class AddCodeFieldToDescription < ActiveRecord::Migration
  def self.up 
    add_column :descriptions, :implementation_code, :string
    add_column :descriptions, :description_code, :string
    remove_column :descriptions, :code
  end

  def self.down
    add_column :descriptions, :code, :text
    remove_column :descriptions, :description_code
    remove_column :descriptions, :implementation_code
  end
end
