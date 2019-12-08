package com.neeraj.grabathon.insuranceserver.Service;

import com.neeraj.grabathon.insuranceserver.Model.Insurance.Claim;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class ClaimService {
    // This is for storing the data
    private List<Claim> arrayAllClaims = new ArrayList<>(Arrays.asList(
    ));


    public List<Claim> getAllClaims() {
        return arrayAllClaims;
    }

    public void addClaim(Claim claim) {
        arrayAllClaims.add(claim);
    }

    public List<Claim> getClaimByUserID(String id) {
        return (List<Claim>) arrayAllClaims.stream().filter(t -> t.getUserID().equals(id)).findFirst().get();
    }
}
