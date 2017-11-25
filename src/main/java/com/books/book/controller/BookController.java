package com.books.book.controller;

import com.books.book.model.Book;
import com.books.book.respository.BookRepository;
import org.apache.commons.io.IOUtils;
import org.apache.commons.net.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.io.UnsupportedEncodingException;


@SessionAttributes("UserSession")
@Controller
public class BookController {

Logger logger = LogManager.getLogger(BookController.class);

@Autowired
BookRepository bookRepository;

@RequestMapping(value = "/",method = RequestMethod.GET)
public String index (Model model){
    model.addAttribute("book", new Book());
    logger.info("indexPage...");
    return "index";
    }

    @RequestMapping(value = "/books", method = RequestMethod.GET)
    public String listBooks(@ModelAttribute("book") Book book,Model model) throws IOException {
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", this.bookRepository.findAll());
        logger.info("BooksListPage...");
        return "books";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") long id){
        this.bookRepository.deleteById(id);
        logger.info("DelBook...");
        return "redirect:/books";
    }

    @RequestMapping("edit/{id}")
    public String editBook(@PathVariable("id") long id, Model model){
        model.addAttribute("book", this.bookRepository.getById(id));
        model.addAttribute("listBooks", this.bookRepository.findAll());
        logger.info("BookEdit...");
        return "books";
    }

    @RequestMapping(value="books/add", method=RequestMethod.POST)
    public  String handleFileUpload(@ModelAttribute("book") @Valid Book book,BindingResult result, MultipartFile file) {
        if (result.hasErrors()) {
            logger.debug("errors in form" + result.toString());
            return "books";
        } else
            try {
                byte[] bytes = IOUtils.toByteArray(file.getInputStream());
                book.setPhotoContentLength(Long.valueOf(file.getSize()).intValue());
                book.setPhotoContentType(file.getContentType());
                book.setPhotoBlob(bytes);
                bookRepository.save(book);
            } catch (IOException e) {
                logger.error("File error");
                return "redirect:/books";
            }
        return "redirect:/books";
    }

   @RequestMapping("/bookdata/{id}")
    public String bookData(@PathVariable("id") long id,Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
       model.addAttribute("book", bookRepository.getById(id));
       byte[] encodeBase64 = Base64.encodeBase64(bookRepository.getById(id).getPhotoBlob());
       String base64Encoded = new String(encodeBase64, "UTF-8");
       model.addAttribute("image",base64Encoded);
       return "bookdata";
    }

}





