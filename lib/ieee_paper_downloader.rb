require 'ieee_paper_downloader/version'
require 'ieee_paper_downloader/cli'
require 'uri'
require 'net/http'
require 'json'
require 'csv'

module IEEEPaperDownloader
  API_URI = 'http://ieeexploreapi.ieee.org/api/v1/search/articles'.freeze
  API_KEY = ENV['IEEE_XPLORE_API']

  def search(query_text)
    raise "環境変数IEEE_XPLORE_APIがセットされていません" if API_KEY.nil?
    uri = "#{API_URI}?querytext=#{query_text}&format=json&subscribed=true&apikey=#{API_KEY}"
    result = JSON.parse(Net::HTTP.get(URI.parse(uri)))
    result
  end

  def download(article_number, filename)
    uri = "http://ieeexplore.ieee.org/stampPDF/getPDF.jsp?tp=&isnumber=&arnumber=#{article_number}"
    system("echo '#{uri}' | xargs wget -O '#{filename}'")
  end

  def read_csv(csv_path)
    csv_data = CSV.read(csv_path, headers: true)

    articles = csv_data.map do |record|
      pdf_link = record.find do |element|
        element[0].include?('PDF Link')
      end[1]
      article_number = Hash[URI.decode_www_form(URI.parse(pdf_link).query)]['arnumber']
      title = record.find do |element|
        element[0].include?('Document Title')
      end[1].gsub(/\//, ' and ')
      {
        'article_number' => article_number,
        'title'          => title
      }
    end
    articles
  end


  module_function :search, :download, :read_csv
end
