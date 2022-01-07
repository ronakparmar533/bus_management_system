package mypack;

import mypack.busDetails;
import mypack.FetchBean;
import java.sql.*;
import java.util.*;


public class busDetailsDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3307/mydemo?";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    //public int userID = 1;
    private static final String INSERT_REGISTRATION_DETAILS_QUERY="INSERT INTO users" + "  (fullname, email ,userName, password ) VALUES " +
        " (?,?,?,?);";  

    private static final String INSERT_BUSDETAILS_SQL = "INSERT INTO bus_details" + "  (Bus_no, Name, From_city,To_city , Date , Time , Travel_duration , Price ,available_seats) VALUES " +
        " (?, ?, ? , ?, ?, ? , ? , ?,?);";

    private static final String EDIT_BUSDETAILS_SQL = "UPDATE bus_details SET Name=?, From_city=?, To_city=?, Date=?, Time=?, Travel_duration=?, Price=? ,available_seats=? WHERE Bus_no=?";
    private static final String DELETE_BUSDETAILS_SQL = "DELETE from bus_details where Bus_no=?";
    //update 
    private static final String INSERT_USER_DETAILS_QUERY = "INSERT INTO Book_ticket_details" + "  (Email, Mobile ,No_of_person,Bus_no,From_city,To_city , Date , Time , Amount,user_id ) VALUES " +
        " (?,?,?,?,?,?,?,?,?,?);";    

    private static final String INSERT_PAYMENT_DETAILS_QUERY = "INSERT INTO payment_details" + " (Card_Owner_Name, Card_No,Expiry_Month,Expiry_Year,CVV,Amount) VALUES " +" (?,?,?,?,?,?);";        

    private static final String SELECT_ALL_BUSDETAILS = "select * from bus_details";
    private static final String SELECT_ALL_TICKETDETAILS = "select * from Book_ticket_details";

    private static final String UPDATE_SEATS = "UPDATE bus_details SET available_seats = ? WHERE Bus_no=? ";
  
  //  private static final String SELECT_USER_TICKETDETAILS = "select * from Book_ticket_details where user_id='"+ userID +"'";
    public busDetailsDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    //Registration 
    public void insertRegistration(FetchBean details) throws SQLException {
        System.out.println(INSERT_REGISTRATION_DETAILS_QUERY);
        try (Connection connection = getConnection(); 
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_REGISTRATION_DETAILS_QUERY)) {
            preparedStatement.setString(1, details.getFullname());
            preparedStatement.setString(2, details.getEmail());
            preparedStatement.setString(3, details.getUsername());
            preparedStatement.setString(4, details.getPassword());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }


    public String authenticateUser(FetchBean fetchbean){
        String userName = fetchbean.getUsername();
        String password = fetchbean.getPassword();

        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select userName,password from users");) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            String userNameDB = "";
            String passwordDB = "";
            while (rs.next()) {
                userNameDB = rs.getString("userName");
                passwordDB = rs.getString("password");

                if(userName.equals(userNameDB) && password.equals(passwordDB)){
                    return "SUCCESS";
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }

        return "Invalid user credentials";

    }


    // INSERT PAYMENT DETAILS METHOD FOR DATA STORAGE IN DB
    // insertPaymentDetails
    public void insertPaymentDetails(paymentDetail details) throws SQLException {
        System.out.println(INSERT_PAYMENT_DETAILS_QUERY);
        try (Connection connection = getConnection(); 
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PAYMENT_DETAILS_QUERY)) {
            preparedStatement.setString(1, details.getcardOwner());
            preparedStatement.setString(2, details.getcardNumber());
            preparedStatement.setInt(3, details.getExpiryMonth());
            preparedStatement.setInt(4, details.getExpiryYear());
            preparedStatement.setInt(5, details.getCVV());
            preparedStatement.setInt(6, details.getAmount());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }



    public void insertBusDetails(busDetails details) throws SQLException {
        System.out.println(INSERT_BUSDETAILS_SQL);
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BUSDETAILS_SQL)) {
            preparedStatement.setString(1, details.getBus_no());
            preparedStatement.setString(2, details.getName());
            preparedStatement.setString(3, details.getFrom_city());
            preparedStatement.setString(4, details.getTo_city());
            preparedStatement.setString(5, details.getDate());
            preparedStatement.setString(6, details.getTime());
            preparedStatement.setInt(7, details.getTravel_duration());
            preparedStatement.setInt(8, details.getprice());
            preparedStatement.setInt(9, details.getavailable_seats());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // insert data in table those who have book ticket
    public void insertUserDetails(UserTicket Ticketdetails,String uname) throws SQLException {
        System.out.println(INSERT_USER_DETAILS_QUERY);
         String userQuery = "select user_id from users where userName = '"+ uname +"'";
         int userID = 1 ;
         System.out.println(userQuery);
        try (Connection connection = getConnection(); 
            PreparedStatement ps = connection.prepareStatement(userQuery); 
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_DETAILS_QUERY);) {
                  ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    userID = rs.getInt("user_id");
                }
            preparedStatement.setString(1, Ticketdetails.getEmail());
            preparedStatement.setString(2, Ticketdetails.getMobile());
            preparedStatement.setInt(3, Ticketdetails.getNo_of_person());
            preparedStatement.setString(4, Ticketdetails.getBus_no());
            preparedStatement.setString(5, Ticketdetails.getFrom_city());
            preparedStatement.setString(6, Ticketdetails.getTo_city());
            preparedStatement.setString(7, Ticketdetails.getDate());
            preparedStatement.setString(8, Ticketdetails.getTime());
            preparedStatement.setInt(9, Ticketdetails.getAmount()*Ticketdetails.getNo_of_person());
            preparedStatement.setInt(10,userID);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
              
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // update bus details code
    public void editBusDetails(busDetails details) throws SQLException {
        System.out.println(EDIT_BUSDETAILS_SQL);
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_BUSDETAILS_SQL)) {
            preparedStatement.setString(1, details.getName());
            preparedStatement.setString(2, details.getFrom_city());
            preparedStatement.setString(3, details.getTo_city());
            preparedStatement.setString(4, details.getDate());
            preparedStatement.setString(5, details.getTime());
            preparedStatement.setInt(6, details.getTravel_duration());
            preparedStatement.setInt(7, details.getprice());
            preparedStatement.setInt(8, details.getavailable_seats());
            preparedStatement.setString(9, details.getBus_no());

            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    //DELETE BUS DETAILS FUNCTION
    public void deleteBusDetails(String bus_no) throws SQLException {
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BUSDETAILS_SQL)) {
            preparedStatement.setString(1, bus_no);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    //update available seats
    public void UpdateSeats(String bus_no , int available_seats){

            try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SEATS);) {
            
            preparedStatement.setInt(1, available_seats);
            preparedStatement.setString(2, bus_no);

            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }        

    }

     // search bus function
     public List<busDetails> SearchList(String from , String to){
        
        String SEARCH_QUERY ="select * from bus_details where From_city='" + from + "' AND To_city='" + to + "' ";
        List <busDetails> bus_details = new ArrayList<>();
        try (Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_QUERY);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String bus_no = rs.getString("Bus_no");
                String name = rs.getString("Name");
                String from_city = rs.getString("From_city");
                String to_city = rs.getString("To_city");
                String date = rs.getString("Date");
                String time = rs.getString("Time");
                int travel_duration = rs.getInt("Travel_duration");
                int price = rs.getInt("Price");
                int available_seats = rs.getInt("available_seats");

                bus_details.add(new busDetails(bus_no, name, from_city, to_city , date , time , travel_duration , price,available_seats));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return bus_details;

     }


    public List < busDetails > selectAllDetails() {

        // using try-with-resources to avoid closing resources
        List < busDetails > bus_details = new ArrayList <>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BUSDETAILS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object. 
            while (rs.next()) {
                String bus_no = rs.getString("Bus_no");
                String name = rs.getString("Name");
                String from_city = rs.getString("From_city");
                String to_city = rs.getString("To_city");
                String date = rs.getString("Date");
                String time = rs.getString("Time");
                int travel_duration = rs.getInt("Travel_duration");
                int price = rs.getInt("Price");
                int available_seats = rs.getInt("available_seats");

                bus_details.add(new busDetails(bus_no, name, from_city, to_city , date , time , travel_duration , price, available_seats));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return bus_details;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }


    // user booking ticket details function 

    public List < UserTicket > selectAllTicketDetails() {

        List < UserTicket > ticket_details = new ArrayList<>();
        try (Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TICKETDETAILS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
         
            while (rs.next()) {
                String email = rs.getString("Email");
                String mobile = rs.getString("Mobile");
                int no_of_person = rs.getInt("No_of_person");
                String bus_no = rs.getString("Bus_no");
                String from_city = rs.getString("From_city");
                String to_city = rs.getString("To_city");
                String date = rs.getString("Date");
                String time = rs.getString("Time");
                int price = rs.getInt("Amount");
               

                // Email, Mobile ,No_of_person,Bus_no,From_city,To_city , Date , Time , Amount

                ticket_details.add(new UserTicket(email, mobile ,no_of_person,bus_no, from_city, to_city , date , time , price));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return ticket_details;
    }
// user booking ticket details function 
    public List <UserTicket> selectUserTicketDetails(String uname) {
        String userQuery = "select user_id from users where userName = '"+ uname +"'";
         int userID = 1 ;
         System.out.println(userQuery);
        List < UserTicket > ticket_details = new ArrayList<>();
        try (Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(userQuery);) {
            ResultSet rsss = ps.executeQuery();
            while (rsss.next()) {
                userID = rsss.getInt("user_id");
            }
            PreparedStatement preparedStatement = connection.prepareStatement("select * from Book_ticket_details where user_id='"+ userID +"'");
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
         
            while (rs.next()) {
                String email = rs.getString("Email");
                String mobile = rs.getString("Mobile");
                int no_of_person = rs.getInt("No_of_person");
                String bus_no = rs.getString("Bus_no");
                String from_city = rs.getString("From_city");
                String to_city = rs.getString("To_city");
                String date = rs.getString("Date");
                String time = rs.getString("Time");
                int price = rs.getInt("Amount");

                // Email, Mobile ,No_of_person,Bus_no,From_city,To_city , Date , Time , Amount

                ticket_details.add(new UserTicket(email, mobile ,no_of_person,bus_no, from_city, to_city , date , time , price));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return ticket_details;
    }


}