class User < ApplicationRecord
  validates_presence_of   :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of     :email, with: /@/

  has_secure_password

  before_save   :downcase_email
  before_create :generate_confirmation_instructions

  private ########################  PRIVATE  ##########################

  def downcase_email
    self.email = email.downcase
  end

  def generate_confirmation_instructions
    self.confirmation_token = SecureRandom.hex(10)
    self.confirmation_sent_at = Time.now.utc
  end
end
