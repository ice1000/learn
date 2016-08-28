package util;

/**
 * Created by Administrator on 2015/12/24 0024.
 */
public class lesson {
    public String name;
    public String time;
    public int cnt;

    public lesson(String name, String time, int cnt) {
        this.name = name;
        this.time = time;
        this.cnt = cnt;
    }

    public lesson(String name, String time) {
        this.name = name;
        this.time = time;
    }
}
