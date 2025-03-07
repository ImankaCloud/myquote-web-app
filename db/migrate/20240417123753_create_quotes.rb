class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.text :text, null: false
      t.integer :publication_year, null: false
      t.boolean :is_public, default:true
      t.references :user, null: false, foreign_key: true
      t.references :philosopher, null: false, foreign_key: true
      t.text :comment, null: false

      t.timestamps
    end
  end
end
