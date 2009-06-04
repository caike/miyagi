class CreateDescriptions < ActiveRecord::Migration
  def self.up
    create_table :descriptions do |t|
      t.text :code
      t.belongs_to :implementation

      t.timestamps
    end
  end

  def self.down
    drop_table :descriptions
  end
end
