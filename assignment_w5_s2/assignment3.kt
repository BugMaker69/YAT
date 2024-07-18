fun dayOfTheWeek(){
    var day = readLine()?:0
    day = day.toString().toInt()

    when(day){
        1-> println("Friday")
        2-> println("Saturday")
        3-> println("Sunday")
        4-> println("Monday")
        5-> println("Tuesday")
        6-> println("Wednesday")
        7-> println("Thursday")
        else -> println("Not Exist")
    }
}


fun trafficLightSystem(){
    var traffic = readLine()?:""

    when(traffic){
        "red"-> println("stop")
        "yellow"-> println("wait")
        "green"-> println("go")
        else -> println("Not Exist")
    }
}