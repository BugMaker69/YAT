
fun returnUnionNIntersection(set1:Set<Int>,set2:Set<Int>):MutableList<Set<Int>>{

    var arr = mutableListOf<Set<Int>>()
    arr.add(set1.union(set2))
    arr.add(set1.intersect(set2))
    return arr

}


fun returnUnique(list:List<Int>):Set<Int>{

    return list.toSet()
} 

