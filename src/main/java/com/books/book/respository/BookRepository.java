package com.books.book.respository;

import com.books.book.model.Book;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import java.util.List;



@Repository
public interface BookRepository extends CrudRepository<Book,Long>{
    List<Book> findAll();
    Book getById(long id);
    Book save(Book book);
}
