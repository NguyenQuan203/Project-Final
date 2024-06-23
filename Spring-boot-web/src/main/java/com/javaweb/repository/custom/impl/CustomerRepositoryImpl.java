package com.javaweb.repository.custom.impl;

import java.lang.reflect.Field;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import com.javaweb.utils.NumberUtils;
import com.javaweb.utils.StringUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public void queryJoin(CustomerSearchRequest customerSearchRequest, StringBuilder sql) {
        String staffID = customerSearchRequest.getStaffID();
        if(StringUtils.check(staffID)) {
            sql.append(" INNER JOIN assignmentcustomer asm ON c.id = asm.customerid ");
        }
    }

    public void queryWhereNormal(CustomerSearchRequest customerSearchRequest, StringBuilder where) {
        try {
            Field[] fields = CustomerSearchRequest.class.getDeclaredFields();
            for(Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if(fieldName.equals("staffID") == false) {
                    String value = (String)item.get(customerSearchRequest);
                    if(StringUtils.check(value)) {
                        if(NumberUtils.isLong(value)) {
                            where.append(" AND c." + fieldName.toLowerCase() + " LIKE '%" + value + "%'");
                        }
                        else {
                            where.append(" AND c." + fieldName.toLowerCase() + " LIKE '%" + value + "%'");
                        }
                    }
                }
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }
    }

    public void queryWhereSpecial(CustomerSearchRequest customerSearchRequest, StringBuilder where) {
        String staffID = customerSearchRequest.getStaffID();
        if(StringUtils.check(staffID)) {
            where.append(" AND asm.staffid = " + staffID);
        }
    }

    public String buildQueryFilter(CustomerSearchRequest customerSearchRequest){
        StringBuilder sql = new StringBuilder("SELECT c.id, c.fullname, phone, email, companyname, "
                + "demand, status, is_active, c.createddate, c.createdby, c.modifieddate, c.modifiedby " +
                " FROM customer c");
        queryJoin(customerSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 AND is_active=1 ");
        queryWhereNormal(customerSearchRequest, where);
        queryWhereSpecial(customerSearchRequest, where);
        sql.append(where.toString());
        return sql.toString();
    }

    @Override
    public List<CustomerEntity> findAll(Pageable pageable, CustomerSearchRequest customerSearchRequest) {
        StringBuilder sql = new StringBuilder(buildQueryFilter(customerSearchRequest))
                .append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        System.out.println("Final query: " + sql.toString());

        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

    @Override
    public int countTotalItem(CustomerSearchRequest customerSearchRequest) {
        String sql = buildQueryFilter(customerSearchRequest);
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }
}
