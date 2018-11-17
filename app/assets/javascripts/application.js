// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//ツイッターのタブ変更(channel_twitter)
$(document).on('turbolinks:load', function(){

  var twitter = ".channel_tweets"

  $(twitter + ' .j_content').hide();
  $(twitter + ' .0').show();

  $(twitter + ' .j_tab').click(function(){
    //idを取得
    var tag =  $(this).attr("value");

    //一旦全部消す
    $(twitter + ' .j_content').hide();

    //クリックしたidと同じタイムラインを表示
    $(twitter + " .j_content[value='" + tag + "']" ).show();
  });

});

//ツイッターのタブ変更(channel_hashtag)
$(document).on('turbolinks:load', function(){

  var twitter = ".channel_hashtags"

  $(twitter + ' .j_content').hide();
  $(twitter + ' .0').show();

  $(twitter + ' .j_tab').click(function(){
    //idを取得
    var tag =  $(this).attr("value");

    //一旦全部消す
    $(twitter + ' .j_content').hide();

    //クリックしたidと同じタイムラインを表示
    $(twitter + " .j_content[value='" + tag + "']" ).show();
  });

});

//ツイッターの画像表示divのアス比を固定する。
// $(window).resize(function () {
//     wsize = $(".tweet_item_list").width();
//     $(".tweet_item").css("height", wsize*0.75 + "px");
// });

//検索でサジェスト一覧を表示する。
$(document).on('turbolinks:load', function(){
  $(document).on('keyup','#channel_search_form', function(e){
    e.preventDefault();
    var input = $.trim($(this).val());
    $.ajax({
      url: '/searches/channels',
      type: 'GET',
      data: ('keyword=' + input),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data){
      if(input !== ""){
        if(!$.isEmptyObject(data)){
          $('#result').removeClass('invisible');
          $('#result').find('.result_li').remove();
          $(data).each(function(i, channel){
            $('#result').append('<div class="result_li flex"><a href="/channels/' + channel.channelId + '">' + channel.name + '</a></div>');
          });
        }
      } else {
        $('#result').addClass('invisible');
      }
    });
  });
});

//フォーカスが外れると見えなくなる
$(document).on('turbolinks:load', function(){
  $(document).on('click touchend', function(e){
    if(!$(e.target).closest('.focus_inv').length){
      $('.focus_inv').addClass('invisible');
    }
  });
});
