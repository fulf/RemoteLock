# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Models::Person do
  let(:instance) { described_class.new(**params) }
  let(:params) do
    {
      first_name: 'Foo',
      last_name: 'Bar',
      birthdate: Date.parse('10-04-2022'),
      city: 'FizzBuzz'
    }
  end

  describe '#formatted_birthdate' do
    subject { instance.formatted_birthdate }

    it 'returns the correctly formatted birthday' do
      expect(subject).to eq '4/10/2022'
    end
  end
end
