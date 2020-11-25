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
      <form method="post" action="review_main.html">
        <table class="table" style="text-align: center; border: 1px solid #dddddd">
          <thead>
            <tr>
              <th colspan="2" style="background-color: #eeeeee; text-align: center;">리뷰 작성</th>

            </tr>

          </thead>

          <tbody>
            <tr>
                <td>종류: <select class="menu_select" name="menu">
                        <option value="Men" selected>Men</option>
                        <option value="Women">Women</option>
                        <option value="Parents">Parents</option>
                </select>
            </tr>
            <tr>

              <td><input type="text" style="width:80%; height:auto;" maxlength="100" id="review_text" placeholder="글 제목" name="bbsTitle" maxlength="50" /></td>

            </tr>

            <tr>

              <td><textarea class="form-control" style="width:80%;height: 250px;" rows="50" placeholder="글 내용" name="bbsContent" maxlength="2048"></textarea></td>

            </tr>

          </tbody>

        </table>
        <div class ="review_service" align="center">
          <input type="file" class ="review_button" value="이미지" accept="img/*" required multiple onchange="handleFiles(this.files)">
          <input type="submit" class ="review_button" value="글 올리기" onclick="location.href='c:/Web/review_main/review_main.html'" />

        </div>
      </form>
    </div>
  </div>
</body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>