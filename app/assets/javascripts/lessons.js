$(function(){
  $('#froala-editor').froalaEditor({
    heightMin: 600,
    imageInsertButtons: ['imageBack', '|', 'imageByURL'],
    toolbarButtons: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', '|', 'color', 'emoticons', 'inlineStyle', 'paragraphStyle', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', '-', 'insertLink', 'insertImage', 'insertVideo', 'insertTable', '|', 'quote', 'insertHR', 'undo', 'redo', 'clearFormatting', 'selectAll', 'html']
  });
  $('#submit_lesson').on('click', function(){
      $('#lesson_content').val($('#froala-editor').froalaEditor('html.get'));
  });
});