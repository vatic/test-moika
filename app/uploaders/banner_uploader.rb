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
    asset_path("assets/fallback/" + [version_name, "default.png"].compact.join('_'))
    #"/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Create different versions of your uploaded files:

  version :b_335_205, :if => :is_top_or_bottom?
  version :b_160_190, :if => :is_left_thin_long?
  version :b_160_160, :if => :is_left_thin_short?

  version :b_335_205 do
    process :resize_to_fit => [335, 205]
  end

  version :b_160_160 do
    process :resize_to_limit => [160, 160]
  end

  version :b_160_190 do
    process :resize_to_fit => [160, 190]
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


end
