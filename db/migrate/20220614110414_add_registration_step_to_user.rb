class AddRegistrationStepToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :registration_step, :string
  end
end
