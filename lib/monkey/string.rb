class String
  def unindent
    gsub /^#{self[/\A\s*/]}/, ''
  end

  def classify
    split('_').collect { |w| w.sub(/\A(.)/){ $1.upcase } }.join
  end
end
