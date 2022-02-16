# 0x18. Webstack monitoring
## Details
      By Sylvain Kalache, co-founder at Holberton School          Weight: 1                Ongoing project - started 02-16-2022, must end by 02-17-2022 (in about 14 hours)          - you're done with 0% of tasks.              Checker will be released at 02-16-2022 03:36 PM              An auto review will be launched at the deadline      ## Concepts
For this project, students are expected to look at these concepts:
* [Monitoring](https://intranet.hbtn.io/concepts/13) 

* [Server](https://intranet.hbtn.io/concepts/67) 

 ![](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/281/hb3pAsO.png) 

## Background Context
“You cannot fix or improve what you cannot measure” is a famous saying in the Tech industry. In the age of the data-ism, monitoring how our Software systems are doing is an important thing. In this project, we will implement one of many tools to measure what is going on our servers.
Web stack monitoring can be broken down into 2 categories:
* Application monitoring: getting data about your running software and making sure it is behaving as expected
* Server monitoring: getting data about your virtual or physical server and making sure they are not overloaded (could be CPU, memory, disk or network overload)
 ![](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/281/ktCXnhE.jpg) 

## Resources
Read or watch :
* [What is server monitoring](https://intranet.hbtn.io/rltoken/m8e7smqRz3k4PUBnv0zB7g) 

* [What is application monitoring](https://intranet.hbtn.io/rltoken/fGzCCVr7lwNEvarE8u1HRQ) 

* [System monitoring by Google](https://intranet.hbtn.io/rltoken/h6WV2iIVUCL-atjFIu6TZA) 

* [Nginx logging and monitoring](https://intranet.hbtn.io/rltoken/ZUIlnid6NphRWIaGZ3MTZQ) 

## Learning Objectives
At the end of this project, you are expected to be able to  [explain to anyone](https://intranet.hbtn.io/rltoken/fg0tmIkt2x_pb-c2j_J4OQ) 
 ,  without the help of Google :
### General
* Why is monitoring needed
* What are the 2 main area of monitoring
* What are access logs for a web server (such as Nginx)
* What are error logs for a web server (such as Nginx)
## Requirements
### General
* Allowed editors:  ` vi ` ,  ` vim ` ,  ` emacs ` 
* All your files will be interpreted on Ubuntu 16.04 LTS
* All your files should end with a new line
* A  ` README.md `  file, at the root of the folder of the project, is mandatory
* All your Bash script files must be executable
* Your Bash script must pass  ` Shellcheck `  (version  ` 0.3.7 ` ) without any error
* The first line of all your Bash scripts should be exactly  ` #!/usr/bin/env bash ` 
* The second line of all your Bash scripts should be a comment explaining what is the script doing
## Your servers
NameUsernameIPState3308-web-01 ` ubuntu `  ` 52.87.175.229 ` running              Actions              Toggle Dropdown* [Soft reboot](https://intranet.hbtn.io/servers/7279/soft_reboot) 

* [Hard reboot](https://intranet.hbtn.io/servers/7279/hard_reboot) 

* [
                    Ask a new server
                      (Last)
](https://intranet.hbtn.io/servers/7279/ask_new) 

3308-web-02 ` ubuntu `  ` 3.87.94.150 ` running              Actions              Toggle Dropdown* [Soft reboot](https://intranet.hbtn.io/servers/7019/soft_reboot) 

* [Hard reboot](https://intranet.hbtn.io/servers/7019/hard_reboot) 

* [
                    Ask a new server
](https://intranet.hbtn.io/servers/7019/ask_new) 

3308-lb-01 ` ubuntu `  ` 54.227.73.171 ` running              Actions              Toggle Dropdown* [Soft reboot](https://intranet.hbtn.io/servers/7020/soft_reboot) 

* [Hard reboot](https://intranet.hbtn.io/servers/7020/hard_reboot) 

* [
                    Ask a new server
](https://intranet.hbtn.io/servers/7020/ask_new) 

## Tasks
### 0. Sign up for Datadog and install datadog-agent
          mandatory         Progress vs Score  Task Body For this task head to  [https://www.datadoghq.com/](https://intranet.hbtn.io/rltoken/Uho9kxbX9KHCSYAQ-Zl1AQ) 
  and sign up for a free   ` Datadog `   account. When signing up, you’ll have the option of selecting statistics from your current stack that   ` Datadog `   can monitor for you. Once you have an account set up, follow the instructions given on the website to install the   ` Datadog `   agent. 
 ![](https://holbertonintranet.s3.amazonaws.com/uploads/medias/2019/6/6b0ea6345a6375437845.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOU5BHMTQX4%2F20220216%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220216T143343Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=15a0671a5ad819e36d31cfda946c6100279c7a32f113bf0415d585d08458d7ff) 

* Sign up for Datadog - Please make sure you are using the US website of Datagog (.com)
* Install  ` datadog-agent `  on  ` web-01 ` 
* Create an  ` application key ` 
* Copy-paste in your Intranet user profile ([here](https://intranet.hbtn.io/rltoken/2D6j3Y6G9c8o_t278-Cu_w) 
) your DataDog  ` API key `   and your DataDog  ` application key ` .
* Your server  ` web-01 `  should be visible in Datadog under the host name  ` XX-web-01 ` * You can validate it by using this [API](https://intranet.hbtn.io/rltoken/CyrSkrD0zPWXK4YBRRbTvw) 

* If needed, you will need to update the hostname of your server

 Task URLs  Github information Repo:
* GitHub repository:  ` holberton-system_engineering-devops ` 
* Directory:  ` 0x18-webstack_monitoring ` 
 Self-paced manual review  Panel footer - Controls 
### 1. Monitor some metrics
          mandatory         Progress vs Score  Task Body Among the litany of data your monitoring service can report to you are system metrics. You can use these metrics to determine statistics such as reads/writes per second, which can help your company determine if/how they should scale. Set up some   ` monitors `   within the   ` Datadog `   dashboard to monitor and alert you of a few. You can read about the various system metrics that you can monitor here:  [System Check](https://intranet.hbtn.io/rltoken/naY47nur2yPJNw8tdACnzQ) 
 .
 ![](https://holbertonintranet.s3.amazonaws.com/uploads/medias/2019/6/6a4551974aadc181e97a.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOU5BHMTQX4%2F20220216%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220216T143343Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=c3575ae97efd9c120a1f3f48cd10755a42dcdad55b94a036e71c66526eb81628) 

* Set up a monitor that checks the number of read requests issued to the device per second.
* Set up a monitor that checks the number of write requests issued to the device per second.
 Task URLs  Github information Repo:
* GitHub repository:  ` holberton-system_engineering-devops ` 
* Directory:  ` 0x18-webstack_monitoring ` 
 Self-paced manual review  Panel footer - Controls 
### 2. Create a dashboard
          mandatory         Progress vs Score  Task Body Now create a dashboard with different metrics displayed in order to get a few different visualizations.
* Create a new  ` dashboard ` 
* Add at least 4  ` widgets `  to your dashboard. They can be of any type and monitor whatever you’d like
* Create the answer file  ` 2-setup_datadog `  which has the  ` dashboard_id `  on the first line. Note: in order to get the id of your dashboard, you may need to use [Datadog’s API](https://intranet.hbtn.io/rltoken/VrzQP39UUFMmAKZx0IZLuw) 

 Task URLs  Github information Repo:
* GitHub repository:  ` holberton-system_engineering-devops ` 
* Directory:  ` 0x18-webstack_monitoring ` 
* File:  ` 2-setup_datadog ` 
 Self-paced manual review  Panel footer - Controls 
