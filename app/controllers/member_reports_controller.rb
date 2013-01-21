class MemberReportsController < ApplicationController
  def index
    @member_report = MemberReport.new(params[:member_report])
    @assets = @member_report.assets.page(params[:page])
  end
end
