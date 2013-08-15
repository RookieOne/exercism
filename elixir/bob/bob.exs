defmodule Message do
  def identify(message) do
    cond do
      question?(message) ->
        {:question}
      silent?(message) ->
        {:silent}
      yelling?(message) ->
        {:yelling}
      true ->
        {:unidentified}
    end
  end

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
    respond Message.identify(message)
  end

  def respond({:question}), do: "Sure."
  def respond({:silent}), do: "Fine. Be that way!"
  def respond({:yelling}), do: "Woah, chill out!"
  def respond(_), do: "Whatever."

end