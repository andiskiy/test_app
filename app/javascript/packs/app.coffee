window.TestApp = {}

import Azia from './azia/index'

class TestApp.Application
  @init: ->
    Azia.onInit()
    initDataTable()
    page = $('body').data('page')
    TestApp[page].init() if TestApp[page]

  initDataTable = ->
    jQuery.extend(true, jQuery.fn.dataTable.defaults, {
      'language': {
        'emptyTable': 'Нет данных',
        'lengthMenu': 'Показывать _MENU_ записей',
        'search': 'Поиск: ',
        'paginate': {
          'first': 'первая',
          'last': 'последняя',
          'next': 'следующая',
          'previous': 'предыдущая'
        },
      }
    })

$(document).on 'turbolinks:load', ->
  TestApp.Application.init()
