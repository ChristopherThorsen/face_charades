class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :prompt, null: false, uniqueness: true

      t.timestamps null: false
    end
  end
end
