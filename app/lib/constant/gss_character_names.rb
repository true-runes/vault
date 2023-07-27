module Constant
  class GssCharacterNames
    class << self
      def s1
        ProductTitle.find_by(name: '幻想水滸伝').gss_characters.pluck(:name).sort
      end

      def s2
        ProductTitle.find_by(name: '幻想水滸伝II').gss_characters.pluck(:name).sort
      end

      def gaiden
        (
          ProductTitle.find_by(name: '幻想水滸外伝Vol.1').gss_characters.pluck(:name) +
          ProductTitle.find_by(name: '幻想水滸外伝Vol.2').gss_characters.pluck(:name)
        ).uniq.sort
      end

      def s3
        ProductTitle.find_by(name: '幻想水滸伝III').gss_characters.pluck(:name).sort
      end

      def s4
        ProductTitle.find_by(name: '幻想水滸伝IV').gss_characters.pluck(:name).sort
      end

      def rhapsodia
        ProductTitle.find_by(name: 'Rhapsodia').gss_characters.pluck(:name).sort
      end

      def s5
        ProductTitle.find_by(name: '幻想水滸伝V').gss_characters.pluck(:name).sort
      end

      def tk
        ProductTitle.find_by(name: '幻想水滸伝ティアクライス').gss_characters.pluck(:name).sort
      end

      def tsumutoki
        ProductTitle.find_by(name: '幻想水滸伝 紡がれし百年の時').gss_characters.pluck(:name).sort
      end

      # いずれの登場作品にも属さないキャラクター
      def others
        # 実質は LEFT OUTER JOIN で WHERE "product_titles"."id" IS NULL をしている
        Gss::Character.where.missing(:product_titles).pluck(:name).sort
      end

      def values
        (s1 + s2 + gaiden + s3 + s4 + rhapsodia + s5 + tk + tsumutoki).uniq.sort
      end
    end
  end
end
