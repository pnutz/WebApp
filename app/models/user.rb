class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable

	after_create :initialize_folder, :auto_confirm
				 
	has_many :receipts
  has_many :folders
	has_many :folder_types
	
  before_save :ensure_authentication_token

	Roles = [:admin, :user]
	def is?( requested_role )
		self.role == requested_role.to_s
	end
	
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

	def initialize_folder
		self.folder_types.create(:name => "Your first tab")
	end
	
  def auto_confirm
    puts "auto confirming"
    # auto confirm in development so we don't have to confirm email addresses
    if Rails.env.development?
      puts "Setting #{DateTime.now}"
      self.confirmed_at = DateTime.now
      self.save
    end
	end

end
