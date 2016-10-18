class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :ip
      t.string :category

      t.timestamps
    end
  end
end
