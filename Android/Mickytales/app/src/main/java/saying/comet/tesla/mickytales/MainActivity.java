package saying.comet.tesla.mickytales;

import android.graphics.drawable.Drawable;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends ActionBarActivity {

    private Button nextpage;
    private ImageView face1;
    private ImageView interesting;
    private ImageView mickey1;
    private ImageView mickey2;
    private ImageView mickey3;
    private ImageView mickey4;
    private ImageView mickey5;
    private ImageView mickey6;
    private ImageView mickey7;
    private ImageView mickeyfinal;
    private ImageView newpic1;
    private ImageView newpic2;
    private int cnt = -2;
    private TextView maker1;
    private TextView maker2;
    private TextView maker3;
    private TextView maker4;
    private TextView nowText;
    private TextView newText;
    private String nowString;
    private String newString;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        nextpage = (Button)findViewById(R.id.button);
        maker1 = (TextView)findViewById(R.id.maker_name);
        maker2 = (TextView)findViewById(R.id.writer_name);
        maker3 = (TextView)findViewById(R.id.QQ);
        maker4 = (TextView)findViewById(R.id.baidu);
        mickey1 = (ImageView)findViewById(R.id.mickey);
        mickey2 = (ImageView)findViewById(R.id.mickey2);
        mickey3 = (ImageView)findViewById(R.id.mickey3);
        mickey4 = (ImageView)findViewById(R.id.mickey4);
        mickey5 = (ImageView)findViewById(R.id.mickey5);
        mickey6 = (ImageView)findViewById(R.id.mickey6);
        mickey7 = (ImageView)findViewById(R.id.mickey7);
        mickeyfinal = (ImageView)findViewById(R.id.mickeyfinal);
        newpic1 = (ImageView)findViewById(R.id.newpic1);
        newpic2 = (ImageView)findViewById(R.id.newpic2);
        face1 = (ImageView)findViewById(R.id.face1);
        interesting = (ImageView)findViewById(R.id.interesting);
        nowText = (TextView)findViewById(R.id._1);
        newText = (TextView)findViewById(R.id._2);
        nowText.setText(nowString);
        newText.setText(newString);
        newString = getString(R.string.Text1);

        nextPage_theMainClass();

    }

    public void createrAppear() {
        final Animation from = AnimationUtils.loadAnimation(this, R.anim.from);

        maker1.setVisibility(View.VISIBLE);
        maker2.setVisibility(View.VISIBLE);
        maker3.setVisibility(View.VISIBLE);
        maker4.setVisibility(View.VISIBLE);

        maker1.startAnimation(from);
        maker2.startAnimation(from);
        maker3.startAnimation(from);
        maker4.startAnimation(from);
    }

    public void createrDisappear() {
        final Animation to = AnimationUtils.loadAnimation(this, R.anim.to);

        maker1.startAnimation(to);
        maker2.startAnimation(to);
        maker3.startAnimation(to);
        maker4.startAnimation(to);

        maker1.setVisibility(View.INVISIBLE);
        maker2.setVisibility(View.INVISIBLE);
        maker3.setVisibility(View.INVISIBLE);
        maker4.setVisibility(View.INVISIBLE);
    }

    public void letsSetNowPicture(ImageView nowpic,ImageView newpic) {
        final Animation ifrom = AnimationUtils.loadAnimation(this, R.anim.ifrom);
        final Animation ito = AnimationUtils.loadAnimation(this, R.anim.ito);

        nowpic.startAnimation(ito);
        nowpic.setVisibility(View.INVISIBLE);
        newpic.setVisibility(View.VISIBLE);
        newpic.startAnimation(ifrom);
    }

    public void textIn(int resId,TextView nowtext, TextView newtext){
        final Animation from = AnimationUtils.loadAnimation(this, R.anim.from);
        final Animation to = AnimationUtils.loadAnimation(this, R.anim.to);

        nowtext.startAnimation(to);
        nowtext.setVisibility(View.INVISIBLE);
        newtext.setVisibility(View.VISIBLE);
        newtext.startAnimation(from);
        nowString = newString;
        newString = getString(resId);
        nowtext.setText(nowString);
        newtext.setText(newString);
    }

    private void setToast(String comment){
        Toast toast = Toast.makeText(this, comment, Toast.LENGTH_SHORT);
        toast.show();
    }

    private void nextPage_theMainClass(){
        final Animation from = AnimationUtils.loadAnimation(this, R.anim.from);
        final Animation to = AnimationUtils.loadAnimation(this, R.anim.to);
        final Animation ifrom = AnimationUtils.loadAnimation(this, R.anim.ifrom);
//        final Animation ito = AnimationUtils.loadAnimation(this, R.anim.ito);

        nextpage.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                switch( cnt ){
                    case -2:
                        createrAppear();
                        break;
                    case -1:
                        createrDisappear();
                        mickey3.setVisibility(View.VISIBLE);
                        mickey3.startAnimation(ifrom);
                        newText.setVisibility(View.VISIBLE);
                        newText.startAnimation(from);
                        break;
                    case 0:
                        nowString = newString;
                        newString = getString(R.string.Text2);
                        nowText.setText(nowString);
                        newText.setText(newString);
                        nowText.startAnimation(to);
                        newText.startAnimation(from);
                        newText.setVisibility(View.VISIBLE);
                        nowText.setVisibility(View.INVISIBLE);
                        letsSetNowPicture(mickey3, newpic1);
                        break;
                    case 1:
                        textIn(R.string.Text3,  nowText, newText);
                        break;
                    case 2:
                        textIn(R.string.Text4,  nowText, newText);
                        break;
                    case 3:
                        textIn(R.string.Text5,  nowText, newText);
                        letsSetNowPicture(newpic1, mickey2);
                        break;
                    case 4:
                        textIn(R.string.Text6,nowText,newText);
                        break;
                    case 5:
                        textIn(R.string.Text7,nowText,newText);
                        break;
                    case 6:
                        textIn(R.string.Text8,nowText,newText);
                        break;
                    case 7:
                        textIn(R.string.Text9,nowText,newText);
                        break;
                    case 8:
                        textIn(R.string.Text10,nowText,newText);
                        break;
                    case 9:
                        textIn(R.string.Text11,nowText,newText);
                        break;
                    case 10:
                        textIn(R.string.Text12,  nowText, newText);
                        break;
                    case 11:
                        textIn(R.string.Text13,nowText,newText);
                        letsSetNowPicture(mickey2, mickey4);
                        break;
                    case 12:
                        textIn(R.string.Text14,nowText,newText);
                        break;
                    case 13:
                        textIn(R.string.Text15, nowText, newText);
                        break;
                    case 14:
                        textIn(R.string.Text16,  nowText, newText);
                        letsSetNowPicture(mickey4, newpic2);
                        break;
                    case 15:
                        textIn(R.string.Text17,nowText,newText);
                        break;
                    case 16:
                        textIn(R.string.Text18,  nowText, newText);
                        break;
                    case 17:
                        textIn(R.string.Text19,  nowText, newText);
                        letsSetNowPicture(newpic2, mickey5);
                        break;
                    case 18:
                        textIn(R.string.Text20,nowText,newText);
                        break;
                    case 19:
                        textIn(R.string.Text21,nowText,newText);
                        break;
                    case 20:
                        textIn(R.string.Text22,nowText,newText);
                        break;
                    case 21:
                        textIn(R.string.Text23,  nowText, newText);
                        break;
                    case 22:
                        textIn(R.string.Text24,  nowText, newText);
                        letsSetNowPicture(mickey5, mickey6);
                        break;
                    case 23:
                        textIn(R.string.Text25,nowText,newText);
                        break;
                    case 24:
                        textIn(R.string.Text26,nowText,newText);
                        break;
                    case 25:
                        textIn(R.string.Text27,nowText,newText);
                        break;
                    case 26:
                        textIn(R.string.Text28,nowText,newText);
                        break;
                    case 27:
                        textIn(R.string.Text29,nowText,newText);
                        break;
                    case 28:
                        textIn(R.string.Text30,nowText,newText);
                        break;
                    case 29:
                        textIn(R.string.Text31,nowText,newText);
                        break;
                    case 30:
                        textIn(R.string.Text32,  nowText, newText);
                        break;
                    case 31:
                        textIn(R.string.Text33,  nowText, newText);
                        letsSetNowPicture(mickey6, mickey7);
                        break;
                    case 32:
                        textIn(R.string.Text34,nowText,newText);
                        break;
                    case 33:
                        textIn(R.string.Text35,nowText,newText);
                        break;
                    case 34:
                        textIn(R.string.Text36,nowText,newText);
                        break;
                    case 35:
                        textIn(R.string.Text37,  nowText, newText);
                        break;
                    case 36:
                        textIn(R.string.Text38,  nowText, newText);
                        letsSetNowPicture(mickey7, mickey1);
                        break;
                    case 37:
                        textIn(R.string.Text39,nowText,newText);
                        break;
                    case 38:
                        textIn(R.string.Text40,nowText,newText);
                        break;
                    case 39:
                        textIn(R.string.Text41,  nowText, newText);
                        break;
                    case 40:
                        textIn(R.string.Text42,  nowText, newText);
                        letsSetNowPicture(mickey1, mickeyfinal);
                        break;
                    case 41:
                        textIn(R.string.Text43,nowText,newText);
                        break;
                    case 42:
                        textIn(R.string.Text44,  nowText, newText);
                        break;
                    case 43:
                        textIn(R.string.Text45,  nowText, newText);
                        letsSetNowPicture(mickeyfinal, face1);
                        break;
                    case 44:
                        textIn(R.string.Text46,nowText,newText);
                        break;
                    case 50:
                        textIn(R.string.Text47,nowText,newText);
                        letsSetNowPicture(face1,interesting);
                        break;
                    default:
                        setToast("sorry,there`s nothing.");
                        break;
                }
                cnt ++;
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
