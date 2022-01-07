package mypack;

public class UserTicket {
    public String Email,Mobile,bus_no,From_city,To_city,Date,Time;
    public int No_of_person,Amount;

    public UserTicket(String Email, String Mobile, int No_of_person , String bus_no , String From_city , String To_city , String Date,String Time , int Amount) {
        super();
        
        this.Email = Email;
        this.Mobile = Mobile;
        this.No_of_person = No_of_person;
        this.bus_no = bus_no;
        this.From_city=  From_city;
        this.To_city = To_city;
        this.Date = Date;
        this.Time = Time;
        this.Amount = Amount;
    }

    public String getBus_no() {
        return bus_no;
    }

    public String getEmail() {
        return Email;
    }
    
    public String getMobile() {
        return Mobile;
    }
    
    public int getNo_of_person() {
        return No_of_person;
    }

    public String getFrom_city() {
        return From_city;
    }
    

    public String getTo_city() {
        return To_city;
    }


    public String getDate() {
        return Date;
    }
    
    public String getTime() {
        return Time;
    }

    public int getAmount() {
        return Amount;
    }

  
        
}