class CreateScriptTags < ActiveRecord::Migration[7.1]
  def change
    create_table :script_tags do |t|
      t.string :name
      t.string :code
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
