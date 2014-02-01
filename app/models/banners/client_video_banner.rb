class ClientVideoBanner < ClientBanner
  before_save :change_url
  private
    def change_url
      unless self.filename.nil?
        base = "//www.youtube.com/embed/"
        suffix = "?wmode=transparent"
        query = URI.parse(self.filename).query
        if !query.nil?
          #&& (/wmode=transparent/ =~ self.filename).nil?
          self.filename = base + query[2..-1] + suffix
        else
          self.filename += suffix
        end
      end
    end
end
