class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :due_date
      t.date :reminder_date
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
