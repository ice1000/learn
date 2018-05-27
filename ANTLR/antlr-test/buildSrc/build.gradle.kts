plugins { java; antlr }
repositories { jcenter() }
tasks.withType<AntlrTask> { outputDirectory = file(projectDir.parentFile.resolve("src/gen/java/org/ice1000/iceditor/gen")) }
dependencies { antlr(group = "org.antlr", name = "antlr4", version = "4.7.1") }
