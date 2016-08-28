package lesson.tesla.watchlessonlist;

import android.annotation.TargetApi;
import android.database.DataSetObserver;
import android.os.Build;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.PagerTitleStrip;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SimpleAdapter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MainActivity extends AppCompatActivity {

    private ViewPager pager;
//    private PagerTabStrip tabStrip;
    private PagerTitleStrip titleStrip;
    private PagerAdapter adapter;
    private LayoutInflater lf;
    private ArrayList<View> views;
    private ArrayList<String> titles;
    private Adapter[] listAdapters;
    private RecyclerView[] listViews;

    @TargetApi(Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        pager = (ViewPager) findViewById(R.id.viewPager);
//        tabStrip = (PagerTabStrip) findViewById(R.id.pagerTab);
        titleStrip = (PagerTitleStrip) findViewById(R.id.pagerTitle);

//        tabStrip.setTabIndicatorColorResource(R.color.skyBlue);
//        tabStrip.setDrawFullUnderline(false);
//        tabStrip.setBackgroundColor(getResources().getColor(R.color.white));
//        tabStrip.setTextSpacing(50);

        getLayoutInflater();
        lf = LayoutInflater.from(this);

        views = new ArrayList<>();
        views.add( lf.inflate(R.layout.monday, null))    ;
        views.add( lf.inflate(R.layout.tuesday, null))   ;
        views.add( lf.inflate(R.layout.wednesday, null)) ;
        views.add( lf.inflate(R.layout.thursday, null))  ;
        views.add( lf.inflate(R.layout.friday, null))    ;
        views.add( lf.inflate(R.layout.saturday, null))  ;
        views.add( lf.inflate(R.layout.sunday, null))    ;

        titles = new ArrayList<>();
        titles.add("星期一");
        titles.add("星期二");
        titles.add("星期三");
        titles.add("星期四");
        titles.add("星期五");
        titles.add("星期六");
        titles.add("星期日");

        adapter = new PagerAdapter() {
            @Override
            public int getCount() {
                return views.size();
            }
            @Override
            public boolean isViewFromObject(View view, Object object) {
                return view == object;
            }
            @Override
            public void destroyItem(ViewGroup container, int position, Object object) {
                container.removeView(views.get(position));
            }
            @Override
            public CharSequence getPageTitle(int position) {
                return titles.get(position);
            }

            @Override
            public Object instantiateItem(ViewGroup container, int position) {
                container.addView(views.get(position));
                return views.get(position);
            }
        };

        pager.setAdapter(adapter);

        listViews = new RecyclerView[7];
        listAdapters = new Adapter[7];
        listViews[0] = (RecyclerView) findViewById(R.id.listView1);
        listViews[1] = (RecyclerView) findViewById(R.id.listView2);
        listViews[2] = (RecyclerView) findViewById(R.id.listView3);
        listViews[3] = (RecyclerView) findViewById(R.id.listView4);
        listViews[4] = (RecyclerView) findViewById(R.id.listView5);
        listViews[5] = (RecyclerView) findViewById(R.id.listView6);
        listViews[6] = (RecyclerView) findViewById(R.id.listView7);

//        listAdapters[0] = new Adapter(this, getData(0), R.layout.unit,
//                new String[]{"1","2"}, new int[]{R.id.name,R.id.time});
//        listAdapters[1]
//        listAdapters[2]
//        listAdapters[3]
//        listAdapters[4]
//        listAdapters[5]
//        listAdapters[6]

        listViews[0].setAdapter( listAdapters[0]);
    }

    /**
     *  @param day:It`s from 0 to 6.
     */
    private List<Map<String, Object>> getData(int day){
        List<Map<String, Object>> data = new ArrayList<>();
        Map<String, Object> map = new HashMap<>();

        map.put("name", "示例名称");
        map.put("time", "示例时间");
        data.add(map);
        map.clear();

        map.put("name", "示例名称");
        map.put("time", "示例时间");
        data.add(map);
        map.clear();

        map.put("name", "示例名称");
        map.put("time", "示例时间");
        data.add(map);
        map.clear();

        map.put("name", "示例名称");
        map.put("time", "示例时间");
        data.add(map);
        map.clear();

        return data;
    }
}
