class EvalWriter
  def initialize(game, referee)
    @game = game
    @referee = referee
    binding.pry
    @tmp_file = Rails.root.join('tmp/input.fdf')
    @template = read_template
  end

  def write
    create_template
  end

  private

  def create_template
    File.open(@tmp_file, 'w') do |file|
      @template.each do |line|
        line = subbed_line(line)
        file.write(line)
      end
    end
  end

  def subbed_line(line)
    return line unless line.include?('/V') && (line.include?('(_') || line.include?('/_'))

  end

  def read_template
    IO.readlines(Rails.root.join('lib/fixtures/template.fdf'))
  end

  def mappings
    {
      '_EMAIL_ADDRESS' => '',
      '_SANCTIONED' => '',
      '_LEGAL_NAME' => '',
      '_LEAGUE' => '',
      '_TEAMS' => '',
      '_JR' => '',
      '_REGULATION' => '',
      '_OPR' => '',
      '_DERBY_NAME' => '',
      '_OTHER' => '',
      '_IPR' => '',
      '_SCORE' => '',
      '_DATE' => '',
      '_TOURNAMENT' => '',
      '_HEAD_OFFICIALS' => '',
      '_PENALTIES' => ''
    }
  end
end
