package com.neeraj.grabathon.insuranceserver.controller;

import com.neeraj.grabathon.insuranceserver.Model.FlightClaim;
import com.neeraj.grabathon.insuranceserver.Model.HopitalClaim;
import com.neeraj.grabathon.insuranceserver.Model.Insurance.Claim;
import com.neeraj.grabathon.insuranceserver.Model.VechileClaim;
import com.neeraj.grabathon.insuranceserver.Service.ClaimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/claim")
public class ClaimController {

    @Autowired
    private ClaimService claimService;

    @RequestMapping("")
    List<Claim> getAllClaims(){
        return claimService.getAllClaims();
    }

    @RequestMapping("/{id}")
    List<Claim> getClaimByUserID(@PathVariable String id){
        return claimService.getClaimByUserID(id);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/health")
    void addClaim(@RequestBody HopitalClaim claim){
        claimService.addClaim(claim);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/vechile")
    void addClaim(@RequestBody VechileClaim claim){
        claimService.addClaim(claim);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/flight")
    void addClaim(@RequestBody FlightClaim claim){
        claimService.addClaim(claim);
    }
}
