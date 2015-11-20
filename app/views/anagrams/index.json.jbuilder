json.array!(@anagrams) do |anagram|
  json.extract! anagram, :id, :sentence, :is_anagram
  json.url anagram_url(anagram, format: :json)
end
