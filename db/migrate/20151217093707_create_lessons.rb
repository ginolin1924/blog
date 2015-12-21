class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :content
      t.integer :level

      t.timestamps null: false
    end
  end
end
