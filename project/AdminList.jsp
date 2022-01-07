<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="mypack.busDetails"%>
    <%@ page import="mypack.busDetailsDAO"%>
    <%@ page import="java.util.*"%>
        <html>

        <head>
            <title>GujaratBus</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        </head>

        <body>
            
            <%
                busDetailsDAO dao = new busDetailsDAO();
                List<busDetails> userList = dao.selectAllDetails();
            %>
            
            <jsp:include page="headerAdmin.jsp"/>
            <br>  

            <!-- Bus_no Name From_city To_city Date Time Travel_duration Price -->

            <div class="row">
                <div class="container">
                    <h3 class="text-center">Bus List</h3>
                    <hr>
                    <div class="container text-center">

                        <a href="new.jsp" class="log-btn" style="text-decoration: none;">Add New Buses</a>
                    </div>
                    <br>
                    <table class="table text-center"  style="background-color:white;">
                        <thead>
                            <tr>
                                <th>Bus_no</th>
                                <th>Name</th>
                                <th>From_city</th>
                                <th>To_city</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Travel_duration</th>
                                <th>Price</th>
                                <th>Available_seats</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                            <%
                            for (busDetails data : userList) {
                            %>
                                <td><%=data.getBus_no()%></td>
                                <td><%=data.getName()%></td>
                                <td><%=data.getFrom_city()%></td>
                                <td><%=data.getTo_city()%></td>
                                <td><%=data.getDate()%></td>
                                <td><%=data.getTime()%></td>
                                <td><%=data.getTravel_duration()%> hours</td>
                                <td><%=data.getprice()%> &#8377;</td>
                                <td><%=data.getavailable_seats()%> </td>

                                <td> <a class="log-btn" style="text-decoration:none"
                                    href="editDetails.jsp?Bus_no=<%=data.getBus_no()%>&Name=<%=data.getName()%>&From_city=<%=data.getFrom_city()%>&To_city=<%=data.getTo_city()%>&Date=<%=data.getDate()%>&Time=<%=data.getTime()%>&Travel_duration=<%=data.getTravel_duration()%>&Price=<%=data.getprice()%>&Available_seats=<%=data.getavailable_seats()%>" > Edit </a>  
                                    <a style="background-color: var(--header-back);text-decoration:none; color: white; padding: 5px 15px; border-radius: 2px;"
                                    href="Delete?Bus_no=<%=data.getBus_no()%>" > Delete </a> 
                                </td>
                            </tr>
                            <%
                            }
                            %>
                            
                        </tbody>

                    </table>
                </div>
            </div>
                              
    </body>

    </html>

