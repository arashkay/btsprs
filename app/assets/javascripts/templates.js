$(function(){

site.templates = {
  init: function(){
    var editor = new wysihtml5.Editor("editor", {
      toolbar:      "editor-toolbar",
      stylesheets: ["/assets/bootstrap.min.css", '/assets/editor.css', '/assets/bootstrap-rtl.min.css'],
      parserRules: wysihtml5ParserRules
    });
  }
}

site.templates.init();  

});

