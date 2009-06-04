class CreateImplementations < ActiveRecord::Migration
  def self.up
    create_table :implementations do |t|
      t.text :code

      t.timestamps
    end
  end

  def self.down
    drop_table :implementations
  end
end
