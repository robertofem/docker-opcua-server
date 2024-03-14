Test OPC-UA Server Docker
=========================

Build Docker image
------------------
docker build -t server-opcua .

Run Docker container
--------------------
docker run -dp 4840:4840 server-opcua
