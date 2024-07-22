fun main(args: Array<String>) {
    


    createArray()
    
    var arr = Array(10){it+1}
    println(returnSum(arr))

    println(returnMax(arr))



    var list = List(10){it+1}
    println(returnEven(list))

    var list1 = MutableList(10){it+1}
    println(returnDoubled(list1))



    var set1 = setOf(1,5,3,2)
    var set2 = setOf(4,2,8,9)
    var sets = returnUnionNIntersection(set1,set2)
    println(sets[0])
    println(sets[1])

    println(returnUnique(list))



    printKeyValue()

    var map = mutableMapOf( "Omar" to 100 , "Ahmed" to 200 , "Ali" to 150 )
    returnsUpdated(map)

    var map1 = mutableMapOf( "Omar" to 10 , "Ahmed" to 20 , "Ali" to 15 )
    println(returnValue(map1,10))

}