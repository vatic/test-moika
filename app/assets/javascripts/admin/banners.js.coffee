# plupload file upload
#

$ ->
  uploaders = {}
  ids = $('#banners').data('ids')
  console.log(ids)
  $.each ids, (index,id) ->
    uploader = new plupload.Uploader(
      runtimes: "html5,flash,silverlight,browserplus"
      browse_button: "pickfiles_" + id
      container: "image-container_" + id 
      max_file_size: "500kb"
      url: $('#banner_' + id).data('url')
      authenticity_token: $('#banner').data('token')
      multi_selection: false
      flash_swf_url: "/plupload/js/plupload.flash.swf"
      silverlight_xap_url: "/plupload/js/plupload.silverlight.xap"
      filters: [
        extensions: "jpg,gif,png"
        title: "Image files"
      ,
        title: "Zip files"
        extensions: "zip"
      ]
      resize:
        width: 320
        height: 240
        quality: 90
      multipart: true
      multipart_params:
        "_method" : "put"
    )

    uploader.bind "UploadProgress", (up, file) ->
      progress_div_part1 = '<div class="progress"><div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="'
      progress_div_part2 = '" aria-valuemin="0" aria-valuemax="100" style="width: 40%"><span class="sr-only">40% Complete (success)</span></div></div>'
      $("#" + file.id + " b").html progress_div_part1 + file.percent + progress_div_part2
      console.log('progress' + file.percent)

    uploader.bind "Init", (up, params) ->
   
    #$("#filelist").html "<div>Current runtime: " + params.runtime + "</div>"
    #$("#filelist").append "<div>container: " + params.container + "</div>"

###############################
    uploader.init()
###############################

    uploader.bind "Error", (up, err) ->
      $(".filelist").html('')
      if err.code == -600
        $(".filelist").append "<div>Ошибка: " + "<b class='red'>" + err.message + "</b>" + ((if err.file then ", Размер файла не может превышать: " + up.settings.max_file_size else "")) + "</div>"
        console.log(up.settings)
      else
        $(".filelist").append "<div>Ошибка: " + err.code + ", Message: " + err.message + ((if err.file then ", File: " + err.file.name else "")) + "</div>"
      up.refresh() # Reposition Flash/Silverlight

    uploader.bind "FileUploaded", (up, file, data) ->
      $("#" + file.id + " b").html "100%"
      banner = data.response
      banner = JSON.parse banner

      version =  $('#banner_' + id).data('version')
      console.log(version)
      console.log(banner.file.file)
      url = banner.file.file[version].url

      $('img#' + banner["id"]).prop('src',url) 
    uploaders[id] = uploader

#####################################################

    $("#uploadfiles_" + id).click (e) ->
      uploader = uploaders[id]
      uploader.settings.multipart_params.text = $('#bannermodal_' + id + ' input[type="text"').val()
      console.log(uploader.settings.multipart_params)
      uploader.start()
      e.preventDefault()

#####################################################

    uploader.bind "FilesAdded", (up, files) ->
      $.each files, (i, file) ->
        img = new o.Image()
        img.onload = ->
          li = document.createElement("li")
          h4 = document.createElement("h4")
          t=document.createTextNode("Новый")
          h4.appendChild(t)
          li.appendChild(h4)
          li.id = @uid
          document.getElementById("image-container_" + id).appendChild li
          @embed li.id,
            width: 240
            height: 140
            crop: true
        img.load file.getSource()
        $(".filelist").html('')
        $("#filelist_" + id).append "<div id=\"" + file.id + "\">" + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"
        up.refresh() # Reposition Flash/Silverlight


#####################################################
# modal dialog for image uploading

  $(document).on 'mouseover', 'img.banner', (e) ->
    $(this).css('border', 'solid 2px red')
    $(this).tooltip('show')
  $(document).on 'mouseout', 'img.banner', (e) ->
    $(this).css('border', '2px solid blue')
    $(this).tooltip('hide')
  $(document).on 'click', 'img.banner', (e) ->
    banner_id = $(this).data('id')
    $('#bannermodal_' + banner_id).modal('toggle')

  $(document).on "ajax:success", "a.delete_file", (e, data, status, xhr) ->
    arr = $('ul.image-container li')
    $.each arr, (i,v) ->
      $(v).html('')
    $("ul.image-container").append('<h5>Удалено</h5>')
    #file = data.response
    #file = JSON.parse file
    id = data.id
    version =  $('#banner_' + id).data('version')
    url = data.file[version].url
    $('img#' + id).prop('src',url) 
