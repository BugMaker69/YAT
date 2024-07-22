


fun printKeyValue(){

    var map = mapOf( "Omar" to 10 , "Ahmed" to 20 , "Ali" to 15 )

    map.entries.forEach {(key,value)-> println("Key: $key\tValue:$value") }

}


fun returnsUpdated(map:MutableMap<String,Int>):Map<String,Int>{

    for ((key,value) in map) {
        map[key] = value +1
    }

    return map
     
}


fun returnValue(map:Map<String,Int>,target:Int):String?{

    for ((key,value) in map.entries) {
        if(target==value)
            return key
    }

    return null
}