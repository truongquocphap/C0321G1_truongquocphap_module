package model.service.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Validate {
//    public static void ngayThangNam(String ngayThangNam){
//        Object contract ;
//        Date start = new SimpleDateFormat("yyyy-MM-dd").parse(contract.getContractStartDate());
//        Date end = new SimpleDateFormat("yyyy-MM-dd").parse(contract.getContractEndDate());
//        Date currentDate = new Date();
//        if (start.after(end)) {
//            Object errors;
//            errors.rejectValue("contractStartDate", "con.start.afterEnd");
//        }
//    }
    public static String tenNguoiThue(String name){
        String message=null;
       String regex = "^[a-zA-z]{5,50}$";
        if (!name.matches(regex)) {
            message = "Tên ng thuê  must contain 5 or 50 ";
        }
         return message;
    }
    public static String validateTelephone(String name) {
        String message = null;
        String regex = "^090\\d{7}|\\(84\\)\\+90\\d{7}|091\\d{7}|\\(84\\)\\+91\\d{7}$";
        if (!name.matches(regex)) {
            message = "Số điện thoại phải đúng định dạng 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx";
        }
        return message;
    }
    public static String ghiChu(String ghiChu){
        String mess=null;
        String regex = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]{0,200}";
        if (!ghiChu.matches(regex)) {
            mess="vượt quá số ký tự cho phép mời nhập lại : 200 ký tự";
        }
        return mess;
    }
}
