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

    def headers_without_id
      # id の列が存在する場合には取り除く
      columns.delete_if { |column| column == :id }
    end

    def values
      raise NotImplementedError
    end

    # values は [1, 2, 3, 4, 5] の形
    def values_without_id
      # id の列が存在する場合には取り除く
      # NOTE: id は 1つ目の要素 であることは仕様とする
      values.map { |value| value[1..] }
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
