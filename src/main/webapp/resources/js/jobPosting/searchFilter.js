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

const jobList = document.querySelector(".jobList")



//필터 박스에 추가
addToFilterBox()

function addToFilterBox() {
    for (let i = 0; i < filters.length; i++) {
        filters[i].addEventListener("click", function (event) {
            const isInList = filterList.indexOf(event.target.id)
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
    filterBoxUl.innerHTML = "" // filterBoxUl 초기화
    filterList.forEach((filter) => {
        filterBoxUl.innerHTML += `<li class="filterLi">${filter}<button class="delete-button">x</button></li>`
    })
    deleteFilter()
}

//필터 삭제
function deleteFilter() {
    const deleteButtons = document.querySelectorAll(".delete-button")
    for (let i = 0; i < deleteButtons.length; i++) {
        deleteButtons[i].addEventListener("click", function () {
            filterList.splice(i, 1)
            makeList()
        })
    }
}

//선택한 필터 초기화
resetFilter()

function resetFilter() {
    resetFiltersButton.addEventListener("click", function () {
        filterList = []
        makeList()
        anythingInList()
    })
}

searchFilter()

//AJAX 연결
function searchFilter() {
    searchFiltersButton.addEventListener("click", function () {
        //추가된 리스트가 없을 경우 작동 막음
        if (filterList.length == 0) {
            console.log("선택된 조건이 없습니다!")
            return
        }

        //이미 한번 백틱 쓰면 다시 안써도 됨
        $.ajax({
            url: "/searchFilter",
            type: "POST",
            data: JSON.stringify(filterList), // filterList 배열을 직접 전송
            contentType: "application/json; charset=UTF-8",
            success: function (data) {
                console.log("성공:", data, jobList)
                jobList.innerHTML = ""
                if (data.length == 0) {
                    jobList.innerHTML = "검색 결과가 없습니다."
                    return
                }
                for (let i = 0; i < data.length; i++) {
                    jobList.innerHTML += `<div class="list-group">
            <a href="#" class="list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1 postingTitle">${data[i].postingTitle}</h5>
                    <small class="text-body-secondary">
					D-${showDate(data[i].countdownDays)}
					</small>
                </div>
               
                <small class="text-body-secondary ">
					<!--경력 여부-->
					<span class="job-detail">${data[i].jobExperience}</span>
					<!--직무-->
					<span class="job-detail">${data[i].jobTitle}</span>
					<!--근무 지역-->
					<span class="job-detail">${data[i].workLocation}</span>
					<!--고용 형태-->
					<span class="job-detail">${data[i].employmentType}</span>
				</small>
            </a>
        </div>`
                }
                jobList.innerHTML += generatePagination()

            },
            error: function (error) {
                console.error("에러 발생:", error)
            },
        })
        console.log("AJAX 요청 전송됨")

        filterList = [] //배열 초기화하기
        makeList()
        anythingInList()
    })
}

//js에서는 반환타입 명시안해줘도 됨?
function showDate(count) {
    console.log(count)
    if (count != 0) {
        return count
    } else {
        return "day"
    }
}

function generatePagination() {
    return `
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center list-paging mt-3">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    `
}

anythingInList()

function anythingInList() {
    if (filterList.length==0){
        filterBoxUl.innerHTML="<li>상세 조건을 클릭하세요.</li>"
    }
}