# frozen_string_literal: true

require "yaml"

# Generates some questions.
module QuestionGenerator
  # Version of QuestionGenerator
  VERSION = "1.1.0"

  class << self
    # The base path to the questions (e.g. +'/home/nilsding/questions'+).
    attr_reader   :question_base_path
    # The default locale, as a symbol.
    attr_accessor :default_locale
  end

  module_function

  # Generates a new question.
  # @param options [Hash] A customizable set of options.
  # @param :locale [Symbol] The target locale
  # @param :prefix [String] Prefix of the question, e.g. +'¿'+
  # @param :suffix [String] Suffix of the question, e.g. +' ?'+
  # @return [String] String containing the generated question.
  def generate(locale: @default_locale, prefix: "", suffix: "?")
    compile(locale:) unless @compiled.key?(locale)

    prefix + @compiled[locale].sample + suffix
  end
  
  # Compiles all the questions and stores it into the +@compiled+ hash.
  # @param :locale [Symbol] The target locale
  def compile(locale: @default_locale)
    questions = YAML.load_file(File.expand_path("#{locale}.yml", @question_base_path))
    @compiled[locale] = build(questions)
  end

  def question_base_path=(path)
    raise Errno::ENOENT.new(path) unless Dir.exist?(path)

    @compiled = {} # new dir, force a recompile
    @question_base_path = path
  end

  private

  module_function

  def build(questions, q = "")
    ary = []

    case questions
    when Hash
      questions.each do |k, v|
        Array(k).each do |variant|
          ary << build(v, "#{q}#{variant} ")
        end
      end
    when Array
      questions.each do |v|
        ary << build(v, q)
      end
    when String
      return "#{q}#{questions}".strip
    end

    ary.flatten
  end

  @question_base_path = File.expand_path("./questions/", __dir__)
  @default_locale = :en
  @compiled = {}
end
