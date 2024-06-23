package com.javaweb.repository.custom.impl;

import java.lang.reflect.Field;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import com.javaweb.utils.StringUtils;
import com.javaweb.utils.NumberUtils;
@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public void queryJoin(BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        String staffID = buildingSearchRequest.getStaffID();
        if(StringUtils.check(staffID)) {
            sql.append(" INNER JOIN assignmentbuilding asm ON b.id = asm.buildingid ");
        }
    }

    public void queryWhereNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for(Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if(fieldName.equals("staffID") == false && fieldName.equals("rentType") == false
                        && fieldName.equals("wordArea") == false && fieldName.equals("arrivalArea") == false
                        && fieldName.startsWith("rental") == false) {
                    String value = (String)item.get(buildingSearchRequest);
                    if(StringUtils.check(value)) {
                        if(NumberUtils.isLong(value)) {
                            where.append(" AND b." + fieldName.toLowerCase() + " LIKE '%" + value + "%'");
                        }
                        else {
                            where.append(" AND b." + fieldName.toLowerCase() + " LIKE '%" + value + "%'");
                        }
                    }
                }
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }
    }

    public void queryWhereSpecial(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        String staffID = buildingSearchRequest.getStaffID();
        if(StringUtils.check(staffID)) {
            where.append(" AND asm.staffid = " + staffID);
        }
        String rentAreaFrom =  buildingSearchRequest.getWordArea();
        String rentAreaTo =  buildingSearchRequest.getArrivalArea();
        if(StringUtils.check(rentAreaFrom) || StringUtils.check(rentAreaTo)) {
            where.append(" AND EXISTS (SELECT* FROM rentarea r WHERE b.id = r.buildingid ");
            if(StringUtils.check(rentAreaFrom)){
                where.append(" AND r.value >= " + rentAreaFrom);
            }
            if(StringUtils.check(rentAreaTo)){
                where.append(" AND r.value <= " + rentAreaTo);
            }
            where.append(") ");
        }
        String rentPriceFrom = buildingSearchRequest.getRentalPriceFrom();
        String rentPriceTo = buildingSearchRequest.getRentalPriceCome();
        if(StringUtils.check(rentPriceFrom)) {
            where.append(" AND rentprice >= " + rentPriceFrom);
        }
        if(StringUtils.check(rentPriceTo)) {
            where.append(" AND rentprice <= " + rentPriceTo);
        }
        List<String> typeCode = buildingSearchRequest.getRentType();
        if(typeCode != null && typeCode.isEmpty() == false) {
            where.append(" AND (");
            String sqlJoin = typeCode.stream().map(item -> "type LIKE '%" + item + "%'").collect(Collectors.joining(" OR "));
            where.append(sqlJoin + ")");
        }
    }

    public String buildQueryFilter(BuildingSearchRequest buildingSearchRequest){
        StringBuilder sql = new StringBuilder("SELECT b.id, b.name, street, ward, district, "
                + "numberofbasement, floorarea, rentprice, servicefee, brokeragefee, "
                + "managername, managerphone, level, structure, direction, rentpricedescription, carfee, motofee, overtimefee, waterfee, electricityfee, deposit, payment, renttime, " +
                "decorationtime, type, note, avatar " +
                " FROM building b");
        queryJoin(buildingSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        queryWhereNormal(buildingSearchRequest, where);
        queryWhereSpecial(buildingSearchRequest, where);
        sql.append(where.toString());
        sql.append(" GROUP BY b.id");
        return sql.toString();
    }

    @Override
    public List<BuildingEntity> findAll(Pageable pageable, BuildingSearchRequest buildingSearchRequest) {
        StringBuilder sql = new StringBuilder(buildQueryFilter(buildingSearchRequest))
                .append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        System.out.println("Final query: " + sql.toString());

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }

    @Override
    public int countTotalItem(BuildingSearchRequest buildingSearchRequest) {
        String sql = buildQueryFilter(buildingSearchRequest);
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }
}
