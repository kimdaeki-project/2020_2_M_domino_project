
	var viewAllBranch = document.getElementById("view-all-branch")
	var btn = document.getElementById("viewAll");
	
	$("#viewAll").click(function(){
	
		viewAllBranch.style.display = "block";
		
		var mapContainer = document.getElementById("all-map"), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.564713, 126.993173), // 지도의 중심좌표
		    	level: 3 // 지도의 확대 레벨
			};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
		    {
		        title: '개포점', 
		        latlng: new kakao.maps.LatLng(37.475518, 127.047214)
		    },
		    {
		        title: '논현점', 
		        latlng: new kakao.maps.LatLng(37.510734, 127.023298)
		    },
		    {
		        title: '미아점', 
		        latlng: new kakao.maps.LatLng(37.617072, 127.022029)
		    },
		    {
		        title: '번동점',
		        latlng: new kakao.maps.LatLng(37.635334, 127.030114)
		    },
		    {
		        title: '명동점',
		        latlng: new kakao.maps.LatLng(37.564713, 126.993173)
		    },
		    {
		        title: '사당점',
		        latlng: new kakao.maps.LatLng(37.483839, 126.976931)
		    },
		    {
		        title: '서방배점',
		        latlng: new kakao.maps.LatLng(37.477243, 126.987488)
		    } ,
		    {
		        title: '이문점',
		        latlng: new kakao.maps.LatLng(37.596323, 127.060903)
		    },
		    {
		        title: '망원점',
		        latlng: new kakao.maps.LatLng(37.554549, 126.912031)
		    },
		    {
		        title: '이촌점',
		        latlng: new kakao.maps.LatLng(37.523978, 126.968742)
		    },
		    {
		        title: '은평점',
		        latlng: new kakao.maps.LatLng(37.602266, 126.915558)
		    },
		    {
		        title: '계양점',
		        latlng: new kakao.maps.LatLng(37.535761, 126.727786)
		    },
		    {
		        title: '고양점',
		        latlng: new kakao.maps.LatLng(37.706529, 126.902918)
		    },
		    {
		        title: '임학점',
		        latlng: new kakao.maps.LatLng(37.544718, 126.737872)
		    },
		    {
		        title: '대화점',
		        latlng: new kakao.maps.LatLng(37.669116, 126.733212)
		    },
		    {
		        title: '마두백석점',
		        latlng: new kakao.maps.LatLng(37.653908, 126.78429)
		    },
		    {
		        title: '원당점',
		        latlng: new kakao.maps.LatLng(37.654689, 126.836985)
		    },
		    {
		        title: '과천점',
		        latlng: new kakao.maps.LatLng(37.428979, 126.990522)
		    },
		    {
		        title: '광명일직점',
		        latlng: new kakao.maps.LatLng(37.42234, 126.885048)
		    },
		    {
		        title: '광명점',
		        latlng: new kakao.maps.LatLng(37.466753, 126.875732)
		    },
		    {
		        title: '철산점',
		        latlng: new kakao.maps.LatLng(37.479527, 126.864083)
		    },
		    {
		        title: '수내정자점',
		        latlng: new kakao.maps.LatLng(37.37063, 127.114767)
		    }
			
		];
		
		var imageSrc = '/t1/resources/images/branch/ico_spot.png' // 마커이미지의 주소입니다    
	    
		for (var i = 0; i < positions.length; i ++) {
			
		    var imageSize = new kakao.maps.Size(40, 52), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(0, 0)}
		    
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
	
				// 마커가 지도 위에 표시되도록 설정합니다
				map: map,
				
				position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		         
			    image: markerImage // 마커이미지 설정 
			})
		}
	}) 
	
	window.onclick = function(event) {
	  if (event.target == viewAllBranch) {
	    viewAllBranch.style.display = "none";
	  }
	}
