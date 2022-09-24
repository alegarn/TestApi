class CreateAudios < ActiveRecord::Migration[7.0]
  def change
    create_table :audios do |t|
      t.string :index
      t.string :show

      t.timestamps
    end
  end
end
