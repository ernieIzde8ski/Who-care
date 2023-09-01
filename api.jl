import HTTP
import JSON

function request(url::String, params::Dict)::Dict
    resp = HTTP.get(url, query=params, status_exception=false)
    resp_content = JSON.parse(String(resp.body))

    if resp_content == "translation not found"
        error("translation not found: " * params["translation"])
    elseif resp_content isa Dict && haskey(resp_content, "error")
        error("Bible API returned an error: ", resp_content["error"])
    elseif resp.status >= 400 || ! (resp_content isa Dict)
        error("unrecognized error! Who care.")
    end

    return resp_content
end

function print_response(resp::Dict)
    println(resp["reference"] * ", " * resp["translation_name"])
    println(strip(resp["text"]))
end