module ApplicationHelper
  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end

  #def broadcast(channel, &block)
  #  message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN}}
  #  uri = URI.parse("http://localhost:9292/faye")
  #  Net::HTTP.post_form(uri, :message => message.to_json)
  #end

end
