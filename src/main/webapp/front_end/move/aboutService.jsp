<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ page
import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>委域</title>
<link rel="icon" type="image/x-icon" href="asset/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css"
	rel="stylesheet" />
</head>

<body>
	<!-- Navigation-->
	<!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

	<!-- Page Header-->
	<header class="masthead"
		style="background-image: url('<%=request.getContextPath()%>/asset/img/move01.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1>關於我們</h1>
						<span class="subheading">委 域 搬 家</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- 主體畫面設計  -->
	<main class="mb-4">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<a href='aboutUs.jsp'><b>經營理念</b></a><br> <a href='aboutService.jsp'><b>服務說明</b></a>
					<p>
					<h3>家庭搬家:</h3>

					各式家具，大型衣櫃、冰箱、沙發、床組、書櫃、DIY設備、衣物、碗盤等。日興全省搬家具備完整的搬家經驗，讓您不再為搬家而煩惱。
					搬家車輛提供（自助搬家） 提供車輛及司機乙名協助您，讓您省下搬家師傅的花費。 精緻包裝服務

					若您府上有高級的家具，或是您不想花太多時間及氣力為自己整理搬家的家當，本公司可提供專業的包裝服務。 急件搬家（立即服務）

					本公司備有大小貨車、吊車及領有專門執照司機. 為因應不同消費者需求, 自即日起新增急件搬家項目, 提供隨叫隨搬服務
					如有此項需求的消費者, 請來電0987-887-788, 立即為您服務 急件搬家: 租約中止之家庭搬家. 汽車載運.
					進出口貨物趕件報關等 公司機關行號搬遷

					本搬家公司擁有多年的公司搬遷/工廠搬遷/辦公室搬遷經驗，包括電子產業、高科技產業及傳統產業的服務經驗。從評估、歸劃、說明、耗材提供到搬遷完成，絕對能讓您安心的將公司搬遷的工程交付給本公司服務。
					精密設備遷移 鋼琴、樂器、重型的機具、精密的儀器設備，無論包裝、搬運或吊車起重，本公司都能完成任務。 廢棄物處理

					廢棄傢俱、老舊設備、廢棄物品。本公司均可提供清運處理服務。 人工搬運服務

					如果您只是樓層移動，或是同一社區搬遷，本公司提供您計時收費的搬家技工為您做搬家服務。
					冷氣拆裝不論視窗型還是分離式冷氣~日興全省搬家都免費幫您拆~但是安裝就必須花錢請冷氣行幫您。<p><br>

					<p><h3>計費方案:</h3>
					日興全省搬家公司秉持公平交易原則，搬家價格與搬家費用透明合理，不亂收費。本公司提供下列三種搬家計費方案，由資深專業組長到府估價，替客戶量身規劃選擇最經濟節省的計費方式，亦可由客戶自由選擇<p><br>
					<p><h3>方案一：「以車計價」</h3>
					搬家費用：依消費者運送距離、搬運樓層、有無電梯、步行距離、特殊地形、超重物品等
					計價因素後，評估每車次單價，一輛車一趟計為一車次，一輛車出二趟或二輛車各出一趟均為二車次，依此類推，不同噸數大小的車輛單價不同(吊車另計)。而(出車次數)×(每車次單價)
					＝ 本次搬家總費用。
					範例：由本搬家公司資深專業組長至顧客陳先生家中估價，以3.49噸貨車(俗稱3噸半)一車次3,000元報價，經顧客陳先生同意後搬運，若搬家當日以
					2 車次完成搬運。則陳先生需搬家公司6,000元之搬家費用。<p><br>
					<p><h3>方案二：「包價制」</h3>
					搬家費用：經本搬家公司資深專業組長整體評估後報價，以總費用承包所有搬運服務。
					範例：資深專業組長至顧客陳先生家中估價，估計將陳先生家所有傢俱物品搬運至
					新居需要6,000元，經陳先生同意，則於搬運完畢後陳先生需支付搬家公司6,000元之搬家費用。<p><br>
					<p><h3>方案三：「精緻搬家」</h3>
					搬家費用：從物品打包、傢俱拆卸、精緻包裝、運送、搬運、定位、傢俱組裝所有搬運動作均由本公司專業搬家師傅代勞，讓您省掉所有麻煩事。
					惟此種搬家費用的報價除考量以車計價的估價因素外，尚會參考物品多寡、物品價值、物品大小等，因此搬家價格會較以車計價、包價制略高。
					<p>
				</div>
			</div>
		</div>
	</main>
	<!-- Footer-->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>