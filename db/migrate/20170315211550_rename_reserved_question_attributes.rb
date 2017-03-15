class RenameReservedQuestionAttributes < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :type
    add_column :questions, :qtype, :string

    remove_column :questions, :order
    add_column :questions, :qorder, :int
  end
end
