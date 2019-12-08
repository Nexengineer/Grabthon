package com.neeraj.grabathon.insuranceserver.Model.Insurance;

import java.util.List;

public class Insurance {
    private String policyID;
    private String userID;
    private String type;
    private List<InsuranceCoverage> coveredField;

    public Insurance(String policyID, String userID, String type, List<InsuranceCoverage> coveredField) {
        this.policyID = policyID;
        this.userID = userID;
        this.type = type;
        this.coveredField = coveredField;
    }

    public String getPolicyID() {
        return policyID;
    }

    public void setPolicyID(String policyID) {
        this.policyID = policyID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<InsuranceCoverage> getCoveredField() {
        return coveredField;
    }

    public void setCoveredField(List<InsuranceCoverage> coveredField) {
        this.coveredField = coveredField;
    }
}
