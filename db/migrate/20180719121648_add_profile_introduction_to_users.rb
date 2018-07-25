class AddProfileIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_introduction, :body
  end
end
