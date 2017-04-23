@Importer = React.createClass
  render: ->
    statusName = if @props.importer.status then @props.importer.status.name else ''
    operationName = if @props.importer.operation then @props.importer.operation.name else ''

    React.DOM.tr null,
      React.DOM.td null, @props.importer.company
      React.DOM.td null, @props.importer.invoice_num
      React.DOM.td null, @props.importer.invoice_date
      React.DOM.td null, @props.importer.operation_date
      React.DOM.td null, @props.importer.amount
      React.DOM.td null, @props.importer.reporter
      React.DOM.td null, @props.importer.notes
      React.DOM.td null, statusName
      React.DOM.td null, @props.importer.category
      React.DOM.td null, operationName