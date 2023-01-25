package com.kh.lawservice101.refund.model.service;

import java.io.IOException;

public interface RefundService {

    public String getToken() throws IOException;

    void paymentCancel(String access_token, String merchantUid, String impUid, int productPrice) throws IOException;

    void saveRefund(Long paymentNum, String impUid);

}

