class FileService
  def initialize(filepath)
    @filepath = filepath
  end

  def write(text)
    File.open(@filepath, 'w') do |file|
      file.puts text
    end
  end

  class << self
    # rubocop:disable Security/Eval
    def eval_plain_env_or_plain_text_variable(plain_env_or_plain_text)
      if plain_env_or_plain_text.start_with?('ENV')
        eval(plain_env_or_plain_text)
      else
        plain_env_or_plain_text
      end
    end
    # rubocop:enable Security/Eval
  end
end
