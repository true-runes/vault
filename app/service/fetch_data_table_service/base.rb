module FetchDataTableService
  class Base
    def initialize(*args)
      # TODO: 書く
    end

    def headers
      raise NotImplementedError
    end

    def rows
      raise NotImplementedError
    end

    def header_to_rows
      raise NotImplementedError
    end
  end
end
