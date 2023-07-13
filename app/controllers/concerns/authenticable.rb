module Authenticable
    private

    def authenticate_with_token
        @token ||= request.headers['Authorization']

        unless valid_token?
            render json: {errors: 'Forneça um Header Authorization para se identificar (qualquer um com no mínimo 10 caracteres)'}, 
                    status: :unauthorized
        end
    end

    def valid_token?
        @token.present? && @token.size >= 10
    end
end