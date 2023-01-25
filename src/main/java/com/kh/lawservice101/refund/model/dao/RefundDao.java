package com.kh.lawservice101.refund.model.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RefundDao {

    void insertRefund(Long paymentNum, String impUid);

    void updatePaymentState(Long paymentNum);
}
