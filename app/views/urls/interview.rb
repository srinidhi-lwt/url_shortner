class InterviewTest
  def balanced?(string)
    return false if string.length.odd? or string.blank?
    res = []

    string.split('').each do |char|
      if opening_brackets.include?(char)
        res << char
      elsif matching_brackets[res[-1]] == char
        res.pop
      else
        return false
      end
    end

    res.present? ? false : true
  end

  private

  def opening_brackets
    ['(', '{', '[']
  end

  def matching_brackets
    {
      '(' => ')',
      '[' => ']',
      '{' => '}'
    }
  end
end