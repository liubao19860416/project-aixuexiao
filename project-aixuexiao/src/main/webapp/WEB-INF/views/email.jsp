<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html">
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="wedding/text.css" />
<link rel="stylesheet" href="wedding/960.css" />
<%@include file="/WEB-INF/views/common/js.jsp" %>
<title>Wedding.jsp</title>
</head>
		<script type="text/javascript">
		$(function() {
			$('.buttonsubmit').on('click', function() {
				if($.trim($("#userName").val())==''){
					alert('请输入您的名字！');
					return false;
				}else if($.trim($("#telephone").val())==''){
					alert('请输入您的手机号码！');
					return false;
				}else if(isNaN($('#telephone').val())){
					alert('请输入正确的手机号码！');
					return false;
				}else if($.trim($("#message").val())==''){
					alert('请输入您的留言信息！');
					return false;
				}else{
					$("#submitForm").submit();
				}
			});
		});
		</script>
		
		
<body>

	<div class="top"></div>
	<div class="grey">
		<div class="container_12">
			<div class="space"></div>
			<div class="grid_12 img">
				<img src="wedding/img/logo.png" alt="img" />
			</div>
			<div class="grid_12">
				<p class="text">Hoping For Your Comming!!!</p>
			</div>
			<div class="grid_12 img">
				<img src="wedding/img/07.png" alt="img" />
			</div>
			<div class="grid_12 img">
				<img src="wedding/img/06.png" alt="img" />
			</div>
			<div class="grid_12 img">
				<img src="wedding/img/07.png" alt="img" />
			</div>
			<div class="clear"></div>
			<div class="grid_5 prefix_1">
				<p class="text4" style="color:red;ont-weight: bold;font-size:x-large;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					谨定于 :<u>二 零 一 五 年 公历 十 月 四 日 星期日(农历八 月 廿 二 日)</u>,【刘保、王丽】举行婚礼,敬备薄酒,恭候各位亲朋好友光临!
					<br/>地址：XX路XX号XX楼XX厅;
					<div align="right" style="margin-right:50px;font-weight: bold;font-size: large;color: olive;">
						敬约恕邀!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<br/>FROM <u>刘保(Groom)、王丽(Bride)</u>
					</div>&nbsp;
				</p>
			</div>
		</div>
	</div>
	<div class="grey1"></div>
	<div class="grey2">
		<div class="container_12">
			<div class="grid_12 space1"></div>

			<div class="grid_12 img">
				<img src="wedding/img/09.png" alt="img" />
			</div>

			<div class="grid_8 suffix_2 prefix_2">
				<p class="text4">Give Me An Email As Follows:</p>
			</div>
			<div class="grid_12 top2"></div>
			<form method="post" id="submitForm" action="emailSender/0" accept-charset="utf-8" >
				<div class="grid_2 prefix_2">
					<p class="text4">Name:</p>
				</div>
				<div class="grid_6 suffix_2">
					<input name="userName" id="userName" type="text" class="colortext" />
				</div>
				<div class="clear"></div>
				<div class="grid_2 prefix_2">
					<p class="text4">Telephone:</p>
				</div>
				<div class="grid_6 suffix_2">
					<input name="telephone" id="telephone" type="text" class="colortext" />
				</div>
				<div class="clear"></div>
				<div class="grid_10 prefix_2">
					<p class="text4">Your Message:</p>
				</div>
				<div class="grid_8 prefix_2 suffix_2">
					<input name="message" id="message" type="text" class="colortext1" />
				</div>
				<div class="grid_12 space2"></div>
				<div class="grid_10">
					<input type="image" class="buttonsubmit" src="wedding/img/10-4.png" alt="ОК" />
				</div>
			</form>
			<div class="grid_2"></div>
			<div class="grid_12 space3"></div>
			<div class="grid_5 prefix_1">
				<div class="text4">
					© Invitation From <a href="javascript:void(0)" target="_blank"
						title="刘保">【刘保】</a>
				</div>
			</div>
			<div class="grid_5 suffix_1"></div>
		</div>
	</div>
	<div class="foot" align="center" style="color: red;font: italic;font-size: large;background-color: gray;"></div>
	
	<hr/>
	<div class="grey2">
	<table border="1" align="center"  style="color: red;font: italic;font-size: x-large;border-color: blue;width: 90%;">
		<tr>
			<th colspan="5">邮件回复信息列表</th>
		</tr>
		<tr>
			<td>编号</td>
			<td>姓名</td>
			<td>电话</td>
			<td>备注信息</td>
			<td>发送时间</td>
		</tr>
		<c:forEach items="${resultList}"  var="eMailSender"  >
			<tr>
				<td>${eMailSender.id}</td>
				<td>${eMailSender.userName}</td>
				<td>${eMailSender.telephone}</td>
				<td>${eMailSender.message}</td>
				<td>${eMailSender.inserttime}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	
</body>
</html>