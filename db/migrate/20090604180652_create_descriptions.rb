class CreateDescriptions < ActiveRecord::Migration
  def self.up
    create_table :descriptions do |t|
      t.string :name
      
      t.string :implementation_code
      t.string :test_code

      t.timestamps
    end
  end

  def self.down
    drop_table :descriptions
  end
end
