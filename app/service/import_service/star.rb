module ImportService
  class Star < Base
    class << self
      def execute
        ActiveRecord::Base.transaction do
          ::Star.import(columns, values, validate: true)
        end
      end

      def columns
        data_table.headers.map(&:to_sym)
      end

      def values
        data_table.rows
      end

      def data_table
        spreadsheet_title = 'basic_attributes'

        spreadsheet_id = SpreadsheetService::SheetId.retrieve(spreadsheet_title)
        worksheet_name = 'stars'

        FetchDataTableService::FromSpreadsheet.new(spreadsheet_id, worksheet_name)
      end
    end
  end
end
