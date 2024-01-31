class MemberAvatarUploader < CarrierWave::Uploader::Base
    include Cloudinary::CarrierWave 
  
    def extension_allowlist
      %w[jpg jpeg png]
    end
  
    def public_id
      SecureRandom.uuid
    end
  end
  