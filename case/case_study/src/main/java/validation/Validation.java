package validation;

public class Validation {
    public static  boolean checkMail(String email){
        String regexEmail = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
        return email.matches(regexEmail);
    }
    public static boolean checkName(String name){
        String regexName="^[A-Z]+[a-zA-Z]{5,20}$";
        return name.matches(regexName);
    }
    public static boolean checkPhoneNumber(String phoneNumber){
        String regexPhoneNumber="^[(+84)]+[0-9]{9}$";
        return phoneNumber.matches(regexPhoneNumber);
    }  public static boolean checkBirthDay(String birthDay){
        String regexBirthDay=  "^(19|20)\\d\\d[-/.](0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])$" ;
        return birthDay.matches(regexBirthDay);
    }

}
