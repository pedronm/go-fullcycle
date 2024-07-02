# Build & Compile
FROM golang:1.22.3-alpine as Builder

WORKDIR /app

RUN echo $'package main; func main(){print(\"Full Cycle Rocks!!\");}' > fullcycle.go

RUN go mod init full-go.com

RUN env GOOS=linux GOARCH=amd64 go build fullcycle.go

# RUN 1,86MB
FROM scratch	

COPY --from=Builder ./app .

CMD ["./fullcycle"]
