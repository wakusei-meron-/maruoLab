# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("td.lbl").addClass("")
  
  $("#member li").draggable(
    revert: "invalid"
    helper: "clone"
    )

  $(".blank ol").droppable(
     accept: ':not(ui-sortable-helper)'
     tolerance: 'pointer'
     activeClass: 'ui-state-default'
     hoverClass: 'ui-state-hover'
     drop: (event, ui)->
      $(this).find(".placeholder").remove();
      $('<li class="schedule"></li>').text(ui.draggable.text()).appendTo(this)
      #フォームのデータを渡す
      #日付
      now = new Date($(this).attr("id"))
      roomName = parseInt($(this).attr("class"))
      if roomName == 1
       $("#exp_plan_roomName").val(roomName);
      $("#exp_plan_planDay").val(now)
      #使用者名前
      $("#exp_plan_userName").val(ui.draggable.text())
      #submitを押す
      $("#new_exp_plan").submit()
      document.location.reload(true)
          
   )