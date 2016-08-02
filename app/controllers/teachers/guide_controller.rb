module Teachers
  class GuideController < BaseController
    def index
      @quide_embed_code = '<iframe src="https://docs.google.com/document/d/11sP1Y1KM6Xh5vmjsuJSmvfveT6MZORlwxNG2ErTMwmw/pub?embedded=true"></iframe>'
    end
  end
end
