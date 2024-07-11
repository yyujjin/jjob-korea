
//필터
const filters = document.querySelectorAll(".filter")
//필터박스
const filterBox = document.querySelector("filter-box")
//필터박스 ul
const filterBoxUl = document.querySelector(".filter-box-ul")
//필터 리스트
const filterList = []

//필터 박스에 추가
addToFilterBox()
function addToFilterBox() {
   
    for(let i=0; i<filters.length; i++) {
        filters[i].addEventListener("click", function(event){
            const isInList = filterList.indexOf(event.target.id);
            //중복 확인 => -1일 경우에만 추가
            if(isInList==-1){
                filterList.push(event.target.id)
            }
            makeList()
        })
    }
}

// 필터리스트로 li 생성하기
function makeList() {
    filterBoxUl.innerHTML = ""; // filterBoxUl 초기화
    filterList.forEach(filter => {
        filterBoxUl.innerHTML += `<li>${filter}<button class="delete-button">x</button></li>`;
    })

    deleteFilter()
}

//필터 삭제
function deleteFilter(){
    const deleteButtons = document.querySelectorAll(".delete-button")
    for(let i=0; i<deleteButtons.length; i++) {
        deleteButtons[i].addEventListener("click",function(){
            filterList.splice(i,1)
            makeList()
        })
    }
}