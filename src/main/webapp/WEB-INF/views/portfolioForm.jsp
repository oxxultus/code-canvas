<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Portfolio Form</title>
</head>
<body>
<h1>Submit Your Portfolio</h1>

<form action="${pageContext.request.contextPath}/api/portfolio/save" method="POST">
  <!-- Portfolio Images -->
  <h2>Portfolio Images</h2>
  <label>Portfolio Image 1:</label>
  <label>
    <input type="text" name="portfolioImg1">
  </label><br>
  <label>Portfolio Image 2:</label>
  <label>
    <input type="text" name="portfolioImg2">
  </label><br>
  <label>Portfolio Image 3:</label>
  <label>
    <input type="text" name="portfolioImg3">
  </label><br>
  <label>Portfolio Image 4:</label>
  <label>
    <input type="text" name="portfolioImg4">
  </label><br>
  <label>Portfolio Image 5:</label>
  <label>
    <input type="text" name="portfolioImg5">
  </label><br>
  <label>Portfolio Image 6:</label>
  <label>
    <input type="text" name="portfolioImg6">
  </label><br>

  <!-- Certificates -->
  <h2>Certificates</h2>
  <label>First Certificate Title:</label>
  <label>
    <input type="text" name="firstCertificateTitle">
  </label><br>
  <label>First Certificate Icon:</label>
  <label>
    <input type="text" name="firstCertificateButtonIcon">
  </label><br>
  <label>Second Certificate Title:</label>
  <label>
    <input type="text" name="secondCertificateTitle">
  </label><br>
  <label>Second Certificate Icon:</label>
  <label>
    <input type="text" name="secondCertificateButtonIcon">
  </label><br>
  <label>Third Certificate Title:</label>
  <label>
    <input type="text" name="thirdCertificateTitle">
  </label><br>
  <label>Third Certificate Icon:</label>
  <label>
    <input type="text" name="thirdCertificateButtonIcon">
  </label><br>
  <label>Fourth Certificate Title:</label>
  <label>
    <input type="text" name="fourthCertificateTitle">
  </label><br>
  <label>Fourth Certificate Icon:</label>
  <label>
    <input type="text" name="fourthCertificateButtonIcon">
  </label><br>

  <!-- Projects -->
  <h2>Projects</h2>
  <label>Project 1 Image:</label>
  <label>
    <input type="text" name="projectImg1">
  </label><br>
  <label>Project 1 Description:</label>
  <label>
    <input type="text" name="projectDesc1">
  </label><br>
  <label>Project 2 Image:</label>
  <label>
    <input type="text" name="projectImg2">
  </label><br>
  <label>Project 2 Description:</label>
  <label>
    <input type="text" name="projectDesc2">
  </label><br>
  <label>Project 3 Image:</label>
  <label>
    <input type="text" name="projectImg3">
  </label><br>
  <label>Project 3 Description:</label>
  <label>
    <input type="text" name="projectDesc3">
  </label><br>
  <label>Project 4 Image:</label>
  <label>
    <input type="text" name="projectImg4">
  </label><br>
  <label>Project 4 Description:</label>
  <label>
    <input type="text" name="projectDesc4">
  </label><br>
  <label>Project 5 Image:</label>
  <label>
    <input type="text" name="projectImg5">
  </label><br>
  <label>Project 5 Description:</label>
  <label>
    <input type="text" name="projectDesc5">
  </label><br>
  <label>Project 6 Image:</label>
  <label>
    <input type="text" name="projectImg6">
  </label><br>
  <label>Projec 6 Description:</label>
  <label>
    <input type="text" name="projectDesc6">
  </label><br>


  <!-- Social Button Icons -->
  <h2>Social</h2>
    <label>Social 1:</label>
  <label>
    <input type="text" name="socialButtonIcon1">
  </label><br>
    <label>Social 2:</label>
  <label>
    <input type="text" name="socialButtonIcon2">
  </label><br>
    <label>Social 3:</label>
  <label>
    <input type="text" name="socialButtonIcon3">
  </label><br>
    <label>Social 4:</label>
  <label>
    <input type="text" name="socialButtonIcon4">
  </label><br>

  <!-- teck Stack Button Icons -->
  <h2>Stack</h2>
  <label>Stack 1:</label>
  <label>
    <input type="text" name="techStackButtonIcon1">
  </label><br>
  <label>Stack 2:</label>
  <label>
    <input type="text" name="techStackButtonIcon2">
  </label><br>
  <label>Stack 3:</label>
  <label>
    <input type="text" name="techStackButtonIcon3">
  </label><br>
  <label>Stack 4:</label>
  <label>
    <input type="text" name="techStackButtonIcon4">
  </label><br>
  <label>Stack 5:</label>
  <label>
    <input type="text" name="techStackButtonIcon5">
  </label><br>
  <label>Stack 6:</label>
  <label>
    <input type="text" name="techStackButtonIcon6">
  </label><br>

  <button type="submit">전송</button>
</form>
</body>
</html>