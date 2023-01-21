package com.kh.lawservice101.payment.model.dao;

import com.kh.lawservice101.payment.model.vo.PaymentVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PaymentDao {

    void insertOrder(PaymentVo paymentVo);

     List<PaymentVo> selectPayment(Long clientNum);

     List<PaymentVo> selectCounselingList(Long lawyerNum);

     // 결제 단건 조회
    PaymentVo selectPaymentByPaymentNum(Long paymentNum);
}
