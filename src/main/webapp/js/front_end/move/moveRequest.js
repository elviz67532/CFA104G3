const itemPhoto = document.getElementById("itemPhoto");
const updatePhotosDiv = document.getElementById("updatePhotosDiv");

itemPhoto.addEventListener('input', (e) => {
	updatePhotosDiv.innerHTML = '';
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
