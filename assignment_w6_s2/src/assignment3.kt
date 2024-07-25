

class Book(val title: String, val author: String, val price: Double) {

    fun displayDetails() {
        println("Book Title: $title , Book Author: $author , Book Price: $price")
    }

    fun applyDiscount(discount: Int): Double {
        return price * (discount/100.0)
    }

    fun applyDiscount(discount: Double): Double {
        return price * discount
    }
}

class BookStore(var listBooks: MutableList<Book>) {

    fun addBook(book: Book) {
        listBooks.add(book)
    }

    fun removeBook(book: Book) {
        listBooks.remove(book)
    }

    fun displayBooks() {
        for (book in listBooks) {
            println("Book Title: ${book.title}, Author: ${book.author}, Price: $${book.price}")
        }
    }
}
