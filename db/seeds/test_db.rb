require_relative 'dateable'
require 'roo'
include Dateable

month = {
            January:    1,
            February:   2, 
            March:      3, 
            April:      4, 
            May:        5,
            June:       6, 
            July:       7,
            August:     8,
            September:  9,
            October:    10,
            November:   11,
            December:   12
          }
def valid_row?(index, hash)
  index != 0 && not_empty_row?(hash[:gusti_id])
end

def not_empty_row?(cell)
  cell.to_s != ""
end

PATH_TO_DIR = "#{Rails.root}/db//seeds/unitactivityreportfaella2016/"



Dir.foreach(PATH_TO_DIR) do |file|
  next if file.start_with? '.'
  
  spreadsheet = Roo::Spreadsheet.open("#{PATH_TO_DIR}/#{file}")
  header = spreadsheet.row(1)
  imported_products = (2..spreadsheet.last_row).map do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    if row['Item ID'].to_s != ''
      row['Sold'].to_i
    end
  end
end