# encoding: utf-8

class BannerUploader < CarrierWave::Uploader::Base
  require 'carrierwave/processing/mini_magick'

  include CarrierWave::MiniMagick
  include CarrierWave::Processing::MiniMagick
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

  version :b_385_220, :if => :is_top_or_bottom?
  version :b_190_280, :if => :is_left_thin_long?
  version :b_190_160, :if => :is_left_thin_short?
  version :b_320_380, :if => :is_fat_long?
  version :b_320_320, :if => :is_fat_short?
  version :b_770_270, :if => :is_client_fat_top?
  version :b_380_270, :if => :is_client_thin_top?
  version :b_380_540, :if => :is_client_thin_bottom?


  
  version :b_385_220 do
    process :resize_to_limit => [385, 220]
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
    #process :my_resize => [380, 270]
    #process :quality => 90
    #process :convert => 'png'
    #process :colorspace => :rgb
    process resize_to_fill: [380,270]
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
    fn = model.filename
    fn.chomp(File.extname(fn)) + '.png' if original_filename.present?
  end


  protected

  def my_resize(width, height)
    manipulate! do |img|
      img.format("png") do |c|
        c.quality 100
        c.thumbnail "380x270"
      end
      img
    end
  end

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
