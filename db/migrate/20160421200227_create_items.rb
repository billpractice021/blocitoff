class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :description, null: false
      t.boolean :complete, null: false, default: false 
 
      t.timestamps null: false
    end
  end
end
