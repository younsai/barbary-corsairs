class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about contact]

  def home
  end

  def about

  end

  def contact
  end

  def dasshboard
    if current_user.company.nil?
      @my_reports = Report.where('expert_id = ?', current_user.expert.id)
    elsif current_user.expert.nil?
      @my_programs = Program.where('company_id = ?', current_user.company.id)
    end
  end
end
