package com.neeraj.grabathon.insuranceserver.Model;

import com.neeraj.grabathon.insuranceserver.Model.Insurance.Claim;

public class VechileClaim extends Claim {

    private String claimCategory;
    private String amountClaimed;
    private String status;
    private Boolean isTheft;
    private String proofImagePath;
    private String ProofImageText;

    public VechileClaim(String userID, String policyID, String claimCategory, String amountClaimed, String status, Boolean isTheft, String proofImagePath, String proofImageText) {
        super(userID, policyID);
        this.claimCategory = claimCategory;
        this.amountClaimed = amountClaimed;
        this.status = status;
        this.isTheft = isTheft;
        this.proofImagePath = proofImagePath;
        ProofImageText = proofImageText;
    }

    public String getClaimCategory() {
        return claimCategory;
    }

    public void setClaimCategory(String claimCategory) {
        this.claimCategory = claimCategory;
    }

    public String getAmountClaimed() {
        return amountClaimed;
    }

    public void setAmountClaimed(String amountClaimed) {
        this.amountClaimed = amountClaimed;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Boolean getTheft() {
        return isTheft;
    }

    public void setTheft(Boolean theft) {
        isTheft = theft;
    }

    public String getProofImagePath() {
        return proofImagePath;
    }

    public void setProofImagePath(String proofImagePath) {
        this.proofImagePath = proofImagePath;
    }

    public String getProofImageText() {
        return ProofImageText;
    }

    public void setProofImageText(String proofImageText) {
        ProofImageText = proofImageText;
    }
}
