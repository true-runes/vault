module SpreadsheetService
  class SheetId
    class << self
      def retrieve(spreadsheet_title)
        title_to_id[spreadsheet_title]
      end

      # 新規追加時はシートへの権限の付与も忘れないこと
      def title_to_id
        {
          'basic_attributes' => ENV.fetch('SPREADSHEET_ID_BASIC_ATTRIBUTES'),
          'products' => ENV.fetch('SPREADSHEET_ID_PRODUCTS')
        }
      end
    end
  end
end
