#!/bin/bash

check_doppler_token() {
    TOKEN=$(doppler configure get token --scope / --plain)
    if [ -z "$TOKEN" ]; then
        return 1
    else
        return 0
    fi
}

ensure_doppler_token() {
    if ! check_doppler_token; then
        echo "Doppler token not set. Please enter your Doppler service token:"
        read -s DOPPLER_TOKEN

        echo "$DOPPLER_TOKEN" | doppler configure set token --scope /
        echo "Doppler CLI has been configured with the provided token."
    else
        echo "Doppler token is already set."
    fi
}

ensure_doppler_token
