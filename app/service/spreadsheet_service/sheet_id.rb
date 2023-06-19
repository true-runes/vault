module SpreadsheetService
  class SheetId
    class << self
      # 新規追加時はシートへの権限の付与も忘れないこと
      def title_to_id(title)
        {
          'basic_attributes' => ENV.fetch('SPREADSHEET_ID_BASIC_ATTRIBUTES'),
          'products' => ENV.fetch('SPREADSHEET_ID_PRODUCTS')
        }.fetch(title)
      end
    end
  end
end
