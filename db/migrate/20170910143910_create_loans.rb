class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.float :amount
      t.text :detail
      t.string :user_email

      t.belongs_to :application, polymorphic: true
      t.belongs_to :company
      t.timestamps
    end
  end
end
