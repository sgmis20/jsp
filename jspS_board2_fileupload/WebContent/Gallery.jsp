<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  include file="../inc/header.jsp"%>


<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<script>
/* /* /* /* /*  */ */ */ */ */
.content {
 width: 67%;
 float: left;
}
.sidebar {
 width: 33%;
 float: right;
}
.feature {
 width: 25%;
 float: left;
}
.wrap:after, .features:after {
 content: " "; 
 display: block; 
 clear: both;
}  
.wrap, .features {
 display: flex;
}
.content {
 flex: 2;
}
.sidebar {
 flex: 1;
}
.wrap {
 display: grid;
 grid-template-columns: 67% 33%;
}
.features {
 display: grid;
 grid-template-columns: repeat(auto-fit, 25%);
}
</script>
<div class="container">
	<!-- <div class="panel">
	   <div  class="panel-heading"> <span class="glyphicon glyphicon-plus">FILE</span></div>
	   <div  class="panel-body"><a href="/upload/animal3.JPG"><img src="/upload/animal3.JPG" width="300"/><img src="/upload/DWDT0361.png" width="300"/></a></div>
	   <div  class="panel-body"><a href="/upload/DWDT0361.png"></a></div>
	</div> -->
	<div class="wrap">
		<main class="content">
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Qua ex
			cognitione facilior facta est investigatio rerum occultissimarum. Hoc
			dixerit potius Ennius: Nimium boni est, cui nihil est mali. Hoc loco
			tenere se Triarius non potuit. Diodorus, eius auditor, adiungit ad
			honestatem vacuitatem doloris. Itaque haec cum illis est dissensio,
			cum Peripateticis nulla sane. Contineo me ab exemplis. Sed ne, dum
			huic obsequor, vobis molestus sim. Multoque hoc melius nos veriusque
			quam Stoici.</p>
		<section class="features">
			<a class="feature" href="#"><img src="/upload/animal3.JPG"
				width="100"></a> <a class="feature" href="#"><img
				src="/upload/DWDT0361.png" width="100"></a>
		</section>
		</main>
		<aside class="sidebar"></aside>
	</div>
	<!--.wrap -->





</div>

<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<%@  include file="../inc/footer.jsp"%>