FROM rust:1.52 as build

COPY ./ ./

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install podman
RUN cargo install cross
RUN cross build --release --target=armv7-unknown-linux-gnueabihf

RUN mkdir -p /build
RUN cp target/release/ecu-bridge /build/

FROM ubuntu:18.04

COPY --from=build /build/ecu-bridge /

CMD ["/ecu-bridge"]
