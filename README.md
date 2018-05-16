# polis_container

Install docker and docker swarm and docker-compose to run container on 


Polis Container using docker-compose
 
  copy docker-compose.yml
  
    docker-compose up  
    
    or 
    
    docker-compose up -d
    
## Prepare Docker Environment

 Run *polisContainer.sh* if you are not aware of system os. This will install docker environment whether the os is ubuntu on centos 7. Go to *docker_setup/install.sh* to prepare your docker nevironment on ubuntu xenial (16.04) 
        
        sh polisContainer.sh
        
        # Docker install on Ubuntu 16.04 
        
        sh docker_setup/install.sh
        

Create docker-compose.yml using following -
----------------------------------------
    
        version: '2'
        services:
            # Polis PostgreSQL Database
            polisdb:
                image: uzzal2k5/polis_postgresql:1.0
                container_name: polisdb
                ports:
                  - "5432:5432/tcp"
                restart: on-failure

            # Polis Server
            polisserver:
                image: uzzal2k5/polis_server:1.0
                container_name: polisserver
                ports:
                  - "5000:5000/tcp"
                links:
                  - polisdb
                environment:
                  DATABASE_URL: postgres://polis:polis@polisdb/polis
                  STATIC_FILES_HOST: clientparticipation
                restart: on-failure

            # Polis Client Admin & Participants
            clientparticipant:
                image: uzzal2k5/polis_clientparticipation:1.0
                container_name: clientparticipant
                hostname: clientparticipant
                environment:
                  SERVICE_URL: polisserver
                links:
                  - polisserver
                ports:
                  - "5001:5001"
                  - "8000:8000"
                restart: on-failure
    
            # Polis Client Admin 
            clientadmin:
                image: uzzal2k5/polis_clientadmin:1.0
                container_name: clientadmin
                hostname: clientadmin
                environment:
                  SERVICE_URL: polisserver
                links:
                  - polisserver
                ports:
                  - "5002:5002"
                restart: on-failure


            # Polis Math Container
            math:
                image: uzzal2k5/polis_math:1.0
                container_name: math
                hostname: math
                environment:
                  SERVICE_URL: polisserver
                  DATABASE_URL: postgres://polis:polis@polisdb/polis
                links:
                  - polisserver
                  - polisdb
                ports:
                  - "8080:8080"
                restart: on-failure



# Build and Run Docker Container from Source

Please Review Bash Script and make any change you need to adjust with your environment

    git clone -b master  https://github.com/uzzal2k5/polis_container.git
    cd  polis_container && sh polisContainer.sh
    
    Note : You can use your host IP rather than 127.0.0.1  in --advertise-addr 127.0.0.1 to initialize your docker swarm


# Build you own Image
You can run polis-build.sh or follow the instruction bellow
    
    sh polis-build.sh


#### Build Image Individually -

Build polis_postgresql

      
    git clone hhttps://github.com/uzzal2k5/polispostgres.git
        cd   polispostgres
        docker build -t polis_postgresql .
        
Build polis_leiningen 
   
    git clone https://github.com/uzzal2k5/polisleiningen.git
    cd  polisleiningen
    docker build -t polis_leiningen .
 
Build polis_ClientParticipation   
    
    git clone https://github.com/uzzal2k5/polisClientParticipation.git
    cd  polisClientParticipation
    docker build  -t polis_clientparticipants .

Build polis_ClientAdmin   
    
    git clone https://github.com/uzzal2k5/polisClientAdmin.git
    cd  polisClientAdmin
    docker build  -t polis_clientadmin .

Build polis_server  
    
    git clone https://github.com/uzzal2k5/polisserver.git
    cd polisserver
    docker build -t polis_server .
Build polis_math
 
    git clone https://github.com/uzzal2k5/polismath.git
    cd  polismath
    docker build polis_math .
     
    
