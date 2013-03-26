'use strict'

$.fn.extend
  hideDetails : () ->
    $(this).each () ->
      $(this).addClass('collapsed').prev().removeClass('last-child')
      $(this).next().removeClass('first-child')
  showDetails : () ->
    $(this).each () ->
      $(this).removeClass('collapsed').siblings().hideDetails()
      $(this).prev().addClass('last-child')
      $(this).next().addClass('first-child')


switchToPage = (page) ->
  page = $(page)
  page.show().siblings('.page').hide()
  $("#appNavbar a[href=##{page.attr('id')}]").parent().addClass('selected').siblings().removeClass('selected')
  page

checkLinkTo = (link) ->
  href = $(link).attr('href')
  if href[0] isnt '#'
    return href
  else
    targetElem = $(href)
    if targetElem.hasClass('page')
      itsPage = targetElem
    else
      itsPage = targetElem.parents('.page')
    if itsPage.length > 0
      switchToPage(itsPage)
    itsPage

$ ->
  $('.page').hide()
  $('a').click () -> checkLinkTo(this)

  $('#appNavbar a').eq(0).click()
  $('.monster-info').hideDetails().click () ->
    console.log 'clicked'
    $(this).showDetails()
