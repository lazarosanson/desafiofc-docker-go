FROM golang:1.22.4-alpine AS builder

WORKDIR /app
COPY main.go .
RUN go build -o main main.go

FROM scratch

WORKDIR /app
COPY --from=builder /app/main .

ENTRYPOINT [ "./main" ]