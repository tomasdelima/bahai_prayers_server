function sendCategoryRequest(id, data){
  $.ajax({
    url:'categories',
    type: 'POST',
    data: {id: id, data: data},
    success: function(a){
      alert(a.message)
    },
    error: function(e){
      alert(e.message)
    }
  })
}

function listenToSave (){
  $('.category input.left').on('keypress', function(event){
    var id, title, active

    if(event.which == 13) {
      id = $(event.target).attr('id')
      title = $('#'+id).val()
      sendCategoryRequest(id, { title: title })
    }
  })

  $('.category input.middle').on('click', function(event){
    id = $(event.target).data('id')
    active = $(event.target).prop('checked')
    sendCategoryRequest(id, { active: active })
  })
}

$(document).ready(function(){
  listenToSave()
})