import tensorflow as tf


def func1():
	node1 = tf.constant(233, dtype=tf.int32)
	node2 = tf.constant(666)
	print node1, '\n', node2

	sess = tf.Session()
	print sess.run([node1, node2])

	node3 = tf.add(node1, node2)
	print node3
	print sess.run(node3)


def func2():
	print "MEOW"
	a = tf.placeholder(tf.float32)
	b = tf.placeholder(tf.float32)
	print a
	adder_node = a + b
	print "MEOW"
	print adder_node
	sess = tf.Session()
	print sess.run(adder_node, {a: 3, b: 4.5})
	print "MEOW"
	print sess.run(adder_node, {a: [1, 3], b: [2.33, 6.66]})


def func3():
	a = tf.placeholder(tf.float32)
	b = tf.placeholder(tf.float32)
	adder_node = a + b
	add_and_triple = adder_node * 3
	sess = tf.Session()
	print sess.run(add_and_triple, {a: 3, b: 4.5})


func3()

