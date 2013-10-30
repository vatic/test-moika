class Banner < ActiveRecord::Base
  mount_uploader :file, BannerUploader
end
