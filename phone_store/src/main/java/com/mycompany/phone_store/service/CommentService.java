/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.service;
;
import com.mycompany.phone_store.entities.CommentEntity;
import com.mycompany.phone_store.repositories.CommentRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dang
 */
@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;
    
    public List<CommentEntity> getCommentsByProductId(int id){
        return commentRepository.findByProduct_id(id);
    }
    
    public CommentEntity save(CommentEntity comment){
        return (CommentEntity) commentRepository.save(comment);
    }
}
