# frozen_string_literal: true

module Services
  class PeopleNormalizer
    def initialize(data:)
      @data = data
    end

    def call
      @data.map do |person|
        "#{person.first_name}, #{person.city}, #{person.formatted_birthdate}"
      end
    end
  end
end

