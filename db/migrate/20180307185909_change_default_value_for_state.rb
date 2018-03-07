class ChangeDefaultValueForState < ActiveRecord::Migration[5.1]
  change_table :states do |t|
    t.change :state, :string, {default: "like"}
  end
end
