class AnagramsController < ApplicationController
  before_action :set_anagram, only: [:show, :edit, :update, :destroy]

  # GET /anagrams
  # GET /anagrams.json
  def index
    @anagrams = Anagram.all
  end

  def is_anagram

  end

  # POST /anagrams
  # POST /anagrams.json
  def create
    @anagram = Anagram.new(anagram_params)

    respond_to do |format|
      if @anagram.save
        format.html { redirect_to @anagram, notice: 'Anagram was successfully created.' }
        format.json { render :show, status: :created, location: @anagram }
      else
        format.html { render :new }
        format.json { render json: @anagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anagrams/1
  # PATCH/PUT /anagrams/1.json
  def update
    respond_to do |format|
      if @anagram.update(anagram_params)
        format.html { redirect_to @anagram, notice: 'Anagram was successfully updated.' }
        format.json { render :show, status: :ok, location: @anagram }
      else
        format.html { render :edit }
        format.json { render json: @anagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anagrams/1
  # DELETE /anagrams/1.json
  def destroy
    @anagram.destroy
    respond_to do |format|
      format.html { redirect_to anagrams_url, notice: 'Anagram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anagram
      @anagram = Anagram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anagram_params
      params.require(:anagram).permit(:sentence, :is_anagram)
    end
end
