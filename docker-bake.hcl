variable "REGISTRY" {
    default = "docker.io"
}

variable "REGISTRY_USER" {
    default = "ashleykza"
}

variable "APP" {
    default = "tts-generation"
}

variable "RELEASE" {
    default = "2.6.0"
}

variable "CU_VERSION" {
    default = "118"
}

variable "BASE_IMAGE_REPOSITORY" {
    default = "ashleykza/runpod-base"
}

variable "BASE_IMAGE_VERSION" {
    default = "1.7.0"
}

variable "CUDA_VERSION" {
    default = "11.8.0"
}

variable "TORCH_VERSION" {
    default = "2.0.0"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["${REGISTRY}/${REGISTRY_USER}/${APP}:${RELEASE}"]
    args = {
        RELEASE = "${RELEASE}"
        BASE_IMAGE = "${BASE_IMAGE_REPOSITORY}:${BASE_IMAGE_VERSION}-cuda${CUDA_VERSION}-torch${TORCH_VERSION}"
        INDEX_URL = "https://download.pytorch.org/whl/cu${CU_VERSION}"
        TORCH_VERSION = "${TORCH_VERSION}+cu${CU_VERSION}"
        XFORMERS_VERSION = "0.0.19"
        TTS_COMMIT = "09792985a6e4e11b817f7f11ed6a531b48cfdd9a"
    }
}
