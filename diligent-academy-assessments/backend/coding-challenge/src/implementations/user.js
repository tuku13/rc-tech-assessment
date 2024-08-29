export class User {
    constructor() {
        /** @member {Book[]} */
        this.books = [];
    }

    /**
     * Borrow the given book from the library, when the user does not already have it
     * @param {Book} book
     * @param {Library} library
     */
    borrow(book, library) {
        if(this.hasBook(book)) {
            return;
        }

        this.books.push(book);
        library.removeBook(book);
    }

    /**
     * Check the user has the given book
     * @param book the book to check
     * @return boolean
     */
    hasBook(book) {
        return this.books.includes(book);
    }

    /**
     * Return the given book to the library
     *
     * @param {Book} book
     * @param {Library} library
     * @returns {boolean}
     */
    return(book, library) {
        if(!this.hasBook(book)) {
            return false;
        }

        this.books = this.books.filter(b => b !== book);
        library.addBook(book);
        return true;
    }

    /**
     * Return the name of the books borrowed by the user
     *
     * @return {string[]} name of the borrowed book
     */
    getBookNames() {
        return this.books.map(b => b.name);
    }
}