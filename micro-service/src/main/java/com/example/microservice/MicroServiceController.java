package com.example.microservice;

import org.springframework.web.bind.annotation.*;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
@RequestMapping("/micro-service") //micro-service의 url로 gateway가 redirect하기 때문에 추가합니다.
public class MicroServiceController {

    @GetMapping
    public String healthCheck() {
        String hostName = "unknown";
        try {
            hostName = InetAddress.getLocalHost().getHostName();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        return "Hello from " + hostName + "!";
    }
}
