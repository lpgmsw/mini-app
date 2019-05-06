$(function(){
  $('.delete_btn').on('click', function(e){
    var confirm = window.confirm('削除しますか？');
    if(confirm == true) {
      var blog_element = $(this).parents('.card');
      var blog_id = blog_element.data('blog-id');
      var url = 'blogs/' + blog_id;
      $.ajax({
        url: url,
        type: 'POST',
        data: {'id': blog_id, '_method': 'DLETE'},
        dataType: 'json'
      })
      .done(function(data) {
        blog_element.remove();
      })
      .fail(function(data) {
        alert('blog destroy error!');
      })
    }
  });
});
