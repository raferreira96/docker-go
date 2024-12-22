FROM golang:1.22-bookworm AS builder

WORKDIR /app

COPY . /app

RUN CGO_ENABLED=0 GOOS=linux go build -o main main.go

FROM scratch AS production

WORKDIR /app

COPY --from=builder /app/main ./

CMD ["./main"]