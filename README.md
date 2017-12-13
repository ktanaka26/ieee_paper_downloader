# IEEEPaperDownloader

IEEE Xploreに掲載された論文PDFのダウンロードを支援します

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ieee_paper_downloader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ieee_paper_downloader

## Usage

```
$ ieee_paper_downloader help
Commands:
  ieee_paper_downloader csv CSV_FILE_PATH  # CSV_FILE_PATHのCSVファイルに掲載されている論文をカレントディレクトリにダウンロードします
  ieee_paper_downloader download KEYWORD   # [WIP]KEYWORDで検索してヒットした論文をカレントディレクトリにダウンロードします。
  ieee_paper_downloader help [COMMAND]     # Describe available commands or one specific command

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ktanaka26/ieee_paper_downloader. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the IeeePaperDownloader project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ktanaka26/ieee_paper_downloader/blob/master/CODE_OF_CONDUCT.md).
