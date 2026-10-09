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
