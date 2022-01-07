<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GujaratBus</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
  />
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
          }
          
          html {
            box-sizing: border-box;
          }
          
          *, *:before, *:after {
            box-sizing: inherit;
          }
          
          .column {
            float: left;
            width: 49%;
            margin-bottom: 16px;
            padding: 0 8px;
          }
          
          .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            margin: 8px;
          }
          
          .about-section {
            padding: 50px;
            text-align: center;
            background-color: #474e5d;
            color: white;
          }
          
          .container {
            padding: 0 16px;
          }
          
          .container::after, .row::after {
            content: "";
            clear: both;
            display: table;
          }
          
          .title {
            color: grey;
          }
          
          .button {
            border: none;
            outline: 0;
            display: inline-block;
            padding: 8px;
            color: white;
            background-color: #000;
            text-align: center;
            cursor: pointer;
            width: 100%;
          }
          
          .button:hover {
            background-color: #555;
          }
          
          @media screen and (max-width: 650px) {
            .column {
              width: 100%;
              display: block;
            }
          }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="about-section">
        <h1>About Us</h1>

        <p style="justify-content: center;">GujaratBus is gujarat’s largest online bus ticketing platform that has transformed bus travel in the State by bringing ease and convenience to millions of Indians who travel using buses. GujaratBus is part of India’s leading online travel company MakeMyTrip Limited (NASDAQ: MMYT). By providing widest choice, superior customer service, lowest prices and unmatched benefits, GujaratBus has served over 2 million customers. </p>
      </div>
      
      <h2 style="text-align:center">Our Team</h2>
      <div class="row">
        <div class="column">
          <div class="card">
            <div class="container">
              <h2>Ronak Parmar</h2>
              <p class="title">Software Engineer</p>
              <p>ronakparmar533@gmail.com</p>
              <p><button class="button">Contact</button></p>
            </div>
          </div>
        </div>
      
        <div class="column">
          <div class="card">
           <div class="container">
              <h2>Rahul Modi</h2>
              <p class="title">Software Engineer</p>
              <p>rahulmodi.204@gmail.com</p>
              <p><button class="button"><a href="rahulsprotfolio.netlify.app" style="text-decoration: none;color:white;">Contact</a></button></p>
            </div>
          </div>
        </div>
      

      </div>
    <jsp:include page="footer.jsp"/>

</body>
</html>