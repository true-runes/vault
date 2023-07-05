module ImportService
  class Base
    def initialize
      @klass = klass
      @headers = headers
      @rows = rows
    end

    def execute
      ActiveRecord::Base.transaction do
        @klass.import!(
          @headers,
          @rows,
          validate: true
        )
      end
    end

    def rows
      raise NotImplementedError
    end

    private

    def headers
      # id, created_at & updated_at は除外する
      @klass.new.attributes.keys.reject do |key|
        %w[id created_at updated_at].include?(key)
      end
    end

    def klass
      self_class_str = self.class.to_s
      imported_class_str = self_class_str.gsub('ImportService::', '')

      imported_class_str.classify.safe_constantize
    end
  end
end
