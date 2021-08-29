# Cloud_m20aie213


# Clone the code from GitHub:

amit@VM-M20AIE213-1:~/WebApp$ git clone https://github.com/amishrm/cloud_m20aie213.git
Cloning into 'cloud_m20aie213'...
remote: Enumerating objects: 16, done.
remote: Counting objects: 100% (16/16), done.
remote: Compressing objects: 100% (14/14), done.
remote: Total 16 (delta 4), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (16/16), 5.59 KiB | 1.12 MiB/s, done.
amit@VM-M20AIE213-1:~/WebApp$ cd cloud_m20aie213/

# Build an Image:

amit@VM-M20AIE213-1:~/WebApp/cloud_m20aie213$ sudo docker build --tag cloud_m20aie213:v1.0.0 .
Sending build context to Docker daemon  101.9kB
Step 1/10 : FROM python:3.8-slim-buster
 ---> 4594dc5e9028
Step 2/10 : RUN apt-get update -y
 ---> Using cache
 ---> e5118d0aa44c
Step 3/10 : RUN apt-get install -y default-libmysqlclient-dev python3-pip python3-dev build-essential
 ---> Using cache
 ---> 7b3c69f25abe
Step 4/10 : LABEL maintainer="Amit Sharma <sharma.95@iitj.ac.in>"
 ---> Using cache
 ---> 1694761b6e4a
Step 5/10 : EXPOSE 5000
 ---> Using cache
 ---> 6cb2ec5d622d
Step 6/10 : COPY requirements.txt .
 ---> Using cache
 ---> a97d64c73b11
Step 7/10 : RUN python3 -m pip install -r requirements.txt
 ---> Using cache
 ---> 9734315e818c
Step 8/10 : WORKDIR /app
 ---> Using cache
 ---> cc6e66019cc9
Step 9/10 : COPY . /app
 ---> d3501b4c3461
Step 10/10 : CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
 ---> Running in abb15269f8fa
Removing intermediate container abb15269f8fa
 ---> fe459e64a0b0
Successfully built fe459e64a0b0
Successfully tagged cloud_m20aie213:v1.0.0

# Check Docker Images:

amit@VM-M20AIE213-1:~/WebApp/cloud_m20aie213$ sudo docker images
REPOSITORY        TAG               IMAGE ID       CREATED             SIZE
cloud_m20aie213   v1.0.0            fe459e64a0b0   38 seconds ago      554MB
m20aie213         v1.0.0            5b71453007fb   43 minutes ago      554MB
amit-docker       latest            72c63a44ccc2   53 minutes ago      556MB
<none>            <none>            8bd004befd1d   About an hour ago   525MB
python-docker     v1.0.0            83b39b2c084f   About an hour ago   443MB
<none>            <none>            27908b66d0ea   2 hours ago         114MB
python            3.8-slim-buster   4594dc5e9028   12 days ago         114MB
ubuntu            20.04             1318b700e415   4 weeks ago         72.8MB
hello-world       latest            d1165f221234   5 months ago        13.3kB

# Show all Container:

amit@VM-M20AIE213-1:~/WebApp/cloud_m20aie213$ sudo docker ps -a
CONTAINER ID   IMAGE                  COMMAND                  CREATED             STATUS                           PORTS     NAMES
a463ab545eef   m20aie213:v1.0.0       "gunicorn --bind 0.0…"   41 minutes ago      Exited (0) 39 minutes ago                  festive_shtern
85a41188c97f   m20aie213:v1.0.0       "gunicorn --bind 0.0…"   42 minutes ago      Exited (0) 41 minutes ago                  quirky_ardinghelli
c5aa3e8b7a3c   amit-docker:latest     "gunicorn --bind 0.0…"   51 minutes ago      Exited (0) 44 minutes ago                  pedantic_leavitt
7468ecd0101b   amit-docker:latest     "gunicorn --bind 0.0…"   52 minutes ago      Exited (0) 51 minutes ago                  kind_hodgkin
1daa436a8ade   e5118d0aa44c           "/bin/sh -c 'apt-get…"   56 minutes ago      Exited (100) 56 minutes ago                magical_margulis
4e166ef08e80   d5c678f9b3ba           "/bin/sh -c 'apt-get…"   59 minutes ago      Exited (1) 59 minutes ago                  ecstatic_kepler
68e23a39672c   8bd004befd1d           "/bin/sh -c 'python3…"   About an hour ago   Exited (1) About an hour ago               recursing_jepsen
e65a7aefd793   d5c678f9b3ba           "/bin/sh -c 'apt-get…"   About an hour ago   Exited (100) About an hour ago             wizardly_hermann
b82b3497e17c   e5118d0aa44c           "/bin/sh -c 'apt-get…"   About an hour ago   Exited (100) About an hour ago             hardcore_turing
3f9069805338   python-docker:v1.0.0   "gunicorn --bind 0.0…"   About an hour ago   Exited (0) About an hour ago               nervous_sanderson
a7767536aacc   python-docker:v1.0.0   "gunicorn --bind 0.0…"   About an hour ago   Exited (0) About an hour ago               intelligent_franklin
6c9a5a3c19e4   34da5e2592de           "/bin/sh -c 'python …"   About an hour ago   Exited (127) About an hour ago             relaxed_villani
d176bf4cd90e   27908b66d0ea           "/bin/sh -c 'python …"   2 hours ago         Exited (1) 2 hours ago                     magical_chatterjee
dd8948d5ac3f   hello-world            "/hello"                 2 hours ago         Exited (0) 2 hours ago                     priceless_feynman


