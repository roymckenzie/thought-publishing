class AddSummaryToThought < ActiveRecord::Migration
  def change
    add_column :thoughts, :summary, :string
  end
end
