# questiongenerator

A simple question generator, used by Retrospring (formerly justask).

## Installation

Add this line to your application's Gemfile:

    gem 'questiongenerator'

If you're feeling _edgy_, you can add this line instead:

    gem 'questiongenerator', git: 'https://github.com/retrospring/questiongenerator.git'

## Usage

``` ruby
require 'questiongenerator'

# Configure it
QuestionGenerator.question_base_path = '/home/nilsding/questions'
QuestionGenerator.default_locale = :en

# Compile the questions for increased randomness
QuestionGenerator.compile

# Get some questions
puts QuestionGenerator.generate
# => "What is the best thing about the internet?"

# You can also specify the locale, if you want to
puts QuestionGenerator.generate locale: :de
# => "Was war das letzte, das du gegessen hast?"
```

## Contributing

1. Fork it ( https://github.com/retrospring/questiongenerator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
