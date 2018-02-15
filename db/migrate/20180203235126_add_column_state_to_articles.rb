class AddColumnStateToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :state, :string, state: "in_draft"
  end
end
