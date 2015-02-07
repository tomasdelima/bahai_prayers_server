function sendRequest(id, key, value){
  $.ajax({
    url:'categories',
    type: 'POST',
    data: {id: id, key: key, value: value},
    success: function(a){
      alert(a.message)
    }
  })
}

function listenToSave (){
  $('.category input.left').on('keypress', function(event){
    if(event.which == 13) {
      id = $(event.target).attr('id')
      title = $('#'+id).val()
      sendRequest(id, 'title', title)
    }
  })

  $('.category input.middle').on('click', function(event){
    id = $(event.target).data('id')
    active = $(event.target).prop('checked')
    sendRequest(id, 'active', active)
  })
}

$(document).ready(function(){
  listenToSave()
})