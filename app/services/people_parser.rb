require 'CSV'

# frozen_string_literal: true

module Services
  class PeopleParser
    NORMALIZED_CITY_HASH = {
      LA: 'Los Angeles',
      NYC: 'New York City'
    }.freeze

    def initialize(data:, separator:)
      @data = data
      @separator = separator
    end

    def call
      parsed_csv.map do |row|
        Models::Person.new(
          first_name: row['first_name'],
          last_name: row['last_name'],
          city: normalized_city(row['city']),
          birthdate: parsed_date(row['birthdate'])
        )
      end
    end

    private

    def parsed_csv
      CSV.parse(@data, headers: true, col_sep: @separator)
    end

    def parsed_date(date)
      Date.parse(date)
    rescue ArgumentError
      nil
    end

    def normalized_city(city)
      NORMALIZED_CITY_HASH[city.to_sym] || city
    end
  end
end
