package main;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class Baidu {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		String line;
		try{
			
//			URL url = new URL("http://www.bilibili.com/");
			URL url = new URL("http://www.bilibili.com/video/av2930059/");

			URLConnection connect = url.openConnection();
			
			BufferedReader in = new BufferedReader(new InputStreamReader(connect.getInputStream()));
			
			while ((line = in.readLine()) != null) {

				System.out.println(line);
				System.out.println("fuck you");
			}
			
//			System.out.println(url.getFile());
			
		}catch(MalformedURLException e){
			e.printStackTrace();
		}
	}

}
