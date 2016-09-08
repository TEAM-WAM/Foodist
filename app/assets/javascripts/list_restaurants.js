// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();

    var element = ev.dataTransfer.getData("text");
    var parentDiv = $(ev.target).parent();
    var listId = parentDiv.children().children().first().attr('id');
    var restaurantsList = parentDiv.children().children().last();
    var data = {
      restaurant_id: element,
      list_id: listId
    }
    // debugger;
    var url = "/lists/" + data.list_id + "/list_restaurants"
    $.post(url, data)
      .done((response) => {
        restaurantsList.append(document.getElementById(element));
      })
}
