class AnagramsController < ApplicationController
  before_action :set_anagram, only: [:show, :edit, :update, :destroy]

  def index
    @anagram = Anagram.new
  end

  def create
    @anagram = Anagram.new(anagram_params)
    is_anagram = @anagram.check_anagram(anagram_params)

    respond_to do |format|
      if @anagram.save && is_anagram
        @anagram.is_anagram = true
        format.html { redirect_to :back, notice: 'Its an anagram' }
      else
        @anagram.is_anagram = false
        format.html { redirect_to :back, notice: 'Its not an anagram' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anagram
      @anagram = Anagram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anagram_params
      params.require(:anagram).permit(:sentence, :sentence2, :is_anagram)
    end
end
