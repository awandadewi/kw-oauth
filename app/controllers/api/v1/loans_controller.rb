class API::V1::LoansController < API::V1::ApplicationController

  def apply
    company = Company.find_by(ref_id: params[:company_id])
    response_bad_request if company.blank?

    @loan = Loan.new
    @loan.company = company
    @loan.application = current_application
    @loan.amount = params[:amount]
    @loan.user_email = params[:email]
    @loan.detail = params
    response_bad_request unless @loan.save
  end

end
