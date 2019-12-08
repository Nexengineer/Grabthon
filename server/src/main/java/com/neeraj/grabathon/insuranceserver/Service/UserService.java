package com.neeraj.grabathon.insuranceserver.Service;

import com.neeraj.grabathon.insuranceserver.Model.Insurance.Insurance;
import com.neeraj.grabathon.insuranceserver.Model.Insurance.InsuranceCoverage;
import com.neeraj.grabathon.insuranceserver.Model.User;
import com.neeraj.grabathon.insuranceserver.Utils.SHAGenerator;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class UserService {
     List<User> arrayUserList = Arrays.asList(
        new User(SHAGenerator.applySha256("neeraj mishra"),"neeraj","mishra",
                "1st a main road BTM 2nd Stage", Arrays.asList(
                        new Insurance(SHAGenerator.applySha256("neeraj mishra VechileClaim"),
                                SHAGenerator.applySha256("neeraj mishra"),"VechileClaim",
                                Arrays.asList(
                                        new InsuranceCoverage("Theft"),
                                        new InsuranceCoverage("Accident")
                                )),
                        new Insurance(SHAGenerator.applySha256("neeraj mishra FlightClaim"),
                        SHAGenerator.applySha256("neeraj mishra"),"FlightClaim",
                        Arrays.asList(
                                new InsuranceCoverage("Flight Delayed"),
                                new InsuranceCoverage("Baggage theft")
                        )),
                        new Insurance(SHAGenerator.applySha256("neeraj mishra HealthClaim"),
                        SHAGenerator.applySha256("neeraj mishra"),"HealthClaim",
                        Arrays.asList(
                                new InsuranceCoverage("Cancer Treatment"),
                                new InsuranceCoverage("Other Treatment")
                        ))

        ) ),
            new User(SHAGenerator.applySha256("Shrikant mishra"),"Shrikant","mishra",
                    "1st a main road BTM 2nd Stage", Arrays.asList(
                    new Insurance(SHAGenerator.applySha256("Shrikant mishra VechileClaim"),
                            SHAGenerator.applySha256("Shrikant mishra"),"VechileClaim",
                            Arrays.asList(
                                    new InsuranceCoverage("Theft"),
                                    new InsuranceCoverage("Accident")
                            )),
                    new Insurance(SHAGenerator.applySha256("Shrikant mishra FlightClaim"),
                            SHAGenerator.applySha256("Shrikant mishra"),"FlightClaim",
                            Arrays.asList(
                                    new InsuranceCoverage("Flight Delayed"),
                                    new InsuranceCoverage("Baggage theft")
                            )),
                    new Insurance(SHAGenerator.applySha256("Shrikant mishra HealthClaim"),
                            SHAGenerator.applySha256("Shrikant mishra"),"HealthClaim",
                            Arrays.asList(
                                    new InsuranceCoverage("Cancer Treatment"),
                                    new InsuranceCoverage("Other Treatment")
                            ))

            ) )
    );

    // Getting all the users
    public List<User> getAllUsers(){
        return arrayUserList;
    }

    public User getUserByID(String id) {
        return arrayUserList.stream().filter(t -> t.getUserID().equals(id)).findFirst().get();
    }
}
