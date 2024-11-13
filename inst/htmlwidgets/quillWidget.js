HTMLWidgets.widget({

  name: 'quillWidget',

  type: 'output',

  factory: function(el, width, height) {

    return {

      renderValue: function(params) {
        toolbarOptions = [
          params.toolbar_options.header,
          params.toolbar_options.binary_options,
          params.toolbar_options.align,
          params.toolbar_options.background,
          params.toolbar_options.color,
          params.toolbar_options.list,
          params.toolbar_options.script,
          params.toolbar_options.direction,
          params.toolbar_options.indent,
          params.toolbar_options.size,
        ]

        var editorWidget = new Quill(el, {
          modules: {
            toolbar: toolbarOptions
          },
          placeholder: params.placeholder,
          theme: params.theme
        });

        editorWidget.on('text-change', function() {
          var contentJSON = JSON.stringify(editorWidget.getContents());
          var contentText = editorWidget.getText();
          var contentHTML = editorWidget.root.innerHTML;

          Shiny.onInputChange(`${el.id}_content`, [contentJSON, contentText, contentHTML]);
        })
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
