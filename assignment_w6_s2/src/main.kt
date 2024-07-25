


fun main(args: Array<String>) {

    var list = createList(10)
    displayResult(list)

    var filterEven = lambdaFunctions(list) { list.filter { it % 2 == 0 } }
    displayResult(filterEven)

    val mapSquareFun: (List<Int>) -> List<Int> = { list -> list.map { it * it } }

    val mapSquare = lambdaFunctions(list,mapSquareFun)
    displayResult(mapSquare)




    var list2  = createList(10)
    var doublingtransformList = transformListFun(list2) { doublingNum(it) }
    displayResult(doublingtransformList)

    var squaringtransformList = transformListFun(list2) { squaringNum(it) }
    displayResult(squaringtransformList)

    var negatingtransformList = transformListFun(list2) { negatingNum(it) }
    displayResult(negatingtransformList)





    val book1 = Book("Clean Code", "Robert C. Martin", 29.99),
    val book2 = Book("The Pragmatic Programmer", "Andrew Hunt, David Thomas", 24.95),
    val book3 = Book("Introduction to Algorithms", "Cormen, Leiserson, Rivest, Stein", 42.50)
    
    val myBookStore = BookStore(mutableListOf(book1, book2, book3))

    val discountPercentage = 0.2
    val discountedPrice = book1.applyDiscount(discountPercentage)
    println("Discounted price: $$discountedPrice")
    
    val discountAmount = 5
    val discountedPrice2 = book2.applyDiscount(discountAmount)
    println("Discounted price (by $$discountAmount): $$discountedPrice2")
    
    val newBook = Book("cracking the coding interview", "gayle laakmann", 240.99)
    myBookStore.addBook(newBook)
    
    println("\nBooks in the store:")
    myBookStore.displayBooks()
    
    myBookStore.removeBook(book3)
    println("\nAfter removing a book:")
    myBookStore.displayBooks()



}
