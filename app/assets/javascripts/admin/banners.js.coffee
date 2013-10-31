# plupload file upload
#

$ ->
  uploader = new plupload.Uploader(
    runtimes: "html5,flash,silverlight,browserplus"
    browse_button: "pickfiles"
    container: "image-container"
    max_file_size: "10mb"
    url: $('#banner').data('url')
    authenticity_token: $('#banner').data('token')
    #file_data_name: 'banner'
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
      "_method" : "put",
  )

  uploader.bind "Init", (up, params) ->
    $("#filelist").html "<div>Current runtime: " + params.runtime + "</div>"
    console.log($('#banner').data('token'))


  $("#uploadfiles").click (e) ->
    uploader.start()
    e.preventDefault()

  uploader.init()

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
        document.getElementById("image-container").appendChild li
        @embed li.id,
          width: 200
          height: 100
          crop: true
      img.load file.getSource()
      console.log(img)
      $("#filelist").append "<div id=\"" + file.id + "\">" + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"
      up.refresh() # Reposition Flash/Silverlight

  uploader.bind "UploadProgress", (up, file) ->
    $("#" + file.id + " b").html file.percent + "%"

  uploader.bind "Error", (up, err) ->
    $("#filelist").append "<div>Error: " + err.code + ", Message: " + err.message + ((if err.file then ", File: " + err.file.name else "")) + "</div>"
    up.refresh() # Reposition Flash/Silverlight

  uploader.bind "FileUploaded", (up, file) ->
    $("#" + file.id + " b").html "100%"

  $(document).on 'mouseover', 'img.banner', (e) ->
    $(this).css('border', 'solid 2px red')
    $(this).tooltip('show')
  $(document).on 'mouseout', 'img.banner', (e) ->
    $(this).css('border', 'none')
    $(this).tooltip('hide')
  $(document).on 'click', 'img.banner', (e) ->
    banner_id = $(this).data('id')
    console.log('#bannermodal_' + banner_id)
    $('#bannermodal_' + banner_id).modal('toggle')
