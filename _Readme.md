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
`Gemfile` is a local file limited to this theme; it isn't copied
