function sendRequest(id, key, value){
  $.ajax({
    url:'prayers',
    type: 'POST',
    data: {id: id, key: key, value: value},
    success: function(d){
      alert(d.message)
    },
    error: function(e){
      alert(e.message)
    }
  })
}

function listenToSaveButton (){
  $('.prayer button').on('click', function(event){
    var id, body, author

    id = $(event.target).data('id')
    preamble = $('.preamble.id'+id).val()
    body = $('.body.id'+id).val()
    author = $('.author.id'+id).val()
    sendRequest(id, "preamble", preamble)
    sendRequest(id, "body",     body)
    sendRequest(id, "author",   author)
  })
}

$(document).ready(function(){
  listenToSaveButton()
})