/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.itemBook;

import java.io.Serializable;
import model.customer.Customer;

/**
 *
 * @author pc
 */
public class Review implements Serializable{
    private int id;
    private String content;
    private Customer customer;
    private ItemBook itemBook;

    public Review() {
    }

    public Review(int id, String content, Customer customer, ItemBook itemBook) {
        this.id = id;
        this.content = content;
        this.customer = customer;
        this.itemBook = itemBook;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public ItemBook getItemBook() {
        return itemBook;
    }

    public void setItemBook(ItemBook itemBook) {
        this.itemBook = itemBook;
    }
}
