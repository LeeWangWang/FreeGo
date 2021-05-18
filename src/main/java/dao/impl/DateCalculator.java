package dao.impl;/**
 * 一些声明信息
 * Description: <br/>
 * date: 2021/4/17 12:50<br/>
 *
 * @author hp<br />
 * @version
 * @since JDK 1.8
 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * ClassName: HotelTest <br/>
 * Description: <br/>
 * date: 2021/4/17 12:50<br/>
 * @author hp<br />
 */

public class DateCalculator {
    String dateFormat = "yyyy-MM-dd";
    SimpleDateFormat format = new SimpleDateFormat(dateFormat);

    public static void main(String[] args) {
        DateCalculator t = new DateCalculator();

        String date1 = "2021-05-18";
        String date2 = "2021-05-21";
        List<String> dateList;
        dateList = t.process(date1, date2);
        int i=0;
        for(;i < dateList.size();i++){
            System.out.println(dateList.get(i));
        }
    }

    public List<String> process(String date1, String date2){
        List<String> dateList = new ArrayList<String>();
        if(date1.equals(date2)){
            dateList.add(date1);
            return dateList;
        }
        dateList.add(date1);
        String tmp;
        if(date1.compareTo(date2) > 0){  //确保 date1的日期不晚于date2
            tmp = date1; date1 = date2; date2 = tmp;
        }

        tmp = format.format(str2Date(date1).getTime() + 3600*24*1000);

        int num = 0;
        while(tmp.compareTo(date2) < 0){
            dateList.add(tmp);
            num++;
            tmp = format.format(str2Date(tmp).getTime() + 3600*24*1000);
        }

        if(num == 0) {
            System.out.println("两个日期相邻!");
            dateList.add(date2);
        }else{
            dateList.add(date2);
        }
        return dateList;
    }

    private Date str2Date(String str) {
        if (str == null) return null;

        try {
            return  format.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

}
