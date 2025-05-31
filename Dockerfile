# ──────────────────────────────────────────────────────────────────────────────
# Dockerfile
# ──────────────────────────────────────────────────────────────────────────────

FROM devkitpro/devkitarm:latest

# install only make
RUN apt-get update \
 && apt-get install -y --no-install-recommends make \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# point at devkitPRO and devkitARM and ensure the cross-compiler is on PATH
ENV DEVKITPRO=/opt/devkitpro \
    DEVKITARM=/opt/devkitpro/devkitARM \
    PATH=/opt/devkitpro/devkitARM/bin:${PATH}

# bind-mount point for your host repo
VOLUME /workspace

# build from your template_c folder
WORKDIR /workspace/template_c

# run Make by default
ENTRYPOINT ["make"]
