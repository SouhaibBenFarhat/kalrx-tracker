class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.string  :session_hash
      t.string :user_hash
      t.integer :duration, default: 0
      t.string :site
      t.string :path
      t.timestamps
    end
  end
end
