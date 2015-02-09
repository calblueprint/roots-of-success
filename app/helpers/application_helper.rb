module ApplicationHelper
  def class_if(pred, yes, no=nil)
    pred ? yes : no
  end

  def hidden_if?(pred)
    class_if pred, "hidden"
  end

  def active_if?(pred)
    class_if pred, "active"
  end

  def yes_no(pred)
    pred ? "Yes" : "No"
  end

  def parent_layout(layout)
    render template: "layouts/#{layout}"
  end
end
