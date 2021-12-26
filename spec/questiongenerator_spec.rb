# frozen_string_literal: true

describe QuestionGenerator do
  it 'applies a prefix to a question' do
    prefix = "¿"
    expect(QuestionGenerator.generate prefix: prefix).to start_with(prefix)
  end

  it 'applies a suffix to a question' do
    suffix = "!!!1"
    expect(QuestionGenerator.generate suffix: suffix).to end_with(suffix)
  end

  it 'compiles all available locales' do
    puts
    available_locales = Dir[File.expand_path '../../lib/questions/*.yml', __FILE__].map { |l| File.basename(l).sub(/\.yml$/, '') }
    available_locales.each do |locale|
      print "compiling #{locale}"
      compiled = QuestionGenerator.compile locale: locale.to_sym
      puts " (#{compiled.length} questions)"
    end
  end
end
