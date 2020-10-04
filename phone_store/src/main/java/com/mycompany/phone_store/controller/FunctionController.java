/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.controller;

import com.mycompany.phone_store.Ultil.AccountUltil;
import com.mycompany.phone_store.entities.AccountEntity;
import com.mycompany.phone_store.entities.CommentEntity;
import com.mycompany.phone_store.entities.FavoriteEntity;
import com.mycompany.phone_store.entities.OrderEntity;
import com.mycompany.phone_store.entities.ProductEntity;
import com.mycompany.phone_store.service.AccountService;
import com.mycompany.phone_store.service.CommentService;
import com.mycompany.phone_store.service.FavoriteService;
import com.mycompany.phone_store.service.OrderService;
import com.mycompany.phone_store.service.ProductService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author dang
 */
@Controller
public class FunctionController {

    @Autowired
    private ProductService productService;
    @Autowired
    private FavoriteService favoriteService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private CommentService commentService;
    
    
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(Model model,
            @RequestParam(value = "searchText") String searchText,
            @RequestParam(value = "action") String action,
            @RequestParam(value = "page", required = false) Integer page
    ) {
        if (page == null || page <= 0) {
            page = 1;
        }
        int id;
        try {
            id = Integer.valueOf(searchText);
        } catch (NumberFormatException e) {
            id = 0;
        }
        if (action.equals("searchProduct")) {
            Page<ProductEntity> productsPage;
            if (searchText == null || searchText.isEmpty()) {
                productsPage = productService.getProductsActive(page);
            } else {
                productsPage = productService.getProductByAnyActive(searchText, page);
            }
            List<ProductEntity> products = new ArrayList<>(productsPage.getContent());
            for (int i = 0; i < products.size(); i++) {
                ProductEntity product = products.get(i);
                List<FavoriteEntity> favs = favoriteService.getFavoritesByProductId(product.getId());
                product.setFavorites(favs);
                products.set(i, product);
            }
            model.addAttribute("page", productsPage.getTotalPages());
            model.addAttribute("products", products);
            return "home";
        } else if (action.equals("searchOrder")) {
                AccountEntity acc = AccountUltil.getAccount();
                Page<OrderEntity> ordersPage = orderService.getOrdersByAny(searchText,acc, page);
                List<OrderEntity> orders = new ArrayList<>(ordersPage.getContent());
            
                model.addAttribute("orders", orders);
                model.addAttribute("page", ordersPage.getTotalPages());
            
         }
            return "account/myorder";
    }
    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    public String comment(@ModelAttribute(value = "content") String content,
            @ModelAttribute(value = "productId") int productId) {
        AccountEntity account = AccountUltil.getAccount();
        if (account != null) {
            ProductEntity product = productService.getProductById(productId);
            CommentEntity comment = new CommentEntity();
            comment.setContent(content);
            comment.setCommentDate(new Date());
            comment.setAccount(account);
            comment.setProduct(product);
            commentService.save(comment);
        }
        return "redirect:/product?id=" + productId;
    }
 }
    

