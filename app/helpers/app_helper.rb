module AppHelper

  def trim_desc(string)
    "#{string.split(' ')[1..20].join(' ')} ..."
  end
end
