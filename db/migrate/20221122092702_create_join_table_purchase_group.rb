class CreateJoinTablePurchaseGroup < ActiveRecord::Migration[7.0]
  def change
    create_join_table :purchases, :groups do |t|
      # t.index [:purchase_id, :group_id]
      # t.index [:group_id, :purchase_id]
    end
  end
end
