# plupload file upload
#

$ ->
  uploaders = {}
  ids = $('#banners').data('ids')
  console.log(ids)
  for id in ids
    uploader = new plupload.Uploader(
      runtimes: "html5,flash,silverlight,browserplus"
      browse_button: "pickfiles_" + id
      container: "image-container_" + id 
      max_file_size: "10mb"
      url: $('#banner_' + id).data('url')
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
    console.log(uploader.settings.container)

    uploader.bind "Init", (up, params) ->
      #$("#filelist").html "<div>Current runtime: " + params.runtime + "</div>"


###############################
    uploader.init()
###############################


    uploader.bind "UploadProgress", (up, file) ->
      $("#" + file.id + " b").html file.percent + "%"

    uploader.bind "Error", (up, err) ->
      $("#filelist").append "<div>Error: " + err.code + ", Message: " + err.message + ((if err.file then ", File: " + err.file.name else "")) + "</div>"
      up.refresh() # Reposition Flash/Silverlight

    uploader.bind "FileUploaded", (up, file, data) ->
      $("#" + file.id + " b").html "100%"
      banner = data.response
      banner = JSON.parse banner
      $('img#' + banner["id"]).prop('src',banner.url) 
    uploaders[id] = uploader

#####################################################

  $("#uploadfiles_" + ids[0]).click (e) ->
    uploader = uploaders[ids[0]]
    uploader.start()
    e.preventDefault()

  $("#uploadfiles_" + ids[1]).click (e) ->
    uploader = uploaders[ids[1]]
    uploader.start()
    e.preventDefault()

  $("#uploadfiles_" + ids[2]).click (e) ->
    uploader = uploaders[ids[2]]
    uploader.start()
    e.preventDefault()

  $("#uploadfiles_" + ids[3]).click (e) ->
    uploader = uploaders[ids[3]]
    uploader.start()
    e.preventDefault()

  $("#uploadfiles_" + ids[4]).click (e) ->
    uploader = uploaders[ids[4]]
    uploader.start()
    e.preventDefault()

  $("#uploadfiles_" + ids[5]).click (e) ->
    uploader = uploaders[ids[5]]
    uploader.start()
    e.preventDefault()

  $("#uploadfiles_" + ids[6]).click (e) ->
    uploader = uploaders[ids[6]]
    uploader.start()
    e.preventDefault()

  $("#uploadfiles_" + ids[7]).click (e) ->
    uploader = uploaders[ids[7]]
    uploader.start()
    e.preventDefault()

  $("#uploadfiles_" + ids[8]).click (e) ->
    uploader = uploaders[ids[8]]
    uploader.start()
    e.preventDefault()

#####################################################

  banner_id = ids[0]
  uploader0 = uploaders[banner_id]
  uploader0.bind "FilesAdded", (up, files) ->
    id = banner_id
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
          width: 200
          height: 100
          crop: true
      img.load file.getSource()
      $("#filelist_" + id).append "<div id=\"" + file.id + "\">" + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"
      up.refresh() # Reposition Flash/Silverlight
      console.log('filesAdded:' + file.name)
      console.log('filesAdded:' + id)
      console.log('filesAdded:' + $("filelist_" + id))
      $('#test').append file.name

  banner_id = ids[1]
  uploader1 = uploaders[banner_id]
  uploader1.bind "FilesAdded", (up, files) ->
    id = banner_id
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
          width: 200
          height: 100
          crop: true
      img.load file.getSource()
      $("#filelist_" + id).append "<div id=\"" + file.id + "\">" + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"
      up.refresh() # Reposition Flash/Silverlight
      console.log('filesAdded:' + file.name)
      console.log('filesAdded:' + id)
      console.log('filesAdded:' + $("filelist_" + id))
      $('#test').append file.name

  banner_id = ids[2]
  uploader2 = uploaders[banner_id]
  uploader2.bind "FilesAdded", (up, files) ->
    id = banner_id
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
          width: 200
          height: 100
          crop: true
      img.load file.getSource()
      $("#filelist_" + id).append "<div id=\"" + file.id + "\">" + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"
      up.refresh() # Reposition Flash/Silverlight
      console.log('filesAdded:' + file.name)
      console.log('filesAdded:' + id)
      console.log('filesAdded:' + $("filelist_" + id))
      $('#test').append file.name

  banner_id = ids[3]
  uploader3 = uploaders[banner_id]
  uploader3.bind "FilesAdded", (up, files) ->
    id = banner_id
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
          width: 200
          height: 100
          crop: true
      img.load file.getSource()
      $("#filelist_" + id).append "<div id=\"" + file.id + "\">" + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"
      up.refresh() # Reposition Flash/Silverlight
      console.log('filesAdded:' + file.name)
      console.log('filesAdded:' + id)
      console.log('filesAdded:' + $("filelist_" + id))
      $('#test').append file.name

  banner_id = ids[4]
  uploader4 = uploaders[banner_id]
  uploader4.bind "FilesAdded", (up, files) ->
    id = banner_id
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
          width: 200
          height: 100
          crop: true
      img.load file.getSource()
      $("#filelist_" + id).append "<div id=\"" + file.id + "\">" + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"
      up.refresh() # Reposition Flash/Silverlight
      console.log('filesAdded:' + file.name)
      console.log('filesAdded:' + id)
      console.log('filesAdded:' + $("filelist_" + id))
      $('#test').append file.name

  banner_id = ids[5]
  uploader5 = uploaders[banner_id]
  uploader5.bind "FilesAdded", (up, files) ->
    id = banner_id
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
          width: 200
          height: 100
          crop: true
      img.load file.getSource()
      $("#filelist_" + id).append "<div id=\"" + file.id + "\">" + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"
      up.refresh() # Reposition Flash/Silverlight
      console.log('filesAdded:' + file.name)
      console.log('filesAdded:' + id)
      console.log('filesAdded:' + $("filelist_" + id))
      $('#test').append file.name

  banner_id = ids[6]
  uploader6 = uploaders[banner_id]
  uploader6.bind "FilesAdded", (up, files) ->
    id = banner_id
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
          width: 200
          height: 100
          crop: true
      img.load file.getSource()
      $("#filelist_" + id).append "<div id=\"" + file.id + "\">" + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"
      up.refresh() # Reposition Flash/Silverlight
      console.log('filesAdded:' + file.name)
      console.log('filesAdded:' + id)
      console.log('filesAdded:' + $("filelist_" + id))
      $('#test').append file.name

  banner_id = ids[7]
  uploader7 = uploaders[banner_id]
  uploader7.bind "FilesAdded", (up, files) ->
    id = banner_id
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
          width: 200
          height: 100
          crop: true
      img.load file.getSource()
      $("#filelist_" + id).append "<div id=\"" + file.id + "\">" + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"
      up.refresh() # Reposition Flash/Silverlight
      console.log('filesAdded:' + file.name)
      console.log('filesAdded:' + id)
      console.log('filesAdded:' + $("filelist_" + id))
      $('#test').append file.name

  banner_id = ids[8]
  uploader8 = uploaders[banner_id]
  uploader8.bind "FilesAdded", (up, files) ->
    id = banner_id
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
          width: 200
          height: 100
          crop: true
      img.load file.getSource()
      $("#filelist_" + id).append "<div id=\"" + file.id + "\">" + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"
      up.refresh() # Reposition Flash/Silverlight
      console.log('filesAdded:' + file.name)
      console.log('filesAdded:' + id)
      console.log('filesAdded:' + $("filelist_" + id))
      $('#test').append file.name

#####################################################

  $(document).on 'mouseover', 'img.banner', (e) ->
    $(this).css('border', 'solid 2px red')
    $(this).tooltip('show')
  $(document).on 'mouseout', 'img.banner', (e) ->
    $(this).css('border', '1px solid blue')
    $(this).tooltip('hide')
  $(document).on 'click', 'img.banner', (e) ->
    banner_id = $(this).data('id')
    $('#bannermodal_' + banner_id).modal('toggle')
