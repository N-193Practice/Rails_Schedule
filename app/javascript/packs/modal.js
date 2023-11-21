// jQueryを明示的に読み込む
const jQuery = require('jquery');

// 削除リンクをクリックした際にモーダル表示する
jQuery(function() {
  // 削除リンクのクリックイベントを設定
  $('.delete-link').on('click', function(e) {
    e.preventDefault();
    this.blur(); // Manually remove focus from clicked link.
    $.get(this.href, function(html) {
      $(html).appendTo('body').modal();
    });
  });
});