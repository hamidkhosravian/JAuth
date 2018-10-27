class CreateJauthUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :jauth_users do |t|
      t.string   :email,              null: false
      t.string   :encrypted_password, null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.boolean  :confirmed, default: false

      t.timestamps
    end

    add_index :jauth_users, :email,                unique: true
    add_index :jauth_users, :reset_password_token, unique: true
    add_index :jauth_users, :confirmation_token,   unique: true
  end
end
