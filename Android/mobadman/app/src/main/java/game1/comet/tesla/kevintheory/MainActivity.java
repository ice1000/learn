package game1.comet.tesla.kevintheory;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Toast;


public class MainActivity extends ActionBarActivity {

    private int cntchange = 1;
    private int cntback = 0;
    private int cntproexcute = 10;
    private int cntprobody = 30;
    private int cntprostdy = 30;
    private ImageView bullet1;
    private ImageView bullet2;
    private ImageView bullet3;
    private ImageView bullet4;
    private ImageView bullet5;
    private ImageView nowpic;
    private ImageView normal;
    private ImageView normal2;
    private ProgressBar body;
    private ProgressBar excite;
    private ProgressBar study;
    private Button left;
    private Button right;
    private ImageView nowbullet;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        bullet1 = (ImageView)findViewById(R.id.imageView2);
        bullet2 = (ImageView)findViewById(R.id.imageView3);
        bullet3 = (ImageView)findViewById(R.id.imageView5);
        bullet4 = (ImageView)findViewById(R.id.imageView6);
        bullet5 = (ImageView)findViewById(R.id.imageView8);
        normal = (ImageView)findViewById(R.id.imageView);
        normal2 = (ImageView)findViewById(R.id.imageView4);
        excite = (ProgressBar)findViewById(R.id.progressBar);
        excite.setMax(300);
        body = (ProgressBar)findViewById(R.id.progressBar2);
        body.setMax(300);
        study = (ProgressBar)findViewById(R.id.progressBar3);
        study.setMax(300);
        left = (Button)findViewById(R.id.button);
        right = (Button)findViewById(R.id.button2);
        nowbullet = bullet1;
        nowpic = normal;

        toast("Use weapon shoot Kevin!");

        final Animation bulletmove = AnimationUtils.loadAnimation(this, R.anim.anim);

        right.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                cntchange ++;
                switch( cntchange % 5 ){
                    case 1:
                        toast("\"Pants\" is ready!");
                        bullet5.setVisibility(View.INVISIBLE);
                        bullet1.setVisibility(View.VISIBLE);
                        nowbullet = bullet1;
                        break;
                    case 2:
                        toast("\"Mashiro\" is ready!");
                        bullet1.setVisibility(View.INVISIBLE);
                        bullet2.setVisibility(View.VISIBLE);
                        nowbullet = bullet2;
                        break;
                    case 3:
                        toast("\"Mathbook\" is ready!");
                        bullet2.setVisibility(View.INVISIBLE);
                        bullet3.setVisibility(View.VISIBLE);
                        nowbullet = bullet3;
                        break;
                    case 4:
                        toast("\"Mr.Shao\" is ready!");
                        bullet3.setVisibility(View.INVISIBLE);
                        bullet4.setVisibility(View.VISIBLE);
                        nowbullet = bullet4;
                        break;
                    case 0:
                        toast("\"Ms.Wang\" is ready!");
                        bullet4.setVisibility(View.INVISIBLE);
                        bullet5.setVisibility(View.VISIBLE);
                        nowbullet = bullet5;
                        break;
                    default:
                        break;
                }
            }
        });

        left.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                nowbullet.startAnimation(bulletmove);

                if( nowbullet == bullet1 ){
                    cntproexcute += 18;
                    cntprobody -= 17;
                    cntprostdy -= 11;
                    excite.setProgress(cntproexcute%300);
                    body.setProgress(cntprobody%300);
                    study.setProgress(cntprostdy%300);
                }
                if( nowbullet == bullet2 ){
                    cntproexcute += 32;
                    cntprobody -= 15;
                    cntprostdy -= 22;
                    excite.setProgress(cntproexcute%300);
                    body.setProgress(cntprobody%300);
                    study.setProgress(cntprostdy%300);
                }
                if( nowbullet == bullet3 ){
                    cntproexcute -= 16;
                    cntprobody += 33;
                    cntprostdy += 22;
                    excite.setProgress(cntproexcute%300);
                    body.setProgress(cntprobody%300);
                    study.setProgress(cntprostdy%300);
                }
                if( nowbullet == bullet4 ){
                    cntproexcute -= 26;
                    cntprobody += 43;
                    cntprostdy += 32;
                    excite.setProgress(cntproexcute%300);
                    body.setProgress(cntprobody%300);
                    study.setProgress(cntprostdy%300);
                }
                if( nowbullet == bullet5 ){
                    cntproexcute -= 20;
                    cntprobody -= 37;
                    cntprostdy += 31;
                    excite.setProgress(cntproexcute%300);
                    body.setProgress(cntprobody%300);
                    study.setProgress(cntprostdy%300);
                }
                cntprobody %= 300;
                cntproexcute %= 300;
                cntprostdy %= 300;

                if( cntprobody >= 200 ){
                    if( cntproexcute >= 190 ){
                        if( cntproexcute >= 260 ){
                            nowpic.setVisibility(View.INVISIBLE);
                            nowpic = normal2;
                            nowpic.setVisibility(View.VISIBLE);
                            toast("Oh!!I need ero!");
                        }else {
                            nowpic.setVisibility(View.INVISIBLE);
                            nowpic = normal;
                            nowpic.setVisibility(View.VISIBLE);
                            toast("Oh,I feel exciting!");
                        }
                    }
                    if( cntprostdy >= 180 ){
                        if( cntprostdy >= 250 ){
                            nowpic.setVisibility(View.INVISIBLE);
                            nowpic = normal2;
                            nowpic.setVisibility(View.VISIBLE);
                            toast("Oh,I must study!");
                        }else {
                            nowpic.setVisibility(View.INVISIBLE);
                            nowpic = normal;
                            nowpic.setVisibility(View.VISIBLE);
                            toast("Everyone needs learn!");
                        }
                    }
                }
                cntback++;
                if( cntback == 10 ){
                    nowpic = normal2;
                    toast("Hmm,there`s nothing!");
                }
            }
        });
    }

    private void toast(String txt){
        Toast.makeText(this,txt,Toast.LENGTH_SHORT).show();
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
