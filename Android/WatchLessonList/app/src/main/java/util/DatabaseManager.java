package util;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;

import java.io.Closeable;

/**
 * Created by Administrator on 2015/12/14 0014.
 */
public class DatabaseManager implements Closeable{

    private DatabaseOpenHelper helper;
    private SQLiteDatabase database;

    public DatabaseManager(Context context) {
        onCreate(context);
    }

    private void onCreate(Context context){
        helper = new DatabaseOpenHelper(context);
//        可读可写
        database = helper.getWritableDatabase();
        helper.createDay(database, "monday");
        helper.createDay(database, "tuesday");
        helper.createDay(database, "wednesday");
        helper.createDay(database, "thursday");
        helper.createDay(database, "friday");
        helper.createDay(database, "saturday");
        helper.createDay(database, "sunday");
//        helper.close();
    }


//    增加一组声音
//    public void addSounds(String groupName, List<lesson> sounds) {
//        database.beginTransaction();
//        try{
//            for (lesson sound:sounds) {
//                ContentValues contentValues = new ContentValues();
////                contentValues.put("name", sound.name);
//                contentValues.put("id", sound.id);
//                contentValues.put("time", sound.time);
//                contentValues.put("cnt", sound.cnt);
//                database.insert(groupName, null, contentValues);
////                database.execSQL(String.format("INSERT INTO '%s' VALUES('%s',%d,%d,%d)",
////                        TABLE_NAME, sound.name, sound.id, sound.time, i));
//            }
//            database.setTransactionSuccessful();
////            database.endTransaction();
//        }
//        finally {
//            database.endTransaction();
//        }
//    }

    // 听说少产生一些对象会减少内存消耗？
    public void addSound(String day,String name, String time, int cnt) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("name", name);
        contentValues.put("time", time);
        contentValues.put("cnt", cnt);
        database.insert(day, null, contentValues);
//        database.execSQL(String.format("INSERT INTO '%s' VALUES('%s',%d,%d,%d)",
//                TABLE_NAME, name, id, time, cnt));

    }

//    public String findSoundGroupName(){
////        Cursor cursor = database.query(GROUP, null, null, null, null, null, null);
//        int i;
//        String name ;
////        boolean bool = true;
////        while(bool){
//        i = (int) (Math.random()*1000000);
//        name = String.format("%8s%d", JSON, i);
//        ContentValues contentValues = new ContentValues();
//        contentValues.put("name", name);
//        helper.createDay(database, name);
//        database.insert(GROUP, null, contentValues);
////            while(cursor.moveToNext()){
////                if(cursor.getString(cursor.getColumnIndex("name")).equals(name)) {
////                    i = Math.random();
////                    bool = false;
////                    break;
////                }
////            }
////        }
//        return name;
//    }

//    public void deleteLesson(String day, String name){
//        // 万恶的where表达式
//        database.delete(name, null, null);
//        database.execSQL("DROP TABLE " + name);
//        database.delete(GROUP, "name = ?", new String[]{name});
//    }

//    public void renameSoundGroup(String oldName,String newName){
//        ContentValues contentValues = new ContentValues();
//        contentValues.put("name",newName);
//        // 万恶的where表达式
//        database.update(GROUP, contentValues, "name = ?", new String[]{oldName});
//        database.execSQL("ALTER TABLE " + oldName + " RENAME TO " + newName);
//    }

//    public ArrayList<lesson> querySounds(String name){
//        ArrayList<lesson> lessonArrayList = new ArrayList<>();
////        Cursor cursor = database.query(TABLE_NAME,
////                new String[]{"id", "time"}, "name = ?", new String[]{name}, null, null, "cnt");
//        Cursor cursor = database.query(name,
//                null, null,
//                null, null,
//                null, "cnt");
//        while(cursor.moveToNext()){
//            Log.d(MY_TAG, "find one sound!!Yeah!!");
//            lessonArrayList.add(new lesson(
//                    cursor.getString(cursor.getColumnIndex("name")),
//                    cursor.getString(cursor.getColumnIndex("time"))
//                    // sound的顺序已经由游标本身确定了，所以不用构造
//            ));
//        }
//        cursor.close();
//        return lessonArrayList;
//    }

//    public String[] queryGroups(){
//        ArrayList<String> namesList = new ArrayList<>();
//        String[] names;
//        Cursor cursor = database.query(GROUP,
//                null, null,
//                null, null,
//                null, null);
//        while(cursor.moveToNext()){
//            Log.d(MY_TAG,"cursor.getString(cursor.getColumnIndex(\"name\")) = "
//                    + cursor.getString(cursor.getColumnIndex("name")));
//            namesList.add(cursor.getString(cursor.getColumnIndex("name")));
//        }
//        cursor.close();
//        names = new String[namesList.size()];
//        for(int i = 0; i < namesList.size(); i++){
//            names[i] = namesList.get(i);
//        }
//        return names;
//    }

    private void onDestroy(){
        database.close();
        helper.close();
    }

    @Override
    public void close(){
        onDestroy();
        // 就是不知道能不能用，之前就是这个方法导致内存泄露的
//        this.close();
    }
}
