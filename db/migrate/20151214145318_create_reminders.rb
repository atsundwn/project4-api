class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :message, null: false
      t.string :send_date, null: false
      t.boolean :sent, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
