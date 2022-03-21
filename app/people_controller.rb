class PeopleController
  SEPARATORS = {
    dollar_format: ' $ ',
    percent_format: ' % ',
    pipe_format: ' | '
  }.freeze

  def initialize(params)
    @params = params
  end

  def normalize
    people = params.keys.select { |param| param.end_with?('_format') }.map do |format|
      Services::PeopleParser.new(data: params[format], separator: SEPARATORS[format]).call
    end.flatten

    sorted_people = people.sort_by { |p| p.__send__(params[:order]) }

    Services::PeopleNormalizer.new(data: sorted_people).call
  end

  private

  attr_reader :params
end
