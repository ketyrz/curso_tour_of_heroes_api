module Request
    module JsonHelpers
        def json_response
            @json_response ||= JSON.parse(response.body, symbolize_name: true )
        end
    end
end