module Teachers
  class ChangelogItemsController < BaseController
    def index
      @changelog_items = ChangelogItem.all.decorate
    end
  end
end
