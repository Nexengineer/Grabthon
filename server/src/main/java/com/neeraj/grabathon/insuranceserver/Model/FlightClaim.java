package com.neeraj.grabathon.insuranceserver.Model;

import com.neeraj.grabathon.insuranceserver.Model.Insurance.Claim;

public class FlightClaim extends Claim {
    private String claimCategory;
    private String amountClaimed;
    private String status;
    private String boardingPass;
    private String boardingPassDecodedText;
    private Boolean isDelayed;
    private String cargoThiefProofImagePath;
    private String cargoThiefProofText;

    public FlightClaim(String userID, String policyID, String claimCategory, String amountClaimed, String status, String boardingPass, String boardingPassDecodedText, Boolean isDelayed, String cargoThiefProofImagePath, String cargoThiefProofText) {
        super(userID, policyID);
        this.claimCategory = claimCategory;
        this.amountClaimed = amountClaimed;
        this.status = status;
        this.boardingPass = boardingPass;
        this.boardingPassDecodedText = boardingPassDecodedText;
        this.isDelayed = isDelayed;
        this.cargoThiefProofImagePath = cargoThiefProofImagePath;
        this.cargoThiefProofText = cargoThiefProofText;
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

    public String getBoardingPass() {
        return boardingPass;
    }

    public void setBoardingPass(String boardingPass) {
        this.boardingPass = boardingPass;
    }

    public String getBoardingPassDecodedText() {
        return boardingPassDecodedText;
    }

    public void setBoardingPassDecodedText(String boardingPassDecodedText) {
        this.boardingPassDecodedText = boardingPassDecodedText;
    }

    public Boolean getDelayed() {
        return isDelayed;
    }

    public void setDelayed(Boolean delayed) {
        isDelayed = delayed;
    }

    public String getCargoThiefProofImagePath() {
        return cargoThiefProofImagePath;
    }

    public void setCargoThiefProofImagePath(String cargoThiefProofImagePath) {
        this.cargoThiefProofImagePath = cargoThiefProofImagePath;
    }

    public String getCargoThiefProofText() {
        return cargoThiefProofText;
    }

    public void setCargoThiefProofText(String cargoThiefProofText) {
        this.cargoThiefProofText = cargoThiefProofText;
    }
}
