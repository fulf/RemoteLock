# spec/functional/app_extension_spec.rb
require 'spec_helper'

#######################################################
# DO NOT CHANGE THIS FILE - WRITE YOUR OWN SPEC FILES #
#######################################################
RSpec.describe 'App Functional Test - Extension' do
  describe 'dollar, percent and pipe formats sorted by birthdate' do
    let(:params) do
      {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
        percent_format: File.read('spec/fixtures/people_by_percent.txt'),
        pipe_format: File.read('spec/fixtures/people_by_pipe.txt'),
        order: :birthdate,
      }
    end
    let(:people_controller) { PeopleController.new(params) }

    it 'parses input files and outputs normalized data' do
      normalized_people = people_controller.normalize

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(normalized_people).to eq [
                                        'Elliot, New York City, 5/4/1947',
                                        'Rigoberto, New York City, 1/5/1962',
                                        'Rhiannon, Los Angeles, 4/30/1974',
                                        'Mckayla, Atlanta, 5/29/1986',
                                        'Joseph, New York City, 10/24/1990',
                                        'Jane, Denver, 1/15/1995',
                                      ]
    end
  end
end