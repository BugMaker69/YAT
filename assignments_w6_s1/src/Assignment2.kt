
fun returnEven(list:List<Int>):List<Int>{
    return list.filter { 
        it%2==0
     }

}



fun returnDoubled(list:MutableList<Int>):List<Int>{
    for(i in 0 until list.size)
    list[i]*=2
    return list
}



