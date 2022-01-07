<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="mypack.busDetails"%>
    <%@ page import="mypack.busDetailsDAO"%>
    <%@ page import="java.util.*"%>


        <html>

        <head>
            <title>GujaratBus</title>
            <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
          />
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        </head>

        <body>
            
   <jsp:include page="header.jsp"/>
            <br>  


                    <!-- Bus_no Name From_city To_city Date Time Travel_duration Price -->

                <div class="row">
    
                    <div class="container">
                        <h3 class="text-center">Bus List</h3>
                        <hr>

                        <!-- write load search result code and 
                        all result code is placed in log file -->
                        <table class="table text-center" style="background-color:aliceblue">
                            <thead>
                                <tr>
                                    <th>Bus_no</th>
                                    <th>Bus Name</th>
                                    <th>From_city</th>
                                    <th>To_city</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Travel_duration</th>
                                    <th>Price</th>
                                    <th>Available_seats</th>
                                    <th>Book</th>
                                </tr>
                            </thead>


                            <%List<busDetails> std = 
                                (List<busDetails>)request.getAttribute("listUser");
                            for(busDetails s:std){%>
                            <tr>
                                <td><%=s.getBus_no()%></td>
                                <td><%=s.getName()%></td>
                                <td><%=s.getFrom_city()%></td>
                                <td><%=s.getTo_city()%></td>
                                <td><%=s.getDate()%></td>
                                <td><%=s.getTime()%></td>
                                <td><%=s.getTravel_duration()%> hours</td>
                                <td><%=s.getprice()%> &#8377;</td>
                                <td><%=s.getavailable_seats()%> </td>

                                <td> <a class="log-btn" style="text-decoration:none;"
                                    href="Book.jsp?Bus_no=<%=s.getBus_no()%>&From_city=<%=s.getFrom_city()%>&To_city=<%=s.getTo_city()%>&Date=<%=s.getDate()%>&Time=<%=s.getTime()%>&Price=<%=s.getprice()%>&Available_seats=<%=s.getavailable_seats()%>" > Book </a>  </td>



                            </tr>
                            <%}%>

                            </table>
                        
                            
                    
                    </div>
                </div>
                              
    </body>

    </html>