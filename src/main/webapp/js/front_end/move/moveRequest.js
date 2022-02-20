// -----------預設值設定-----------
// 取得今日日期
var today = new Date();
var dueDay = new Date();
dueDay.setDate(today.getDate() + 90);
var ymdToday = parseDateString(today);
var ymdDueDay = parseDateString(dueDay);

// 設值
document.getElementById("moveDate").setAttribute("min", ymdToday);
document.getElementById("evaDate").setAttribute("min", ymdToday);
document.getElementById("moveDate").setAttribute("max", ymdDueDay);
document.getElementById("evaDate").setAttribute("max", ymdDueDay);

function parseDateString(date) {
	var dd = date.getDate();
	var mm = date.getMonth() + 1;
	var yyyy = date.getFullYear();
	
	if (dd < 10) {
	   dd = '0' + dd;
	}
	if (mm < 10) {
	   mm = '0' + mm;
	} 
	var ymd = yyyy + '-' + mm + '-' + dd;
	return ymd;
}


if ($('#online').attr("checked")) {
	$('#siteEvaDiv').hide();
	$('#onlineEvaDiv').show();
} else {
	$('#onlineEvaDiv').hide();
	$('#siteEvaDiv').show();
}

// -----------監聽器設定-----------
$('#online').change(function() {
	$('#siteEvaDiv').hide();
	$('#onlineEvaDiv').show();
});
$('#site').change(function() {
	$('#siteEvaDiv').show();
	$('#onlineEvaDiv').hide();
});
$('#itemPhoto').change(function() {
	const itemPhoto = this;
	const updatePhotosDiv = document.getElementById("updatePhotosDiv");
	updatePhotosDiv.innerHTML = '';
	
	console.log(itemPhoto.files.length);
	if (itemPhoto.files.length > 3) {
		itemPhoto.value = '';
		alert("圖片上傳數量最多3張");
		return;
	}
	
	var overSize = false;
	var MB =  1024 * 1024;
	var MAX_SIZE = 3;
	var singleFileMaxSize = MAX_SIZE * MB;
	Array.prototype.forEach.call(itemPhoto.files, file => {
		if (file.size > singleFileMaxSize) {
			overSize = true;
		}
	});
	if (overSize) {
		itemPhoto.value = '';
		alert("單一檔案大小不得超過 " + MAX_SIZE + "MB");
		return;
	}
	
	Array.prototype.forEach.call(itemPhoto.files, file => {
		const img = document.createElement('img');
		const url = URL.createObjectURL(file);
		img.setAttribute('class', "itemPhoto");
		img.setAttribute('alt', "photo");
		img.setAttribute('src', url);
		img.setAttribute('style', 'max-width:25%;border: solid black 2px;');

		updatePhotosDiv.appendChild(img);
	});
});
