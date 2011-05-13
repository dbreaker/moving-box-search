xml.instruct!
xml.urlset "xmlns" => "http://www.google.com/schemas/sitemap/0.84" do

    @move_sizes.each do |move_size|
      xml.url do
        url = "http://www.movingboxsearch.com/kits/#{move_size.slug}"
        xml.loc(url)
        xml.lastmod w3c_date(Time.now)
        xml.changefreq  "weekly"
      end 
    end

    page_array = [
      "http://www.movingboxsearch.com/",
      "http://www.movingboxsearch.com/content/about_us",
      "http://www.movingboxsearch.com/content/contact_us"
      ]
    
      #all_other_pages
      page_array.each do |page|
        xml.url do
          url = page 
          xml.loc(url)
          xml.lastmod w3c_date(Time.now)
          xml.changefreq  "weekly"
        end 
      end
end