@ImporterForm = React.createClass
  handleSubmit: (e) ->
    e.preventDefault()
    status = $('#status')
    statusBar = $('#statusBar')
    statusText = $('#statusText')
    statusFeedback = $('#statusFeedback')
    $('.form-inline').ajaxSubmit
      beforeSend: ->
        status.show()
        statusFeedback.hide()

        percentVal = '0%'
        statusBar.width(percentVal)
        statusBar.removeClass('active')
        statusBar.removeClass('progress-bar-danger')
        statusBar.addClass('progress-bar-success');
        statusText.html(percentVal + ' Uploading')

      uploadProgress: (event, position, total, percentComplete) ->
        percentVal = percentComplete + '%'
        statusBar.width(percentVal)

        if percentComplete == 100
          statusText.html('Uploaded successfully. Please wait for parsing data.')
        else
          statusText.html(percentVal + ' Uploading')

      complete: (xhr) ->
        statusBar.addClass('active')
        statusBar.addClass('progress-bar-warning');
        statusBar.addClass('progress-bar-striped');
        statusBar.removeClass('progress-bar-success')
        statusBar.removeClass('progress-bar-danger')
        intervalID = setInterval(->
          $.ajax
            url: "/progress-job/" + xhr.responseJSON
            success: (job) ->
              # If there are errors
              if job.last_error != null
                clearInterval(intervalID)
                statusText.html('Could not parse your uploaded file.')
                statusBar.removeClass('active')
                statusBar.removeClass('progress-bar-warning')
                statusBar.removeClass('progress-bar-striped')
                statusBar.addClass('progress-bar-danger')
              else
                # Upload stage
                if job.progress_stage != null
                  stage = JSON.parse job.progress_stage
                  # percentVal = (stage.step * 100) / job.progress_max

                  statusBar.width('100%')
                  statusText.html('Importing data...')

                  statusFeedback.show()
                  statusFeedback.html('Total processed data: ' + stage.total_row_processed + '<br>Succeeded: ' + (stage.total_row_processed - stage.total_row_fail) + '<br>Failed: ' + stage.total_row_fail)

                  # if percentVal >= 100
                  #   statusText.html('Parsing data successfully.')
                  #   statusBar.removeClass('active')
                  #   clearInterval(intervalID)

            error: ->
              statusText.html('Importing data successfully.')
              statusBar.removeClass('active')
              statusBar.removeClass('progress-bar-warning')
              statusBar.removeClass('progress-bar-striped')
              statusBar.addClass('progress-bar-success')
              clearInterval(intervalID)
        , 100)

  render: ->
    React.DOM.form
      className: 'form-inline'
      action: 'importers/csv'
      encType: 'multipart/form-data'
      method: 'POST'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'file'
          className: 'form-control'
          placeholder: 'Your CSV file'
          name: 'csvfile'
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        'Import'