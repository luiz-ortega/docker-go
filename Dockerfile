FROM golang:1.17-alpine AS builder

WORKDIR /go/src/app
COPY . .

RUN go build .

FROM scratch
WORKDIR /go/src/app
COPY --from=builder /go/src/app /go/src/app

ENTRYPOINT [ "./app" ]

