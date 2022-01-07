package mypack;

public class busDetails {
    
    public String Bus_no;
    public String Name;
    public String From_city, To_city,Date,Time;
    public int Travel_duration,price,available_seats;

    public busDetails(String Bus_no, String Name, String From_city , String To_city , String Date , String Time , int Travel_duration , int price,int available_seats) {
        super();

        this.Bus_no = Bus_no;
        this.Name = Name;
        this.From_city = From_city;
        this.To_city = To_city;
        this.Date = Date;
        this.Time = Time;
        this.Travel_duration = Travel_duration;
        this.price = price;
        this.available_seats = available_seats;

    }


    public String getBus_no() {
        return Bus_no;
    }
    public void setBus_no(String Bus_no) {
        this.Bus_no = Bus_no;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getFrom_city() {
        return From_city;
    }
    
    public void setFrom_city(String From_city) {
        this.From_city = From_city;
    }

    public String getTo_city() {
        return To_city;
    }
    
    public void setTo_city(String To_city) {
        this.To_city = To_city;
    }

    public String getDate() {
        return Date;
    }
    
    public void setDate(String Date) {
        this.Date = Date;
    }

    public String getTime() {
        return Time;
    }
    
    public void setTime(String Time) {
        this.Time = Time;
    }

    public int getTravel_duration() {
        return Travel_duration;
    }
    
    public void setTravel_duration(int Travel_duration) {
        this.Travel_duration = Travel_duration;
    }

    public int getprice() {
        return price;
    }
    
    public void setprice(int price) {
        this.price = price;
    }

    public int getavailable_seats() {
        return available_seats;
    }
    
    public void setavailable_seats(int available_seats) {
        this.available_seats = available_seats;
    }
    

    
}