#Show all media types that rails supports
Mime::SET.collect(&:to_s)
