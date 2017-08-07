<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>网站首页</title>
<!-- 引入Bootstrap核心样式文件 -->
<link href="/fenye/css/bootstrap.css" rel="stylesheet">
<!--JS有兼容问题-->
<script src="/fenye/js/jquery-1.11.3.min.js"></script>
<script src="/fenye/js/bootstrap.js"></script>
<style type="text/css">
div {
	/*border: 1px solid green;*/
	
}
</style>
<script type="text/javascript">
			function overFun(obj){
				$(obj).css("background","#C0C1C5");
				}

			function  outFn(obj){
				$(obj).css("background","#fff");
				}
			function clickFn(obj){
				$("#shangmian").val($(obj).html());
				$("#showDiv").css("display","none"); 
				}
			function find(obj){
				//1.获取表单的值
				var word = $(obj).val();

				var content="";
				//2.异步ajax去数据库模糊查询
				$.post(
						"/fenye/zhanneisousuo",    //请求地址
						{"word":word},  //请求传递的参数，也可以是JSON
						function(data){     //data表示传递回来的数据，只有在成功的时候才有
							if(data.length>0){
								for(var i=0;i<data.length;i++){
									 content+="<div style='padding:5px;cursor:pointer;' onclick='clickFn(this)' onmouseover='overFun(this);' onmouseout='outFn(this);'>"+data[i]+"</div>";
									}
								$("#showDiv").css("display","block"); 
								$("#showDiv").html(content);
								}
							},
							"json"         //表示返回内容的格式,json会将传回来的自动解析成json对象
				);


				}
			
		</script>

</head>

