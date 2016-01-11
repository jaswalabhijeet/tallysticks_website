$(function(){

  $('.floating-icon').mouseover(function(evt) {
    var elem = $(evt.target)
    elem.next('.discover-more-text').fadeIn(600)
  })

  $('.floating-icon').mouseout(function(evt) {
    var elem = $(evt.target)
    elem.next('.discover-more-text').fadeOut(200)
  })

  var maxHeight = -1
  $('.four-boxes ul li').each(function(_, elem) {
    elem = $(elem)
    if (elem.height() > maxHeight)
      maxHeight = elem.height()
  })

  $('.four-boxes ul li').each(function(_, elem) {
    elem = $(elem)
    elem.height(maxHeight)
  })

  $(".various").fancybox({
    maxWidth	  : 800,
    maxHeight	  : 600,
    padding		  : 5,
    fitToView	  : false,
    width		    : '70%',
    height		  : 'auto',
    autoSize	  : false,
    closeClick	: false,
    openEffect	: 'none',
    closeEffect	: 'none',
  })

  $("a[href='#top']").on("click", function(evt){
    evt.preventDefault()
    $("html, body").animate({ scrollTop: 0 }, "slow")
  })

})
