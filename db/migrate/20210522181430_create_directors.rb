class CreateDirectors < ActiveRecord::Migration[6.0]
  def change
    create_table :directors do |t|
      t.text :bio
      t.date :dob
      t.string :image
      t.string :name

      t.timestamps
    end
  end
end
