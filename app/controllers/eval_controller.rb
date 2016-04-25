require 'eval_writer'
class EvalController < ApplicationController
  def show
    render :show, locals: { referees: referees }
  end

  def create
    ::EvalWriter.new(nil, nil)
  end

  private

  def referees
    ['Head Referee', 'Inside Pack Referee', 'Jammer Referee', 'Jammer Referree',
     'Outside Pack Referee', 'Outside Pack Referee', 'Outside Pack Referee'].map do |position|
      {
        position: position,
        abbreviation: position_to_abbreviation(position)
      }
    end
  end

  def position_to_abbreviation(position)
    words = position.split(' ')
    words.map(&:first).join('').upcase
  end
end
