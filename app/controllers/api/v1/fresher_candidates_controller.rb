class Api::V1::FresherCandidatesController < ApplicationController
  layout "active_employee"

  def new
    @fresher_candidate = FresherCandidate.new
    @fresher_candidate.candidate_educations.build # Build associated CandidateEducation records
  end

  def create
    @fresher_candidate = FresherCandidate.new(fresher_candidate_params)
    if @fresher_candidate.save
      render json: @fresher_candidate, status: :created
    else
      render json: { errors: @fresher_candidate.errors.full_messages }, status: :unprocessable_entity
    end
  end  

  def thanks
  end

  def access_pass
    # @fresher_candidate = FresherCandidate.find(params[:id])
    # pdf = WickedPdf.new.pdf_from_string(
    # render_to_string('access_pass', layout: false))
    # send_data(pdf,
    # filename: 'access_pass.pdf',
    # type: 'application/pdf',
    # disposition: 'attachment')
  end

  def search
    # if params[:search]
    #   @fresher_profile = FresherProfile.where(contact: params[:search]).first
    # end
    # @fresher_profile ||= FresherProfile.new
  end

  def appeared
    # if params[:contact]
    #   @fresher_profile = FresherProfile.where(contact: params[:contact], id: registration_no_to_id).first
    #   @fresher_profile.in_process! unless @fresher_profile.nil?
    # end
    # @fresher_profile ||= FresherProfile.new
    # if @fresher_profile.persisted?
    #   redirect_to thanks_fresher_profiles_path(registration_no: params[:registration_no])
    # else
    #   redirect_to search_fresher_profiles_path
    # end
  end

  def thanks
    # @fresher_profile = FresherProfile.find(registration_no_to_id)
  end

  def result
    # @fresher_profile = FresherProfile.find(params[:id])
  end

  def selected_component
    # @fresher_profile = FresherProfile.find(params[:id])
    # @fresher_profile.update_attributes(:status, 'true')
  end

  private

    def registration_no_to_id
      params[:registration_no][7..-1].to_s.to_i
    end

    def fresher_candidate_params
      params.require(:fresher_candidate).permit(:recruitment_drive_id, :first_name, :last_name, :email, :phone, :date_of_birth, :gender, :marital_status, :current_location, :permanent_location, :resume, candidate_educations_params)
    end

    def candidate_educations_params
      {candidate_educations_attributes: [ :qualification, :university, :institute, :completion_year, :percentage, :qualification_type, :qualification_mode]}
    end
end
