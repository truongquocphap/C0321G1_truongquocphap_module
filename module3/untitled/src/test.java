public class test {
    public static void main(String[] args) {
        String s="abcdef";
        int count = 0;
        while (true){
            if (s.substring(0, count).equals(s)){
                System.out.println(count);
                break;
            }
            count++;
        }
    }


}
