defmodule Servy.Parser do
	
  alias Servy.Conv

  def parse(request) do
    [top, params_string] = String.split(request, "\n\n")

    [request_line | header_line] = String.split(top, "\n")

    [method, path, _] = String.split(request_line, " ")

      
    [method, path, _] =
      request
      |> String.split("\n")
      |> List.first
      |> String.split(" ")

    params = params_string |> parse_params

    %Conv{
    	method: method,
      	path: path,
	params: params
    }
  end

  def parse_params(params) do
    params
    |> String.trim
    |> URI.decode_query
  end
  

end
