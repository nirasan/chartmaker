class DiagramsController < ApplicationController
  require "open3"

  before_action :authenticate_user!
  before_action :set_diagram, only: [:show, :edit, :update, :destroy, :image]

  # GET /diagrams
  # GET /diagrams.json
  def index
    @diagrams = current_user.diagrams
  end

  # GET /diagrams/1
  # GET /diagrams/1.json
  def show
  end

  # GET /diagrams/new
  def new
    @diagram = Diagram.new
  end

  # GET /diagrams/1/edit
  def edit
  end

  # POST /diagrams
  # POST /diagrams.json
  def create
    @diagram = Diagram.new(diagram_params)
    @diagram.user = current_user

    respond_to do |format|
      if @diagram.save
        format.html { redirect_to @diagram, notice: 'Diagram was successfully created.' }
        format.json { render :show, status: :created, location: @diagram }
      else
        format.html { render :new }
        format.json { render json: @diagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diagrams/1
  # PATCH/PUT /diagrams/1.json
  def update
    respond_to do |format|
      if @diagram.update(diagram_params)
        format.html { redirect_to @diagram, notice: 'Diagram was successfully updated.' }
        format.json { render :show, status: :ok, location: @diagram }
      else
        format.html { render :edit }
        format.json { render json: @diagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diagrams/1
  # DELETE /diagrams/1.json
  def destroy
    @diagram.destroy
    respond_to do |format|
      format.html { redirect_to diagrams_url, notice: 'Diagram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def image
    dot = @diagram.get_dot
    o, e, s = Open3.capture3("dot -T png", :stdin_data => dot.to_s)
    send_data o, :disposition => "inline", :type => "image/png"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagram
      @diagram = Diagram.find(params[:id])
      head :forbidden unless @diagram.user_id == current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diagram_params
      params.require(:diagram).permit(:title, :description)
    end
end
