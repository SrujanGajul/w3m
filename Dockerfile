# Multi-stage build for w3m
FROM ubuntu:22.04 AS builder

# Build arguments
ARG VERSION=dev
ARG BUILD_DATE
ARG VCS_REF

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libgc-dev \
    libncurses-dev \
    libssl-dev \
    zlib1g-dev \
    gettext \
    libgpmg1-dev \
    libbsd-dev \
    autoconf \
    automake \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copy source code
WORKDIR /build
COPY . .

# Configure and build
RUN ./configure \
    --prefix=/usr/local \
    --enable-image \
    --enable-ssl \
    --enable-ipv6 \
    --enable-unicode \
    --enable-nls \
    && make -j$(nproc) \
    && make install DESTDIR=/tmp/w3m-install

# Runtime stage
FROM ubuntu:22.04

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    libgc1 \
    libncurses6 \
    libssl3 \
    zlib1g \
    libgpm2 \
    libbsd0 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copy built w3m from builder stage
COPY --from=builder /tmp/w3m-install /

# Add labels
LABEL org.opencontainers.image.title="w3m" \
      org.opencontainers.image.description="w3m text-based web browser with redirect loop fix" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.revision="${VCS_REF}" \
      org.opencontainers.image.source="https://github.com/w3m/w3m" \
      org.opencontainers.image.licenses="MIT"

# Set w3m as entrypoint
ENTRYPOINT ["/usr/local/bin/w3m"]
CMD ["-help"]
