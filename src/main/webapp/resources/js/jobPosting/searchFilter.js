
//필터
const filters = document.querySelectorAll(".filter")
//필터박스 
const filterBox = document.querySelector(".filter-box")
//필터박스 ul
const filterBoxUl = document.querySelector(".filter-box-ul")
//필터 리스트
let filterList = []
//초기화 버튼
const resetFiltersButton = document.querySelector(".reset-filters-button")
//검색 버튼
const searchFiltersButton = document.querySelector(".search-filters-button")

//필터 박스에 추가
addToFilterBox()
function addToFilterBox() {

	for (let i = 0; i < filters.length; i++) {
		filters[i].addEventListener("click", function(event) {
			const isInList = filterList.indexOf(event.target.id);
			//중복 확인 => -1일 경우에만 추가
			if (isInList == -1) {
				filterList.push(event.target.id)
			}
			//배열에 추가됐는지 확인
			console.log(filterList)
			makeList()
		})
	}
}

// 필터리스트로 li 생성하기
function makeList() {
	filterBoxUl.innerHTML = ""; // filterBoxUl 초기화
	filterList.forEach(filter => {
		filterBoxUl.innerHTML += `<li class="filterLi">${filter}<button class="delete-button">x</button></li>`;
	})
	deleteFilter()
}

//필터 삭제
function deleteFilter() {
	const deleteButtons = document.querySelectorAll(".delete-button")
	for (let i = 0; i < deleteButtons.length; i++) {
		deleteButtons[i].addEventListener("click", function() {
			filterList.splice(i, 1)
			makeList()
		})
	}
}

//선택한 필터 초기화
resetFilter()
function resetFilter() {
	resetFiltersButton.addEventListener("click", function() {
		filterList = []
		makeList()
	})

}

searchFilter()
//AJAX 연결
function searchFilter() {
	searchFiltersButton.addEventListener("click", function() {

		//추가된 리스트가 없을 경우 작동 막음
		if (filterList.length == 0) {
			console.log("선택된 조건이 없습니다!")
			return;
		}

		$.ajax({
			url: "/searchFilter",
			type: "POST",
			data: JSON.stringify(filterList),// filterList 배열을 직접 전송
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				console.log('성공:', data);
				// 서버에서 반환된 데이터 처리
			},
			error: function(error) {
				console.error('에러 발생:', error);
			},
		});
		console.log("AJAX 요청 전송됨")
		
		filterList = [] //배열 초기화하기
        makeList() 
	})

}