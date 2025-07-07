package com.library.service;

import com.library.BookRepository;

public class BookService {
    private BookRepository bookRepository;

    public void performService() {
        System.out.println("BookService: Performing service...");
        bookRepository.saveBook();
    }

    // Setter injection
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }
}
