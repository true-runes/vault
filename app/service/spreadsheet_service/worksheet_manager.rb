module SpreadsheetService
  class WorksheetManager
    attr_reader :worksheet, :headers, :rows

    def initialize(sheets_api, spreadsheet, worksheet_name, range: 'A1:Z')
      @sheets_api = sheets_api
      @spreadsheet = spreadsheet

      @worksheet = @spreadsheet.sheets.find do |sheet|
        sheet.properties.title == worksheet_name
      end

      @all_cells = all_cells(@worksheet, range:)
      @headers = @all_cells.first
      @rows = @all_cells.drop(1)

      raise "Some cells are invalid in #{@worksheet.properties.title}" unless valid_all_cells?
    end

    def all_cells(worksheet, range: 'A1:Z')
      # 戻り値からは nil が取り除かれる
      @sheets_api.get_spreadsheet_values(
        @spreadsheet.spreadsheet_id,
        "#{worksheet.properties.title}!#{range}"
      ).values
    end

    def valid_all_cells?
      return false if @headers.blank? || @rows.blank?

      # この条件は「スプレッドシート」という特性から厳しすぎるので、いったんコメントアウト
      # @rows.each { |row| return false if row.size != @headers.size }

      true
    end
  end
end
