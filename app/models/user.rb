# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  email                 :string(255)
#  confirmation_code     :string(255)
#  password_digest       :string(255)
#  remember_token        :string(255)
#  username              :string(255)
#  first_name            :string(255)
#  last_name             :string(255)
#  new_email             :string(255)
#  confirmed             :boolean
#  admin                 :boolean
#  created_at            :datetime
#  updated_at            :datetime
#  selected_display_name :integer          default(0)
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :likes, dependent: :destroy

  USERNAME_REGEX = /\A[a-zA-Z0-9_\-]+\z/
  NAME_REGEX = /\A[a-zA-Z\-]+\z/

  validates(:username,
            presence: true,
            format: { with: USERNAME_REGEX })
  validates(:first_name,
            presence: true,
            format: { with: NAME_REGEX })
  validates(:last_name,
            presence: true,
            format: { with: NAME_REGEX })

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  def self.find_by_identifier(identifier)
    User.find_by_username(identifier) || User.find_by_email(identifier)
  end

  def display_name(option = self.selected_display_name)
    case option
    when 0 then self.first_name
    when 1 then self.last_name
    when 2 then self.username
    when 3 then "#{self.first_name} #{self.last_name}"
    else "User"
    end
  end

  def display_name_options
    (0..3).inject([]) do |arr, option|
      arr << [display_name(option), option]
    end
  end

private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
