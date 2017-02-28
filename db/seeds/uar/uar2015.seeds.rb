require_relative '../seed_helper'
require_relative 'upload_activities'

# Specify which producer by director that their UAR's are located
PRODUCER_DIRECTORY = 'santeustachio2015'

PATH_TO_DIR = "#{Rails.root}/db/seeds/uar/unit_activity_reports/#{PRODUCER_DIRECTORY}/"
Dir.foreach(PATH_TO_DIR) do |file|
  next if is_hidden?(file)
  path_to_file = "#{PATH_TO_DIR}/#{file}"
  UnitActivityReport.new(path_to_file).upload_uar
end
