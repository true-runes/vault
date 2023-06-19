class FileService
  def initialize(filepath)
    @filepath = filepath
  end

  def write(text)
    File.open(@filepath, 'w') do |file|
      file.puts text
    end
  end
end
