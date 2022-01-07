package mypack;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import mypack.busDetails;
import mypack.busDetailsDAO;
import mypack.FetchBean;

@WebServlet("/")
public class busDetailsServlet extends HttpServlet {
    private busDetailsDAO busdetailsDAO;

    public void init() {
        busdetailsDAO = new busDetailsDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String action = request.getServletPath();

        try {
             switch (action) {
                case "/InsertTicketDetails":
                    BookTickets(request , response);
                    break;
                case "/insert":
                    insertDetails(request, response);
                    break;
                case "/edit":
                    editDetails(request, response);
                    break;
                case "/Delete":
                    deleteDetails(request, response);
                    break;
                case "/Payment":
                    AddPaymentDetails(request, response);
                    break;
                case "/Search":
                    SearchBus(request , response);
                    break;
                case "/login":
                    LoginUser(request , response);
                    break;
                case "/logout":
                    LogoutUser(request,response);
                    break;
                case "/registration":
                    registrationUser(request,response);
                    break;
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    // Registration code
    private void registrationUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("here registrationUser servlet");
        FetchBean fetchBean = new FetchBean(); 
        fetchBean.setFullname(fullName); 
        fetchBean.setEmail(email); 
        fetchBean.setUsername(userName); 
        fetchBean.setPassword(password);
 
        busdetailsDAO.insertRegistration(fetchBean); 
        response.sendRedirect("fetch.jsp");
        
    }

    // login user code
    private void LoginUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {

        String userName = request.getParameter("username");
        String password = request.getParameter("password");
 
        FetchBean fetchBean = new FetchBean(); 
        fetchBean.setUsername(userName); 
        fetchBean.setPassword(password);
 
        String userValidate = busdetailsDAO.authenticateUser(fetchBean); 
        if(userValidate.equals("SUCCESS")) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user",userName); 
            //request.setAttribute("userName", userName); 
            System.out.println("data passed successfull");
            request.getRequestDispatcher("/list.jsp").forward(request, response);
         }
         else
         {
             HttpSession session = request.getSession(true);
             
            //out.print(name);  
            String login = "Login";
            session.setAttribute("user",login); 
             System.out.println("failed passed data");
            request.setAttribute("errMessage", userValidate); 
            request.getRequestDispatcher("/fetch.jsp").forward(request, response);
         }
        
    }


    // logout code
    private void LogoutUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        //private static final long serialVersionUID = 1L;
     
        HttpSession session = request.getSession(false); 
            if(session!=null) 
            {
                session.invalidate(); 
                request.setAttribute("errMessage", "You have logged out successfully");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/fetch.jsp");
                requestDispatcher.forward(request, response);
                System.out.println("Logged out");
            }
    }



    private void listBusDetails(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List<busDetails> list = busdetailsDAO.selectAllDetails();

        request.setAttribute("listUser", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list.jsp");
        dispatcher.forward(request, response);
        
    }

    // search bus function code
    private void SearchBus(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {

        // pass data of from and to in argument
        String from_city = request.getParameter("From_city");
        String to_city = request.getParameter("To_city");
        List<busDetails> list = busdetailsDAO.SearchList(from_city , to_city);

        request.setAttribute("listUser", list);
        RequestDispatcher view = request.getRequestDispatcher("/searchList.jsp");
        view.forward(request, response);
        
    }

    // ADD PAYMENT DETAILS METHOD
    private void AddPaymentDetails(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {

        String cardOwner = request.getParameter("cardOwner");
        String cardNumber = request.getParameter("cardNumber");
        int ExpiryMM = Integer.parseInt(request.getParameter("Expiry_Month"));
        int ExpiryYY = Integer.parseInt(request.getParameter("Expiry_Year"));
        int cardCVV = Integer.parseInt(request.getParameter("CVV"));
        int cardAmount = Integer.parseInt(request.getParameter("Amount"));
        paymentDetail Details = new paymentDetail(cardOwner,cardNumber,ExpiryMM,ExpiryYY,cardCVV,cardAmount);
        busdetailsDAO.insertPaymentDetails(Details);
        response.sendRedirect("list.jsp");
        
    }

  
    private void insertDetails(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        // Bus_no Name From_city To_city Date Time Travel_duration Price
        
        String bus_no = request.getParameter("Bus_no");
        String name = request.getParameter("Name");
        String from_city = request.getParameter("From_city");
        String to_city = request.getParameter("To_city");
        String date = request.getParameter("Date");
        String time = request.getParameter("Time");
        int travel_duration = Integer.parseInt(request.getParameter("Travel_duration"));
        int price = Integer.parseInt(request.getParameter("Price"));
        int available_seats = Integer.parseInt(request.getParameter("Available_seats"));

        busDetails newDetails = new busDetails(bus_no, name, from_city, to_city , date , time , travel_duration , price,available_seats);
        busdetailsDAO.insertBusDetails(newDetails);
        response.sendRedirect("AdminList.jsp");
    }

    // update bus details code
    private void editDetails(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        
        String bus_no = request.getParameter("Bus_no");
        String name = request.getParameter("Name");
        String from_city = request.getParameter("From_city");
        String to_city = request.getParameter("To_city");
        String date = request.getParameter("Date");
        String time = request.getParameter("Time");
        int travel_duration = Integer.parseInt(request.getParameter("Travel_duration"));
        int price = Integer.parseInt(request.getParameter("Price"));
        int available_seats = Integer.parseInt(request.getParameter("Available_seats"));

        busDetails newDetails = new busDetails(bus_no, name, from_city, to_city , date , time , travel_duration , price,available_seats);
        busdetailsDAO.editBusDetails(newDetails);
        response.sendRedirect("AdminList.jsp");
    }

    private void BookTickets(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException , ServletException{
        
        String email = request.getParameter("Email");
        String mobile_no = request.getParameter("Mobile");
        int no_of_person = Integer.parseInt(request.getParameter("No_of_person"));
        String bus_no = request.getParameter("Bus_no");
        String from_city = request.getParameter("From_city");
        String to_city = request.getParameter("To_city");
        String date = request.getParameter("Date");
        String time = request.getParameter("Time");
        int price = Integer.parseInt(request.getParameter("Price"));
        int available_seats = Integer.parseInt(request.getParameter("Available_seats"));
        String uname = request.getParameter("uname");
        System.out.println(uname);
        UserTicket newDetails = new UserTicket(email, mobile_no , no_of_person, bus_no ,from_city, to_city , date , time , price );

        //update Available seats
        busdetailsDAO.UpdateSeats( bus_no , (available_seats-no_of_person) );
        busdetailsDAO.insertUserDetails(newDetails,uname);
    
        request.setAttribute("price",price*no_of_person);
        //request.setAttribute("amount", price * no_of_person);
        RequestDispatcher view = request.getRequestDispatcher("/payment.jsp");
        view.forward(request, response);

    }

private void deleteDetails(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        
        String bus_no = request.getParameter("Bus_no");
        busdetailsDAO.deleteBusDetails(bus_no);
        response.sendRedirect("AdminList.jsp");
    }

    protected void dispatch(HttpServletRequest request,
    HttpServletResponse response, String page)
        throws javax.servlet.ServletException, java.io.IOException {
    RequestDispatcher dispatcher = getServletContext()
            .getRequestDispatcher(page);
    dispatcher.forward(request, response);
    }


}