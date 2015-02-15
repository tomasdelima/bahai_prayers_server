function sendPrayerRequest(id, data){
  $.ajax({
    url:'prayers',
    type: 'POST',
    data: {id: id, data: data},
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
    sendPrayerRequest(id, { preamble: preamble, body: body, author: author })
  })
}

$(document).ready(function(){
  listenToSaveButton()
})