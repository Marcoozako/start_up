class CreateEvenements < ActiveRecord::Migration[7.0]
  def change
    create_table :evenements do |t|
      t.string :title
      t.date :date
      t.integer :participant
      t.text :content

      t.timestamps
    end
  end
end
