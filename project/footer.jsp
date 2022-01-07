<style>
    @import url('https://fonts.googleapis.com/css2?family=Titillium+Web:wght@700&display=swap');



.cards {
    padding: 2% 7%;
    color: #646771;
    background-color: #16151a
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0
}

ul>li {
    padding: 4px
}

ul>li:hover {
    color: var(--primary-color);
    cursor: pointer
}
.lela{
    color:#646771;
}
.lela:hover{
    color: var(--primary-color);
    cursor: pointer
}

hr {
    border-width: 3px
}

.social>i {
    padding: 1%;
    font-size: 15px
}

.social>i:hover {
    color: #957bda;
    cursor: pointer
}

.policy>div {
    padding: 4px
}

.heading {
    font-family: 'Titillium Web', sans-serif;
    color: white
}

.divider {
    border-top: 2px solid rgba(189, 196, 203, 0.5);
}
.foot-brand{
    background: -webkit-linear-gradient(
      var(--primary-color),
      var(--secondary-color)
    );
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
   
}
</style>
<div class="container-fluid mt-5 ">
    <div class="cards">
        <div class="row mb-4 ">
            <div class="col-md-4 col-sm-11 col-xs-11">
                <div class="footer-text pull-left">
                    <div class="d-flex">
                        <h1 class="font-weight-bold mr-2  px-3 foot-brand" > <i class="fas fa-bus" ></i> </h1>
                        <h1 class="foot-brand">GujaratBus</h1>
                    </div>
                    <p class="card-text">
                        GujaratBus Service is the Gujarat largest online bus ticket booking service trusted by over 2 million happy customers. It offers bus ticket booking through its website for all major routes in India.</p>
                    <div class="social mt-2 mb-3"> <i class="fa fa-facebook-official fa-lg"></i> <i class="fa fa-instagram fa-lg"></i> <i class="fa fa-twitter fa-lg"></i> <i class="fa fa-linkedin-square fa-lg"></i> <i class="fa fa-facebook"></i> </div>
                </div>
            </div>
            <div class="col-md-2 col-sm-1 col-xs-1 mb-2"></div>
            <div class="col-md-2 col-sm-4 col-xs-4">
                <h5 class="heading foot-brand"></h5>
                <ul>
                    <li></li>
                    <li> </li>
                   
                </ul>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-4">
                <h5 class="heading foot-brand">Services</h5>
                <ul class="card-text">
                    <li>Transport</li>
                    <li><a href="list.jsp" class="lela" style="text-decoration:none;">Bus Ticket</a></li>
                
                    
                </ul>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-4">
                <h5 class="heading foot-brand">About</h5>
                <ul class="card-text">
                    <li><a href="aboutUs.jsp" class="lela" style="text-decoration:none;">About Us</a></li>
                    <li><a href="ContactUs.jsp"  class="lela" style="text-decoration:none;">Contact Us</a></li>
                    
                    
                   
                </ul>
            </div>
        </div>
        <div class="divider mb-4"> </div>
        <div class="row" style="font-size:10px;">
            <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="pull-left">
                    <p><i class="fa fa-copyright"></i> 2021 Amdavadi</p>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="pull-right mr-4 d-flex policy">
                    <div>Terms of Use</div>
                    <div>Privacy Policy</div>
                    <div>Cookie Policy</div>
                </div>
            </div>
        </div>
    </div>
</div>