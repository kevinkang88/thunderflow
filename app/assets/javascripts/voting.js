$(document).ready(function() {
  $('.vote-up').bind('ajax:success', function() {
    var numString = parseInt($(this).next().next().html())
    $(this).next().next().text("" + (numString + 1))
  })

  $('.vote-down').bind('ajax:success', function() {
    var numString = parseInt($(this).prev().html())
    $(this).prev().text("" + (numString - 1))
  })
})