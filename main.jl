import HTTP

include("argparse.jl")
include("api.jl")


function ensure_trailing_slash(s::String)::String
    if SubString(s, length(s)) == "/"
        return s
    else
        return s * "/"
    end
end

function main()
    args = parse_commandline()

    url = ensure_trailing_slash(args["server"]) * args["query"]

    params = Dict()
    if args["verse-numbers"] == true
        params["verse_numbers"] = args["verse-numbers"]
    end
    if args["translation"] !== nothing
        params["translation"] = args["translation"]
    end

    resp = request(url, params)

    if args["json"]
        JSON.print(resp)
    else
        print_response(resp)
    end
end

main()
