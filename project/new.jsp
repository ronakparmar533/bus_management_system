<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

    <head>
        <title>GujaratBus</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>

        
    <jsp:include page="headerAdmin.jsp"/>
        <br>  
        
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">

                    <form action="insert" method="post">

                    <fieldset class="form-group">
                        <label>Bus Number</label> <input type="text" class="form-control" name="Bus_no" required="required"/>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Bus Name</label> <input type="text" class="form-control" name="Name" required/>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>From City</label> <input type="text" class="form-control" name="From_city" required/>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>To City</label> <input type="text" class="form-control" name="To_city" required/>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Date</label> <input type="date" class="form-control" name="Date" required/>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Time</label> <input type="time" class="form-control" name="Time" required/>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Travel_duration</label> <input type="number"  class="form-control" name="Travel_duration" required/>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Price</label> <input type="number" class="form-control" name="Price" required/>
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Available Seats</label> <input type="number" class="form-control" name="Available_seats" required/>
                    </fieldset>
                     <button type="submit" class="btn log-btn">Add New Bus</button>
                     
                    </form>
                </div>
            </div>
        </div>


    </body>

</html>