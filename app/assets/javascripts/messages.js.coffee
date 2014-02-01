@MessagePoller =
  poll: ->
    setTimeout @request, 5000
  request: ->
    arr = $.map($('#messages #messages_content #index table tbody tr.toggleble'), (n,i) -> 
      n.id
    )
    data_after = Math.max.apply(Math,arr)
    #data_after = $('#messages #messages_content #index table tbody tr').last().data('id') 
    on_cpanel = $('#messages').data('oncpanel')
    $.ajax
      url: $('#messages').data('url')
      dataType: "script"
      data: 
        after: data_after
        on_cpanel: on_cpanel
  addMessagesFirstTime: (html) ->
    $('h3#empty').remove()
    $('#messages #messages_content #index').append(html)
    @poll()
  addMessages: (html_count, html) ->
    if html!='' and $('#messages #messages_content #index table').css('display') == 'none'
      $('h3#empty').remove()
      $('#messages #messages_content #index table').show()

    $('#messages #messages_header h3').html(html_count)
    $('#messages #messages_content #index table tbody').append(html)
      
    @poll()
  addCount: (messages_button_html) ->
    $('#admin_messages_button').html(messages_button_html)
    @poll()
jQuery ->
  if $('#messages').length> 0 or $('#admin_messages_button').length> 0
    MessagePoller.poll()

  $(document).on 'click', '#messages_content #index table tbody tr.toggleble', (e) ->
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
          message: 
            read: true
        success: ->
          target.data('read') == 'true'
          $('tr.toggleble[data-read="false"]#' + target_id).children().css('color','black')
