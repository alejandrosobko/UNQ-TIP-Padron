class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.references :visit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end