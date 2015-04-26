library(data.table)

extract <- function(){
        
        #read test data into table
        data_test <- read.table("X_test.txt", header=FALSE)
        data_train <- read.table("X_train.txt", header=FALSE)
        
        #extract only mean and SD measurements
        data_test <- data_test[,c(1:6,41:46,81:86,121:126,161:166,201:202,
                                  214:215,227:228,240:241,253:254,266:271,
                                  294:296,345:350,373:375,424:429,452:454,
                                  503:504,513,516:517,526,529:530,539,
                                  542:543,552,555:561)]
        data_train <- data_train[,c(1:6,41:46,81:86,121:126,161:166,201:202,
                                    214:215,227:228,240:241,253:254,266:271,
                                    294:296,345:350,373:375,424:429,452:454,
                                    503:504,513,516:517,526,529:530,539,
                                    542:543,552,555:561)]
        
        #extract subject and activity
        data_test_subject <- read.table("subject_test.txt",header=FALSE)
        data_test_activity <- read.table("y_test.txt",header=FALSE)
        data_train_subject <- read.table("subject_train.txt", header=FALSE)
        data_train_activity <- read.table("y_train.txt", header=FALSE)
               
        #add subject and activity to test data
        m_data_test <- cbind(data_test_activity,data_test_subject,data_test)
        m_data_train <- cbind(data_train_activity,data_train_subject,data_train)
        
        #bind two table together
        merged_data <- rbind(m_data_test,m_data_train)

        #sort by activity and then by subject
        merged_data <- merged_data[order(merged_data[,1],merged_data[,2]),]
        
        #print(ncol(merged_data))
        
        #add column names
        #total num of column is 88
        names(merged_data)[1:88] = c("activity","subject","tBA_mX","tBA_mY","tBA_mZ","tBA_sdX","tBA_sdY","tBA_sdZ",
               "tGA_mX","tGA_mY","tGA_mZ","tGA_sdX","tGA_sdY","tGA_sdZ", 
               "tBAJ_mX","tBAJ_mY","tBAJ_mZ","tBAJ_sdX","tBAJ_sdY","tBAJ_sdZ",
                "tBG_mX","tBG,mY","tBG_mZ","tBG_sdX","tBG_sdY","tBG_sdZ",
                "tBGJ_mX","tBGJ_mY","tBGJ_mZ","tBGJ_sdX","tBGJ_sdY","tBGJ_sdZ",
                "tBAM_m","tBAM_sd","tGAM_m","tGAM_sd","tBAJM_m","tBAJM_sd",
                "tBGM_m","tBGM_sd","tBGJM_m","tBGJM_sd","fBA_mX","fBA_mY","fBA_mZ",
                "fBA_sdX","fBA_sdY","fBA_sdZ",
                "fBA_mFX","fBA_mFY","fBA_mFZ",
                "fBAJ_mX","fBAJ_mY","fBAJ_mZ",
                "fBAJ_sdX","fBAJ_sdY","fBAJ_sdZ",
                "fBAJ_mFX","fBAJ_mFY","fBAJ_mFZ",
                "fBG_mX","fBG_mY","fBG_mZ",
                "fBG_sdX","fBG_sdY","fBG_sdZ",
                "fBG_mFX","fBG_mFY","fBG_mFZ",
                "fBAM_m","fBAM_sd","fBAM_mF","fBBAJM_m","fBBAJM_sd",
                "fBBAJM_mF","fBBGM_m",
                "fBBGM_sd","fBBGM_mF",
                "fBBGJM_m","fBBGJM_sd","fBBGJM_mF",
                "a_tBAM_g","a_tBAJM_gm",
                "a_tBGM_gm","a_tBGJM_gm","a_X_gm","a_Y_gm","a_Z_gm")
        
        #assign name to activity
        merged_data$activity[merged_data$activity == 1] <- "W"
        merged_data$activity[merged_data$activity == 2] <- "W_US"
        merged_data$activity[merged_data$activity == 3] <- "W_DS"
        merged_data$activity[merged_data$activity == 4] <- "SIT"
        merged_data$activity[merged_data$activity == 5] <- "STD"
        merged_data$activity[merged_data$activity == 6] <- "L"        
        
        ##################################
        #project assignment 1-4 is done 
        ##################################
        #print(merged_data[1700:1750,])
        print(head(merged_data,20))
        
        ##################################
        #project assignment num 5
        ##################################

        #sort and calc ave 
        merged_data <- aggregate(merged_data[,3:88], 
                                by=list(activity=merged_data$activity, 
                                        subject=merged_data$subject), mean)
        
        #create tidy data set
        write.table(merged_data, file="tidy_data_set.txt", row.names=FALSE, col.names=TRUE)
}