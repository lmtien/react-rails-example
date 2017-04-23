class ImportJob < ProgressJob::Base
  require 'csv'

  def initialize(csv)
    super progress_max: 0
    @csv = csv
  end

  def perform
    update_stage({total_row_processed: 0, total_row_fail: 0}.to_json)

    total_row_processed = 0
    total_row_fail = 0
    CSV.foreach(@csv, headers: true) do |row|
      total_row_processed += 1
      total_row_fail += 1 if !Importer.import row
      update_stage({total_row_processed: total_row_processed, total_row_fail: total_row_fail}.to_json)
    end

    sleep 1
  end
end