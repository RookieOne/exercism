defprotocol MessageType do
  def question?(message)
  def yelling?(message)
  def silent?(message)
end

defimpl MessageType, for: BitString do
  def question?(message) do
    String.ends_with? message, "?"
  end

  def yelling?(message) do
    String.upcase(message) == message
  end

  def silent?(message) do
    String.strip(message) == ""
  end
end

defmodule Teenager do

  def hey(message) do
    respond identify_message(message)
  end

  def respond({:question}), do: "Sure."
  def respond({:silent}), do: "Fine. Be that way!"
  def respond({:yelling}), do: "Woah, chill out!"
  def respond(_), do: "Whatever."

  defp identify_message(message) do
    cond do
      MessageType.question?(message) ->
        {:question}
      MessageType.silent?(message) ->
        {:silent}
      MessageType.yelling?(message) ->
        {:yelling}
      true ->
        {:unidentified}
    end
  end

end