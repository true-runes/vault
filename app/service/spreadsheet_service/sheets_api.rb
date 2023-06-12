require 'google/apis/sheets_v4'

module SpreadsheetService
  class SheetsApi
    CREDS_JSON_FILEPATH = ENV.fetch('SPREADSHEET_CREDENTIALS_FILEPATH', nil)

    class << self
      def create
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

        api = Google::Apis::SheetsV4::SheetsService.new
        api.authorization = authorizer

        api
      end
    end
  end
end
