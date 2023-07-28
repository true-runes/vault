namespace :json do
  desc 'JSON で作品別にエクスポートする'
  task export: :environment do
    filename_to_array_method_map = {
      'char_s1.json' => Constant::GssCharacterNames.s1,
      'char_s2.json' => Constant::GssCharacterNames.s2,
      'char_gaiden.json' => Constant::GssCharacterNames.gaiden,
      'char_s3.json' => Constant::GssCharacterNames.s3,
      'char_s4.json' => Constant::GssCharacterNames.s4,
      'char_rhapsodia.json' => Constant::GssCharacterNames.rhapsodia,
      'char_s5.json' => Constant::GssCharacterNames.s5,
      'char_tk.json' => Constant::GssCharacterNames.tk,
      'char_tsumutoki.json' => Constant::GssCharacterNames.tsumutoki
    }

    filename_to_array_method_map.each do |filename, array_method|
      File.write(
        "db/json/#{filename}",
        JSON.pretty_generate(array_method)
      )
    end
  end
end
