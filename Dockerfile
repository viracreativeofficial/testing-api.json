# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve unknown_registry node IllustriousMasterModel (no aux_id) - skipped
# Could not resolve unknown_registry node IllustriousKSamplerPro (no aux_id) - skipped
# Could not resolve unknown_registry node IllustriousVAEDecode (no aux_id) - skipped
# Could not resolve unknown_registry node IllustriousPrompt (no aux_id) - skipped
# Could not resolve unknown_registry node CLIPVisionLoader (no aux_id) - skipped
# Could not resolve unknown_registry node IPAdapterAdvanced (no aux_id) - skipped
# Could not resolve unknown_registry node IPAdapterModelLoader (no aux_id) - skipped

# download models into comfyui
RUN comfy model download --url https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors --relative-path models/clip --filename CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors
RUN comfy model download --url https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors --relative-path models/ipadapter --filename ip-adapter-plus_sdxl_vit-h.safetensors
# RUN # Could not find URL for WAI-ANI-ILLUSTRIOUS-SDXL.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
