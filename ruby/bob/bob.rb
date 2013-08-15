class Bob

  def hey(message)
    msg = Message.new(message)
    return "Fine. Be that way!" if msg.silent?
    return "Woah, chill out!" if msg.yelling?
    return "Sure." if msg.question?
    "Whatever."
  end

end

class Message

  def initialize(message)
    @message = message || ""
  end

  def question?
    @message.end_with? "?"
  end  

  def yelling?
    @message.upcase == @message
  end

  def silent?
    @message.strip == ""
  end

end
