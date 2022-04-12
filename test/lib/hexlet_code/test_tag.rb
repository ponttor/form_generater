# frozen_string_literal: true

require 'test_helper'
require 'minitest/power_assert'
require 'power_assert/colorize'

class TestTag < TestCase
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
end
