class AddCloumnToUserDiscussion < ActiveRecord::Migration
   def self.up
       add_column :user_discussions ,:thesis ,:text
       add_column :user_discussions ,:argument ,:text
  end
    def self.down
      remove_column :user_discussion ,:thesis
      remove_column :user_discussion ,:argument 
  end
end
