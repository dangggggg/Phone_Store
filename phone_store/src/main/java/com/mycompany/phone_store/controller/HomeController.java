/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.controller;

import com.mycompany.phone_store.Ultil.AccountUltil;
import com.mycompany.phone_store.entities.AccountEntity;
import com.mycompany.phone_store.entities.ColorEntity;
import com.mycompany.phone_store.entities.CommentEntity;
import com.mycompany.phone_store.entities.FavoriteEntity;
import com.mycompany.phone_store.entities.ProductEntity;
import com.mycompany.phone_store.service.CategoryService;
import com.mycompany.phone_store.service.ColorService;
import com.mycompany.phone_store.service.CommentService;
import com.mycompany.phone_store.service.FavoriteService;
import com.mycompany.phone_store.service.ProductService;
import com.mycompany.phone_store.service.PromotionService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author dang
 */
@Controller
public class HomeController {
    
    @Autowired
    private ProductService productService;
    @Autowired
    private FavoriteService favoriteService;
    
    @Autowired
    private ColorService ColorService;

    @Autowired
    private CommentService commentService;

    
    @Autowired
    private PromotionService promotionService;
    
    @Autowired
     private CategoryService categoryService; 
    
    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String homePage(Model model,
            @RequestParam(value = "page", required = false) Integer page) {        
        if (page == null || page <= 0) {
            page = 1;
        }
        Page<ProductEntity> productsPage = productService.getProductsActive(page);
        List<ProductEntity> productsList = productsPage.getContent();
        List<ProductEntity> products = new ArrayList<>();
        for (int i = 0; i < productsList.size(); i++) {
            ProductEntity product = productsList.get(i);
            List<FavoriteEntity> favs = favoriteService.getFavoritesByProductId(product.getId());
            product.setFavorites(favs);
            products.add(product);
        }
        model.addAttribute("page", productsPage.getTotalPages());
        model.addAttribute("products", products);
        return "home";
    }


    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public String productPage(Model model, @RequestParam("id") int id) {
        ProductEntity product = productService.getProductById(id);
        List<ColorEntity> colors = ColorService.getColorByProductId(id);
        model.addAttribute("product", product);
        model.addAttribute("colors",colors);
        List<CommentEntity> comments = commentService.getCommentsByProductId(id);
        model.addAttribute("comments", comments);
        model.addAttribute("favorites", favoriteService.countFavoriteByProductId(id));
        AccountEntity account = AccountUltil.getAccount();
        if (account != null) {
            FavoriteEntity fav = favoriteService.getFavotiteByAccountIDAndProductID(account.getId(), id);
            if (fav != null) {
                model.addAttribute("favorited", true);
            } else {
                model.addAttribute("favorited", false);
            }
        } else {
            model.addAttribute("favorited", false);
        }
        model.addAttribute("promotions", promotionService.getPromotionsByProductId(id));
        return "product";
    }
    @RequestMapping(value = "/favorite/{productId}", method = RequestMethod.GET)
    @ResponseBody
    public Object getFavorite(@PathVariable(value = "productId") int productId) {
        AccountEntity account = AccountUltil.getAccount();
        if (account != null) {
            FavoriteEntity fav = favoriteService.getFavotiteByAccountIDAndProductID(account.getId(), productId);
            if (fav == null) {                             
                fav = new FavoriteEntity();
                fav.setAccount(account);
                ProductEntity product = productService.getProductById(productId);
                fav.setProduct(product);
                FavoriteEntity favsaved =  favoriteService.save(fav);
                if(favsaved!=null && favsaved.getId()>0){
                    return "favorited";
                }                
            }else{
                fav.setAccount(account);
                ProductEntity product = productService.getProductById(productId);
                fav.setProduct(product);
                favoriteService.delete(fav);
                return "unfavorited";
            }
        }
        return "login";
    }
    @RequestMapping(value = "/category", method = RequestMethod.GET)
    public String categoryPageLimit(Model model, 
            @RequestParam("id") int id, 
            @RequestParam(value = "page", required = false) Integer page
            ) {
        if (page == null || page <= 0) {
            page = 1;
        }
        
        Page<ProductEntity> productsPage = null;
        productsPage = productService.getProductByCategoryId(id, page);
        List<ProductEntity> productsList = productsPage.getContent();
        List<ProductEntity> products = new ArrayList<>();
        for (int i = 0; i < productsList.size(); i++) {
            ProductEntity product = productsList.get(i);
            List<FavoriteEntity> favs = favoriteService.getFavoritesByProductId(product.getId());
            product.setFavorites(favs);
            products.add(product);
        }
        model.addAttribute("category", categoryService.getCategoryById(id));
        model.addAttribute("page", productsPage.getTotalPages());
        model.addAttribute("products", products);
        return "category";
    }
}
