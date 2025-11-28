#!/usr/bin/env bash
echo "== GPU Verification Script =="

echo "Checking Metal support..."
system_profiler SPDisplaysDataType | grep Metal

echo "Checking Vulkan loader..."
vulkaninfo >/dev/null 2>&1 && echo "Vulkan OK" || echo "Vulkan NOT available"

echo "Testing OpenCL..."
python3 - << 'EOF'
import pyopencl as cl
platforms = cl.get_platforms()
print("OpenCL Platforms:", platforms)
EOF

echo "GPU verification complete."
