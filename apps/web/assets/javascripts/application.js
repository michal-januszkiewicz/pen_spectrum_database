$(function() {
  $(".btn-danger").on("click", function(event, options) {
    options = options || {};
    console.log(options)
    if ( !options.delete ) {
      event.preventDefault();
      bootbox.confirm({
        message: "Are you sure?",
        buttons: {
            confirm: {
                label: 'Yes',
                className: 'btn-success'
            },
            cancel: {
                label: 'No',
                className: 'btn-danger'
            }
        },
        callback: function(result) {
          if(result) {
            console.log(event);
            $(event.currentTarget).trigger("click", {"delete": true });
          }
        }
      });
    }
    else {
      // Default behaviour.
    }
  });
});
