/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.controller;


import com.mycompany.phone_store.Ultil.AccountUltil;
import com.mycompany.phone_store.entities.AccountEntity;
import com.mycompany.phone_store.entities.OrderDetailEntity;
import com.mycompany.phone_store.entities.OrderEntity;
import com.mycompany.phone_store.entities.PromotionEntity;
import com.mycompany.phone_store.service.OrderService;
import com.mycompany.phone_store.service.PromotionService;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author dang
 */
@Controller
public class ExportController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private PromotionService promotionService;
    
    
    @RequestMapping(value = "/downloadOrderExcel")
    public String downloadOrderExcel(Model model, HttpServletResponse response) throws IOException{
        AccountEntity account = AccountUltil.getAccount();
        List<OrderEntity> orders = orderService.getOrdersByAccountId(account.getId());
            for (int i = 0; i < orders.size(); i++) {
                OrderEntity order = orders.get(i);
                
                List<OrderDetailEntity> orderDetails = order.getOrderDetails();
                for (int j = 0; j < orderDetails.size(); j++){
                    OrderDetailEntity od = orderDetails.get(j);
                    PromotionEntity promotion = promotionService.getPromotionByOrderDetailId(od.getId());
                    od.setPromotion(promotion);
                    orderDetails.set(j, od);
                }
                order.setOrderDetails(orderDetails);
                orders.set(i, order);
            }
        model.addAttribute("orders", orders);
        return "excelView";
    }
}
