module ApplicationHelper
  def hidden_if?(pred)
    "hidden" if pred
  end

  def active_if?(pred)
    "active" if pred
  end

  def yes_no(pred)
    pred ? "Yes" : "No"
  end

  def parent_layout(layout)
    render template: "layouts/#{layout}"
  end
end
