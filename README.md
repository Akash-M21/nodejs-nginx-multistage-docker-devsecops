# Node.js Multi-stage Docker Build

A Node.js application packaged using a **multi-stage Docker build**.

This project demonstrates:

* Node.js application build
* Testing during Docker build
* Removing unnecessary dependencies
* Serving the final application using Nginx

---

## Architecture

```
Application Source
        |
        v
 Node Build Stage
        |
        v
 Test Stage
        |
        v
 Nginx Runtime Image
        |
        v
 Docker Container
```

---

## Project Structure

```
node-multistage-app/

├── Dockerfile
├── package.json
├── package-lock.json
├── server.js
└── public
    └── index.html
```

---

## Technologies Used

* Node.js
* Express.js
* Nginx
* Docker

---

# Docker Multi-stage Build

The Dockerfile contains multiple stages.

---

## Stage 1: Build

Base image:

```
node:22
```

Tasks:

* Install dependencies
* Copy application code
* Run tests

Commands:

```
npm install

npm test
```

---

## Stage 2: Runtime

Base image:

```
nginx:alpine
```

Only copies:

```
public/
```

into:

```
/usr/share/nginx/html
```

Final image contains:

* Nginx
* Static application files

It does not contain:

* Node.js
* npm
* Source code

---

# Build Docker Image

Clone repository:

```bash
git clone <repository-url>

cd node-multistage-app
```

Build:

```bash
docker build -t node-app .
```

---

# Run Container

```bash
docker run -d \
-p 80:80 \
--name node-container \
node-app
```

---

# Access Application

Open:

```
http://localhost
```

Expected output:

```
Node Docker Multi Stage Build

Application running successfully
```

---

# Useful Commands

Check container:

```bash
docker ps
```

View logs:

```bash
docker logs node-container
```

Stop:

```bash
docker stop node-container
```

Remove:

```bash
docker rm node-container
```

---

# Benefits

| Without Multi-stage               | With Multi-stage       |
| --------------------------------- | ---------------------- |
| Node image required in production | Nginx only             |
| Larger image size                 | Smaller image          |
| More vulnerabilities              | Reduced attack surface |
| More dependencies                 | Minimal runtime        |

---

## Author

AKASH M
