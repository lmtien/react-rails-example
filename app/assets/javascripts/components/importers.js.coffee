@Importers = React.createClass
  getInitialState: ->
    importers: @props.data

  getDefaultProps: ->
    importers: []

  componentDidMount: ->
    status = $('#status')
    status.hide()
    intervalID = setInterval( () =>
      $.get "refresh", ( data ) =>
        @setState importers: data
    , 300)

  render: ->
    React.DOM.div
      className: 'importers'
      React.DOM.h2
        className: 'title'
        'Company'
      React.createElement ImporterForm
      React.DOM.div
        id: 'status'
        React.DOM.br null
        React.DOM.div
          id: 'statusBar'
          className: 'progress-bar progress-bar-success'
          role: 'progress-bar'
          style: {width: "0%", height: "20px"}
          React.DOM.div
            id: 'statusText'
        React.DOM.br null
        React.DOM.br null
        React.DOM.div
          id: 'statusFeedback'
          '12345'
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Company'
            React.DOM.th null, 'Invoice No'
            React.DOM.th null, 'Invoice Date'
            React.DOM.th null, 'Operation Date'
            React.DOM.th null, 'Amount'
            React.DOM.th null, 'Reporter'
            React.DOM.th null, 'Notes'
            React.DOM.th null, 'Status'
            React.DOM.th null, 'Category'
            React.DOM.th null, 'Operation'
        React.DOM.tbody null,
          for importer in @state.importers
            React.createElement Importer, key: importer.id, importer: importer