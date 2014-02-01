json.extract! @banner, :id, :place, :filename, :text, :file
json.url Banner.find(@banner.id).file.url
