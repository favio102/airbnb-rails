class RemoveAverageRaitingFromProperties < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :average_raiting, :decimal
  end
end
