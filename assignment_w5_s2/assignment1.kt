fun primitiveTypes() {
    
    var num1:Int = 5
    var num2:Double = 50.6
    val char1:Char = 'a'
    val b:Boolean = true
    
    println("value of Int: ${num1}\nvalue of Double: ${num2}\nvalue of Char: ${char1}\nvalue of Boolean: ${b}")
    
    num1 = 90.5.toInt()
    num2 = 50.toDouble()
    print("value of Int: ${num1}\nvalue of Double: ${num2}")
}



fun stringManipulation(){
    print("Please Enter Your Name: ")
    var name = readLine()?:""
    println("Your Name: $name")
    
    println("Name length : ${name.length},\tFirst character: ${name.get(0)},\tName in uppercase: ${name.uppercase()},\tName in lowercase: ${name.lowercase()}" + if(name.length > 5 ) ",\tSubstring From Index 2 To 5 ${name.subSequence(2, 5)} " else ""  )

}