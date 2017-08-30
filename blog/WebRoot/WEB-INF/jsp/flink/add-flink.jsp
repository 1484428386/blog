<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <div class="row">
        <form action="/flink/addflink.html" method="post" class="add-flink-form" onsubmit="return addFlink();" draggable="false">
          <div class="col-md-9">
           
            <h1 class="page-header">增加友情链接
            
            </h1>
            <ul id="add_flink">
            
            </ul>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>名称</span></h2>
              <div class="add-article-box-content">
                <input type="text" id="add-name" name="name" class="form-control" placeholder="在此处输入名称" >
                <span class="prompt-text">例如：异清轩技术博客</span> </div>
            </div>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>WEB地址</span></h2>
              <div class="add-article-box-content">
                <input type="text" id="add-url" name="url" class="form-control" placeholder="在此处输入URL地址" >
                <span class="prompt-text">例子：<code>http://www.ylsat.com/</code>——不要忘了<code>http://</code></span> </div>
            </div>
            
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>描述</span></h2>
              <div class="add-article-box-content">
                <textarea  id = "add_describe"class="form-control" name="describe"></textarea>
                <span class="prompt-text">描述是可选的手工创建的内容总结</span> </div>
            </div>
          </div>
          <div class="col-md-3">
            <h1 class="page-header">操作</h1>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>保存</span></h2>
              <div class="add-article-box-content">
                <p>
                  <label>状态：</label>
                  <span class="article-status-display">未增加</span></p>
               
                  <label>增加于：</label>
                  <span class="article-time-display">
                  <input style="border: none;" type="datetime" name="time" value="" />
                  </span>
                  
              </div>
              <div class="add-article-box-footer">
                <button class="btn btn-primary" type="submit" name="submit">增加</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
<!-- 引入底部 -->
<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
<script src="/statics/js/bootstrap.min.js"></script> 
<script src="/statics/js/admin-scripts.js"></script>
<script src="/statics/localjs/flink.js"></script>
</body>
</html>