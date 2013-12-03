# encoding: utf-8

class BannerUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  include Sprockets::Rails::Helper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :dropbox

  # Override the directory where uploaded files will be stored.
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    # asset_path([version_name, "default.png"].compact.join('_'))
    "/uploads/default/" + [version_name, "default.png"].compact.join('_')
  end

  # Create different versions of your uploaded files:

  version :b_380_285, :if => :is_top_or_bottom?
  version :b_190_280, :if => :is_left_thin_long?
  version :b_190_160, :if => :is_left_thin_short?
  version :b_320_380, :if => :is_fat_long?
  version :b_320_320, :if => :is_fat_short?
  version :b_770_270, :if => :is_client_fat_top?
  version :b_380_270, :if => :is_client_thin_top?
  version :b_380_540, :if => :is_client_thin_bottom?


  
  version :b_380_285 do
    process :resize_to_limit => [380, 285]
  end

  version :b_190_160 do
    process :resize_to_limit => [190, 160]
  end

  version :b_190_280 do
    process :resize_to_limit => [190, 280]
  end

  version :b_320_380 do
    process :resize_to_limit => [320, nil]
  end

  version :b_320_320 do
    process :resize_to_limit => [320, 320]
  end

  version :b_770_270 do
    process :resize_to_fill=> [770, 270]
  end

  version :b_380_270 do
    process :resize_to_fill => [380, 270]
  end
 
  version :b_380_540 do
    process :resize_to_fill => [380, 540]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  #def extension_white_list
  #  %w(jpg jpeg gif png)
  #end

  def filename
    model.filename
  end

  # DropBox config
  #CarrierWave.configure do |config|
  #config.dropbox_app_key = "ykxd3nnm9kut7qj"
  #config.dropbox_app_secret = "ertj7ttbfp83u7j"
  #config.dropbox_access_token = "f39jxu6o6ec3wlth"
  #config.dropbox_access_token_secret = "7isegmk64tal705"
  #config.dropbox_user_id = "157055272"
  #config.dropbox_access_type = "dropbox"
  #end

  protected
  def is_top_or_bottom? picture
    model.top? || model.bottom?
  end

  def is_left_thin_long? picture
    model.left_thin_long?
  end

  def is_left_thin_short? picture
    model.left_thin_short?
  end

  def is_fat_long? picture
    image = MiniMagick::Image.open(picture.path)
    Rails.logger.debug "minimagick:width: #{image[:width]} height: #{image[:height]}"
    (model.comment? || model.request?) && model.fat_long?
  end

  def is_fat_short? picture
    (model.comment? || model.request?) && model.fat_short?
  end

  def is_client_thin_bottom? picture
    model.client_thin_bottom?
  end

  def is_client_thin_top? picture
    model.client_thin_top?
  end

  def is_client_fat_top? picture
    model.client_fat_top?
  end

end
