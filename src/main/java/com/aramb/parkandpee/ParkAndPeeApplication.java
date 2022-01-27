package com.aramb.parkandpee;

import com.aramb.parkandpee.config.FileStorageProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@EnableConfigurationProperties({
        FileStorageProperties.class
})
public class ParkAndPeeApplication {

    public static void main(String[] args) {
        SpringApplication.run(ParkAndPeeApplication.class, args);
    }

}
