json.extract! @banner, :id, :place, :filename
json.url Banner.find(@banner.id).file.url
