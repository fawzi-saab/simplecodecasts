class AddPlanToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :plan
  end
end
