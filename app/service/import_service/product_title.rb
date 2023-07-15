module ImportService
  class ProductTitle < Base
    def rows
      product_titles = ::OnSheet::Title.all

      product_titles.map do |product_title|
        [
          product_title.name,
          product_title.name_en,
        ]
      end
    end
  end
end
