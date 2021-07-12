FROM rust:1.53.0-slim-bullseye AS builder

WORKDIR /src

COPY . .

RUN cargo build --release


FROM debian:bullseye-slim

WORKDIR /app

COPY --from=builder /src/target/release/apery /app/apery
COPY --from=builder /src/eval/20190617 /app/eval/20190617
