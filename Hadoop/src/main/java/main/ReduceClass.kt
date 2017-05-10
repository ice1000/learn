package main

import org.apache.hadoop.io.IntWritable
import org.apache.hadoop.io.Text
import org.apache.hadoop.mapreduce.Reducer

/**
 * Created by ice1000 on 2017/2/2.
 *
 * @author ice1000
 */
class ReduceClass : Reducer<Text, IntWritable, Text, IntWritable>() {
	override fun reduce(
			key: Text?,
			values: MutableIterable<IntWritable>?,
			context: Context?) {
		context?.write(key, IntWritable(values?.fold(0) { sum, int -> sum + int.get() } ?: 0))
	}
}
