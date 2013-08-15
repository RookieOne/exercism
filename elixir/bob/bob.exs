defrecord Message, message: ""

defprotocol MessageType do
  def question?(message)
  def yelling?(message)
  def silent?(message)
end

defimpl MessageType, for: Message do
  def question?(message) do
    String.ends_with? message.message, "?"
  end

  def yelling?(message) do
    String.upcase(message.message) == message.message
  end

  def silent?(message) do
    String.strip(message.message) == ""
  end
end

defmodule Teenager do

  def hey(message) do
    msg = Message.new(message: message)
    cond do
      MessageType.question?(msg) ->
        "Sure."
      MessageType.silent?(msg) ->
        "Fine. Be that way!"
      MessageType.yelling?(msg) ->
        "Woah, chill out!"
      true ->
        "Whatever."
    end
  end

end