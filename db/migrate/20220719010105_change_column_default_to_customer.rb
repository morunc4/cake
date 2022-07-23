class ChangeColumnDefaultToCustomer < ActiveRecord::Migration[6.1]
  def change
    change_column_default :customers,:is_deleted,null: false,default: true
  end
end
