require 'yaml'

module QuestionGenerator
  VERSION = "0.0.2"

  class << self
    attr_accessor :question_base_path
    attr_accessor :default_locale
  end

  def self.setup
    yield self
  end

  def self.generate(locale = @default_locale)
    questions = YAML.load_file(File.expand_path("#{locale.to_s}.yml", @question_base_path))
    "#{get_question(questions).strip}?"
  end

  private

    def self.get_question questions
      question = ""
      if questions.is_a? Hash
        key = questions.keys.sample
        value = questions[key]
        question = "#{key} #{get_question(value)}"
      elsif questions.is_a? Array
        question = get_question questions.sample
      elsif questions.is_a? String
        question = questions
      end
      question
    end

    @question_base_path = File.expand_path("../questions/", __FILE__)
    @default_locale = :en
end
