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
  addRequestsFirstTime: (html) ->
    $('h3#empty').remove()
    $('#requests #requests_content #index').append(html)
    @poll()
  addRequests: (html_count, html) ->
    if html!='' and $('#requests #requests_content #index table').css('display') == 'none'
      $('h3#empty').remove()
      $('#requests #requests_content #index table').show()

    $('#requests #requests_header h3').html(html_count)
    $('#requests #requests_content #index table tbody').append(html)
      
    @poll()
  addCount: (requests_button_html) ->
    $('#requests_button').html(requests_button_html)
    @poll()
jQuery ->
  if $('#requests').length> 0 or $('#requests_button')> 0
    RequestPoller.poll()

  $(document).on 'click', '#requests #requests_content #index table tr.toggleble', (e) ->
    e.preventDefault()
    
    target_id = $(this).data('id') 
    target = $(this)
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
          $('tr.toggleble[data-read="false"]#' + target_id).children().css('color','black')
