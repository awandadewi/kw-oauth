class API::V1::CompaniesController < API::V1::ApplicationController

  def register
    @company = Company.new
    @company.name = params[:company_name]
    @company.ref_id = params[:id]
    @company.pic = params[:pic_name]
    @company.meta = params
    @company.approved = true
    @company.application = current_application
    response_bad_request unless @company.save
  end

end
