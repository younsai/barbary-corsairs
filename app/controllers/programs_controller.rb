class ProgramsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]
  before_action :set_program, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[index]


  # GET /programs or /programs.json
  def index
    @programs = Program.all
  end

  # GET /programs/1 or /programs/1.json
  def show
    @program_scopes = @program.scopes
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs or /programs.json
  def create
    @program = Program.new(program_params)
    @program.company = current_user.company

    if @program.save
      redirect_to new_program_scope_path(@program), notice: "Program was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /programs/1 or /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to new_program_scope_path(@program), notice: "Program was successfully updated." }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1 or /programs/1.json
  def destroy
    @program.destroy

    respond_to do |format|
      format.html { redirect_to programs_path, notice: "Program was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def my_programs
    @my_programs = Program.where("company.user = ?", current_user)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_program
    @program = Program.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def program_params
    params.require(:program).permit(:title, :terms, :accepted_vulnerabilities, :excluded_vulnerabilities, :vulnerability_levels, :bounty_range)
  end
end
