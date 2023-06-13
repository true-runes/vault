module ImportService
  class Star < Base
    def execute
      ActiveRecord::Base.transaction do
        klass.import(columns, values, validate: true)
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
