# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Services::PeopleParser do
  let(:service) { described_class.new(params) }
  let(:params) { { data: data, separator: separator } }

  let(:data) { "first_name % city % birthdate\nMckayla % Atlanta % 1986-05-29" }
  let(:separator) { ' % ' }

  describe '#call' do
    subject { service.call }

    it 'correctly parses the data' do
      parsed_data = subject
      expect(parsed_data.size).to eq 1
      expect(parsed_data.first).to have_attributes(
                                     first_name: 'Mckayla',
                                     last_name: nil,
                                     birthdate: Date.parse('1986-05-29'),
                                     city: 'Atlanta'
                                   )
    end

    context 'with shorthand city' do
      let(:data) { "first_name % city % birthdate\nMckayla % NYC % 1986-05-29" }

      it 'correctly maps the city name' do
        expect(subject.first.city).to eq 'New York City'
      end
    end

    context 'with invalid date' do
      let(:data) { "first_name % city % birthdate\nMckayla % Atlanta % invalid" }

      it 'sets the date to nil' do
        expect(subject.first.birthdate).to be_nil
      end
    end
  end
end
