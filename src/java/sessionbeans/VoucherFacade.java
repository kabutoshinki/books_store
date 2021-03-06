/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbeans;

import entities.Voucher;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author SE150010 Nguyen Sy Hoan
 */
@Stateless
public class VoucherFacade extends AbstractFacade<Voucher> {

    @PersistenceContext(unitName = "BookStorePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VoucherFacade() {
        super(Voucher.class);
    }
    
}
