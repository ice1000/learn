import org.jetbrains.kotlin.gradle.tasks.KotlinCompile
import java.util.concurrent.Callable

group = "org.ice1000.iceditor"
version = "1.0"

plugins {
	java
	kotlin("jvm") version "1.2.41"
}

java {
	sourceCompatibility = JavaVersion.VERSION_1_8
	targetCompatibility = JavaVersion.VERSION_1_8
	sourceSets { "main" { java.srcDir("src/gen/java") } }
}

repositories { jcenter() }
dependencies {
	val antlrVersion = "4.7.1"
	val jimguiVersion = "v0.1"
	val jimguiGroup = "org.ice1000.jimgui"
	val antlrGroup = "org.antlr"
	compile(kotlin("stdlib"))
	compile(group = jimguiGroup, name = "core", version = jimguiVersion)
	compile(group = jimguiGroup, name = "kotlin-dsl", version = jimguiVersion)
	compile(group = antlrGroup, name = "antlr4-runtime", version = antlrVersion)
	testCompile(group = "junit", name = "junit", version = "4.12")
}

task<Jar>("fatJar") {
	classifier = "all"
	description = "Assembles a jar archive containing the main classes and all the dependencies."
	group = "build"
	from(Callable {
		configurations.runtime
				.filter { it.parentFile.name != "plugins" }
				.map {
					@Suppress("IMPLICIT_CAST_TO_ANY")
					if (it.isDirectory) it else zipTree(it)
				}
	})
	with(tasks["jar"] as Jar)
}
