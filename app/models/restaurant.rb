class Restaurant < ActiveRecord::Base
    mount_uploader :logo, LogoUploader
    
    belongs_to :user
    
    geocoded_by :address
    after_validation :geocode
    
    validates_presence_of :name
end
