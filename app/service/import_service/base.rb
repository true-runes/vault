module ImportService
  class Base
    attr_reader :data_table

    def initialize(
      data_source: :csv,
      csv_filepath: nil,
      spreadsheet_title: nil,
      worksheet_name: nil
    )
      @data_table = case data_source
                    when :spreadsheet
                      data_table_from_spreadsheet(
                        spreadsheet_title:,
                        worksheet_name:
                      )
                    when :csv
                      data_table_from_csv(csv_filepath:)
                    end
    end

    def execute
      raise NotImplementedError
    end

    def columns
      raise NotImplementedError
    end

    def values
      raise NotImplementedError
    end

    def data_table_from_csv(csv_filepath:)
      FetchDataTableService::FromCsv.new(csv_filepath)
    end

    def data_table_from_spreadsheet(spreadsheet_title:, worksheet_name:)
      spreadsheet_id = SpreadsheetService::SheetId.title_to_id(spreadsheet_title)

      FetchDataTableService::FromSpreadsheet.new(spreadsheet_id:, worksheet_name:)
    end
  end
end
