class EvenementsController < ApplicationController
  before_action :set_evenement, only: %i[ show edit update destroy ]

  def index
    @evenements = Evenement.all
  end

  def show
  end


  def new
    @evenement = Evenement.new
  end


  def edit
  end

  def create
    @evenement = Evenement.new(evenement_params)

    respond_to do |format|
      if @evenement.save
        format.html { redirect_to evenement_url(@evenement), notice: "Evenement was successfully created." }
        format.json { render :show, status: :created, location: @evenement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @evenement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @evenement.update(evenement_params)
        format.html { redirect_to evenement_url(@evenement), notice: "Evenement was successfully updated." }
        format.json { render :show, status: :ok, location: @evenement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @evenement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @evenement.destroy

    respond_to do |format|
      format.html { redirect_to evenements_url, notice: "Evenement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_evenement
      @evenement = Evenement.find(params[:id])
    end

    def evenement_params
      params.require(:evenement).permit(:title, :date, :participant, :content, :photo)
    end
end
