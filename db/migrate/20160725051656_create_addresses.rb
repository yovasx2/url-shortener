class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :url
      t.string :short

      t.timestamps null: false
    end
  end
end
