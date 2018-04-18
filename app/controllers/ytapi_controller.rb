class YtapiController < ApplicationController
    require 'video_info'

    def index
        VideoInfo.provider_api_keys = { youtube: 'AIzaSyCm_tgAlL5YThZGQ8g6fRDHW4fW3ODfHn8'}

        @ytapi_video_1 = VideoInfo.new('https://www.youtube.com/watch?v=BI_VnnOLSKY')
        @ytapi_video_2 = VideoInfo.new('https://www.youtube.com/watch?v=uI3YN_cnahk')


    end
end
