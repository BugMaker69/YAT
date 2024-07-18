fun ageCategory(){


    var age = readLine()?:0
    age = age.toString().toInt()
    
    var message = 
        if(age>0 && age<=12) "Child"
        else if(age>=13 && age<=19) "Teenager"
        else if(age>=20 && age<=64) "Adult"
        else if(age>=65) "Senior"
        else "Try Again"

    println(message)
    

}


