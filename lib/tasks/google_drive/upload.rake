namespace :google_drive do
  namespace :upload do
    desc 'Google Drive へファイルをアップロードする'
    # bundle exec rails google_drive:upload:execute\['/tmp/foo.jpg','bar.jpg','123abc'\]
    task :execute, %w[source_filepath uploaded_filename drive_id] => :environment do |_task, args|
      uploader = GoogleDriveService::Upload.new(
        source_filepath: args.source_filepath,
        uploaded_filename: args.uploaded_filename,
        drive_id: args.drive_id
      )

      uploader.execute
    end
  end
end
