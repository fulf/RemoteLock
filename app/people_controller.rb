class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    people = Services::PeopleParser.new(data: params[:dollar_format], separator: ' $ ').call +
      Services::PeopleParser.new(data: params[:percent_format], separator: ' % ').call

    sorted_people = people.sort_by { |p| p.__send__(params[:order]) }

    Services::PeopleNormalizer.new(data: sorted_people).call
  end

  private

  attr_reader :params
end
