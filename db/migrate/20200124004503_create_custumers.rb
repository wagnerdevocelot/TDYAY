class CreateCustumers < ActiveRecord::Migration[6.0]
  def change
    create_table :custumers do |t|
      t.string :name
      t.string :email
      t.string :smoker
      t.string :phone
      t.string :avatar

      t.timestamps
    end
  end
end
