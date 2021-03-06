class NodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diagram, only: [:index, :new, :create]
  before_action :set_node, only: [:show, :edit, :update, :destroy]

  # GET /nodes
  # GET /nodes.json
  def index
    @nodes = Node.includes(:lines).where(user_id: current_user.id, diagram_id: @diagram.id)
  end

  # GET /nodes/1
  # GET /nodes/1.json
  def show
  end

  # GET /nodes/new
  def new
    @node = Node.new
  end

  # GET /nodes/1/edit
  def edit
  end

  # POST /nodes
  # POST /nodes.json
  def create
    @node = Node.new(node_params)
    @node.user = current_user
    @node.diagram = @diagram

    respond_to do |format|
      if @result = @node.save
        format.html { redirect_to @node, notice: 'Node was successfully created.' }
        format.json { render :show, status: :created, location: @node }
        format.js
      else
        format.html { render :new }
        format.json { render json: @node.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /nodes/1
  # PATCH/PUT /nodes/1.json
  def update
    respond_to do |format|
      if @result = @node.update(node_params)
        format.html { redirect_to @node, notice: 'Node was successfully updated.' }
        format.json { render :show, status: :ok, location: @node }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @node.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.json
  def destroy
    respond_to do |format|
      if @result = @node.destroy
        format.html { redirect_to diagram_nodes_url(@diagram), notice: 'Node was successfully destroyed.' }
        format.json { head :no_content }
        format.js
      else
        format.html { redirect_to diagram_nodes_url(@diagram), notice: 'Node was unsuccessfully destroyed.'  }
        format.json { render json: @node.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_node
      @node = Node.find(params[:id])
      @diagram = @node.diagram
      head :forbidden unless @node.user_id == current_user.id
    end

    def set_diagram
      @diagram = Diagram.find(params[:diagram_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def node_params
      params.require(:node).permit(:description)
    end
end
