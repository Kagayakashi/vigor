class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :from
      t.time :to

      t.timestamps
    end
  end
end
