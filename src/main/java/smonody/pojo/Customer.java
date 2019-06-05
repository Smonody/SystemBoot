package smonody.pojo;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
public class Customer {
    private Integer id;
    private String cusName;
/*    private String cusPwd;*/
    private String cusFrom;
    private String cusIndustry ;
    private String cusLevel;
    private String cusPhone;
    private String cusFixedPhone;
    private String cusOperation;

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", cusName='" + cusName + '\'' +
                ", cusFrom='" + cusFrom + '\'' +
                ", cusIndustry='" + cusIndustry + '\'' +
                ", cusLevel='" + cusLevel + '\'' +
                ", cusPhone='" + cusPhone + '\'' +
                ", cusFixedPhone='" + cusFixedPhone + '\'' +
                ", cusOperation='" + cusOperation + '\'' +
                '}';
    }
}
