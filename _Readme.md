# Mar-Elias jekyll base (theme)

## 1. To use it:

1. Add to `_config.yml`:
```
theme: mar-elias-jekyll-base
```

2. Move `css` folder to `assets/css`

3. Add to `Gemfile`:

```
group :jekyll_plugins do
  gem "mar-elias-jekyll-base", git: "https://github.com/mar-elias/jekyll_base.git", branch: "main"
end
```

Or if serving locally:

```
group :jekyll_plugins do
  gem "mar-elias-jekyll-base", path: "../jekyll_base"
end
```

## 2. Files in this base:
1. `Gemfile` is a local file limited to this theme; it isn't copied to the child websites
2. Local `.html` files outside of the folders defined in `site-theme.gemspec` aren't copied either.
3. In `_config.yml` some values are excluded from being inherited. These default values are defined in
   https://github.com/jekyll/jekyll/blob/v4.4.1/lib/jekyll/configuration.rb#L7
   which are:
   ```
      DEFAULTS = {
        # Where things are
        "source"              => Dir.pwd,
        "destination"         => File.join(Dir.pwd, "_site"),
        "collections_dir"     => "",
        "cache_dir"           => ".jekyll-cache",
        "plugins_dir"         => "_plugins",
        "layouts_dir"         => "_layouts",
        "data_dir"            => "_data",
        "includes_dir"        => "_includes",
        "collections"         => {},

        # Handling Reading
        "safe"                => false,
        "include"             => [".htaccess"],
        "exclude"             => [],
        "keep_files"          => [".git", ".svn"],
        "encoding"            => "utf-8",
        "markdown_ext"        => "markdown,mkdown,mkdn,mkd,md",
        "strict_front_matter" => false,

        # Filtering Content
        "show_drafts"         => nil,
        "limit_posts"         => 0,
        "future"              => false,
        "unpublished"         => false,

        # Plugins
        "whitelist"           => [],
        "plugins"             => [],

        # Conversion
        "markdown"            => "kramdown",
        "highlighter"         => "rouge",
        "lsi"                 => false,
        "excerpt_separator"   => "\n\n",
        "incremental"         => false,

        # Serving
        "detach"              => false, # default to not detaching the server
        "port"                => "4000",
        "host"                => "127.0.0.1",
        "baseurl"             => nil, # this mounts at /, i.e. no subdirectory
        "show_dir_listing"    => false,

        # Output Configuration
        "permalink"           => "date",
        "paginate_path"       => "/page:num",
        "timezone"            => nil, # use the local timezone

        "quiet"               => false,
        "verbose"             => false,
        "defaults"            => [],

        "liquid"              => {
          "error_mode"       => "warn",
          "strict_filters"   => false,
          "strict_variables" => false,
        },

        "kramdown"            => {
          "auto_ids"      => true,
          "toc_levels"    => (1..6).to_a,
          "entity_output" => "as_char",
          "smart_quotes"  => "lsquo,rsquo,ldquo,rdquo",
          "input"         => "GFM",
          "hard_wrap"     => false,
          "guess_lang"    => true,
          "footnote_nr"   => 1,
          "show_warnings" => false,
        },
      }.each_with_object(Configuration.new) { |(k, v), hsh| hsh[k] = v.freeze }.freeze
   ```

