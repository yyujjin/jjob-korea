## ✨게시판 메인 페이지 전체 화면
![image.png](/docs/images/board/Board_List_1.png)

<details> <summary>글 목록 페이지</summary>

  ## 📌 글 목록 페이지

  ![image.png](/docs/images/board/Board_List_1.png)

  - 글 목록 페이지에서는 사용자들이 작성한 글들의 목록을 한눈에 볼 수 있습니다. 각 글은 번호, 아이디, 제목, 작성 날짜, 조회수, 좋아요 수의 정보가 포함되어 있습니다.

  ## 📌 주요 기능

  ### 글 검색 기능

  ![image.png](/docs/images/board/Board_List_2.png)

  - **검색 필터:** 글 제목, 내용, 작성자 등을 기준으로 필터를 설정하여 게시글을 검색할 수 있습니다.
  - **결과 표시:** 검색 결과는 표 형태로 보여지며, 화면 아래쪽에 있는 버튼을 눌러서 다른 페이지로 이동할 수 있습니다.

  ### 페이징 기능

  ![image.png](/docs/images/board/Board_List_3.png)

  - **페이징 단위 설정:** 기본적으로 한 페이지에 10개의 글이 표시되며, 글의 수가 10개를 초과할 경우 다음 페이지로 넘겨가며 조회할 수 있습니다.
  - **페이지 이동:** 페이징 바를 통해 사용자는 원하는 페이지로 쉽게 이동할 수 있습니다.

</details>

<details> <summary>글 보기 페이지</summary>

  ## 📌 글 보기 페이지


  ![image.png](/docs/images/board/Board_Content_1.png)

  - 글 보기 페이지는 사용자가 특정 글을 선택했을 때 해당 글의 상세 내용을 보여줍니다.
  - **글 제목 및 본문**: 글의 제목과 본문 내용이 표시됩니다. 이미지가 포함된 경우 이미지도 함께 표시됩니다.
  - **댓글 보기 및 작성**: 로그인한 사용자는 글 하단에 댓글을 작성할 수 있으며, 이미 작성된 댓글을 조회할 수 있습니다.

  ## 📌 주요 기능


  ### 좋아요 기능


  ![image.png](/docs/images/board/Board_Content_2.png)

  ![image.png](/docs/images/board/Board_Content_3.png)

  - **좋아요 버튼**: 각 글에는 좋아요 기능이 포함되어 있어, 사용자가 글을 좋아요 할 수 있습니다. 좋아요 버튼을 누른 경우 아이콘이 채워진 하트로 변합니다.
  - **실시간 업데이트**: 좋아요 수가 실시간으로 반영됩니다. 각 사용자의 좋아요 상태가 글 번호별로 저장됩니다.

  ### 댓글 작성 기능


  ![image.png](/docs/images/board/Board_Content_4.png)

  - **댓글 저장**: 로그인한 사용자는 댓글을 작성할 수 있습니다.
  - **유효성 검사**: 작성된 댓글이 공백일 경우 알림창이 출력됩니다.

  ### 조회수 기능

  ![image.png](/docs/images/board/Board_Content_5.png)

  - **조회수 증가**: 글을 열람하면 조회수가 증가합니다. 단, 글 작성자와 현재 로그인한 사용자가 동일한 경우 조회수는 증가하지 않습니다.

</details>

<details> <summary>글 작성 페이지</summary>
  ## 📌 글 작성 페이지

  ![image.png](/docs/images/board/Board_Write_1.png)

  - **제목 및 내용 입력**: 사용자는 글의 제목과 내용을 입력할 수 있으며, 이 필드는 필수 입력 사항입니다.
  - **파일 업로드**: 이미지와 ZIP 파일을 첨부할 수 있는 기능이 제공되며, 업로드된 파일은 게시글과 함께 저장됩니다.
  - **목록 보기**: 작성 중이던 글을 취소하고 글 목록 페이지로 돌아갈 수 있는 기능입니다.

  ## 📌 주요 기능


  ### 글 작성 기능


  ![image.png](/docs/images/board/Board_Write_2.png)

  ![image.png](/docs/images/board/Board_Write_3.png)

  ![image.png](/docs/images/board/Board_Write_4.png)

  - **유효성 검사**: 제목이나 내용이 입력되지 않으면 유효성 검사가 실행되며, 경고 메시지가 표시됩니다. 모든 입력 항목이 완료되어야만 글을 작성할 수 있습니다.

  ### 이미지, 파일 업로드 기능

  ![image.png](/docs/images/board/Board_Write_5.png)

  - **파일 업로드**: 사용자는 이미지 파일과 ZIP 파일을 게시글에 첨부할 수 있습니다. 업로드된 파일은 작성 페이지에 미리보기로 표시됩니다.
  - **파일 삭제**: 업로드된 파일은 글 작성 중에 언제든지 삭제할 수 있습니다.
</details>