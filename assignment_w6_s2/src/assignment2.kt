

fun transformListFun(list: List<Int>, transform: (List<Int>) -> List<Int>): List<Int> {

    return transform(list)
}

val doublingNum: (List<Int>) -> List<Int> = { list -> list.map { it * 2 } }
val squaringNum: (List<Int>) -> List<Int> = { list -> list.map { it * it } }
val negatingNum: (List<Int>) -> List<Int> = { list -> list.map { it * -1 } }
