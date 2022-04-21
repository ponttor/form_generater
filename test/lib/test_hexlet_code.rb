# frozen_string_literal: true

# # frozen_string_literal: true

require 'test_helper'
require 'power_assert/colorize'

class TestHexletCode < TestCase
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_submit
    user = User.new name: 'rob', job: 'hexlet'
    actual = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    expected = load_fixture('form_submit.html')
    assert { actual == expected }
  end

  def test_form_for
    user = User.new(name: 'rob', job: 'hexlet')
    actual = HexletCode.form_for user
    expected = '<form action="#" method="post"></form>'
    assert { actual == expected }
  end

  def test_form_for_with_url
    user = User.new(name: 'rob', job: 'hexlet')
    actual = HexletCode.form_for user, url: '/users'
    expected = '<form action="/users" method="post"></form>'
    assert { actual == expected }
  end

  def test_form_for_user_do
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    actual = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    expected = load_fixture('form.html')
    assert { actual == expected }
  end
end
