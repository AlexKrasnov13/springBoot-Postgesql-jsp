package com.books.book.controller;

import com.books.book.model.Book;
import com.books.book.respository.BookRepository;
import org.apache.commons.io.IOUtils;
import org.apache.commons.net.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sun.misc.BASE64Encoder;


import javax.annotation.Resource;
import javax.persistence.Lob;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.file.Path;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;


@SessionAttributes("UserSession")
@Controller
public class BookController {

@Autowired
BookRepository bookRepository;

@RequestMapping(value = "/",method = RequestMethod.GET)
public String index (Model model){
    model.addAttribute("book", new Book());
    return "index";
    }

    @RequestMapping(value = "/books", method = RequestMethod.GET)
    public String listBooks(@ModelAttribute("book") Book book,MultipartFile file,Model model) throws IOException {
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", this.bookRepository.findAll());
        return "books";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") long id){
        this.bookRepository.deleteById(id);

        return "redirect:/books";
    }

    @RequestMapping("edit/{id}")
    public String editBook(@PathVariable("id") long id, Model model){
        model.addAttribute("book", this.bookRepository.getById(id));
        model.addAttribute("listBooks", this.bookRepository.findAll());

        return "books";
    }

    @RequestMapping(value="books/add", method=RequestMethod.POST)
    public  String handleFileUpload(@ModelAttribute("book") Book book,MultipartFile file){
        // only do the upload if user selected file to upload
        if (!file.isEmpty()) {
            try {
                byte[] bytes = IOUtils.toByteArray(file.getInputStream());
                book.setPhotoContentLength(Long.valueOf(file.getSize()).intValue());
                book.setPhotoContentType(file.getContentType());
                book.setPhotoBlob(bytes);
                bookRepository.save(book);
                //after done updating the record, redirect back to worker page
            } catch (IOException e) {
                e.printStackTrace();
            return "redirect:/books";}}
        return "redirect:/books";
    }

   @RequestMapping("/bookdata/{id}")
    public String bookData(@PathVariable("id") long id,Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
       Book book = bookRepository.getById(id);
       model.addAttribute("book", bookRepository.getById(id));
       byte[] encodeBase64 = Base64.encodeBase64(bookRepository.getById(id).getPhotoBlob());
       String base64Encoded = new String(encodeBase64, "UTF-8");
       model.addAttribute("image",base64Encoded);
       return "bookdata";
    }

}





