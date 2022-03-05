package com.aramb.parkandpee.services.impl;

import com.aramb.parkandpee.config.FileStorageProperties;
import com.aramb.parkandpee.exceptions.FileStorageException;
import com.aramb.parkandpee.exceptions.MyFileNotFoundException;
import com.aramb.parkandpee.services.FileStorageService;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

@Service
public class FileStorageServiceImpl implements FileStorageService {

    private final Path fileStorageLocation;

    public FileStorageServiceImpl(FileStorageProperties fileStorageProperties) {

        this.fileStorageLocation = Paths.get(fileStorageProperties.getUploadDir()).toAbsolutePath().normalize();

        try {
            Files.createDirectories(this.fileStorageLocation);
        } catch (Exception ex) {
            throw new FileStorageException("Could not create the directory where the uploaded files will be stored.", ex);
        }
    }
    private String getFileType(String fileName){
        StringBuilder type= new StringBuilder();
        for (int i = 0; i < fileName.length(); i++) {
            if(fileName.charAt(i)=='.'){
                for (int j = i; j < fileName.length(); j++) {
                    type.append(fileName.charAt(j));
                }
            }
        }
        return type.toString();
    }

    @Override
    public String storeFile(MultipartFile file, int id, String type) {
        SimpleDateFormat formatter = new SimpleDateFormat(" dd-MM-yyyy HH-mm-ss");
        Date date = new Date();
        // Normalize file name and add upload date
        String originalFileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
        String fileName = id+type+formatter.format(date)+getFileType(originalFileName);

        try {
            // Check if the file's name contains invalid characters

             if (fileName.contains("..")) {
                throw new FileStorageException("Sorry! Filename contains invalid path sequence " + fileName);
            }

            // Copy file to the target location (Replacing existing file with the same name)
            Path targetLocation = this.fileStorageLocation.resolve(fileName);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            return fileName;
        } catch (IOException ex) {
            throw new FileStorageException("Could not store file " + fileName + ". Please try again!", ex);
        } catch (FileStorageException e) {
            e.printStackTrace();
        }
        return fileName;
    }

    @Override
    public Resource loadFileAsResource(String fileName) {
        try {
            Path filePath = this.fileStorageLocation.resolve(fileName).normalize();
            Resource resource = new UrlResource(filePath.toUri());
            if (resource.exists()) {
                return resource;
            } else {
                throw new MyFileNotFoundException("File not found " + fileName);
            }
        } catch (MalformedURLException ex) {
            throw new MyFileNotFoundException("File not found " + fileName, ex);
        } catch (MyFileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

}
