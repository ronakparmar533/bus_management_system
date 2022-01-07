<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <title>GujaratBus</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
    <jsp:include page="headerAdmin.jsp"/>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">

                    <form action="edit" method="post">    

                    <h2> Update Bus Details  </h2>
                    
                    <fieldset class="form-group">
                        <label>  Bus_no  </label> <input type="text"class="form-control" name="Bus_no" value='<%=request.getParameter("Bus_no")%>' >
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Bus Name</label> <input type="text" class="form-control" name="Name" value='<%=request.getParameter("Name")%>'>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>  From_city  </label> <input type="text"class="form-control" name="From_city" value='<%=request.getParameter("From_city")%>' >
                    </fieldset>

                    <fieldset class="form-group">
                        <label>  To_city  </label> <input type="text"class="form-control" name="To_city" value='<%=request.getParameter("To_city")%>' >
                    </fieldset>

                    <fieldset class="form-group">
                        <label>  Date  </label> <input type="date"class="form-control" name="Date" value='<%=request.getParameter("Date")%>' >
                    </fieldset>

                    <fieldset class="form-group">
                        <label>  Time  </label> <input type="time"class="form-control" name="Time" value='<%=request.getParameter("Time")%>' >
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Travel_duration</label> <input type="number"  class="form-control" name="Travel_duration"  value='<%=request.getParameter("Travel_duration")%>'>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>  Price  </label> <input type="number"class="form-control" name="Price" value='<%=request.getParameter("Price")%>' >
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Available Seats</label> <input type="number" class="form-control" name="Available_seats" value='<%=request.getParameter("Available_seats")%>' required/>
                    </fieldset>
                    <hr>

                    <button type="submit" class="btn btn-success">Update</button>

                    </form>
                </div>
            </div>
        </div>
    </body>

</html>