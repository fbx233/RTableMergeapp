# RTableMergeapp
## Introduction
RTableMergeApp is a powerful and user-friendly application developed in R, leveraging the capabilities of the Shiny framework to provide an intuitive graphical interface for merging datasets. Designed to simplify the process of identifying and combining the intersection of two tables, this tool caters to data analysts, researchers, and anyone in need of streamlining their data preparation tasks. With RTableMergeApp, users can effortlessly upload their datasets, specify the criteria for the intersection, and perform the merge operation with just a few clicks. The application not only enhances productivity by automating complex data manipulation tasks but also ensures accuracy and consistency in the results. Whether you're working on data analysis, research projects, or any task that requires precise dataset merging, RTableMergeApp is your go-to solution for efficient and reliable data integration.
## How to use it?
**Deploying RTableMergeApp on a Server for Local Network Access**

RTableMergeApp is designed to be easily deployable on a server, enabling users within the same local area network (LAN) to access and use the application through a web interface. Follow these steps to set up RTableMergeApp on your server and make it accessible to LAN users.

**Server Deployment**

1. **Install Git and Clone the Repository**

   First, ensure Git is installed on your server. Then, clone the RTableMergeApp repository to your server using the following command:

   ```bash
   git clone [Repository URL]
   ```

   Replace `[Repository URL]` with the actual URL of the RTableMergeApp repository.

2. **Navigate to the Application Directory**

   Change to the directory containing the RTableMergeApp:

   ```sh
   cd ~/merge_table
   ```

   Ensure the path matches where you cloned the RTableMergeApp repository.

3. **Run the Application**

   For Linux or Mac servers, execute the provided shell script to start the application:

   ```sh
   sh run.sh
   ```

   This script initializes the Shiny server and sets up RTableMergeApp to run as a web application accessible from any device on your local network.

**Accessing RTableMergeApp within the LAN**

After deploying RTableMergeApp on your server, users on the same local network can access it by navigating to the server's IP address in their web browser, followed by the specific port number if required (e.g., `http://server_ip:port`). Ensure your server's firewall and network settings allow HTTP traffic on the used port to enable seamless access.

**Conclusion**

Deploying RTableMergeApp on a server offers a convenient way for teams and users within the same network to merge tables and manipulate data using its intuitive graphical interface. By following the above steps, you can enhance your data analysis workflow, making collaborative data manipulation tasks more efficient and accessible to everyone on your network.

---

This description provides a comprehensive guide for server deployment and local network access, ensuring users can easily set up and access RTableMergeApp in a collaborative environment.
