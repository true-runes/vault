require 'google/apis/drive_v3'

module GoogleDriveService
  class DriveApi
    CREDS_JSON_FILEPATH = ENV.fetch('SPREADSHEET_CREDENTIALS_FILEPATH', nil)

    class << self
      def create
        authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
          json_key_io: File.open(CREDS_JSON_FILEPATH),

          scope: %w[
            https://www.googleapis.com/auth/drive
            https://www.googleapis.com/auth/drive.file
          ]
        )
        authorizer.fetch_access_token!

        # https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/DriveV3/DriveService.html
        api = Google::Apis::DriveV3::DriveService.new
        api.authorization = authorizer

        api
      end
    end
  end
end
