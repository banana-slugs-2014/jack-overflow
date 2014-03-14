class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
