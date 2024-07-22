

import java.lang.Integer

fun createArray(){

    var arr = Array(10){it+1}
    
    for (i in arr)
    println(i)
}




fun returnSum(arr:Array<Int>):Int{
    return arr.sum()
/*
    var total =0

    arr.forEach { 
        total+=it
     }
        return total
     */
}




fun returnMax(arr:Array<Int>):Int{
    return arr.maxOrNull()?:Integer.MIN_VALUE
/*
    var maxNum = arr[0]

    arr.forEach { 
        if(maxNum<it)
            maxNum = it
    }
    return maxNum*/
}

