package main

import org.apache.hadoop.io.IntWritable
import org.apache.hadoop.io.LongWritable
import org.apache.hadoop.io.Text
import org.apache.hadoop.mapreduce.Mapper

/**
 * Created by ice1000 on 2017/2/2.

 * @author ice1000
 */
class MapClass : Mapper<LongWritable, Text, Text, IntWritable>() {
	val word = Text()
	val one = IntWritable(1)

	override fun map(
			key: LongWritable?,
			value: Text?,
			context: Context?) {
		value!!.toString().split(" ").forEach { str ->
			context?.write(word.apply { set(str) }, one)
		}
	}
}
