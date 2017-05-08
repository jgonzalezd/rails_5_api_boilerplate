class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.references :user, foreign_key: true
      t.string    :name,  null: false
      t.string    :ip
      t.string    :jti,   null: false
      # t.boolean   :valid, default: true
      # t.datetime  :invalidation_datetime
      t.timestamps
    end

    add_index :devices, :jti, unique: true
  end
end
