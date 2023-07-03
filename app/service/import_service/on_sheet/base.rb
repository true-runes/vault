module ImportService
  module OnSheet
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

        @headers = headers
        @rows = rows
      end

      def execute
        imported_klass = convert_self_klass_to_imported_klass

        ActiveRecord::Base.transaction do
          imported_headers = headers_without_id_column
          imported_rows = rows_without_id_column

          imported_klass.import!(
            imported_headers,
            imported_rows,
            validate: true
          )
        end
      end

      def convert_self_klass_to_imported_klass
        self_class_str = self.class.to_s
        imported_class_str = self_class_str.gsub('ImportService::', '')

        imported_class_str.classify.safe_constantize
      end

      def headers
        @data_table.headers.map(&:to_sym)
      end

      def headers_without_id_column
        # id の列が存在する場合には取り除く
        headers.delete_if { |column| column == :id }
      end

      def rows
        @data_table.rows
      end

      def rows_without_id_column
        # id の列が存在する場合には取り除く
        # rows は [1, 2, 3, 4, 5] の形
        # NOTE: id は 1つ目の要素 であることは仕様とする
        rows.map { |value| value[1..] }
      end

      def data_table_from_csv(csv_filepath:)
        FetchDataTableService::FromCsv.new(csv_filepath)
      end

      def data_table_from_spreadsheet(spreadsheet_title:, worksheet_name:)
        spreadsheet_id = SpreadsheetService::SheetId.title_to_id(spreadsheet_title)

        FetchDataTableService::FromSpreadsheet.new(spreadsheet_id:, worksheet_name:)
      end

      def current_dir_name
        File.basename(File.expand_path(__dir__))
      end
    end
  end
end
