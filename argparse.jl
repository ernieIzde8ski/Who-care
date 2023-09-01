using ArgParse

function parse_commandline()
    settings = ArgParseSettings()

    @add_arg_table settings begin
        "--translation", "-T"
            arg_type = String
            help = """A translation of the bible.
                Available options at time of writing are:
                cherokee, bbe, kjv, web, oeb-cw, webbe, oeb-us,
                clementine, almeida, rccv"""
        "--verse-numbers", "-n"
            action = :store_true
            help = "Insert verse numbers into the text."
        "--json"
            action = :store_true
            help = "Print the API response directly."
        "--server"
            arg_type = String
            default = "https://bible-api.com/"
            help = "Server to make API calls to."
        "query"
            arg_type = String
            required = true
            help = """A bible passage, like "John 3:16-17".
                Accepts hyphens, ampersands, commas, and semicolons."""
    end

    return parse_args(settings)
end
