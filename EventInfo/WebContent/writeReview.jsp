<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <meta charset="utf-8">
  <title>눈담화</title>
  <link rel="stylesheet" href="front/css/writeReview.css"><!-- css파일 -->
  <jsp:include page="fragment/header.jsp" flush="false"/>
  <hr><!-- 이 및으론 리뷰 쪽 -->
  <div class="container">
    <div class="row">
      <form method="post" action="writeReviewOk.do">
        <table class="table" style="text-align: center; border: 1px solid #dddddd">
          <thead>
            <tr>
              <th colspan="2" style="background-color: #eeeeee; text-align: center;">리뷰 작성</th>

            </tr>

          </thead>

          <tbody>
            <tr>
                <td>종류: <select class="menu_select" name="category">
                        <option value="men" selected>남자친구를 위한</option>
                        <option value="women">여자친구를 위한</option>
                        <option value="parents">부모님을 위한</option>
                </select>
            </tr>
            <tr>
			
              <td><input type="text" style="width:80%; height:auto;" maxlength="100" id="review_text" placeholder="글 제목" name="title" maxlength="50" /></td>

            </tr>

            <tr>

              <td><textarea class="form-control" style="width:80%;height: 250px;" rows="50" placeholder="글 내용" name="content" maxlength="2048"></textarea></td>

            </tr>

          </tbody>

        </table>
        <div class ="review_service" align="center">
          <input type="file" class ="review_button" value="이미지" accept="img/*" ><!-- required multiple onchange="handleFiles(this.files)" -->
          <input type="submit" class ="review_button" value="글 올리기"/>

        </div>
      </form>
    </div>
  </div>
</body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>