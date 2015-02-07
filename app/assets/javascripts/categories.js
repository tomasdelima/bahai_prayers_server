function sendRequest(id, newValue){
  $.ajax({
    url:'categories',
    type: 'POST',
    data: {id: id, value: newValue},
    success: function(a){
      alert(a.message)
    }
  })
}

function listenToSave (){
  $('.category input').on('keypress', function(event){
    if(event.which == 13) {
      id = $(event.target).attr('id')
      newValue = $('#'+id).val()
      sendRequest(id, newValue)
    }
  })
}

$(document).ready(function(){
  listenToSave()
})