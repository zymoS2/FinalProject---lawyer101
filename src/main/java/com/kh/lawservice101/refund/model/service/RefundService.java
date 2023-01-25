package com.kh.lawservice101.refund.model.service;

import java.io.IOException;

public interface RefundService {

    public String getToken() throws IOException;

    void paymentCancle(String access_token, String merchanUid, String impUid, int productPrice) throws IOException;
}
