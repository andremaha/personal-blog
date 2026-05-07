class CreateSites < ActiveRecord::Migration[8.1]
  def change
    create_table :sites do |t|
      t.string :title, null: false
      t.text :tagline
      t.text :meta_description
      t.timestamps
    end
  end
end
