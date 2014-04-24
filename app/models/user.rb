class User < ActiveRecord::Base

  attr_accessor :password, :current_password, :password_confirmation

  has_many :tokens
  has_many :user_groups
  before_save :encrypt_password
  has_one :api_key  
  validates_confirmation_of :password, :on => :create
  validates_presence_of :password, :on => :create
  validates_length_of :password, :minimum => 4, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email 
  #validates_presence_of :first_name
  #validates_presence_of :last_name

   has_attached_file :avatar, :styles => { :medium => "300x300>",  :medium_s => "300x300#", :thumb => "64x64#" },        
                     :storage => :s3,
                     :bucket => 'default-init', #crear nuevo bucket en amazon y cambiarlo
                     :s3_credentials => {
                        :access_key_id => ENV['S3_KEY_ID'],
                        :secret_access_key => ENV['S3_SECRET_ACCESS_KEY']
                     },
                     :path => ":attachment/:id/:style/:basename.:extension"

  def to_json(scope = '')
    super(:only => [:id, :email], :methods => [:name, :access_token])
  end
  def to_s
    r = (self.first_name ? self.first_name.to_s+' ' : '')+self.last_name.to_s
    return r!='' ? r : self.email
  end

  def full_name
    self.to_s
  end

  def name
    self.to_s
  end

  def admin?
    self.admin==true
  end

  def self.authenticate(email, password)
    user = find_by_email(email.downcase)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def valid_password?(password)
    self.password_hash == BCrypt::Engine.hash_secret(password, self.password_salt)
  end

  def encrypt_password
   if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  def access_token
    self.api_key = self.api_key ? self.api_key : ApiKey.create(user_id: self.id)
    return self.api_key.access_token
  end
  def get_image(size = :medium)
    begin
      return self.avatar.url!='/avatars/original/missing.png' ? self.avatar(size) : self.image!=''&&self.image!=nil ? self.image : '/assets/images/missing.png'
    rescue
      return '/assets/images/missing.png'
    end
  end
  def has_image?
    return self.avatar.url!='/avatars/original/missing.png' 
  end

end
