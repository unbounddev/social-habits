FROM alpine:3.23.4 AS downloader
RUN apk add --no-cache unzip ca-certificates
ADD https://github.com/pocketbase/pocketbase/releases/download/v0.39.1/pocketbase_0.39.1_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /tmp/pb

# 2. Build the final image
FROM alpine:3.23.4
RUN apk add --no-cache ca-certificates

# Copy the binary
COPY --from=downloader /tmp/pb/pocketbase /usr/local/bin/pocketbase

# Copy your declarative app code
COPY pb_migrations /pb/pb_migrations
COPY pb_hooks /pb/pb_hooks

WORKDIR /pb

# Expose port 8090
EXPOSE 8090

# Start PocketBase, binding to all interfaces
CMD ["pocketbase", "serve", "--http=0.0.0.0:8090"]
