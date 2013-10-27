@RequestPoller =
  poll: ->
    setTimeout @request, 5000
  request: ->
    data_after = $('#requests #requests_content #index table tbody tr').last().data('id') 
    on_cpanel = $('#requests').data('oncpanel')
    $.ajax
      url: $('#requests').data('url')
      dataType: "script"
      data: 
        after: data_after
        on_cpanel: on_cpanel
  addRequests: (requests) ->
    $('#requests #requests_content #index table tbody').append(requests)
    @poll()
  addCount: (requests_button_html) ->
    $('#requests_button').html(requests_button_html)
    @poll()
jQuery ->
  if $('#requests').length or $('#requests_button')> 0
    RequestPoller.poll()

  $(document).on 'click', 'a.toggleble', (e) ->
    e.preventDefault()
    
    target_id = $(this).parent().parent().data('id') 
    target = $('#requests_content tr#' + target_id)
    $('table tr#' + target_id + '.text-full').first().fadeToggle('slow', 'linear')

    if not target.data('read')
      $.ajax
        url: target.data('url')
        type: 'POST'
        dataType: "json"
        data: 
          _method: "put"
          request: 
            read: true
        success: ->
          target.data('read') == 'true'
          target.children().first().find('a').css('color','black')
          target.children().first().find('a').css('background-color','#ddd')
