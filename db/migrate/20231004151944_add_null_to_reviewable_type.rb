class AddNullToReviewableType < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :reviewable_type, :string, null: false
  end
end
