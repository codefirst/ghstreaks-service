class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :device_token
      t.integer :hour
      t.integer :minute
      t.timestamp :last_notification_at

      t.timestamps
    end
  end
end
