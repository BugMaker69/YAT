


fun createList(num: Int): List<Int> {
    return List(num) { it + 1 }
}

fun lambdaFunctions(list: List<Int>, filter: (List<Int>) -> List<Int>): List<Int> = filter(list)

fun displayResult(list: List<Int>) {
    list.forEach { println(it) }
}
