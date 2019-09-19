<form class="form-horizontal ff-search" data-sid="{$site_sid}" data-limit="{:C('ui_search_limit')}" role="search" action="{$root}index.php?s=news-search" method="post">
  <div class="input-group">
    <input type="text" class="form-control ff-wd" name="wd" placeholder="Search News">
    <div class="input-group-btn">
      <button type="submit" class="btn btn-default" data-action="{:ff_url('news/search',array('wd'=>'FFWD'), true)}">
        <span class="glyphicon glyphicon-search"></span>
      </button>
    </div>
  </div>
</form>