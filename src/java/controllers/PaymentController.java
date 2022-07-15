/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Book;
import entities.Cart;
import entities.Category;
import entities.OrderItem;
import entities.Payment;
import entities.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessionbeans.BookFacade;
import sessionbeans.CartFacade;
import sessionbeans.PaymentFacade;
import sessionbeans.VoucherFacade;

/**
 *
 * @author SE150010 Nguyen Sy Hoan
 */
@WebServlet(name = "PaymentController", urlPatterns = {"/payment"})
public class PaymentController extends HttpServlet {

    @EJB
    private BookFacade bookFacade;

    @EJB
    private PaymentFacade paymentFacade;

    

    @EJB
    private CartFacade cartFacade;

    @EJB
    private VoucherFacade voucherFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String action = session.getAttribute("action").toString();

        switch (action) {
            case "index":
                index(request, response);
                break;

            case "paymentCreate":
                paymentCreate(request, response);
                break;
            default:
                action = "error";
                request.setAttribute("action", action);
        }
        request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
    }

    private void index(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        List<Voucher> list = voucherFacade.findAll();
        List<Voucher> voucherList = new ArrayList<>();

        for (Voucher voucher : list) {
            if (voucher.getStartDate().compareTo(new Date()) > 0 || voucher.getEndDate().compareTo(new Date()) < 0) {
                System.out.println(voucher);
            } else {
                voucherList.add(voucher);
            }
        }
        session.setAttribute("voucherList", voucherList);
    }
    
    private void newIndex(HttpServletRequest request, HttpServletResponse response) {
       
        int pageSize = 6;//Kich thuoc trang                        
        HttpSession session = request.getSession();

        //Xac dinh so thu tu cua trang hien tai
        Integer page = (Integer)session.getAttribute("page");
        if (page == null) {
            page = 1;
        }

        //Xac dinh tong so trang
        Integer totalPage = null;//(Integer)session.getAttribute("totalPage");
        if (totalPage == null) {
           int count = bookFacade.count();//Dem so luong records
           totalPage = (int) Math.ceil((double) count / pageSize);//Tinh tong so trang
        }

        String op = request.getParameter("op");
        if (op == null) {
            op = "FirstPage";
        }
        switch (op) {
            case "FirstPage":
                page = 1;
                break;
            case "PreviousPage":
                if (page > 1) {
                    page--;
                }
                break;
            case "NextPage":
                if (page < totalPage) {
                    page++;
                }
                break;
            case "LastPage":
                page = totalPage;
                break;
            case "GotoPage":
                page = Integer.parseInt(request.getParameter("gotoPage"));
                if(page <= 0){
                    page = 1;
                }else if(page > totalPage){
                    page = totalPage;
                }
                break;            
        }

        //Lay trang du lieu duoc yeu cau
        int n1 = (page - 1) * pageSize;//Vi tri mau tin dau trang
        int n2 = n1 + pageSize - 1;//Vi tri mau tin cuoi trang
        List<Book> bookList = bookFacade.findRange(new int[]{n1, n2});//Doc mot trang
        //Luu thong tin vao session va request
        session.setAttribute("page", page);
        session.setAttribute("totalPage", totalPage);
        session.setAttribute("bookList", bookList);
    }

    private void paymentCreate(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String op = request.getParameter("op");
        String name = request.getParameter("name");
        session.setAttribute("name", name);
        String phoneNumber = request.getParameter("phoneNumber");
        session.setAttribute("phoneNumber", phoneNumber);
        String address = request.getParameter("address");
        session.setAttribute("address", address);
        String note = request.getParameter("note");
        if (note == null) note = "";
        session.setAttribute("note", note);
        switch (op) {
            case "applyVoucher":
                int voucherID = Integer.parseInt(request.getParameter("voucherID"));
                Cart cart = (Cart) session.getAttribute("cart");
                int paymentTotal = cart.getTotal();
                if (voucherID != 0) {
                    Voucher voucher = voucherFacade.find(voucherID);
                    paymentTotal -= voucher.getVoucherValue() * paymentTotal / 100;
                    session.setAttribute("selectedVoucher", voucherID);
                }
                session.setAttribute("paymentTotal", paymentTotal);
                session.setAttribute("action", "index");
                break;

            case "createPayment":
                Payment payment = new Payment();
                payment.setUserName(name);
                payment.setPhoneNumber(phoneNumber);
                payment.setUserAddress(address);
                payment.setNote(note);
                voucherID = Integer.parseInt(request.getParameter("voucherID"));
                cart = (Cart) session.getAttribute("cart");
                paymentTotal = cart.getTotal();
                if (voucherID != 0) {
                    Voucher voucher = voucherFacade.find(voucherID);
                    paymentTotal -= voucher.getVoucherValue() * paymentTotal / 100;
                }
                payment.setTotal(BigDecimal.valueOf(paymentTotal));
                if (voucherID != 0) {
                    payment.setVoucherID(voucherFacade.find(voucherID));
                }
                payment.setCreateDate(voucherFacade.find(voucherID).getStartDate());
                payment.setCreateDate(new Date());
                payment.setPaymentStatus("Processing");
                payment.setCartID(cart);
                System.out.println(payment);
                System.out.println(payment.getUserName());
                System.out.println(payment.getUserAddress());
                System.out.println(payment.getNote());
                System.out.println(payment.getTotal());
                System.out.println(payment.getVoucherID());
                paymentFacade.create(payment);
                for (OrderItem order: cart.getOrderItemList()) {
                    Book book = bookFacade.find(order.getBookID().getBookID());
                    book.setQuantity(book.getQuantity() - order.getQuantity());
                    book.setBought(book.getBought() + order.getQuantity());
                    bookFacade.edit(book);
                }
                cart.setCartStatus(0);
                cartFacade.edit(cart);
                session.setAttribute("cart", null);
                session.setAttribute("action", "index");
                session.setAttribute("controller", "home");
                newIndex(request, response);
                break;
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
