package com.aramb.parkandpee.services;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

public interface FileStorageService {
    String storeFile(MultipartFile file, int id, String type);
    Resource loadFileAsResource(String fileName);
}
