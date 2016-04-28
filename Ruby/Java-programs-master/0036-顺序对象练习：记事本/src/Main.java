import java.util.ArrayList;
import java.util.Scanner;

class CityDemo {

 public static void main(String[] args) {
  CityDemo ci=new CityDemo();
  Scanner scan=new Scanner(System.in);
  
  for(;;){
   String s;
   s=scan.next();
   if(s.equals("###"))
    break;
   ci.add(s);
  }
  int len=ci.cityName.size();
  int[][] arr=new int[len][len];
  
  for(int i=0;i<len;i++){
   for(int j=0;j<len;j++){
    arr[i][j]=scan.nextInt();
   }
  }
  ci.setArr(arr);
 
  String firstcity=scan.next();
  String secondcity=scan.next();
  scan.close();
 
  System.out.println(ci.cityDistance(firstcity, secondcity));
  
 }
 
 private ArrayList<String>  cityName=new ArrayList<String>();
 private int[][] arr=new int[this.cityName.size()][this.cityName.size()];
 public void add(String str){
  this.cityName.add(str);
 }
 
 public int[][] getArr() {
  return arr;
 }

 public void setArr(int[][] arr) {
  this.arr = arr;
 }
 
 
 public int cityDistance(String firstcity,String secondcity){
  int first=this.cityName.indexOf(firstcity);
  int second=this.cityName.indexOf(secondcity);
  return arr[first][second];
  
 }

}