<body>
	<!--1.首页-->
	<div class="container">
		<div class="row">
			<!--xs:超小(<768)   sm:小(<992)  md:中(<1200)  lg:大(>1200)-->
			<div class="col-lg-4 col-md-4  col-sm-4 col-xs-6 ">
				<img src="/fenye/img/logo2.png" style="width: 100%;" />
			</div>
			<div class="col-lg-5 col-md-4  col-sm-4 hidden-xs">
				<img src="/fenye/img/header.png" />
			</div>
			<div class="col-lg-3 col-md-4  col-sm-12 col-md-4 col-xs-6"
				style="margin-top: 15px;">
				<c:if test="${empty user }">
					<a href="/fenye/login.html">登录</a>
					<a href="register.html">注册</a>
				</c:if>
				<c:if test="${!empty user }">
						欢迎您:<span style="color: red">&nbsp;${user.name }</span>	&nbsp;&nbsp;&nbsp;&nbsp;					
					<a href="/fenye/userfenye">订单</a>
				</c:if>
			</div>
		</div>
	</div>

	<!--2.导航，自带响应式-->
	<!--将default改为inverse可设为反色导航栏-->
	<div class="container">
		<nav class="navbar navbar-inverse">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">首页</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">手机数码 <span class="sr-only">(current)</span></a>
					</li>
					<li><a href="#">家用电器</a></li>
					<li><a href="#">鞋靴箱包</a></li>
					<li><a href="#">电脑办公</a></li>
					<li><a href="#">孕婴保健</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">所有分类 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">手机数码</a></li>
							<li><a href="#">家用电器</a></li>
							<li><a href="#">鞋靴箱包</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">电脑办公</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">孕婴保健</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group" style="position: relative;">
						<input id="shangmian" type="text" class="form-control"
							placeholder="Search" onkeyup="find(this);">
						<div id="showDiv"
							style="position: absolute; width: 170px; z-index: 3000; background-color: white; border: 1px solid; display: none;"></div>
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				<!--<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="#">Link</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li>
									<a href="#">Action</a>
								</li>
								<li>
									<a href="#">Another action</a>
								</li>
								<li>
									<a href="#">Something else here</a>
								</li>
								<li role="separator" class="divider"></li>
								<li>
									<a href="#">Separated link</a>
								</li>
							</ul>
						</li>
					</ul>-->
			</div>
			<!-- /.navbar-collapse -->
			<!-- /.container-fluid -->
		</nav>
	</div>

	<!--3.轮播图-->
	<!--自带响应式-->
	<div class="container">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="/fenye/img/1.jpg" alt="/fenye.">
					<!--<div class="carousel-caption">
							<h3>大标题</h3>
							<p>小标题</p>
						</div>-->
					<div class="carousel-caption">/fenye.</div>
				</div>
				<div class="item">
					<!--图片-->
					<img src="/fenye/img/2.jpg" alt="/fenye.">
					<!--标题-->
					<!--				<div class="carousel-caption">
							<h3>大标题</h3>
							<p>小标题</p>
						</div>-->

					<div class="carousel-caption">/fenye.</div>
				</div>
				<div class="item">
					<img src="/fenye/img/3.jpg" alt="/fenye.">
					<!--标题-->
					<!--<div class="carousel-caption">
							<h3>大标题</h3>
							<p>小标题</p>
						</div>-->
					<div class="carousel-caption">/fenye.</div>
				</div>
				/fenye.
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>


	<!--4.热门商品-->
	<div class="container">
		<!--上边图片-->
		<div class="row">
			<span id="" style="font-size: 30px;"> <!--响应式图片-->
				热门商品&nbsp;&nbsp;&nbsp;&nbsp;<img src="/fenye/img/title2.jpg" />
			</span>
		</div>
		<!--下边图片内容-->
		<div class="row">
			<div class="col-lg-2 col-md-2 hidden-sm hidden-xs">
				<img src="/fenye/img/big01.jpg" style="width: 100%;" />
			</div>
			<div class="col-lg-10 col-md-10">
				<div class="row">
					<div class="col-lg-6 col-md-6 hidden-sm hidden-xs">
						<img src="/fenye/img/middle01.jpg"
							style="width: 100%; height: 100%;" />
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 col-xs-6 col-xs-6 "
						align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 col-xs-6"
						align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 col-xs-6"
						align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 col-xs-6"
						align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6" align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6" align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6" align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6" align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6" align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--5.广告图片-->
	<div class="container">
		<div class="row">
			<img src="/fenye/img/ad.jpg" style="width: 100%;" />
		</div>
	</div>



	<!--6.最新商品-->
	<div class="container">
		<!--上边图片-->
		<div class="row">
			<span id="" style="font-size: 30px;"> <!--响应式图片-->
				最新商品&nbsp;&nbsp;&nbsp;&nbsp;<img src="/fenye/img/title2.jpg" />
			</span>
		</div>
		<!--下边图片内容-->
		<div class="row">
			<div class="col-lg-2 col-md-2 hidden-sm hidden-xs">
				<img src="/fenye/img/big01.jpg" class="img-responsive" />
			</div>
			<div class="col-lg-10 col-md-10">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-12 hidden-xs">
						<img src="/fenye/img/middle01.jpg"
							style="width: 100%; height: 100%;" />
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 col-xs-6 col-xs-6 "
						align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 col-xs-6"
						align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 col-xs-6"
						align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 col-xs-6"
						align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6" align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6" align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6" align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6" align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6" align="center">
						<a href="#"><img src="/fenye/img/small03.jpg"
							style="width: 100%;" /></a> <a href="#">炖菜锅</a>
						<p class="text-center" style="color: red;">￥399.0</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--6.广告图片-->
	<div class="container">
		<div class="row">
			<img src="/fenye/img/footer.jpg" style="width: 100%;" />
		</div>
	</div>

	<!--友情链接和版权信息-->
	<div class="container" style="margin-top: 10px;">
		<div class="row">
			<div class="" align="center">
				<ul class="list-inline">
					<li><a href="info.html">关于我们</a></li>
					<li><a>联系我们</a></li>
					<li><a>招贤纳士</a></li>
					<li><a>法律声明</a></li>
					<li><a>友情链接</a></li>
					<li><a>支付方式</a></li>
					<li><a>配送方式</a></li>
					<li><a>服务声明</a></li>
					<li><a>广告声明</a></li>
				</ul>
			</div>
			<div
				style="text-align: center; margin-top: 5px; margin-bottom: 20px;">
				Copyright &copy; 2005-2016 巴拉巴拉 版权所有</div>
		</div>
	</div>


</body>

</html>