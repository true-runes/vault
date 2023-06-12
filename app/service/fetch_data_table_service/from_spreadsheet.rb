module FetchDataTableService
  class FromSpreadsheet < Base
    def initialize(spreadsheet_id, worksheet_name)
      super

      sheets_api = SpreadsheetService::SheetsApi.create
      spreadsheet_manager = spreadsheet_manager(sheets_api, spreadsheet_id)
      spreadsheet = spreadsheet_manager.spreadsheet

      @worksheet_manager = worksheet_manager(sheets_api, spreadsheet, worksheet_name)
    end

    def headers
      @worksheet_manager.headers
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
      SpreadsheetService::WorksheetManager.new(
        sheets_api,
        spreadsheet,
        worksheet_name
      )
    end
  end
end
