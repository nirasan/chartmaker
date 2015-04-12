class DiagnoseController < ApplicationController
  def index
    @diagrams = Diagram.all.order("updated_at DESC")
  end

  def play
    @diagram = Diagram.find_by_id(params[:diagram_id])
  end
end
