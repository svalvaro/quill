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


          /*
          [{ 'color': [] }, { 'background': [] }],
          [{ 'header': 1 }, { 'header': 2 }],               // custom button values
          [{ 'list': 'ordered'}, { 'list': 'bullet' }, { 'list': 'check' }],
          [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
          [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
          [{ 'direction': 'rtl' }],                         // text direction

          [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
          [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

          [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
          c
          [{ 'align': [] }],

*/
          //['clean']//
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

          Shiny.onInputChange(el.id, [contentJSON, contentText, contentHTML]);
        })
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
