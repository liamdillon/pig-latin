#!/usr/bin/env ruby

module PigLatin
  SUFFIX = 'ay'
  def uppercase?(word)
    !!(word =~ /^[A-Z]/)
  end

  #does the word start with a vowel sound?
  def starts_with_vowel?(word)
    vowel_pattern = /^[aeiou]+/i
    y_vowel_pattern = /^y[aeiou]*/i
    !!(word =~ y_vowel_pattern || word =~ vowel_pattern)
  end
  
  def translate_word(word)
    ret = ''
    if starts_with_vowel?(word)
      ret = word + SUFFIX
    else
      #does the word begin with "qu"?
      if word =~ /(^qu)([a-z']*)/i
        #$1 and $2 contain the match groups from the preceding line,
        #in this case "qu" and the rest of the word
        ret = $2 + $1 + SUFFIX
      else
        #the word starts with a regular vowel or vowel cluster
        word.match /(^[^aeiouy]+)([a-z']*)/i
        ret = $2 + $1 + SUFFIX
      end
    end
    ret.downcase!
    return uppercase?(word) ? ret.capitalize : ret
  end

  def translate(str)
    str = str.nil? ? '' : str
    #separate words and punctuation
    tokens = str.split /([^a-z']+)/i
    tokens.map { |token|
      if token =~ /[a-z']+/
        translate_word(token)
      else
        token
      end
    }.join
  end  
end

include PigLatin

input = ARGV.join(' ')
puts translate(input)


