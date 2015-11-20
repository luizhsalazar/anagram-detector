class AddSentence2ToAnagram < ActiveRecord::Migration
  def change
    add_column :anagrams, :sentence2, :text
  end
end
