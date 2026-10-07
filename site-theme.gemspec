Gem::Specification.new do |spec|
  spec.name     = "mar-elias-jekyll-base"
  spec.version  = "0.1.0"
  spec.summary  = "Base jekyll foundation"
  spec.authors  = ["mar-elias"]
  spec.files    = `git ls-files -z`.split("\x0").select{ |f| f.match(%r{^(assets|_layouts|_includes|_sass|lib|_config\.yml)}i) } # select files starting with the defined names; so README.md, Gemfile, and .gitignore are dropped
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "jekyll"
end

