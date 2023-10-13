class RemoveAverageRatingFromProperties < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :average_rating, :decimal
  end
end
