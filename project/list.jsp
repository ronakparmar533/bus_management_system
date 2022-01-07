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

                <div class="row">
    
                    <div class="container">
                        <h3 class="text-center">Bus List</h3>
                        <hr>

                        <!-- search bus code -->

                            <div class="card">
                                <div class="card-body">
        
                                    <form action="Search" method="POST">
                                        <div class="input-group">
                                            <input type="text" class="form-control input-sm" style="margin-top: 0.5rem;" name="From_city" placeholder="From City" />
                
                                            <input type="text" class="form-control input-sm"  style="margin-top: 0.5rem;margin-left:5px" name="To_city" placeholder="To city" />
    
                                            <button type="submit" class="log-btn" style="margin-left:5px;"  ><i class="fas fa-search"></i> Search</button> 
                                        </div>
                                    </form>

                                </div>
                            </div>
                        

                        <hr>

                        <!-- write load search result code and 
                        all result code is placed in log file -->
                        <%
                        busDetailsDAO dao = new busDetailsDAO();
                        List<busDetails> userList = dao.selectAllDetails();
                        %>
                        <table class="table text-center " style="background-color: white;border-radius:0.3rem;">
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
                                    <th>Available Seats</th>
                                    <th>Book</th>
                                </tr>
                            </thead>
                            <tbody>

                            
                                <%
                                for (busDetails user : userList) {
                                %>
                                    <td><%=user.getBus_no()%></td>
                                    <td><%=user.getName()%></td>
                                    <td><%=user.getFrom_city()%></td>
                                    <td><%=user.getTo_city()%></td>
                                    <td><%=user.getDate()%></td>
                                    <td><%=user.getTime()%></td>
                                    <td><%=user.getTravel_duration()%> hours</td>
                                    <td><%=user.getprice()%> &#8377;</td>
                                    <td><%=user.getavailable_seats()%></td>

                                    <td > <a class="log-btn" style="text-decoration: none;color:white;"
                                         href="Book.jsp?Bus_no=<%=user.getBus_no()%>&From_city=<%=user.getFrom_city()%>&To_city=<%=user.getTo_city()%>&Date=<%=user.getDate()%>&Time=<%=user.getTime()%>&Price=<%=user.getprice()%>&Available_seats=<%=user.getavailable_seats()%>" > <i class="fas fa-ticket-alt"></i> Book </a>  </td>

                                 
                                </tr>
                                <%
                                }
                                %>


          
                                
                            </tbody>
    
                        </table>
                    
                    </div>
                </div>
                
                <jsp:include page="footer.jsp" />

    </body>

    </html>