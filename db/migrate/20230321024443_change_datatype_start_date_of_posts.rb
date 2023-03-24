class ChangeDatatypeStartDateOfPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :start_date, :datetime
  end
end
