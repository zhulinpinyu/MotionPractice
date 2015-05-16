module ViewHelpers
  def datetime_long(string)
    formatter = NSDateFormatter.alloc.init
    formatter.setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    datetime = formatter.dateFromString(string)

    rmq.format.date(datetime, 'MMM dd ''yyyy')
  end
end