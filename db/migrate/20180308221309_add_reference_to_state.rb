class AddReferenceToState < ActiveRecord::Migration[5.1]
  def change
    change_table :states do |t|
      t.references :game, foreign_key: true
    end
  end
end
