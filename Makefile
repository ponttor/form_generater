install:
	bundle install

test:
	bundle exec rake test

lint:
	bundle exec rubocop

correct:
	bundle exec rubocop -a

.PHONY: test
