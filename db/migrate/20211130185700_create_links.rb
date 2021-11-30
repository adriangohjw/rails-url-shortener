class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.text :original_url
      t.text :shortened_path

      t.timestamps
    end
  end
end
