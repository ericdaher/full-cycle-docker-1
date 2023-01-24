FROM golang:1.19.5 AS builder

WORKDIR /src

COPY src/. .

RUN go mod download && go mod verify && go build -v -o /app .

FROM scratch

WORKDIR /

COPY --from=builder /app /app

ENTRYPOINT [ "/app" ]
