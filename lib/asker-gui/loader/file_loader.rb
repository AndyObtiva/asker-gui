# frozen_string_literal: true

require_relative 'haml_loader'

module FileLoader
  def self.load(filepath)
    if File.extname(filepath).casecmp('.haml').zero?
      file_content = HamlLoader.load filepath
    elsif File.extname(filename).casecmp('.xml').zero?
      file_content = File.read(filepath)
    else
      puts "[ERROR] FileLoader: Format error #{filename}"
      raise msg
    end
    file_content
  end
end
