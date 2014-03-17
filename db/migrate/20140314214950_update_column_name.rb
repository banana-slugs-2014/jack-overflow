class UpdateColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :parent_id, :question_id
  end
end
