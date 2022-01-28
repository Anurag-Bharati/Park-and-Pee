package com.aramb.parkandpee.model;

import lombok.Data;

@Data
public class UploadFileResponse {
    private final String fileName;
    private final String fileDownloadUri;
    private final String fileType;
    private final long size;

}
