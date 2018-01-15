class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.belongs_to :category, foreign_key: true
      t.string :name
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
