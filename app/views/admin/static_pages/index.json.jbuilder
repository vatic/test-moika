json.array!(@static_pages) do |static_page|
  json.extract! static_page, :title, :header, :content, :permalink
  json.url static_page_url(static_page, format: :json)
end
