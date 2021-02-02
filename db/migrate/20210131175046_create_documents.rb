class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end
