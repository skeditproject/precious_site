# == Schema Information
#
# Table name: fresher_candidates
#
#  id                   :bigint           not null, primary key
#  current_location     :string
#  date_of_birth        :date
#  deleted_at           :datetime
#  email                :string
#  first_name           :string
#  gender               :integer
#  last_name            :string
#  marital_status       :integer          default("single")
#  permanent_location   :string
#  phone                :string
#  status               :integer          default("pending")
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  recruitment_drive_id :bigint           not null
#
# Indexes
#
#  index_fresher_candidates_on_recruitment_drive_id  (recruitment_drive_id)
#
# Foreign Keys
#
#  fk_rails_...  (recruitment_drive_id => recruitment_drives.id)
#
class FresherCandidate < ApplicationRecord

  # Include Modules

  # Belongs To Associations
  belongs_to :recruitment_drive

  # Has One/Has Many Associations
  has_one_attached :resume, dependent: :destroy

  has_many :candidate_educations , as: :candidate
  accepts_nested_attributes_for :candidate_educations, reject_if: :all_blank, allow_destroy: true
  validates_associated :candidate_educations

  # CallBacks

  # Scopes
  scope :qualification_mode, ->(search) {
    includes(:candidate_educations)
    .where(candidate_educations: {qualification_mode: search})
  }

  # Enums
  enum marital_status: %i[single married widowed separated]
  enum gender: %i[male female other]
  enum status: %i[pending rejeced seleced]

  # Validations
  validates :recruitment_drive_id, presence: true
  validates :first_name, presence: true,
            length: { maximum: 50 }

  validates :last_name, presence: true,
            length: { maximum: 50 }

  # validates :email, presence: true,
            # length: { maximum: 255 },
            # format: VALID_EMAIL_REGEX,
            # uniqueness: { case_sensitive: false }

  validates :phone, presence: true,
            length: { maximum: 50 }

  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :current_location, presence: true,
            length: { maximum: 50 }

  validates :permanent_location, presence: true,
            length: { maximum: 50 }

  validates :marital_status, presence: true
  validates :status, presence: true
  validates :resume, presence: true
  validate :resume_type

  def resume_type
    if resume.attached? && !resume.content_type.in?(%w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:resume, 'Must be a PDF or a DOC file')
    end
  end

  def registration_no
    "SKD#{Date.current.year}#{self.id.to_s.rjust(8,'0')}"
  end

  def self.ransackable_scopes(auth_object = nil)
    [:qualification_mode]
  end
end
