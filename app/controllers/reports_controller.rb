class ReportsController < ApplicationController
  before_action :set_program, only: %i[new create edit update destroy]
  before_action :set_report, only: %i[edit update destroy accept refuse]


  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.expert = current_user.expert
    @report.program = @program
    if @report.save
      redirect_to program_path(@program)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @report.update(report_params)
    redirect_to program_path(@program)
  end

  def destroy
    @report.destroy
    redirect_to programs_path, status: :see_other
  end

  def accept
    @report.status = 'accepted'
    redirect_to dashboard_path, notice: "Accepted" if @report.save
  end

  def refuse
    @report.status = 'refused'
    redirect_to dashboard_path, notice: "Refused" if @report.save
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:summary, :details, :paid)
  end
end
