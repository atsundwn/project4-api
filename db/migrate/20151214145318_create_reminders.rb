class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :message, null: false
      t.datetime :send_date, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
