require 'csv'

class DownloadCsvService
  # スプレッドシートからのダウンロードを大前提とする
  def initialize(spreadsheet_id:, worksheet_name:)
    # YAML から "ENV['hoge']" という「文字列」で渡ってくることがある
    this_spreadsheet_id = FileService.eval_plain_env_or_plain_text_variable(spreadsheet_id)

    @fetcher = FetchDataTableService::FromSpreadsheet.new(
      spreadsheet_id: this_spreadsheet_id,
      worksheet_name:
    )
  end

  def execute(filepath)
    csv_contents = CSV.generate do |csv|
      csv << @fetcher.headers
      @fetcher.rows.each do |row|
        csv << row
      end
    end

    file_service = FileService.new(filepath)
    FileUtils.mkdir_p(File.dirname(filepath)) unless File.directory?(File.dirname(filepath))
    file_service.write(csv_contents)
  end
end
