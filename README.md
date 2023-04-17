# SudokkuCli

A CLI program for logging in to Sudokku git server.

## Installation

    $ gem install sudokku_cli

## Usage

Use `sudokku login` to log in to the Sudokku git server. This will try to connect to the git server using credentials saved
in the .netrc file. If the credentials are not found, or are expired, you will be given a url to visit where you can log in.
After successfully logging in, the program will save the newly generated credentials to the .netrc file.

[//]: # (## Development)

[//]: # ()
[//]: # (After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.)

[//]: # ()
[//]: # (To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org]&#40;https://rubygems.org&#41;.)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Tashows/sudokku_cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Tashows/sudokku_cli/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SudokkuCli project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Tashows/sudokku_cli/blob/main/CODE_OF_CONDUCT.md).
