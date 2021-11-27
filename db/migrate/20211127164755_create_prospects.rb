class CreateProspects < ActiveRecord::Migration[6.1]
  def change
    create_table :prospects do |t|
      t.string :email
      t.string :full_name
      t.integer :phone
      t.string :status

      t.timestamps
    end
  end
end
