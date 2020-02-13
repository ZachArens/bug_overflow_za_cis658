class User < ApplicationRecord
  validates :fname, :lname, :email, presence: true

  #TODO - need to update validation to pass tests
  # VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }

  validates :thumbnail, allow_blank: true,
            format: {with: /[\\\:\/a-zA-Z]+\.(gif|jpg|png)\Z/,
                     message: 'must be a URL for GIF, JPG, or PNG image.'}

  has_many :bugs

end
