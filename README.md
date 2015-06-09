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

# You can also specify an own prefix or suffix:
puts QuestionGenerator.generate locale: :fr, prefix: '[FR] ', suffix: ' ?'
# => "[FR] Quelle est la personne la plus célèbre que vous avez rencontrée ?"
```

## How it works

The question generator uses a simple branching structure inside the specified locale to generate questions from it, here is a quick example:

```yml
Can:
  you:
    - swim
    - speak:
      - different:
        - languages
    - play:
      - any:
        - sports
      - the:
        - piano
        - guitar
        - trumpet
      - baseball
    - ski
    - cook
    - dance

# The following example outputs:
# Can you swim?
# Can you speak different languages?
# Can you play any sports?
# Can you play the piano?
#               ...guitar?
#               ...trumpet?
# Can you play baseball?
# Can you ski?
# Can you cook?
# Can you dance?
```

If you can't break sentences in parts in your language, you can also specify the entire question in one line.
```yml
- Can you swim

# The following example outputs:
# Can you swim?
```

## Contributing

The files for questions are located in `lib/questions/`

If you want to add a new language, create a new file and name it with the [ISO-639-1 language code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) of it (just like `en.yml`)

1. Fork it ( https://github.com/retrospring/questiongenerator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Please don't add harassing, scaring or upsetting content to the questions or content that otherwise violates the [Retrospring Terms of Service](https://retrospring.net/terms).

If you add questions in another language to the questiongenerator and purposely add wrong translations, further Pull Requests will be ignored.
