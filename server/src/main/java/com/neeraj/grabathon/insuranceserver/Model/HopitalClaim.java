package com.neeraj.grabathon.insuranceserver.Model;

import com.neeraj.grabathon.insuranceserver.Model.Insurance.Claim;

public class HopitalClaim extends Claim {
    private String imagePath;
    private String imageDecodedTest;
    private String claimCategory;
    private String amountClaimed;
    private String status;

    public HopitalClaim(String userID, String policyID, String imagePath, String imageDecodedTest, String claimCategory, String amountClaimed, String status) {
        super(userID, policyID);
        this.imagePath = imagePath;
        this.imageDecodedTest = imageDecodedTest;
        this.claimCategory = claimCategory;
        this.amountClaimed = amountClaimed;
        this.status = status;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getImageDecodedTest() {
        return imageDecodedTest;
    }

    public void setImageDecodedTest(String imageDecodedTest) {
        this.imageDecodedTest = imageDecodedTest;
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
}
