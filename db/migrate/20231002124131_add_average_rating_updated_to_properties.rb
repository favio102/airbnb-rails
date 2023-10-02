class AddAverageRatingUpdatedToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :average_rating, :decimal, default: "0.0", null: false
  end
end
