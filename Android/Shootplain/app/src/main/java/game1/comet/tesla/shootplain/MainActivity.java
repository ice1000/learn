package game1.comet.tesla.shootplain;

import android.media.AudioManager;
import android.media.SoundPool;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    private int cnt = 1;
    private ImageButton but;
    private ImageView left;
    private TextView text;
    private ImageView Oscar;
    private ImageView boom;
    private SoundPool sounds;
    private ImageView bottle;
    private int hit = 0;
    private int extraHit = 0;
    private int bigHit = 0;
    private int boomHit = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Animation cartoon = AnimationUtils.loadAnimation(this, R.anim.anim);
        final Animation hurt = AnimationUtils.loadAnimation(this, R.anim.hurt);
        final Animation shakeTo = AnimationUtils.loadAnimation(this, R.anim.shaketo);
        final Animation shakeBack = AnimationUtils.loadAnimation(this, R.anim.shakeback);
        final Animation slowMove = AnimationUtils.loadAnimation(this, R.anim.slower);

        final ProgressBar extraBar = (ProgressBar) findViewById(R.id.progressBar);
        final ProgressBar killingBar = (ProgressBar) findViewById(R.id.progressBar2);
        final ProgressBar boomBar = (ProgressBar) findViewById(R.id.progressBar3);

        but = (ImageButton)findViewById(R.id.imageButton);
        Oscar = (ImageView)findViewById(R.id.imageView);
        text = (TextView)findViewById(R.id.textView);
        boom = (ImageView)findViewById(R.id.imageView6);
        bottle = (ImageView)findViewById(R.id.imageView2);

        sounds = new SoundPool(4, AudioManager.STREAM_MUSIC,1);
        hit = sounds.load(this,R.raw.hit,1);
        extraHit = sounds.load(this,R.raw.extrahit,1);
        bigHit = sounds.load(this,R.raw.bighit,1);
        boomHit = sounds.load(this,R.raw.boomhit,1);

        extraBar.setMax(20);
        killingBar.setMax(50);
        boomBar.setMax(100);

//        boom.startAnimation(hide);

        but.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                bottle.startAnimation(shakeTo);
                bottle.startAnimation(shakeBack);

                String out;
                if( cnt % 10 != 0 ){
                    left = (ImageView)findViewById(R.id.imageView4);
                }
                if( cnt % 50 == 1){
                    boom.setImageResource(R.drawable.voidgraph);
                    boom.startAnimation(hurt);
                }
//make them as they were at first.
                if( cnt % 100 == 0 ){
                    left = (ImageView)findViewById(R.id.imageView7);
                    out = "DISTROY!!!";
                }else if( cnt % 50 == 0 ){
                    left = (ImageView)findViewById(R.id.imageView5);
                    out = "Kill!!!";
                }else if( cnt % 20 == 0 ){
                    left = (ImageView)findViewById(R.id.imageView5);
                    out = "Extra hit!!!";
                }else{
                    left = (ImageView)findViewById(R.id.imageView4);
                    out = String.format("%d hit!!",cnt);
                }
                if ((cnt%100) >= 95 ){
                    out = "William`s ready!";
                }
//make the shape&text.
                text.setText(out);
                if( cnt % 100 == 0 ){
                    left.startAnimation(slowMove);
                }else {
                    left.startAnimation(cartoon);
                }

                extraBar.setProgress(cnt % 20);
                killingBar.setProgress(cnt % 50);
                boomBar.setProgress(cnt % 100);
                cnt++;

                slowMove.setAnimationListener(new Animation.AnimationListener() {
                    @Override
                    public void onAnimationStart(Animation animation) {
                    }

                    @Override
                    public void onAnimationRepeat(Animation animation) {
                    }

                    @Override
                    public void onAnimationEnd(Animation animation) {
                        playsound('e');
                        boom.setImageResource(R.drawable.bigbang);
                        boom.startAnimation(hurt);
                    }
                });

                cartoon.setAnimationListener(new Animation.AnimationListener() {
                    @Override public void onAnimationStart(Animation animation) {}
                    @Override public void onAnimationRepeat(Animation animation) {}
                    @Override public void onAnimationEnd(Animation animation) {
                        if( (cnt-1) % 50 == 0 ){
//                            playsound('l');
                            boom.setImageResource(R.drawable.boom);
                            boom.startAnimation(hurt);
                        }else if( (cnt-1) % 20 == 0 ){
                            playsound('m');
                        }else {
                            playsound('s');
                        }
                    }
                });
//shoot
            }
        });
    }

    private void playsound(char choice){
        switch (choice){
            case 's':
                sounds.play(hit,1,1,0,0,1);
                break;
            case 'l':
                sounds.play(extraHit,1,1,0,0,1);
                break;
            case 'm':
                sounds.play(bigHit,1,1,0,0,1);
                break;
            case 'e':
                sounds.play(boomHit,1,1,0,0,1);
                break;
            default:
                break;
        }
        choice = '\0';
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
