import org.frice.game.Game
import org.frice.game.obj.effects.{FFunction, FunctionEffect}
import org.frice.game.utils.time.FTimer

/**
	* Created by ice1000 on 2016/8/28.
	*
	* @author ice1000
	*/
class Exercise06 extends Game {

	var obj: FunctionEffect = _
	val timer = new FTimer(50)
	var i = 5.0

	override def onInit(): Unit = {
		super.onInit()
		super.setAutoGC(true)
		obj = getFunction(5)
		super.addObject(obj)
	}

	override def onRefresh(): Unit = {
		super.onRefresh()
		if (timer.ended()) {
			i += 0.3
			super.removeObject(obj)
			obj = getFunction(i)
			super.addObject(obj)
		}
	}

	def getFunction(d: Double) = new FunctionEffect(
		new FFunction {
			override def call(double: Double) = Math.sin(double / d) * 100 + 200
		},
		10, 10, 600, 500)
}

object Exercise06 {
	def main(args: Array[String]): Unit = {
		new Exercise06
	}
}