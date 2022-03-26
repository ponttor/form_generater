# frozen_string_literal: true

require 'test_helper'
require 'minitest/power_assert'
require 'power_assert/colorize'

class TestHexletCode < TestCase
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_build_single_tag
    result = HexletCode::Tag.build('br')
    assert { result == '<br>' }
  end

  def test_build_single_tag_with_content
    assert { HexletCode::Tag.build('img', src: 'path/to/image') == '<img src="path/to/image">' }
  end

  def test_build_single_tag_with_double_content
    assert { HexletCode::Tag.build('input', type: 'submit', value: 'Save') == '<input type="submit" value="Save">' }
  end

  def test_build_double_tag
    assert { HexletCode::Tag.build('label') { 'Email' } == '<label>Email</label>' }
  end

  def test_build_double_tag_with_content
    assert { HexletCode::Tag.build('label', for: 'email') { 'Email' } == '<label for="email">Email</label>' }
  end

  def test_build_double_tag_empty
    assert { HexletCode::Tag.build('div') == '<div></div>' }
  end

  User = Struct.new(:name, :job, keyword_init: true)

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

  User = Struct.new(:name, :job, :gender, keyword_init: true)

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
