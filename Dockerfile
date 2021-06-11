FROM rust:1.52 as build

COPY ./ ./

RUN cargo build --release

RUN mkdir -p /build
RUN cp target/release/ecu-bridge /build/

FROM ubuntu:18.04

COPY --from=build /build/ecu-bridge /

CMD ["/ecu-bridge"]
