FROM rust:1.52 as build

COPY ./ ./

RUN rustup target add armv7-unknown-linux-gnueabihf
RUN cargo build --release --target=armv7-unknown-linux-gnueabihf

RUN mkdir -p /build
RUN cp target/release/ecu-bridge /build/

FROM ubuntu:18.04

COPY --from=build /build/ecu-bridge /

CMD ["/ecu-bridge"]
