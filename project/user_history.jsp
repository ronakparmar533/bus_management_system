<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="mypack.UserTicket"%>
    <%@ page import="mypack.busDetailsDAO"%>
    <%@ page import="java.util.*"%>
    <html>

    <head>
        <title>GujaratBus</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"          />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
        
        <%
            String name=(String)session.getAttribute("user");
            busDetailsDAO dao = new busDetailsDAO();
            List<UserTicket> TicketList = dao.selectUserTicketDetails(name);
        %>
            
        <jsp:include page="header.jsp"/>
        <br>  

            <div class="row">

                <div class="container">
                    <h3 class="text-center">Your Booked Tickets</h3>
                    <hr>

                    <table class="table text-center" style="background-color: aliceblue;">
                        <thead>
                            <tr>
                                <!--<th>Email</th>
                                <th>Mobile_number</th>-->
                                <th>Bus_no</th>
                                <th>From_city</th>
                                <th>To_city</th>
                                <th>No_of_person</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Total Amount</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                            for (UserTicket ticket : TicketList) {
                            %>
                                <!--<td><%=ticket.getEmail()%></td>
                                <td><%=ticket.getMobile()%></td>-->
                                
                                <td><%=ticket.getBus_no()%></td>
                                <td><%=ticket.getFrom_city()%></td>
                                <td><%=ticket.getTo_city()%></td>
                                <td><%=ticket.getNo_of_person()%></td>
                                <td><%=ticket.getDate()%></td>
                                <td><%=ticket.getTime()%></td>
                                <td><%=ticket.getAmount()%> &#8377;</td>

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