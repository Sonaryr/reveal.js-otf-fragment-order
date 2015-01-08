###
  otf-fragment-order.coffee
  http://www.waxam.be
  MIT Licensed

  Copyright (C) 2015 Maarten Schroeven <maarten@waxam.be>
###
CURRENT_INDEX = -1
showFragment = (event) ->
  if 48 <= event.keyCode <= 57
    index = event.keyCode - 48
    index = 10 if index is 0
    currentSlide = Reveal.getCurrentSlide()
    fragment = currentSlide.querySelector ".fragment[data-otf-fragment-order-index=\"#{index}\"]"

    if fragment?.className.indexOf('visible') is -1
      CURRENT_INDEX++
      otherFragment = currentSlide.querySelector ".fragment[data-fragment-index=\"#{CURRENT_INDEX}\"]"
      if otherFragment?
        otherFragment.setAttribute 'data-fragment-index', fragment.getAttribute('data-fragment-index')
        fragment.setAttribute 'data-fragment-index', CURRENT_INDEX
        Reveal.nextFragment()

toggleKeyListener = ->
  currentSlide = Reveal.getCurrentSlide()
  if currentSlide?.hasAttribute 'data-otf-fragment-order-slide'
    CURRENT_INDEX = -1
    document.addEventListener 'keydown', showFragment
  else
    document.removeEventListener 'keydown', showFragment

addDataAttributes = ->
  fragments = Array.prototype.slice.call(document.querySelectorAll 'section[data-otf-fragment-order-slide] .fragment')
  fragments.forEach (fragment)->
    fragment.setAttribute 'data-otf-fragment-order-index', parseInt(fragment.getAttribute('data-fragment-index'))+1

config = Reveal.getConfig()
if config?.otfFragmentOrder? is true
  addDataAttributes()
  toggleKeyListener()
  Reveal.addEventListener 'slidechanged', (evt) ->
    if not evt.previousSlide? or evt.previousSlide.className.indexOf 'past' > -1
      toggleKeyListener()