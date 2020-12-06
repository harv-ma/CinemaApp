class SeatsController < ApplicationController




    def getShowingSeats
        @id = params['id'] # ID of showing
        # ['1_2', '4_1', '7_1', '7_2'] unavailable format
        data = {
                :seats => [
                    '1_2', '4_1', '7_1', '7_2', '4_8'
                ],
                :layout => [
                    'sssss_sssss_sssss',
                    'sssss_sssss_sssss',
                    'sssss_sssss_sssss',
                    'sssss_sssss_sssss',
                    'sssss_sssss_sssss',
                    'ddddd_sssss_ddddd'
                    ]
                }

        render :json => data

    end


    private
        def person_params
            params.require(:seat).permit(:id)
        end
end
