package xiangyang.com.xiangyang;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class MainActivity extends AppCompatActivity {
    private Handler handler;
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final EditText eText = (EditText)findViewById(R.id.address);
        final TextView tView = (TextView)findViewById(R.id.pageText);

        handler = new Handler(){
            public void handleMessage(Message msg){
                switch(msg.what) {
                    case 0:
                        tView.append((String)msg.obj);
//                        tView.setText((String)msg.obj);
                        break;
                    case 1:
                        tView.setText("");
                        break;
                    default:
                    break;
                }
                super.handleMessage(msg);
            }
        };

        final Button button = (Button)findViewById(R.id.buttonGo);
        button.setOnClickListener(new Button.OnClickListener(){

            @Override
            public void onClick(View v) {
                new Thread(){
                    @Override
                    public void run() {
                        try{
                            Message imsg;
                            imsg = new Message();
                            imsg.what = 1;
                            MainActivity.this.handler.sendMessage(imsg);
                            URL url = new URL(eText.getText().toString());
                            URLConnection conn = url.openConnection();
                            Log.d("",url.toString());
//                    //方式1
                    BufferedReader rd = new BufferedReader(
                            new InputStreamReader(conn.getInputStream()));

                    String line;
                    while((line = rd.readLine())!= null) {
                        Message lMessage;
                        lMessage = new Message();
                        lMessage.what = 0;
                        lMessage.obj = line;
                        MainActivity.this.handler.sendMessage(lMessage);
                    }
//                    方式2
//                            InputStream is = conn.getInputStream();
//                            byte[] result;
//
//                            ByteArrayOutputStream bos = new ByteArrayOutputStream();
//                            while(true) {
//                                byte[] bytes = new byte[64];
//                                int tmp = is.read(bytes);
//                                if(tmp == -1) {
//                                    break;
//                                }
//                                else {
//                                    bos.write(bytes,0,tmp);
//                                }
//                            }
//                            result = bos.toByteArray();
//                            String all;
//                            all = new String(result);
//
//                            Message msg;
//                            msg = new Message();
//                            msg.what = 0;
//                            msg.obj = all;
//                            MainActivity.this.handler.sendMessage(msg);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }

                    }
                }.start();
            }

        });
    }
}
