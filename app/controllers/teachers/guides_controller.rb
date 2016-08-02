module Teachers
  class GuidesController < BaseController
    def getting_started
      @guide_embed_code = '<iframe src="https://docs.google.com/document/d/11sP1Y1KM6Xh5vmjsuJSmvfveT6MZORlwxNG2ErTMwmw/pub?embedded=true
      "></iframe>'
    end

    def surveys_and_quizzes
      @guide_embed_code = '<iframe src="https://docs.google.com/document/d/1oKygiwON0C87Tl1BGNHAZ6hSsQIZndNU4sjxOGE_djY/pub?embedded=true
      "></iframe>'
    end
  end
end
