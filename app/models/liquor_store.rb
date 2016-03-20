class LiquorStore < ActiveRecord::Base
    mount_uploader :logo, LogoUploader
    
    geocoded_by :address
    after_validation :geocode
end
