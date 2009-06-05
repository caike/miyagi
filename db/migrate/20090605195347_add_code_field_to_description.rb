class AddCodeFieldToDescription < ActiveRecord::Migration
  def self.up 
    add_column :descriptions, :implementation_code, :string
    add_column :descriptions, :description_code, :string
    add_column :descriptions, :name, :string
    remove_column :descriptions, :code
  end

  def self.down
    remove_column :descriptions, :name
    remove_column :descriptions, :description_code
    remove_column :descriptions, :implementation_code
    add_column :descriptions, :code, :text
  end
end
