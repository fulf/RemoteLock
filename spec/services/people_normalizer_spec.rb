# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Services::PeopleNormalizer do
  let(:service) { described_class.new(params) }

  let(:params) do
    { data: [person_1, person_2] }
  end

  let(:person_1) do
    Models::Person.new(
      first_name: 'Foo',
      last_name: 'Bar',
      birthdate: Date.parse('10-04-2022'),
      city: 'FizzBuzz'
    )
  end

  let(:person_2) do
    Models::Person.new(
      first_name: 'John',
      last_name: 'Doe',
      birthdate: Date.parse('04-10-2202'),
      city: 'Nowhere'
    )
  end

  describe '#call' do
    subject { service.call }

    it 'returns the correctly normalized people' do
      expect(subject).to eq [
        'Foo, FizzBuzz, 4/10/2022',
        'John, Nowhere, 10/4/2202'
      ]
    end
  end
end
