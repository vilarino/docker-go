FROM golang:alpine as builder

WORKDIR /app

COPY . .

RUN go build -o /app/hello

FROM scratch

WORKDIR /app

COPY --from=builder /app/hello /hello

ENTRYPOINT [ "/hello" ]