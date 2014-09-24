$("#myTab a:last").click (e) ->
  $("#listAllComments").html "<h1> Loading Comments Please Wait ... </h1>"
  picture_id = $("#MainImage").data("picture-id")
  console.log picture_id
  setTimeout (->
    $.ajax
      type: "GET"
      url: "/comments/show_all_comments.js?picture_id=" + picture_id
      cache: false
  ), 1000