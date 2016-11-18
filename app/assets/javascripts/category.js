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

function listenToActivateButton (){
  $('.prayer input[type=checkbox]').on('click', function(event){
    var id, active

    id = $(event.target).data('id')
    field_name = $(event.target).data('field-name')
    value = $(this).prop('checked')
    data = {}
    data[field_name] = value
    sendPrayerRequest(id, data)
  })
}

$(document).ready(function(){
  listenToSaveButton()
  listenToActivateButton()
})