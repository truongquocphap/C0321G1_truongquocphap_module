package service;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class DictionaryService {
    public static String dictionary(String vocabulary){
        Map<String,String> map=new HashMap<>();
        map.put("Hello","Xin chào");
        map.put("Why","Tại sao");
        map.put("green","Màu xanh lá");
        map.put("red","Màu đỏ");
        Set<String> set=map.keySet();
        for (String key : set){
            if (key.equals(vocabulary)){
                return map.get(key);
            }
        }
        return "Từ bạn vừa nhập không tìm thấy";
    }
}
