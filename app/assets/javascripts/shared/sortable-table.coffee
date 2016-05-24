# This function initializes Sortable (https://github.com/RubaXa/Sortable) for
# a of sortable items.
#
# Args:
#   el (a DOM/jQuery element) - contains sortable elements
#   onUpdate (function) - callback function that will be called with an Event
#     argument once an item is dragged to a new position. You can use
#     evt.oldIndex and evt.newIndex to get the updated position of the item.
#
# Add the .js-sortable class to the tbody element that needs to be sortable.
# If you are using handles, make each handle have the .js-sortable-handle class.
#
# Add a data-endpoint attribute with the URL of the sorting endpoint
# on the server.
# Add a data-id attribute with the ID of the model to each row of the table.
#
# For example, a sortable table might look like:
#
# table
#   thead
#     tr
#       th / Sorting Handle
#       th Col1
#       th Col2
#     tbody.js-sortable data={ endpoint: some_path }
#       tr data={ id: @model.id }
#         td = fa_icon 'arrows', class: 'js-sortable-handle'
#         td Stuff
#         td More stuff
#       tr data={ id: @model2.id }
#         td = fa_icon 'arrows', class: 'js-sortable-handle'
#         td Stuff2
#         td More stuff2

SORTABLE_CLASS = '.js-sortable'
HANDLE_CLASS = '.js-sortable-handle'
DATA_ENDPOINT = 'endpoint'

initSortableTable = (el, onUpdate) ->
  Sortable.create el,
    handle: HANDLE_CLASS
    animation: 150
    onUpdate: onUpdate

# Initialize sortable
ready ->
  $(SORTABLE_CLASS).each ->
    initSortableTable this, (evt) ->
      data = {
        id: evt.item.dataset.id
        # We have to add one since Sortable uses 0 indexing while acts_as_list
        # starts at 1
        newPos: evt.newIndex + 1
      }

      # Post to the endpoint
      # We don't do anything here to give feedback that the request went
      # through, although we could.
      endpoint = evt.target.dataset[DATA_ENDPOINT]
      $.post endpoint, data
