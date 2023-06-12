module SpreadsheetService
  class SpreadsheetManager
    attr_reader :spreadsheet, :worksheet_names

    def initialize(sheets_api, spreadsheet_id)
      @spreadsheet = sheets_api.get_spreadsheet(spreadsheet_id)
      @worksheet_names = @spreadsheet.sheets.map(&:properties).map(&:title)
    end
  end
end
