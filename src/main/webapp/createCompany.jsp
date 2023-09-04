<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Company</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
	<style>
body {
  background: #9FA6B2;
}

</style>
</head>
<body>
<jsp:include page="adminHeader.jsp"></jsp:include>
<div class="container my-5">
  <div class="row justify-content-center">
    <div class="col-lg-9">
      <h1 class="mb-3 fw-bold">Create Company</h1>
      <form action="CreateCompanyServlet" method="post">
        <div class="row g-3">
          <div class="col-8">
            <label for="your-name" class="form-label">Company Name</label>
            <input type="text" class="form-control" id="your-name" name="companyName" required>
          </div>
          <div class="col-8">
            <label for="your-email" class="form-label">Company Logo</label>
            <input type="text" class="form-control" id="your-email" name="companyLogo" required>
          </div>
          <div class="col-12">
            <div class="row">
              <div class="col-4">
                <button  type="submit" class="btn btn-dark w-100 fw-bold" >Create</button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>