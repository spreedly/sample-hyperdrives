defmodule Spreedly do

  require Record
  Record.defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  def purchase_on_gateway(gateway_token, payment_method_token, amount) do
    url = "https://core.spreedly.com/v1/gateways/#{gateway_token}/purchase.xml"

    HTTPotion.post(url, purchase_body(payment_method_token, amount), headers)
    |> process_response
  end


  defp process_response(%{status_code: 200}) do
    { :ok }
  end

  defp process_response(%{body: body}) do
    { :error, retrieve_message(body), retrieve_payment_method(body) }
  end

  defp headers do
    encoded = Base.encode64("#{System.get_env("ENVIRONMENT_KEY")}:#{System.get_env("ACCESS_SECRET")}")
    [
      "Authorization": "Basic #{encoded}",
      "Content-Type": "text/xml"
    ]
  end

  defp retrieve_payment_method(xml) do
    %CreditCard{
      full_name: retrieve(xml, "//transaction/payment_method/full_name"),
      month: retrieve(xml, "//transaction/payment_method/month"),
      year: retrieve(xml, "//transaction/payment_method/year")
    }
  end

  defp retrieve_message(xml) do
    retrieve(xml, "//transaction/message")
  end

  defp retrieve(xml, xpath) do
    xml
    |> XPath.select("#{xpath}/text()")
    |> Enum.map(&(xmlText(&1, :value)))
    |> List.first
  end

  defp purchase_body(payment_method_token, amount) do
    "<transaction>
       <payment_method_token>#{payment_method_token}</payment_method_token>
       <amount>#{amount}</amount>
       <currency_code>USD</currency_code>
     </transaction>"
  end

end
