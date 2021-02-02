class AddStatusToDocuments < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :status, :string, default: "pending"
  end
end
