<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GujaratBus</title>
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
  />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>
    <jsp:include page="header.jsp"/>
    <br/>
    <div class="Containers">
        <form class="registration" action="registration" method="post">
          <h2 class="heading-h2">Sign Up</h2>
         
          <input
            type="text"
            name="fullname"
            class="loginput"
            placeholder="Enter Your FullName"
            
          />
          <input
            type="email"
            name="email"
            class="loginput"
            placeholder="Enter Your Email"
           
          />
          <input
            type="text"
            name="username"
            class="loginput"
            placeholder="Enter Your Username"
            
          />
          <input
            type="password"
            name="password"
            class="loginput"
            placeholder="Enter You Password"
           
          />
        
          <button type="submit" class="sign-btn">
            Sign Up
          </button>
          <p><%=(request.getAttribute("errMessage") == null) ? ""  : request.getAttribute("errMessage")%>
          </p>
          <span ><a class="log-link" href="fetch.jsp" style="text-decoration: none;">Sign In</a></span>
         
        </form>
        </div>

        <jsp:include page="footer.jsp"/>
        
</body>
</html>