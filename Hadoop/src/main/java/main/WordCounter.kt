@file:JvmName("MainFunctionHolder")
@file:JvmMultifileClass

package main

import org.apache.hadoop.conf.Configured
import org.apache.hadoop.fs.Path
import org.apache.hadoop.io.IntWritable
import org.apache.hadoop.io.Text
import org.apache.hadoop.mapreduce.Job
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat
import org.apache.hadoop.util.Tool
import org.apache.hadoop.util.ToolRunner

/**
 * Created by ice1000 on 2017/2/2.
 *
 * @author ice1000
 */
class WordCounter : Configured(), Tool {
	override fun run(args: Array<out String>?): Int {
		args?.let {
			if (args.size != 2) {
				println("fuck you!")
				return -1
			}
			Job().apply {
				setJarByClass(WordCounter::class.java)
				jobName = "WordCounter"
				FileInputFormat.addInputPath(this@apply, Path(args[0]))
				FileOutputFormat.setOutputPath(this@apply, Path(args[1]))
				outputKeyClass = Text::class.java
				outputValueClass = IntWritable::class.java
				outputFormatClass = FileOutputFormat::class.java
				mapperClass = MapClass::class.java
				reducerClass = ReduceClass::class.java
				waitForCompletion(true).run {
					if (isSuccessful) println("success!") else println("failed!")
					return if (this) 0 else 1
				}
			}
		}
		return -2
	}

}

fun main(args: Array<String>) = System.exit(ToolRunner.run(WordCounter(), args))
