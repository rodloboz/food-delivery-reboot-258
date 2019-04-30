class BaseRepository
  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @elements = []
    @next_id = 1
    load_csv if File.exist? @csv_filepath
  end

  def all
    @elements
  end

  def find(id)
    # select => []
    @elements.find { |element| element.id == id }
  end

  # receives a Meal instance
  def add(element)
    # set element id
    element.id = @next_id
    # push element into elements
    @elements << element
    # save changes
    save_csv
    # increment next_id
    @next_id += 1
  end

  private

  def load_csv
    csv_options = {
      headers: :first_row,
      header_converters: :symbol
    }

    CSV.foreach(@csv_filepath, csv_options) do |row|
      # convert columns to integer
      # name doesnt need to be converted
      row[:id] = row[:id].to_i
      @elements << build_element(row)
    end

    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_csv
    CSV.open(@csv_filepath, 'wb') do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end
end
