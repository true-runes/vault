module ImportService
  class Title < Base
    def initialize(
      data_source: :csv,
      csv_filepath: nil,
      spreadsheet_title: nil,
      worksheet_name: nil
    )
      super

      @columns = columns
      @values = values
    end

    def execute
      ActiveRecord::Base.transaction do
        klass.import(@columns, @values, validate: true)
      end
    end

    def columns
      @data_table.headers.map(&:to_sym)
    end

    def values
      @data_table.rows
    end

    private

    def klass
      File.basename(__FILE__, File.extname(__FILE__)).classify.safe_constantize
    end
  end
end
