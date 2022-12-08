class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text :text
      t.integer :deletepass
      t.integer :status
      t.timestamps
    end
  end
end
