require 'open-uri'
require 'nokogiri'
require 'uri'

class V1::SearchInfo
  BASE_URL = 'https://vpl.bibliocommons.com/search?utf8=%E2%9C%93&commit=Search&searchOpt=catalogue&display_quantity=25'.freeze

  def initialize(keyword, category=nil, page=nil)
    @keyword = keyword
    @category = category
    @page = page
  end

  def parse
    contents = {}
    contents["status"] = 'OK'
    contents['info'] = []

    if @keyword.nil?
      contents["status"] = 'NG'
      return contents
    else
      @keyword.gsub!(' ', '+')
    end

    begin
      doc = Nokogiri::HTML.parse(open(create_url))
    rescue
      contents["status"] = 'NG'
      return contents
    end

    doc.xpath('/html/body//div[contains(@class, "list_item_outer")]').each do |node|
      content = {}
      content['title'] = extract_title_from(node)
      content['author'] = extract_author_from(node)
      content['rating'] = extract_rating_from(node)
      content['format'] = extract_format_from(node)
      content['callNumber'] = extract_callNumber_from(node)
      content['availability'] = extract_availability_from(node)
      contents['info'] << content
    end
    contents
  end

  private
    def create_url
      url = BASE_URL
      url += "&#{create_keyword}"
      url += "&#{create_category}"
      url += "&#{create_page}" if @page
      url
    end

    def create_keyword
      "q=#{@keyword}"
    end

    def create_category
      if @category
        "t=#{@category}"
      else
        "t=keyword"
      end
    end

    def create_page
      "page=#{@page}"
    end

    def extract_title_from(node)
      node.xpath('.//span[@class = "title"]/a/text()').to_s.gsub(/&amp;/, '&')
    end

    def extract_author_from(node)
      node.xpath('.//span[@class = "author"]/a/text()').to_s
    end

    def extract_rating_from(node)
      return nil if node.xpath('.//div[contains(@class, "search_ratings")]/i[contains(@class, "icon-star")]').empty?
      rating = node.xpath('.//div[contains(@class, "search_ratings")]/i[@class = "icon-star"]').count
      rating += 0.5 if 0 != node.xpath('.//div[contains(@class, "search_ratings")]/i[@class = "icon-star-half-alt"]').count
      rating
    end

    def extract_format_from(node)
      node.xpath('.//span[@class = "format"]')[0].text.gsub(/(\s)/, '')
    end

    def extract_callNumber_from(node)
      node.xpath('.//span[@class = "value callNumber"]').text.strip
    end

    def extract_availability_from(node)
      availability = node.xpath('.//span[@class = "item_available"]').text.strip
      availability = node.xpath('.//span[@class = "item_not_available"]').text.strip if availability.empty?
      availability = node.xpath('.//span[@class = "item_on_order"]').text.strip if availability.empty?
      availability
    end
end
