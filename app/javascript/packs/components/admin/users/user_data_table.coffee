class TestApp.UserDataTable
  @init: ->
    initUserDataTable()

  initUserDataTable = ->
    currentTable().DataTable
      'searching': true
      'paging': true
      'info': false
      'serverSide': true
      'processing': true
      'columns': [
        { 'data': 'id' }
        { 'data': 'name' }
        { 'data': 'email' }
        { 'data': 'created_at' }
        { 'data': 'updated_at' }
      ]
      'ajax':
        'url': currentTable().data('url')
        'dataSrc': 'data'

  currentTable = ->
    $('#users_table')
