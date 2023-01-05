<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Read
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        			 <div class="form-group">
                                            <label>Bno</label>
                                            <input class="form-control" name="title" readonly="readonly" value="<c:out value="${board.bno}"/>">
                                      </div>
                                      
                        
    				      		      <div class="form-group">
                                            <label>Title</label>
                                            <input class="form-control" name="title" readonly="readonly" value="<c:out value="${board.title}"/>">
                                      </div>
                                      
                                      <div class="form-group">
                                            <label>Content</label>
                                            <textarea rows="5" cols="50" name="content" class="form-control"><c:out value="${board.content}"/></textarea>
                                      </div>
                                      
                                      <div class="form-group">
                                            <label>Writer</label>
                                            <input class="form-control" name="writer" value="<c:out value="${board.writer}"/>">
                                      </div>
                                      
                                      <form id='actionForm' action="/board/list" method='get'>
									  	<input type='hidden' name='pageNum' value = '${cri.pageNum}'>
									  	<input type='hidden' name='amount' value = '${cri.amount}'>
									  	<input type='hidden' name='bno' value = '${board.bno}'>
									  	<input type='hidden' name='type' value = '${cri.type}'>
									  	<input type='hidden' name='keyword' value = '${cri.keyword}'>
									  </form>
                                      
                                       <button type="button" class="btn btn-default listBtn"><a href="/board/list">List</a></button>
                                        <button type="button" class="btn btn-default modBtn"><a href="/board/modify?bno=<c:out value="${board.bno}"/>">Modify</a></button>
    				      	</div>
					      <!--  end panel-body -->
					
					    </div>
					    <!--  end panel-body -->
					  </div>
					  <!-- end panel -->
					</div>
					<!-- /.row -->
 			
 			
 <!-- reply window -->					
 	<div class='row'>
			
		<div class="col-lg-12">
			
			    <!-- /.panel -->
			  <div class="panel panel-default">

			      <div class="panel-heading">
			        <i class="fa fa-comments fa-fw"></i> Reply
			        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
			      </div>      
			      
			      
			      <!-- /.panel-heading -->
			     <div class="panel-body">        
			      
			        <ul class="chat">
			        
			        </ul>
			        <!-- ./ end ul -->
			     </div>
			      <!-- /.panel .chat-panel -->
			
				<div class="panel-footer"></div>
			
			
			</div>
		</div>
			  <!-- ./ end row -->
	</div>

<!-- NEW Reply button operation -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
				</div>
				
				<div class="modal-body">
					<div class="form-group">
						<label>Reply</label>
						<input class="form-control" name="reply" value="New Reply!!">
					</div>
					
					<div class="form-group">
						<label>Replyer</label>
						<input class="form-control" name="replyer" value="replyer">
					</div>
					
					<div class="form-group">
						<label>Reply Date</label>
						<input class="form-control" name="replyDate" value="">
					</div>
				</div>

				<div class="modal-footer">
			        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
			        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
			        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
			        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
				</div>
			</div>
		</div>
	</div>

     			<script type="text/javascript" src="/resources/js/reply.js"></script>
     			
     			
     			
     			<script type="text/javascript">
					
     				$(document).ready(function(){
     					
     					var bnoValue = '<c:out value="${board.bno}"/>';
     					var replyUL =$(".chat");
     					
     					showList(1);
     					
     					function showList(page){
     						
     						replyService.getList({bno:bnoValue,page: page || 1},function(list){//param , callback
     							
     							var str = "";
     							if(list == null || list.length == 0){
     								
     								replyUL.html("");
     								return;
     								
     							}
     							for (var i = 0, len = list.length || 0; i <  len;  i++) {
									str = str + "<li class='left clearfix' data-rno='"+ list[i].rno +"'>";
									str = str + "<div><div class='header'><strong class='primary font'>"+ list[i].replyer + "</strong>";
									str = str + "<small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
									str = str + "<p>"+ list[i].reply + "</p></div></li>";
									
								}
     							
     							replyUL.html(str);
     							
     						});
     						
     					}
     					
     				});
     			
     				
     			    var modal = $(".modal");
     			    var modalInputReply = modal.find("input[name='reply']");
     			    var modalInputReplyer = modal.find("input[name='replyer']");
     			    var modalInputReplyDate = modal.find("input[name='replyDate']");
     			    
     			    var modalModBtn = $("#modalModBtn");
     			    var modalRemoveBtn = $("#modalRemoveBtn");
     			    var modalRegisterBtn = $("#modalRegisterBtn");
     			    
     			    $("#modalCloseBtn").on("click", function(e){
     			    	
     			    	modal.modal('hide');
     			    });
     			    
     			    $("#addReplyBtn").on("click", function(e){
     			      
     			      modal.find("input").val("");
     			      modalInputReplyDate.closest("div").hide();
     			      modal.find("button[id !='modalCloseBtn']").hide();
     			      
     			      modalRegisterBtn.show();
     			      
     			      $(".modal").modal("show");
     			      
     			    });
     			</script>
     			
     			
     			
     			
     			
     			
     			<script type="text/javascript">
     			
     			var actionForm = $("#actionForm")
     			
     			$(".listBtn").click(function(e){
     				e.preventDefault();
     				actionForm.find("input[name='bno']").remove();
     				actionForm.submit();
     			})
     			
     			
     			$(".modBtn").click(function(e){
     				e.preventDefault();
     				actionForm.attr("action","/board/modify");
     				actionForm.submit();
     			})
     			
     			</script>



<%@include file="../includes/footer.jsp" %>