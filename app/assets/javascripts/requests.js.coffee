@RequestPoller =
  poll: ->
    setTimeout @request, 5000
  request: ->
    $.ajax
      url: $('#requests').data('url')
      dataType: "script"
      data: 
        after: $('#requests #requests_content #index table tbody tr').last().data('id')
  addRequests: (requests) ->
    $('#requests #requests_content #index table tbody').append(requests)
    @poll();
jQuery ->
  if $('#requests').length > 0
    RequestPoller.poll()