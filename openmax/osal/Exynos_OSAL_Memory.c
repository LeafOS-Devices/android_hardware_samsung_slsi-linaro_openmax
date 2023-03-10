/*
 *
 * Copyright 2012 Samsung Electronics S.LSI Co. LTD
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * @file        Exynos_OSAL_Memory.c
 * @brief
 * @author      SeungBeom Kim (sbcrux.kim@samsung.com)
 * @version     2.0.0
 * @history
 *   2012.02.20 : Create
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

#include "Exynos_OSAL_Memory.h"

//#define EXYNOS_LOG_OFF
#include "Exynos_OSAL_Log.h"


static int mem_cnt = 0;

OMX_PTR Exynos_OSAL_Malloc(OMX_U32 size)
{
    OMX_PTR addr = NULL;

    addr = (OMX_PTR)malloc(size);
    if (addr != NULL) {
        mem_cnt++;
        Exynos_OSAL_Log(EXYNOS_LOG_TRACE, "[%s] count: %d", __FUNCTION__, mem_cnt);
    }

    return addr;
}

void Exynos_OSAL_Free(OMX_PTR addr)
{
    if (addr) {
        free(addr);
        mem_cnt--;
        Exynos_OSAL_Log(EXYNOS_LOG_TRACE, "[%s] count: %d", __FUNCTION__, mem_cnt);
    }

    return;
}

OMX_PTR Exynos_OSAL_Memset(OMX_PTR dest, OMX_S32 c, OMX_S32 n)
{
    return memset(dest, c, n);
}

OMX_PTR Exynos_OSAL_Memcpy(OMX_PTR dest, OMX_PTR src, OMX_S32 n)
{
    return memcpy(dest, src, n);
}

OMX_PTR Exynos_OSAL_Memmove(OMX_PTR dest, OMX_PTR src, OMX_S32 n)
{
    return memmove(dest, src, n);
}

OMX_S32 Exynos_OSAL_Memcmp(OMX_PTR dest, OMX_PTR src, OMX_S32 n)
{
    return memcmp(dest, src, n);
}

OMX_PTR Exynos_OSAL_Mmap(OMX_PTR addr, size_t length, OMX_S32 prot, OMX_S32 flags, unsigned long fd, off_t offset)
{
    return mmap(addr, length, prot, flags, fd, offset);
}

OMX_S32 Exynos_OSAL_Munmap(OMX_PTR addr, size_t length)
{
    return munmap(addr, length);
}
