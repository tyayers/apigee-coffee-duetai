FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /coffeeservice .

FROM gcr.io/distroless/static-debian11

ENV GIN_MODE=release

COPY --from=builder /coffeeservice .

ENTRYPOINT ["/coffeeservice"]

EXPOSE 8080