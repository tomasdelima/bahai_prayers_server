function sendRequest(id, body, author){
  $.ajax({
    url:'prayers',
    type: 'POST',
    data: {id: id, body: body, author: author},
    success: function(a){
      alert(a.message)
    }
  })
}

function listenToSaveButton (){
  $('.prayer button').on('click', function(event){
    var id, body, author

    id = $(event.target).data('id')
    body = $('textarea.id'+id).val()
    author = $('input.id'+id).val()
    sendRequest(id, body, author)
  })
}

$(document).ready(function(){
  listenToSaveButton()
})