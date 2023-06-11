require 'google/apis/sheets_v4'

class SpreadsheetService
  SPREADSHEET_ID = '12345'.freeze
  RAW_PROPERTY_WORKSHEET_RANGE = 'raw_properties!A1:Z1000'.freeze
  CREDS_JSON_FILEPATH = '/tmp/creds.json'.freeze

  def initialize
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(CREDS_JSON_FILEPATH),

      # drive と drive.file も必要になることには注意する
      scope: %w[
        https://www.googleapis.com/auth/drive
        https://www.googleapis.com/auth/drive.file
        https://www.googleapis.com/auth/spreadsheets
      ]
    )
    authorizer.fetch_access_token!

    @api = Google::Apis::SheetsV4::SheetsService.new
    @api.authorization = authorizer
  end

  def raw_properties_rows
    @api.get_spreadsheet_values(
      SPREADSHEET_ID,
      RAW_PROPERTY_WORKSHEET_RANGE
    )
  end

  class << self
    def raw_properties_rows
      new.raw_properties_rows
    end
  end
end
