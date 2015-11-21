require 'test_helper'

class AnagramsControllerTest < ActionController::TestCase

  setup do
    @anagram = Anagram.new("sentence"=>"joão", "sentence2"=>"joao")
    request.env["HTTP_REFERER"] = root_path
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create anagram" do
    assert_difference('Anagram.count') do
      post :create, anagram: { is_anagram: @anagram.is_anagram, sentence: @anagram.sentence, sentence2: @anagram.sentence2 }
    end

    assert_redirected_to root_path
  end

end
