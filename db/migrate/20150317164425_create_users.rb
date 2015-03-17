class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :oauth_user_id
      t.string :token
      t.string :secret
    end
  end
end
