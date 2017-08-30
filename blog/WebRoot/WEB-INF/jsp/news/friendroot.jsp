<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
        <a style="float: right;" class="delnews">删除</a>
        <div class="table-responsive"> 
          <table class="  table-hover" id="findUserId">
             <c:if test="${newsList!=null}">
                 <c:forEach items="${newsList}" var="news">
                     <c:if test="${news.rocord==0}">
                        <c:if test="${news.userId==sUserId}">
                           <tr>
                              <td>
                               <input  type="checkbox" value="${news.id}" name="checkox">
                              </td>
                              <td style="color: red;">${news.userName}:</td>
                              <td style="color: purple;">${news.newsText}</td>
                           </tr>
                        </c:if>
                       </c:if>
                       <c:if test="${news.rocord==0}">
                         <c:if test="${news.userId!=sUserId}">
                         <tr>
                            <td>
                               <input class="frinedid" type="checkbox" value="${news.id}" name="checkox">
                            </td>
                             <td style="color: red;">${news.userName}:</td>
                            <td style="color:blue; ">${news.newsText}</td>
                         </tr>
                         </c:if>
                       </c:if>
                    
                     <c:if test="${news.rocord!=0}">
                         <c:if test="${news.rocord==sUserId }">
                         <c:if test="${news.userId==sUserId}">
                             <tr>
                            <td>
                               <input class="frinedid" type="checkbox" value="${news.id}" name="checkox">
                            </td>
                             <td style="color: red;">${news.userName}:</td>
                            <td style="color:purple;">${news.newsText}</td>
                         </tr>
                           
                         </c:if>
                         </c:if>
                     </c:if>
                     <c:if test="${news.rocord!=0}">
                         <c:if test="${news.rocord==sUserId }">
                         <c:if test="${news.userId!=sUserId}">
                             <tr>
                            <td>
                               <input class="frinedid" type="checkbox" value="${news.id}" name="checkox">
                            </td>
                             <td style="color: red;">${news.userName}:</td>
                            <td style="color:blue;">${news.newsText}</td>
                         </tr>
                           
                         </c:if>
                         </c:if>
                     </c:if>
                 </c:forEach>
             </c:if>
             
          
          </table>
          <table>
            <tr>
             <td>
	             <div class="input-group" >
	                  <input id="createId" value="${createId}" type="hidden">
	                 <input id="newsText" type="text"   class="form-control"  placeholder="输入发送内容" >
	                 <span class="input-group-btn">
	                 <input id="addnews" class="btn btn-default friendUser" type="button" value="发送">
	                </span> 
	            </div>
             </td>
             <td></td>
            </tr>       
          </table>
       
        </div>
    </div>
   



<!--用户信息模态框-->

<!-- 引入底部 -->
<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
<script src="/statics/js/bootstrap.min.js"></script> 
<script src="/statics/js/admin-scripts.js"></script> 
 <script src="/statics/localjs/news.js"></script> 
</body>
</html>
