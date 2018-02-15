class ChangeVisitCountIntegerToIntegerDefault < ActiveRecord::Migration[5.1]
  def change
  	remove_column :articles,:visit_count, :integer
  	add_column :articles,:visit_count, :integer, default: 0
  end
end
