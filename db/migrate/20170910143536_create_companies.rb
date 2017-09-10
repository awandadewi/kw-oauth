class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :ref_id
      t.text :pic
      t.text :meta
      t.boolean :approved, null: false, default: false

      t.belongs_to :application, polymorphic: true

      t.timestamps
    end
  end
end
