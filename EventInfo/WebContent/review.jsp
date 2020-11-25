<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <meta charset="UTF-8">
 <title>눈담화</title>
 <link rel="stylesheet" href="front/css/review.css">
<jsp:include page="fragment/header.jsp" flush="false"/>

    <div class="container">
      <div class = "row">
      <h3>리뷰 게시판</h3>
      <select class="review_select" name="rivew_sel">
        <option value="Men">Men</option>
        <option value="Women">Women</option>
        <option value="Parents">Parents</option>
        <option value="All">All</option>
      </select>

      <script type="text/javascript">
        if(review_select.equals('Men')){
          document.write("Hello");
        }

      </script>
         <table class="table-striped">
            <thead>
               <tr>
                  <th style="background-color: #eeeeee; text-align: center;">종류</th>
                  <th style="background-color: #eeeeee; text-align: center;">제목</th>
                  <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                  <th style="background-color: #eeeeee; text-align: center;">작성일</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td>1</td>
                  <td>안녕하세요</td>
                  <td>홍길동</td>
                  <td>2017-05-04</td>
               </tr>
            </tbody>
         </table>

      <ul class="review_ul">
         <li><a href="#">1</a></li>
         <li><a href="#">2</a></li>
         <li><a href="#">3</a></li>
         <li><a href="#">4</a></li>
      </ul>

         <a href = "writeReview.do" class="write_review">글쓰기</a>
      </div>
   </div>

</body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>