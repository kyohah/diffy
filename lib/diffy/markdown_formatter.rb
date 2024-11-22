module Diffy
  class MarkdownFormatter

    def initialize(diff, options = {})
      @diff = diff
      @options = options
    end

    def to_s
      wrap_lines(@diff.map { |line| wrap_line(line) })
    end

    private

    def wrap_line(line)
      case line
      when /^(---|\+\+\+|\\\\)/
        "> #{line.chomp}"
      when /^\+/
        "+ *#{line.chomp[1..]}*"
      when /^-/
        "- ~#{line.chomp[1..]}~"
      when /^ /
        "  #{line.chomp}"
      when /^@@/
        "  `#{line.chomp}`"
      end
    end

    def wrap_lines(lines)
      if lines.empty?
        "_No changes detected_"
      else
        lines.join("\n")
      end
    end
  end
end
