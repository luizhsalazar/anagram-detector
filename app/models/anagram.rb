require "i18n"

class Anagram < ActiveRecord::Base

  validates_presence_of :sentence, :sentence2

  def check_anagram(anagrams)
    sentence = I18n.transliterate(anagrams[:sentence]).downcase
    sentence2 = I18n.transliterate(anagrams[:sentence2]).downcase

    i = 0
    if sentence.size == sentence2.size
      return anagram(sentence, sentence2, i) ? true : false
    end

    false
  end

  def anagram(sentence, sentence2, i)

    current_sentence = sentence.gsub(/\s+/, "").split('')

    current_sentence.each { |s|
      unless sentence2.include? s
        return false
      end
    }

    i == 1 ? true : anagram(sentence2, sentence, i+=1)

  end

end
