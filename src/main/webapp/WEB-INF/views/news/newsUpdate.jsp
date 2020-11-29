<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <c:import url="../template/bootstrap.jsp"></c:import>
  <link href ="../resources/css/common/default.css" rel="stylesheet">
  <script src="../resources/js/header.js"></script>
  <!-- include summernote css/js -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
 
 <style type="text/css">
	#files{
		margin-top: 5px;
	}
	
	.files{
		padding: 10px 0;
	}
	
	.write_control{
		width: 100px;
		height: 50px;
		background-color: #222222;
		color: white;
		text-align: center;
		line-height: 50px;
		font-size: 18px;
		margin-right: 5px;
	}
</style>
  
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
 		<h2 style="text-align: center;">${news} 글 수정</h2>
  		<form id="frm" action="./${news}Update" method="post" enctype="multipart/form-data">
  			 <input type="hidden" name="board_num" value="${dto.board_num}">
		    <div class="form-group">
		      <label for="title">Title</label>
		      <input type="text" class="form-control empty" value="${dto.board_title}" id="title" name="board_title" title="제목">
		    </div>
	    
		    <div class="form-group">
		      <label for="writer">Writer</label>
		      <input type="text" class="form-control" value="${dto.board_writer}" id="writer" name="board_writer" readonly="readonly">
		    </div> 
		    
		     <div class="form-group">
		      <label for="contents">Contents</label>
		      <textarea class="form-control empty" rows="20" cols="30" id="contents" name="board_contents" title="내용">${dto.board_contents}</textarea>
		    </div>
		    
			<div id="files" class="col-sm-6" style="border: 1px solid #ddd">
				 <input class="files" type="file" class="form-control" name="files">
				 <input class="files" type="file" class="form-control" name="files">
				 <input class="files" type="file" class="form-control" name="files">
			</div>  
			
			<div>
			
			<div id="news_update_btn" style="float: right;">
			 	 <input type="button" class="write_control" value="글수정">
			</div>
			
			<div  class="write_control" style="float: right;">
				<a href="./${news}List" style="color:white;">목록</a>
			</div>
			</div>
  		</form>
  		
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>

	<script>
	var count=0;

	<!--서머 노트-->
	 $('#contents').summernote({
		 height:500,
		 callbacks:{
			 onImageUpload:function(files, editor, welEditable){
				 var formData = new FormData();	    
				 formData.append('file', files[0]); 
				 
				 $.ajax({
				    data: formData,
				    type: "POST",
				    url: 'summernote',
				    cache: false,
				    contentType: false,
				    enctype: 'multipart/form-data',
				    processData: false,
					 success:function(data){
						 data = data.trim();
						 $("#contents").summernote('editor.insertImage', data);
					 }
				 })
			 },
			 
			 onMediaDelete:function(files){
				var fileName = $(files[0]).attr("src");
				fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
				
				$.ajax({
					type:"POST",
					url : "./summernoteDelete",
					data: {
						file:fileName
					},
					success:function(data){
						alert(data);
					}
				
				}); 
			 }
		 }
		
	 });
	 
	 <!--빈칸 검사-->
	 var emptyCheckResult = true;
		$("#news_update_btn").click(function(){
			emptyCheck();
			if(emptyCheckResult){
				$("#frm").submit();
			}
		});
	
	function emptyCheck(){
		emptyCheckResult=true;
		$(".empty").each(function(){
			var data = $(this).val();
			if(data==''){
				emptyCheckResult=false;
				var title = $(this).attr("title");
				alert(title+"을 입력하세요");
			}
		});
	}
		
	</script>


</body>
</html>