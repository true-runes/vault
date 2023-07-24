# rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/BlockLength
module ImportService
  module Gss
    class CharacterToProductTitle < Base
      # headers
      # gss_character_id
      # product_title_id

      def execute
        ActiveRecord::Base.transaction do
          @klass.import!(
            @headers,
            @rows,
            validate: true
          )
        end
      end

      def headers
        %w[
          gss_character_id
          product_title_id
        ]
      end

      def klass
        ::Gss::CharacterToProductTitle
      end

      def rows
        gss_characters = ::Gss::Character.all

        rows = []

        gss_characters.each do |gss_character|
          gss_character_name = gss_character.name
          on_sheet_gss_characters = ::OnSheet::GssCharacter.where(
            name: gss_character_name
          )

          if on_sheet_gss_characters.blank?
            on_sheet_gss_characters = ::OnSheet::GssCharacter.where(
              sosenkyo_name: gss_character_name
            )
          end

          raise '一致する名前が見つかりませんでした。' if on_sheet_gss_characters.blank?

          # 複数作品に登場することがあり得るので elsif ではなく if で判断する
          on_sheet_gss_characters.each do |on_sheet_gss_character|
            if on_sheet_gss_character.exists_gs1 == true
              rows << [
                gss_character.id,
                ::ProductTitle.find_by(name: '幻想水滸伝').id,
              ]
            end

            if on_sheet_gss_character.exists_gs2 == true
              rows << [
                gss_character.id,
                ::ProductTitle.find_by(name: '幻想水滸伝II').id,
              ]
            end

            if on_sheet_gss_character.exists_gs3 == true
              rows << [
                gss_character.id,
                ::ProductTitle.find_by(name: '幻想水滸伝III').id,
              ]
            end

            if on_sheet_gss_character.exists_gs4 == true
              rows << [
                gss_character.id,
                ::ProductTitle.find_by(name: '幻想水滸伝IV').id,
              ]
            end

            if on_sheet_gss_character.exists_gs5 == true
              rows << [
                gss_character.id,
                ::ProductTitle.find_by(name: '幻想水滸伝V').id,
              ]
            end

            if on_sheet_gss_character.exists_gaiden1 == true
              rows << [
                gss_character.id,
                ::ProductTitle.find_by(name: '幻想水滸外伝Vol.1').id,
              ]
            end

            if on_sheet_gss_character.exists_gaiden2 == true
              rows << [
                gss_character.id,
                ::ProductTitle.find_by(name: '幻想水滸外伝Vol.2').id,
              ]
            end

            if on_sheet_gss_character.exists_rhapsodia == true
              rows << [
                gss_character.id,
                ::ProductTitle.find_by(name: 'Rhapsodia').id,
              ]
            end

            if on_sheet_gss_character.exists_tk == true
              rows << [
                gss_character.id,
                ::ProductTitle.find_by(name: '幻想水滸伝ティアクライス').id,
              ]
            end

            next unless on_sheet_gss_character.exists_tsumutoki == true

            rows << [
              gss_character.id,
              ::ProductTitle.find_by(name: '幻想水滸伝 紡がれし百年の時').id,
            ]
          end
        end

        rows
      end
    end
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/BlockLength
