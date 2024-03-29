
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ieee_paper_downloader/version"

Gem::Specification.new do |spec|
  spec.name          = "ieee_paper_downloader"
  spec.version       = IEEEPaperDownloader::VERSION
  spec.authors       = ["Kohei Tanaka"]
  spec.email         = ["kohei@pluslab.org"]

  spec.summary       = "IEEE Xploreに掲載された論文PDFのダウンロードを支援します"
  spec.homepage      = "https://github.com/ktanaka26/ieee_paper_downloader"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
