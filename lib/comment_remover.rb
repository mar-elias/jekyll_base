# frozen_string_literal: true

# Description: Jekyll plugin to remove comments from HTML, CSS, and JavaScript files

# Shortcomings:
# 1. Won't remove js '//' comments after code (in .js files), for this you'll need a parser.
# 2. Won't remove '//' comments inside <script> tags (in .html files).

# Note: For this file to work without the base theme, just put it inside the `_plugins` folder of the jekyll site.

module Jekyll
  class CommentRemover
    class << self
      def process(site)

        # Note: This will let it apply only in production mode (i.e. comments in local builds won't be removed) i.e. JEKYLL_ENV=production
        # return unless production_mode?

        Jekyll.logger.info "CommentRemover:", "Removing comments from generated files..."

        dest_dir = site.dest
        return unless Dir.exist?(dest_dir)

        processed_count = 0

        # Process all HTML, CSS, and JS files in the destination directory
        Dir.glob(File.join(dest_dir, '**', '*')).each do |file_path|
          next unless File.file?(file_path)

          ext = File.extname(file_path).downcase
          next unless ['.html', '.css', '.js'].include?(ext)

          content = File.read(file_path, encoding: 'UTF-8')
          original_content = content.dup

          case ext
          when '.html'
            content = remove_html_comments(content)
          when '.css'
            content = remove_css_comments(content)
          when '.js'
            content = remove_js_comments(content)
          end

          content = remove_empty_lines(content)

          # Only write if content changed
          if content != original_content
            File.write(file_path, content, encoding: 'UTF-8')
            processed_count += 1
            Jekyll.logger.debug "CommentRemover:", "Processed #{file_path.sub(dest_dir + '/', '')}"
          end
        end

        Jekyll.logger.info "CommentRemover:", "Comment removal complete (#{processed_count} files processed)"
      end

      private

      def production_mode?
        ENV['JEKYLL_ENV'] == 'production'
      end

      # Remove html comments: <!-- ... -->
      def remove_html_comments(content)
        result = content.dup

        result = result.gsub(/<!--[\s\S]*?-->/, '')
        result = result.gsub(/\/\*[\s\S]*?\*\//, '')

        result
      end

      # Remove CSS comments (single-line and multi-line): /* ... */
      def remove_css_comments(content)
        result = content.dup

        result = result.gsub(/\/\*[\s\S]*?\*\//, '')

        result
      end

      # Remove JavaScript comments: // ... and /* ... */
      # It won't remove '//' comments after code, for this you'll need a parser.
      def remove_js_comments(content)
        result = content.dup

        # Remove JS comments (single-line and multi-line): /* ... */
        result = result.gsub(/\/\*[\s\S]*?\*\//, '')

        # Strip leading/trailing whitespace from all lines
        stripped_lines = result.lines.map(&:strip)

        # Remove all lines starting with "//"
        stripped_lines.reject! { |line| line.start_with?("//") }

        result = stripped_lines.join("\n")

        result
      end

      # Remove empty lines (including lines with only whitespace)
      def remove_empty_lines(content)
        result = content.dup

        # First, strip leading/trailing whitespace from all lines
        stripped_lines = result.lines.map(&:strip)

        # Then, remove empty lines
        result = stripped_lines.reject(&:empty?).join("\n")

        result
      end

    end
  end
end

# Hook into Jekyll's post_write event (after all files are written)
Jekyll::Hooks.register(:site, :post_write) do |site|
  Jekyll::CommentRemover.process(site)
end


