class CreateSuggestions < ActiveRecord::Migration[7.2]
  def change
    create_table :suggestions do |t|
      t.timestamps
    end
  end
end
