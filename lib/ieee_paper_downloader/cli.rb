require 'thor'

module IEEEPaperDownloader
  class CLI < Thor
    INTERVAL = 3 # sec
    desc 'download KEYWORD', '[WIP]KEYWORDで検索してヒットした論文をカレントディレクトリにダウンロードします。'
    def download(keyword)
      articles = search(keyword)
      download_paper(articles)
    end

    desc 'csv CSV_FILE_PATH', 'CSV_FILE_PATHのCSVファイルに掲載されている論文をカレントディレクトリにダウンロードします'
    def csv(csv_file_path)
      articles = IEEEPaperDownloader.read_csv(csv_file_path)
      download_paper(articles)
    end

    no_commands do
      def search(keyword)
        result = IEEEPaperDownloader.search(keyword)
        articles = result['articles'].map do |article|
          {
            'article_number' => article['article_number'],
            'title'          => article['title']
          }
        end
        articles
      end

      def download_paper(articles, interval = INTERVAL)
        articles.each do |article|
          filename = "#{article['title']}.pdf"
          if File.exist?(filename)
            puts "Already downloaded \"#{article['title']}\"\n"
          else
            puts "Downloading \"#{article['title']}\"\n"
            IEEEPaperDownloader.download(article['article_number'], filename)
            puts "Sleep #{interval}sec"
            sleep interval
          end
        end
      end
    end
  end
end
