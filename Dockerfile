FROM golang:1.17-buster AS build

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go build -o /full-cycle

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /full-cycle /full-cycle

ENTRYPOINT ["/full-cycle"]