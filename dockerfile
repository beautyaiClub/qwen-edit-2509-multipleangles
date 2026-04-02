# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail qweneditutils@2.0.7 --mode remote
RUN comfy node install --exit-on-fail comfyui-easy-use@1.3.6
RUN comfy node install --exit-on-fail was-ns@3.0.1
# Could not resolve unknown_registry (no aux_id provided) - skipping

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b.safetensors --relative-path models/clip --filename qwen_2.5_vl_7b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors --relative-path models/vae --filename qwen_image_vae.safetensors
RUN comfy model download --url https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-8steps-V2.0.safetensors --relative-path models/loras --filename Qwen-Image-Lightning-8steps-V2.0.safetensors
RUN comfy model download --url https://huggingface.co/lovis93/next-scene-qwen-image-lora-2509/resolve/main/next-scene_lora-v2-3000.safetensors --relative-path models/loras --filename next-scene_lora-v2-3000.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/loras/Qwen-Edit-2509-Multiple-angles.safetensors --relative-path models/loras --filename Qwen-Edit-2509-Multiple-angles.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2509_fp8_e4m3fn.safetensors --relative-path models/diffusion_models --filename qwen_image_edit_2509_fp8_e4m3fn.safetensors
# RUN # Could not find URL for <model-name>

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
