class ChangeDatatypeEndDateOfPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :end_date, :datetime
  end
end
