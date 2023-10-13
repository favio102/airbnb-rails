class AddNullFalseConstraintToPropertiesToUserId < ActiveRecord::Migration[7.0]
  def up
    # Update existing records to set user_id to a non-null value
    execute("UPDATE properties SET user_id = 1 WHERE user_id IS NULL")

    # Change the column to NOT NULL
    change_column :properties, :user_id, :bigint, null: false, default: nil
  end

  def down
    # Change the column back to allow NULL values
    change_column :properties, :user_id, :bigint, null: true, default: nil
  end
end
