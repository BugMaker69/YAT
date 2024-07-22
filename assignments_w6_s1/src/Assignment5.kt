

fun printSum(num:Int):Int{


    var sum = 0

    for(i in 1..num){
        sum+=i
    }

    return sum
    // return (num*(num+1))/2
}

fun fact(num:Int):Int{
    var fct = 1

    for(i in 1..num)
    fct*=i

    return fct
}