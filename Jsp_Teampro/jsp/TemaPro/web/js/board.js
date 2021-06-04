/**
 * 게시판 관련 js
 */

function notice_readArticle(id) {
    // 글 상세보기
    location.href='index.jsp?contentPage=Board/notice_detail.jsp?idx=' + id;
}

function notice_deleteArticle(id) {
    // 글 삭제
    if(confirm('삭제하시겠습니까?'))
    	location.href='index.jsp?contentPage=Board/proc_delete.jsp?idx=' + id;
    else
    	alert('삭제 취소');
}