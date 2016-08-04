public class Test {
    public static void main(String[] args) {
        println 'Hello World'

        def fuck = { int a, b ->
            println a
            println b
        }

        fuck(1, 2)

        fuck.call(1, 2)

        

    }
}
