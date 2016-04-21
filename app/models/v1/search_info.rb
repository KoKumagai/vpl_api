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
      content['title'] = node.xpath('.//span[contains(@class, "title")]/a/text()').to_s.gsub(/&amp;/, '&')
      content['author'] = node.xpath('.//span[contains(@class, "author")]/a/text()').to_s
      content['format'] = node.xpath('.//span[contains(@class, "format")]')[0].text.gsub(/(\s)/, '')
      content['callNumber'] = node.xpath('.//span[contains(@class, "callNumber")]').text.strip
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

    def extract_availability_from(node)
      availability = node.xpath('.//span[contains(@class, "item_available")]').text.strip
      availability = node.xpath('.//span[contains(@class, "item_not_available")]').text.strip if availability.empty?
      availability = node.xpath('.//span[contains(@class, "item_on_order")]').text.strip if availability.empty?
      availability
    end
end
