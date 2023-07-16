module FetchDataTableService
  class FromSpreadsheet < Base
    def initialize(spreadsheet_id:, worksheet_name:)
      super

      begin
        sheets_api = SpreadsheetService::SheetsApi.create
        spreadsheet_manager = spreadsheet_manager(sheets_api, spreadsheet_id)
        spreadsheet = spreadsheet_manager.spreadsheet

        @worksheet_manager = worksheet_manager(sheets_api, spreadsheet, worksheet_name)
      rescue StandardError => e
        puts "#{Time.zone.now} [LOG] エラー: ワークシートの読み込みに失敗しました。"
        puts '※このエラーは Rate Limits の際にも出ることがあります'
        puts "ワークシート名: #{worksheet_name}"
        puts e.message
        puts
      end
    end

    def headers
      @worksheet_manager.headers
    rescue StandardError
      puts "#{Time.zone.now} [LOG] エラー: ワークシートの読み込みに失敗しました。"
      puts '※このエラーは Rate Limits の際にも出ることがあります'
      puts "ワークシート名: #{worksheet_name}"
      puts e.message
      puts
    end

    def rows
      @worksheet_manager.rows
    end

    def header_to_rows
      {}.tap do |hash|
        headers.each do |header|
          rows.each do |row|
            hash[header.to_sym] ||= []
            hash[header.to_sym] << row[headers.index(header)]
          end
        end
      end
    end

    private

    def spreadsheet_manager(sheets_api, spreadsheet_id)
      SpreadsheetService::SpreadsheetManager.new(
        sheets_api,
        spreadsheet_id
      )
    end

    def worksheet_manager(sheets_api, spreadsheet, worksheet_name)
      worksheet_manager = SpreadsheetService::WorksheetManager.new(
        sheets_api,
        spreadsheet,
        worksheet_name
      )

      raise if worksheet_manager.nil?

      worksheet_manager
    end
  end
end
