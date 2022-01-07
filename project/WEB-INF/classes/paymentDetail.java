package mypack;

public class paymentDetail {
    public String cardOwner,cardNumber;
    public int Expiry_Month,Expiry_Year,CVV,Amount;

    public paymentDetail(String cardOwner, String cardNumber, int Expiry_Month, int Expiry_Year, int CVV ,int Amount) {
        super();
        this.cardOwner = cardOwner;
        this.cardNumber = cardNumber;
        this.Expiry_Month = Expiry_Month;
        this.Expiry_Year = Expiry_Year;
        this.CVV = CVV;
        this.Amount = Amount;
    }

    public String getcardOwner() {
        return cardOwner;
    }
    
    public String getcardNumber() {
        return cardNumber;
    }

    public int getExpiryMonth() {
        return Expiry_Month;
    }
    
    public int getExpiryYear() {
        return Expiry_Year;
    }
    public int getCVV() {
        return CVV;
    }
    public int getAmount() {
        return Amount;
    }   
}