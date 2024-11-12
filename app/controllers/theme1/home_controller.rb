class Theme1::HomeController < ApplicationController
  layout "theme1/application"

  before_action :fetch_job_details, only: [:career_detail]
  before_action :fetch_experience_candidate_form, only: [:apply_for_job]
  # before_action :set_vacancies, only: [:career, :apply_for_job]

  def home; end
  def services; end
  def hire_us; end
  def portfolio; end
  def about; end
  def contact; end
  def faq; end

  def contact_section
  end

  def blogs; end

  def blog_details; end

  def technology
    @language = params[:language]
  end

  def service_detail
    @tab = params[:tab]
  end

  def career; end

  def career_detail; end

  def apply_for_job
    respond_to do |format|
      format.html
      format.js
    end
  end


  def submit_application
    response = HTTParty.post(
      api_url('experience_candidates'),
      body: application_body.merge(vacancy_id: params[:vacancy_id]),
      headers: { 'Content-Type' => 'multipart/form-data' }
    )
    if response.success?
      redirect_to theme1_home_career_path, notice: "Application submitted successfully!"
    else
      flash[:error] = "Please fill all the fields."
      render :apply_for_job, status: :unprocessable_entity
    end
  end

  private

  def set_vacancies
    @vacancies = fetch_api_data('vacancies') || []
    if @vacancies.nil? || @vacancies.empty?
      flash[:error] = "No vacancies available."
    end
  end

  def fetch_api_data(endpoint)
    response = HTTParty.get(api_url(endpoint))
    Rails.logger.info "API Response for #{endpoint}: #{response.body}"
    if response.success?
      response.parsed_response || []
    else
      []
    end
  end

  def fetch_job_details
    @api_data = fetch_api_data("vacancies/#{params[:id]}")
  end

  def fetch_experience_candidate_form
    @experience_candidate = fetch_api_data('experience_candidates/new')
  end

  def application_body
    application_params.to_h.merge(resume: params[:resume])
  end

  def application_params
    params.permit(
      :vacancy_id, :first_name, :last_name, :email, :phone, :date_of_birth,
      :gender, :current_location, :permanent_location, :marital_status,
      :relevant_experience, :total_experience, :any_gap, :current_ctc,
      :expected_ctc, :expected_negotiable, :notice_period,
      :notice_period_negotiable, :resume
    )
  end

  def api_url(endpoint)
    "#{Rails.configuration.api_base_url}/#{endpoint}"
  end
end
