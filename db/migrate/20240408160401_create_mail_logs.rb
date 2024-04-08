class CreateMailLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :mail_logs do |t|
      t.references :user
      t.string :mailer
      t.string :to
      t.text :subject
      t.text :body

      t.timestamps
    end
  end
end
