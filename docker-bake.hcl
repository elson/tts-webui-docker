variable "REGISTRY" {
    default = "docker.io"
}

variable "REGISTRY_USER" {
    default = "ashleykza"
}

variable "APP" {
    default = "tts-webui"
}

variable "RELEASE" {
    default = "4.1.0"
}

variable "CU_VERSION" {
    default = "124"
}

variable "BASE_IMAGE_REPOSITORY" {
    default = "ashleykza/runpod-base"
}

variable "BASE_IMAGE_VERSION" {
    default = "2.4.2"
}

variable "CUDA_VERSION" {
    default = "12.4.1"
}

variable "TORCH_VERSION" {
    default = "2.6.0"
}

variable "PYTHON_VERSION" {
    default = "3.11"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["${REGISTRY}/${REGISTRY_USER}/${APP}:${RELEASE}"]
    args = {
        RELEASE = "${RELEASE}"
        BASE_IMAGE = "${BASE_IMAGE_REPOSITORY}:${BASE_IMAGE_VERSION}-python${PYTHON_VERSION}-cuda${CUDA_VERSION}-torch${TORCH_VERSION}"
        INDEX_URL = "https://download.pytorch.org/whl/cu${CU_VERSION}"
        TORCH_VERSION = "${TORCH_VERSION}+cu${CU_VERSION}"
        XFORMERS_VERSION = "0.0.29.post3"
        TTS_COMMIT = "ba626d16b68c35f2e9c12e73f5350a6ccca5a52f"
    }
}
