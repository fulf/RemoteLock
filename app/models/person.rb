# frozen_string_literal: true

module Models
  class Person
    attr_reader :first_name, :last_name, :city, :birthdate

    BIRTHDAY_FORMAT = '%-m/%-d/%Y'

    def initialize(first_name:, last_name:, city:, birthdate:)
      @first_name = first_name
      @last_name = last_name
      @city = city
      @birthdate = birthdate
    end

    def formatted_birthdate
      birthdate.strftime(BIRTHDAY_FORMAT)
    end
  end
end
