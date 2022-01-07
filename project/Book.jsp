<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

    <head>
        <title>GujaratBus</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
<style>
    .disableTag:read-only{
        background-color: #ebe6e6;
        color: #817f7f;
    }
</style>
    <body>

     <jsp:include page="header.jsp"/>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">

                    <!-- send to book ticket control 
                        change below action -->
                    <form action="InsertTicketDetails" method="post">    

                    <h2 class="text-center">  Bus Details  </h2>
                    
                    <fieldset class="form-group">
                        <label>  Bus_no  </label> <input  type="text" class="form-control disableTag" readonly name="Bus_no" value='<%=request.getParameter("Bus_no")%>' >
                    </fieldset>

                    <fieldset class="form-group">
                        <label>  From_city  </label> <input type="text"class="form-control disableTag" readonly name="From_city" value='<%=request.getParameter("From_city")%>' >
                    </fieldset>

                    <fieldset class="form-group">
                        <label>  To_city  </label> <input type="text"class="form-control disableTag" readonly name="To_city" value='<%=request.getParameter("To_city")%>' >
                    </fieldset>

                    <fieldset class="form-group">
                        <label>  Date  </label> <input type="date"class="form-control disableTag" readonly name="Date" value='<%=request.getParameter("Date")%>' >
                    </fieldset>

                    <fieldset class="form-group">
                        <label>  Time  </label> <input type="time"class="form-control disableTag" readonly name="Time" value='<%=request.getParameter("Time")%>' >
                    </fieldset>

                    <fieldset class="form-group">
                        <label>  Price  </label> <input type="number"class="form-control disableTag" readonly name="Price" value='<%=request.getParameter("Price")%>' >
                    </fieldset>


                    <fieldset class="form-group">
                        <label>  Available_seats  </label> <input type="number"class="form-control disableTag" readonly name="Available_seats" value='<%=request.getParameter("Available_seats")%>' >
                    </fieldset>
                    
                    <fieldset class="form-group">
                         <input hidden type="text"class="form-control disableTag" readonly name="uname" value='<%= session.getAttribute("user") %>' >
                    </fieldset>
                    <hr>


                    <h2 class="text-center" > Book Ticket  </h2>

                  
                    <fieldset class="form-group">
                        <label>  Email id </label> <input type="email"class="form-control" name="Email" placeholder="abc@gmail.com" required>
                    </fieldset>

                    <fieldset class="form-group">
                        <label> Mobile number </label> <input type="tel" maxlength="10" class="form-control" name="Mobile" placeholder="9125364758" required >
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Number of persons </label> <input type="number" class="form-control" name="No_of_person" placeholder="<=5" min="1" max="5" required >
                    </fieldset>

                    <button type="submit" class="btn btn-success">  Make payment </button>  &nbsp; 
                    <button type="reset" class="btn btn-danger">  Cancel  </button>

                    </form>
                </div>
            </div>
        </div>
    </body>

</html>