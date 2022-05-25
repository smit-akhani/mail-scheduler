class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :subject
      t.text :body
      t.datetime :scheduled_time
      t.string :send_to

      t.timestamps
    end
  end
end
