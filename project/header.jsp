<style>
  /* Navbar */
:root {
--primary-color: #f857a8;
--secondary-color: #ff5858;
--white: #fff;
--light-gray: #ddd;
--dark-gray: #444;
--header-back: #141b25;
}

header {
background-color: var(--header-back);
}

.main-nav {
height: 90px;
}
.shadeColor{
 background-color: green;
}
.shadeColor:hover{
  background: -webkit-linear-gradient(
    var(--primary-color),
    var(--secondary-color)
  );
  font-weight: bold;
}
.nav-brand {
color: white;
line-height: 90px;
font-size: 30px;
font-weight: bold;
text-decoration: none;
margin-left: 30px;
background: -webkit-linear-gradient(
  var(--primary-color),
  var(--secondary-color)
);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;

font-family: "AstroSpace", sans-serif;
}

.navlinks {
list-style: none;
float: right;
line-height: 90px;
margin: 0;
padding: 0;
}

.navlinks li {
display: inline-block;
margin: 0px 20px;
}

.navlinks li a {
color: white;
text-decoration: none;
font-size: 18px;
transition: all 0.3s linear 0s;
text-transform: uppercase;
}

.navlinks li a:hover {
color: var(--primary-color);
padding-bottom: 7px;
border-bottom: 2px solid var(--secondary-color);
}

li a.active {
background-image: linear-gradient(
  to right,
  var(--primary-color),
  var(--secondary-color)
);
padding: 9px 20px;
border-radius: 50px;
transition: all 0.3s ease 0s;
border-bottom: none;
}

li a.active:hover {
background-image: linear-gradient(
  to right,
  var(--secondary-color),
  var(--primary-color)
);
color: white;
border-bottom: none;
}

#check {
display: none;
}

.menu-btn {
font-size: 25px;
color: white;
float: right;
line-height: 90px;
margin-right: 40px;
display: none;
cursor: pointer;
}

@media (max-width: 800px) {
.navlinks {
  position: fixed;
  width: 100%;
  height: 100vh;
  text-align: center;
  transition: all 0.5s;
  right: -100%;
  background: #222831;
}

.navlinks li {
  display: block;
}

.navlinks li a {
  font-size: 20px;
}

.navlinks li a:hover {
  border-bottom: none;
}

.menu-btn {
  display: block;
}

#check:checked ~ .navlinks {
  right: 0;
}
}

@media (max-width: 360px) {
.logo {
  margin-left: 10px;
  font-size: 25px;
}

.menu-btn {
  margin-right: 10px;
  font-size: 25px;
}

.menu-btn:focus {
  color: blue;
}
}



body {
background-image: linear-gradient(
to right,
var(--primary-color),
var(--secondary-color)
);
padding: 0;
margin: 0;
}
.loginput {
width: 70%;
padding: 10px 10px;
border: none;
background: transparent;
outline: none;
margin: 20px 0;
border-bottom: 1px solid white !important;
color: white;
}
.loginput:hover {
width: 70%;
transition: 0.3s;
border-bottom: 1px solid var(--primary-color) !important;
}
::placeholder {
color: white;
opacity: 1;
}
.sign-btn,
.log-btn {
line-height: 24px;
padding: 5px 30px;
background-image: linear-gradient(
to right,
var(--primary-color),
var(--secondary-color)
);
color: white;
border: 2px solid #ecf0f1;
outline: none;
border-radius: 5px;
text-transform: uppercase;
cursor: pointer;
margin-top: 0.5rem;

}
.sign-btn:hover,.log-btn:hover {
background-image: linear-gradient(
to right,
var(--secondary-color),
var(--primary-color)
);
}
.log-link {
margin-top: 0.5rem;
color: var(--white);
font-size: large;
}
.log-link:hover {
color: var(--primary-color);
}
.Containers {
background-color: transparent;
width: 70%;
margin: auto;
display: flex;
margin-top: 0.5rem;
justify-content: center;
margin-top: 1rem;
}
.registration {
width: 50%;
background-color: var(--header-back);
display: flex;
flex-direction: column;
align-items: center;
border-radius: 0.5rem ;
padding: 1rem;
}

.login {
width: 50%;
display: flex;
flex-direction: column;
align-items: center;
border-radius:  0.5rem ;
background-color: var(--header-back);
padding: 1rem;
text-align: center;
}
.heading-h2 {
color: #ecf0f1;
}
@media only screen and (max-width: 640px) {
.Container {
width: 95%;
}
.registration ,.login{
width: 100%;
border-radius: 0.5rem;
}

}
.disableTag:read-only{
  background-color: #ebe6e6;
  color: #817f7f;
}
</style>
<header>
  <nav class="main-nav">
    <input type="checkbox" id="check" />
    <label for="check" class="menu-btn">
      <i class="fas fa-bars"></i>
    </label>
    <a href="list.jsp" class="nav-brand">
      <i class="fas fa-bus"></i>
      GujaratBus
    </a>
    <ul class="navlinks">
     

      <% if(session.getAttribute("user")== null) 
      {%>
          <li><a href="registration.jsp" >
              <i class="fas fa-user-plus"></i> Register
          </a>
          </li>
          
          <li>
              <a href="fetch.jsp">
                  <i class="fa fa-sign-in-alt" aria-hidden="true"></i> Login
              </a>
          </li>
      <%} 
      %>

      <% 
          if(session.getAttribute("user")!= null)
          {%>
            <li>
              <a href="list.jsp" class="active">
                Bus List
              </a>
            </li>
              <li><a href="#" > 
                <i class="fa fa-user" aria-hidden="true" style="color: #f857a8;"></i>
                <%
                  String name=(String)session.getAttribute("user");  
                  out.print(name);   
                  %></a>
              </li>
              <li><a href="logout" >
                <i class="fa fa-sign-out-alt" aria-hidden="true"></i> Logout</a>
              </li>
              <li><a href="user_history.jsp" >
                  Your Tickets
              </li>
          <%}
      %>
    
      <li><a href="AdminList.jsp" >Admin-Site</a></li>
    </ul>
  </nav>
</header>