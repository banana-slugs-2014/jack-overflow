class ChangeVotesTable < ActiveRecord::Migration
  def up
    change_column :votes, :value, :integer, :default => 0
  end

  def down
  end
end
