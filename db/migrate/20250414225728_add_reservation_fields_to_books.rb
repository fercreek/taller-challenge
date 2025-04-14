class AddReservationFieldsToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :status, :string
    add_column :books, :user_email, :string
  end
end