# Run the Container:

amit@VM-M20AIE213-1:~/WebApp/cloud_m20aie213$ sudo docker run --publish 5000:5000 cloud_m20aie213:v1.0.0
[2021-08-29 18:48:05 +0000] [1] [INFO] Starting gunicorn 20.1.0
[2021-08-29 18:48:05 +0000] [1] [INFO] Listening at: http://0.0.0.0:5000 (1)
[2021-08-29 18:48:05 +0000] [1] [INFO] Using worker: sync
[2021-08-29 18:48:05 +0000] [9] [INFO] Booting worker with pid: 9


# Check whether Container is running or not:

amit@VM-M20AIE213-1:~$ curl localhost:5000
<html>
	<head>
		<meta charset="UTF-8">
		<title> Login </title>
		<link rel="stylesheet" href="../static/style.css">	
	</head>
	<body>
		<div class="logincontent" align="center">
			<div class="logintop">
				<h1>Login</h1>
			</div></br></br></br></br>
			<div class="loginbottom">
			<form action="/login" method="post" autocomplete="off">
			<div class="msg"></div>
			<input type="text" name="username" placeholder="Enter Your Username" class="textbox" id="username" required></br></br>
			<input type="password" name="password" placeholder="Enter Your Password" class="textbox" id="password" required></br></br></br>
			<input type="submit" class="btn" value="Login">
			</form></br></br>
			<p class="worddark">New to this page? <a class="worddark" href="/register">Register here</a></p>
			</div>
		</div>
	</body>
</html>

# Build an Image using Git Repostiory:

amit@VM-M20AIE213-1:~/WebApp/temp$ sudo docker build https://github.com/amishrm/cloud_m20aie213.git#main --tag cloud_m20aie213:main
Sending build context to Docker daemon  99.33kB
Step 1/10 : FROM python:3.8-slim-buster
 ---> 4594dc5e9028
Step 2/10 : RUN apt-get update -y
 ---> Using cache
 ---> e5118d0aa44c
Step 3/10 : RUN apt-get install -y default-libmysqlclient-dev python3-pip python3-dev build-essential
 ---> Using cache
 ---> 7b3c69f25abe
Step 4/10 : LABEL maintainer="Amit Sharma <sharma.95@iitj.ac.in>"
 ---> Using cache
 ---> 1694761b6e4a
Step 5/10 : EXPOSE 5000
 ---> Using cache
 ---> 6cb2ec5d622d
Step 6/10 : COPY requirements.txt .
 ---> Using cache
 ---> 23a3aeddf081
Step 7/10 : RUN python3 -m pip install -r requirements.txt
 ---> Using cache
 ---> cc2374b3ac2a
Step 8/10 : WORKDIR /app
 ---> Using cache
 ---> f9b37dc06531
Step 9/10 : COPY . /app
 ---> d588effd9640
Step 10/10 : CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
 ---> Running in f7501be2e045
Removing intermediate container f7501be2e045
 ---> 39df5f8c257b
Successfully built 39df5f8c257b
Successfully tagged cloud_m20aie213:main


# Check Docker Images:

amit@VM-M20AIE213-1:~/WebApp/temp$ sudo docker images
REPOSITORY        TAG               IMAGE ID       CREATED             SIZE
cloud_m20aie213   main              39df5f8c257b   24 seconds ago      554MB
<none>            <none>            0f4b18c202f6   2 minutes ago       554MB
<none>            <none>            ad858ed9be3b   4 minutes ago       554MB
cloud_m20aie213   v1.0.0            fe459e64a0b0   21 minutes ago      554MB
m20aie213         v1.0.0            5b71453007fb   About an hour ago   554MB
amit-docker       latest            72c63a44ccc2   About an hour ago   556MB
<none>            <none>            8bd004befd1d   About an hour ago   525MB
python-docker     v1.0.0            83b39b2c084f   2 hours ago         443MB
<none>            <none>            27908b66d0ea   2 hours ago         114MB
python            3.8-slim-buster   4594dc5e9028   12 days ago         114MB
ubuntu            20.04             1318b700e415   4 weeks ago         72.8MB
hello-world       latest            d1165f221234   5 months ago        13.3kB

# Run the Container:

amit@VM-M20AIE213-1:~/WebApp/temp$ sudo docker run --publish 5000:5000 cloud_m20aie213:main
[2021-08-29 19:08:11 +0000] [1] [INFO] Starting gunicorn 20.1.0
[2021-08-29 19:08:11 +0000] [1] [INFO] Listening at: http://0.0.0.0:5000 (1)
[2021-08-29 19:08:11 +0000] [1] [INFO] Using worker: sync
[2021-08-29 19:08:11 +0000] [10] [INFO] Booting worker with pid: 10

