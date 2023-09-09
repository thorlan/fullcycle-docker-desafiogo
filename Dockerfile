FROM golang:1.17-alpine3.15 AS builder
WORKDIR /app
COPY . .
RUN go build -ldflags '-w -s -extldflags "-static"' -a -o application main.go

FROM scratch           
WORKDIR /app
COPY --from=builder /app ./
CMD ["./application"]