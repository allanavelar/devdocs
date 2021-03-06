module Docs
  class Typescript < UrlScraper
    self.name = 'TypeScript'
    self.type = 'simple'
    self.release = '4.1.2'
    self.base_url = 'https://www.typescriptlang.org/docs/handbook'
    self.root_path = 'index.html'
    self.links = {
      home: 'https://www.typescriptlang.org',
      code: 'https://github.com/Microsoft/TypeScript'
    }

    html_filters.push 'typescript/entries', 'typescript/clean_html'

    options[:skip] = [
      '/react-&-webpack.html',
      '/asp-net-core.html',
      '/gulp.html',
      '/dom-manipulation.html',
      '/migrating-from-javascript.html',
      '/babel-with-typescript.html',
      '/intro.html'
    ]

    options[:skip_patterns] = [
      /2/,
      /typescript-/,
      /release-notes/,
      /introduction/,
      /tutorials/,
      /intro.html/
    ]

    options[:attribution] = <<-HTML
      &copy; 2012-2020 Microsoft<br>
      Licensed under the Apache License, Version 2.0.
    HTML

    def get_latest_version(opts)
      get_latest_github_release('Microsoft', 'TypeScript', opts)
    end
  end
end
