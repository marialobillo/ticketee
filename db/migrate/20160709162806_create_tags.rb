class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :tag_id, :ticket_id
    end
  end
end
