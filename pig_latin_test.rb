#!/usr/bin/env ruby

require_relative 'pig_latin.rb'
include PigLatin
require 'minitest/autorun'

class TestPigLatin < MiniTest::Unit::TestCase
  def test_uppercase?
    #use the !! operator to get truth value
    assert_equal(true, uppercase?("Word"))
    assert_equal(false, uppercase?("word"))
  end

  def test_starts_with_vowel?
    assert_equal(true, starts_with_vowel?("Apple"))
    assert_equal(true, starts_with_vowel?("yesterday"))
    assert_equal(false, starts_with_vowel?("banana"))
  end

  def test_empty_input
    assert_equal("", translate(""))
  end
  
  def test_regular_word
    assert_equal("ellohay", translate("hello"))
    assert_equal("oolschay", translate("school"))
  end
  
  def test_y_vowel
    assert_equal("yesterdayay", translate("yesterday"))
    assert_equal("ymiray", translate("ymir"))
  end
  
  def test_regular_vowel
    assert_equal("eatay", translate("eat"))
  end
  
  def test_capital
    assert_equal("Ellohay", translate("Hello"))
    assert_equal("Applesay", translate("Apples"))
  end
  
  def test_qu_words
    assert_equal("otequay", translate("quote"))
    assert_equal("itquay", translate("quit"))
    assert_equal("estionquay", translate("question"))
  end

  def test_consonant_cluster
    assert_equal("ownbray", translate("brown"))
    assert_equal("oneticphay", translate("phonetic"))
  end
  
  def test_multiple_words
    assert_equal("eatay orldway", translate("eat world"))
    assert_equal("eatay... orldway?!", translate("eat... world?!"))
    assert_equal("Ickquay ownbray oxfay", translate("Quick brown fox"))
  end

  def test_punctuation
    assert_equal("Ehay...  Entway offay-ampuscay: 50% (oneay/otway) ofay [ethay] imetay!??*" ,
                 translate("He...  Went off-campus: 50% (one/two) of [the] time!??*"))
  end
  
  def test_contraction
    assert_equal("an'tcay", translate("can't"))
    assert_equal("ouldn't'vecay", translate("couldn't've"))
    assert_equal("ol'ay yelleray", translate("ol' yeller"))
  end
end
