/*
 * Copyright 1993-2020 NVIDIA Corporation.  All rights reserved.
 *
 * NOTICE TO LICENSEE:
 *
 * This source code and/or documentation ("Licensed Deliverables") are
 * subject to NVIDIA intellectual property rights under U.S. and
 * international Copyright laws.
 *
 * These Licensed Deliverables contained herein is PROPRIETARY and
 * CONFIDENTIAL to NVIDIA and is being provided under the terms and
 * conditions of a form of NVIDIA software license agreement by and
 * between NVIDIA and Licensee ("License Agreement") or electronically
 * accepted by Licensee.  Notwithstanding any terms or conditions to
 * the contrary in the License Agreement, reproduction or disclosure
 * of the Licensed Deliverables to any third party without the express
 * written consent of NVIDIA is prohibited.
 *
 * NOTWITHSTANDING ANY TERMS OR CONDITIONS TO THE CONTRARY IN THE
 * LICENSE AGREEMENT, NVIDIA MAKES NO REPRESENTATION ABOUT THE
 * SUITABILITY OF THESE LICENSED DELIVERABLES FOR ANY PURPOSE.  IT IS
 * PROVIDED "AS IS" WITHOUT EXPRESS OR IMPLIED WARRANTY OF ANY KIND.
 * NVIDIA DISCLAIMS ALL WARRANTIES WITH REGARD TO THESE LICENSED
 * DELIVERABLES, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY,
 * NONINFRINGEMENT, AND FITNESS FOR A PARTICULAR PURPOSE.
 * NOTWITHSTANDING ANY TERMS OR CONDITIONS TO THE CONTRARY IN THE
 * LICENSE AGREEMENT, IN NO EVENT SHALL NVIDIA BE LIABLE FOR ANY
 * SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, OR ANY
 * DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
 * WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
 * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
 * OF THESE LICENSED DELIVERABLES.
 *
 * U.S. Government End Users.  These Licensed Deliverables are a
 * "commercial item" as that term is defined at 48 C.F.R. 2.101 (OCT
 * 1995), consisting of "commercial computer software" and "commercial
 * computer software documentation" as such terms are used in 48
 * C.F.R. 12.212 (SEPT 1995) and is provided to the U.S. Government
 * only as a commercial end item.  Consistent with 48 C.F.R.12.212 and
 * 48 C.F.R. 227.7202-1 through 227.7202-4 (JUNE 1995), all
 * U.S. Government End Users acquire the Licensed Deliverables with
 * only those rights set forth herein.
 *
 * Any use of the Licensed Deliverables in individual and commercial
 * software must include, in the user documentation and internal
 * comments to the code, the above Disclaimer and U.S. Government End
 * Users Notice.
 */

/*   cudnn_adv_infer : cuDNN's advanced and experimental features.

*/

#if !defined(CUDNN_ADV_INFER_H_)
#define CUDNN_ADV_INFER_H_

#include <cuda_runtime.h>
#include <stdint.h>

#include "cudnn_version.h"
#include "cudnn_ops_infer.h"

/* These version numbers are autogenerated, do not edit manually. */
#define CUDNN_ADV_INFER_MAJOR 8
#define CUDNN_ADV_INFER_MINOR 0
#define CUDNN_ADV_INFER_PATCH 5

#if (CUDNN_ADV_INFER_MAJOR != CUDNN_MAJOR) || (CUDNN_ADV_INFER_MINOR != CUDNN_MINOR) || \
    (CUDNN_ADV_INFER_PATCH != CUDNN_PATCHLEVEL)
#error Version mismatch in cuDNN ADV INFER!!!
#endif

#if defined(__cplusplus)
extern "C" {
#endif

/* BASIC RNN API */

typedef enum {
    CUDNN_FWD_MODE_INFERENCE = 0,
    CUDNN_FWD_MODE_TRAINING  = 1,
} cudnnForwardMode_t;

typedef enum {
    CUDNN_RNN_RELU = 0, /* basic RNN cell type with ReLu activation */
    CUDNN_RNN_TANH = 1, /* basic RNN cell type with tanh activation */
    CUDNN_LSTM     = 2, /* LSTM with optional recurrent projection and clipping */
    CUDNN_GRU      = 3, /* Using h' = tanh(r * Uh(t-1) + Wx) and h = (1 - z) * h' + z * h(t-1); */
} cudnnRNNMode_t;

typedef enum {
    CUDNN_RNN_NO_BIAS         = 0, /* rnn cell formulas do not use biases */
    CUDNN_RNN_SINGLE_INP_BIAS = 1, /* rnn cell formulas use one input bias in input GEMM */
    CUDNN_RNN_DOUBLE_BIAS     = 2, /* default, rnn cell formulas use two bias vectors */
    CUDNN_RNN_SINGLE_REC_BIAS = 3  /* rnn cell formulas use one recurrent bias in recurrent GEMM */
} cudnnRNNBiasMode_t;

typedef enum {
    CUDNN_UNIDIRECTIONAL = 0, /* single direction network */
    CUDNN_BIDIRECTIONAL  = 1, /* output concatination at each layer */
} cudnnDirectionMode_t;

typedef enum {
    CUDNN_LINEAR_INPUT = 0, /* adjustable weight matrix in first layer input GEMM */
    CUDNN_SKIP_INPUT   = 1, /* fixed identity matrix in the first layer input GEMM */
} cudnnRNNInputMode_t;

typedef enum {
    CUDNN_RNN_CLIP_NONE   = 0, /* disables LSTM cell clipping */
    CUDNN_RNN_CLIP_MINMAX = 1, /* enables LSTM cell clipping */
} cudnnRNNClipMode_t;

typedef enum {
    CUDNN_RNN_DATA_LAYOUT_SEQ_MAJOR_UNPACKED   = 0, /* padded, outer stride from one time-step to the next */
    CUDNN_RNN_DATA_LAYOUT_SEQ_MAJOR_PACKED     = 1, /* sequence length sorted and packed as in basic RNN api */
    CUDNN_RNN_DATA_LAYOUT_BATCH_MAJOR_UNPACKED = 2, /* padded, outer stride from one batch to the next */
} cudnnRNNDataLayout_t;

/* Legacy type for backward compatibility */
typedef unsigned cudnnRNNPaddingMode_t;

/* For auxFlags in cudnnSetRNNDescriptor_v8() and cudnnSetRNNPaddingMode() */
#define CUDNN_RNN_PADDED_IO_DISABLED 0
#define CUDNN_RNN_PADDED_IO_ENABLED (1U << 0)

struct cudnnRNNStruct;
typedef struct cudnnRNNStruct *cudnnRNNDescriptor_t;

struct cudnnPersistentRNNPlan;
typedef struct cudnnPersistentRNNPlan *cudnnPersistentRNNPlan_t;

struct cudnnRNNDataStruct;
typedef struct cudnnRNNDataStruct *cudnnRNNDataDescriptor_t;

cudnnStatus_t CUDNNWINAPI
cudnnCreateRNNDescriptor(cudnnRNNDescriptor_t *rnnDesc);

cudnnStatus_t CUDNNWINAPI
cudnnDestroyRNNDescriptor(cudnnRNNDescriptor_t rnnDesc);

cudnnStatus_t CUDNNWINAPI
cudnnSetRNNDescriptor_v8(cudnnRNNDescriptor_t rnnDesc,
                         cudnnRNNAlgo_t algo,
                         cudnnRNNMode_t cellMode,
                         cudnnRNNBiasMode_t biasMode,
                         cudnnDirectionMode_t dirMode,
                         cudnnRNNInputMode_t inputMode,
                         cudnnDataType_t dataType,
                         cudnnDataType_t mathPrec,
                         cudnnMathType_t mathType,
                         int32_t inputSize,
                         int32_t hiddenSize,
                         int32_t projSize,
                         int32_t numLayers,
                         cudnnDropoutDescriptor_t dropoutDesc,
                         uint32_t auxFlags);

cudnnStatus_t CUDNNWINAPI
cudnnGetRNNDescriptor_v8(cudnnRNNDescriptor_t rnnDesc,
                         cudnnRNNAlgo_t *algo,
                         cudnnRNNMode_t *cellMode,
                         cudnnRNNBiasMode_t *biasMode,
                         cudnnDirectionMode_t *dirMode,
                         cudnnRNNInputMode_t *inputMode,
                         cudnnDataType_t *dataType,
                         cudnnDataType_t *mathPrec,
                         cudnnMathType_t *mathType,
                         int32_t *inputSize,
                         int32_t *hiddenSize,
                         int32_t *projSize,
                         int32_t *numLayers,
                         cudnnDropoutDescriptor_t *dropoutDesc,
                         uint32_t *auxFlags);

/*
 * mathPrec in cudnnSetRNNDescriptor_v6() specifies compute precision
 * compute precision is further modified by cudnnSetRNNMatrixMathType()
 * dataType in cudnnGetRNNParamsSize() and wDesc specify weight storage
 * dropout is between RNN layers, not between recurrent steps
 */
CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnSetRNNDescriptor_v6(cudnnHandle_t handle,
                         cudnnRNNDescriptor_t rnnDesc,
                         const int hiddenSize,
                         const int numLayers,
                         cudnnDropoutDescriptor_t dropoutDesc,
                         cudnnRNNInputMode_t inputMode,
                         cudnnDirectionMode_t direction,
                         cudnnRNNMode_t cellMode,
                         cudnnRNNAlgo_t algo,
                         cudnnDataType_t mathPrec);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnGetRNNDescriptor_v6(cudnnHandle_t handle,
                         cudnnRNNDescriptor_t rnnDesc,
                         int *hiddenSize,
                         int *numLayers,
                         cudnnDropoutDescriptor_t *dropoutDesc,
                         cudnnRNNInputMode_t *inputMode,
                         cudnnDirectionMode_t *direction,
                         cudnnRNNMode_t *cellMode,
                         cudnnRNNAlgo_t *algo,
                         cudnnDataType_t *mathPrec);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnSetRNNMatrixMathType(cudnnRNNDescriptor_t rnnDesc, cudnnMathType_t mType);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnGetRNNMatrixMathType(cudnnRNNDescriptor_t rnnDesc, cudnnMathType_t *mType);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnSetRNNBiasMode(cudnnRNNDescriptor_t rnnDesc, cudnnRNNBiasMode_t biasMode);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnGetRNNBiasMode(cudnnRNNDescriptor_t rnnDesc, cudnnRNNBiasMode_t *biasMode);

cudnnStatus_t CUDNNWINAPI
cudnnRNNSetClip_v8(cudnnRNNDescriptor_t rnnDesc,
                   cudnnRNNClipMode_t clipMode,
                   cudnnNanPropagation_t clipNanOpt,
                   double lclip,
                   double rclip);

cudnnStatus_t CUDNNWINAPI
cudnnRNNGetClip_v8(cudnnRNNDescriptor_t rnnDesc,
                   cudnnRNNClipMode_t *clipMode,
                   cudnnNanPropagation_t *clipNanOpt,
                   double *lclip,
                   double *rclip);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnRNNSetClip(cudnnHandle_t handle,
                cudnnRNNDescriptor_t rnnDesc,
                cudnnRNNClipMode_t clipMode,
                cudnnNanPropagation_t clipNanOpt,
                double lclip,
                double rclip);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnRNNGetClip(cudnnHandle_t handle,
                cudnnRNNDescriptor_t rnnDesc,
                cudnnRNNClipMode_t *clipMode,
                cudnnNanPropagation_t *clipNanOpt,
                double *lclip,
                double *rclip);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnSetRNNProjectionLayers(cudnnHandle_t handle,
                            cudnnRNNDescriptor_t rnnDesc,
                            const int recProjSize,
                            const int outProjSize);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnGetRNNProjectionLayers(cudnnHandle_t handle,
                            const cudnnRNNDescriptor_t rnnDesc,
                            int *recProjSize,
                            int *outProjSize);

/* Expensive. Creates the plan for the specific settings. */
CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnCreatePersistentRNNPlan(cudnnRNNDescriptor_t rnnDesc,
                             const int minibatch,
                             const cudnnDataType_t dataType,
                             cudnnPersistentRNNPlan_t *plan);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnDestroyPersistentRNNPlan(cudnnPersistentRNNPlan_t plan);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnSetPersistentRNNPlan(cudnnRNNDescriptor_t rnnDesc, cudnnPersistentRNNPlan_t plan);

cudnnStatus_t CUDNNWINAPI
cudnnBuildRNNDynamic(cudnnHandle_t handle, cudnnRNNDescriptor_t rnnDesc, int miniBatch);

/* dataType in weight descriptors and input descriptors is used to describe storage */
CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnGetRNNWorkspaceSize(cudnnHandle_t handle,
                         const cudnnRNNDescriptor_t rnnDesc,
                         const int seqLength,
                         const cudnnTensorDescriptor_t *xDesc,
                         size_t *sizeInBytes);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnGetRNNTrainingReserveSize(cudnnHandle_t handle,
                               const cudnnRNNDescriptor_t rnnDesc,
                               const int seqLength,
                               const cudnnTensorDescriptor_t *xDesc,
                               size_t *sizeInBytes);

cudnnStatus_t CUDNNWINAPI
cudnnGetRNNTempSpaceSizes(cudnnHandle_t handle,
                          cudnnRNNDescriptor_t rnnDesc,
                          cudnnForwardMode_t fMode,
                          cudnnRNNDataDescriptor_t xDesc,
                          size_t *workSpaceSize,
                          size_t *reserveSpaceSize);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnGetRNNParamsSize(cudnnHandle_t handle,
                      const cudnnRNNDescriptor_t rnnDesc,
                      const cudnnTensorDescriptor_t xDesc,
                      size_t *sizeInBytes,
                      cudnnDataType_t dataType);

cudnnStatus_t CUDNNWINAPI
cudnnGetRNNWeightSpaceSize(cudnnHandle_t handle, cudnnRNNDescriptor_t rnnDesc, size_t *weightSpaceSize);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnGetRNNLinLayerMatrixParams(cudnnHandle_t handle,
                                const cudnnRNNDescriptor_t rnnDesc,
                                const int pseudoLayer,
                                const cudnnTensorDescriptor_t xDesc,
                                const cudnnFilterDescriptor_t wDesc,
                                const void *w,
                                const int linLayerID,
                                cudnnFilterDescriptor_t linLayerMatDesc,
                                void **linLayerMat);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnGetRNNLinLayerBiasParams(cudnnHandle_t handle,
                              const cudnnRNNDescriptor_t rnnDesc,
                              const int pseudoLayer,
                              const cudnnTensorDescriptor_t xDesc,
                              const cudnnFilterDescriptor_t wDesc,
                              const void *w,
                              const int linLayerID,
                              cudnnFilterDescriptor_t linLayerBiasDesc,
                              void **linLayerBias);

cudnnStatus_t CUDNNWINAPI
cudnnGetRNNWeightParams(cudnnHandle_t handle,
                        cudnnRNNDescriptor_t rnnDesc,
                        int32_t pseudoLayer,
                        size_t weightSpaceSize,
                        const void *weightSpace,
                        int32_t linLayerID,
                        cudnnTensorDescriptor_t mDesc,
                        void **mAddr,
                        cudnnTensorDescriptor_t bDesc,
                        void **bAddr);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnRNNForwardInference(cudnnHandle_t handle,
                         const cudnnRNNDescriptor_t rnnDesc,
                         const int seqLength,
                         const cudnnTensorDescriptor_t *xDesc,
                         const void *x,
                         const cudnnTensorDescriptor_t hxDesc,
                         const void *hx,
                         const cudnnTensorDescriptor_t cxDesc,
                         const void *cx,
                         const cudnnFilterDescriptor_t wDesc,
                         const void *w,
                         const cudnnTensorDescriptor_t *yDesc,
                         void *y,
                         const cudnnTensorDescriptor_t hyDesc,
                         void *hy,
                         const cudnnTensorDescriptor_t cyDesc,
                         void *cy,
                         void *workSpace,
                         size_t workSpaceSizeInBytes);

/* RNN EX API */

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnSetRNNPaddingMode(cudnnRNNDescriptor_t rnnDesc, unsigned paddingMode);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnGetRNNPaddingMode(cudnnRNNDescriptor_t rnnDesc, unsigned *paddingMode);

cudnnStatus_t CUDNNWINAPI
cudnnCreateRNNDataDescriptor(cudnnRNNDataDescriptor_t *rnnDataDesc);

cudnnStatus_t CUDNNWINAPI
cudnnDestroyRNNDataDescriptor(cudnnRNNDataDescriptor_t rnnDataDesc);

cudnnStatus_t CUDNNWINAPI
cudnnSetRNNDataDescriptor(cudnnRNNDataDescriptor_t rnnDataDesc,
                          cudnnDataType_t dataType,
                          cudnnRNNDataLayout_t layout,
                          int maxSeqLength,
                          int batchSize,
                          int vectorSize,
                          const int seqLengthArray[], /* length of each sequence in the batch */
                          void *paddingFill);         /* symbol for filling padding position in output */

cudnnStatus_t CUDNNWINAPI
cudnnGetRNNDataDescriptor(cudnnRNNDataDescriptor_t rnnDataDesc,
                          cudnnDataType_t *dataType,
                          cudnnRNNDataLayout_t *layout,
                          int *maxSeqLength,
                          int *batchSize,
                          int *vectorSize,
                          int arrayLengthRequested,
                          int seqLengthArray[],
                          void *paddingFill);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnRNNForwardInferenceEx(cudnnHandle_t handle,
                           const cudnnRNNDescriptor_t rnnDesc,
                           const cudnnRNNDataDescriptor_t xDesc,
                           const void *x,
                           const cudnnTensorDescriptor_t hxDesc,
                           const void *hx,
                           const cudnnTensorDescriptor_t cxDesc,
                           const void *cx,
                           const cudnnFilterDescriptor_t wDesc,
                           const void *w,
                           const cudnnRNNDataDescriptor_t yDesc,
                           void *y,
                           const cudnnTensorDescriptor_t hyDesc,
                           void *hy,
                           const cudnnTensorDescriptor_t cyDesc,
                           void *cy,
                           const cudnnRNNDataDescriptor_t kDesc, /* reserved, should pass NULL */
                           const void *keys,                     /* reserved, should pass NULL */
                           const cudnnRNNDataDescriptor_t cDesc, /* reserved, should pass NULL */
                           void *cAttn,                          /* reserved, should pass NULL */
                           const cudnnRNNDataDescriptor_t iDesc, /* reserved, should pass NULL */
                           void *iAttn,                          /* reserved, should pass NULL */
                           const cudnnRNNDataDescriptor_t qDesc, /* reserved, should pass NULL */
                           void *queries,                        /* reserved, should pass NULL */
                           void *workSpace,
                           size_t workSpaceSizeInBytes);

cudnnStatus_t CUDNNWINAPI
cudnnRNNForward(cudnnHandle_t handle,
                cudnnRNNDescriptor_t rnnDesc,
                cudnnForwardMode_t fwdMode,
                const int32_t devSeqLengths[],
                cudnnRNNDataDescriptor_t xDesc,
                const void *x,
                cudnnRNNDataDescriptor_t yDesc,
                void *y,
                cudnnTensorDescriptor_t hDesc,
                const void *hx,
                void *hy,
                cudnnTensorDescriptor_t cDesc,
                const void *cx,
                void *cy,
                size_t weightSpaceSize,
                const void *weightSpace,
                size_t workSpaceSize,
                void *workSpace,
                size_t reserveSpaceSize,
                void *reserveSpace);

/* RNN FIND API */

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnSetRNNAlgorithmDescriptor(cudnnHandle_t handle, cudnnRNNDescriptor_t rnnDesc, cudnnAlgorithmDescriptor_t algoDesc);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnGetRNNForwardInferenceAlgorithmMaxCount(cudnnHandle_t handle, const cudnnRNNDescriptor_t rnnDesc, int *count);

CUDNN_DEPRECATED cudnnStatus_t CUDNNWINAPI
cudnnFindRNNForwardInferenceAlgorithmEx(cudnnHandle_t handle,
                                        const cudnnRNNDescriptor_t rnnDesc,
                                        const int seqLength,
                                        const cudnnTensorDescriptor_t *xDesc,
                                        const void *x,
                                        const cudnnTensorDescriptor_t hxDesc,
                                        const void *hx,
                                        const cudnnTensorDescriptor_t cxDesc,
                                        const void *cx,
                                        const cudnnFilterDescriptor_t wDesc,
                                        const void *w,
                                        const cudnnTensorDescriptor_t *yDesc,
                                        void *y,
                                        const cudnnTensorDescriptor_t hyDesc,
                                        void *hy,
                                        const cudnnTensorDescriptor_t cyDesc,
                                        void *cy,
                                        const float findIntensity,
                                        const int requestedAlgoCount,
                                        int *returnedAlgoCount,
                                        cudnnAlgorithmPerformance_t *perfResults,
                                        void *workspace,
                                        size_t workSpaceSizeInBytes);

/* Sequence data descriptor */

typedef enum {
    CUDNN_SEQDATA_TIME_DIM  = 0, /* index in time */
    CUDNN_SEQDATA_BATCH_DIM = 1, /* index in batch */
    CUDNN_SEQDATA_BEAM_DIM  = 2, /* index in beam */
    CUDNN_SEQDATA_VECT_DIM  = 3  /* index in vector */
} cudnnSeqDataAxis_t;

struct cudnnSeqDataStruct;
typedef struct cudnnSeqDataStruct *cudnnSeqDataDescriptor_t;

#define CUDNN_SEQDATA_DIM_COUNT 4 /* dimension count */

cudnnStatus_t CUDNNWINAPI
cudnnCreateSeqDataDescriptor(cudnnSeqDataDescriptor_t *seqDataDesc);

cudnnStatus_t CUDNNWINAPI
cudnnDestroySeqDataDescriptor(cudnnSeqDataDescriptor_t seqDataDesc);

cudnnStatus_t CUDNNWINAPI
cudnnSetSeqDataDescriptor(cudnnSeqDataDescriptor_t seqDataDesc,
                          cudnnDataType_t dataType,
                          int nbDims,
                          const int dimA[],
                          const cudnnSeqDataAxis_t axes[],
                          size_t seqLengthArraySize,
                          const int seqLengthArray[],
                          void *paddingFill);

cudnnStatus_t CUDNNWINAPI
cudnnGetSeqDataDescriptor(const cudnnSeqDataDescriptor_t seqDataDesc,
                          cudnnDataType_t *dataType,
                          int *nbDims,
                          int nbDimsRequested,
                          int dimA[],
                          cudnnSeqDataAxis_t axes[],
                          size_t *seqLengthArraySize,
                          size_t seqLengthSizeRequested,
                          int seqLengthArray[],
                          void *paddingFill);

/* Multihead Attention */

/* Legacy type for backward compatibility */
typedef unsigned cudnnAttnQueryMap_t;

/*
 * Multi-head attention options passed via 'attnMode' in cudnnSetAttnDescriptor().
 * Use the bitwise OR operator to combine several settings listed below.  Additional
 * minor options can be added here w/o changing or introducing new API functions.
 */
#define CUDNN_ATTN_QUERYMAP_ALL_TO_ONE 0         /* multiple Q-s map to a single (K,V) set when beam size > 1 */
#define CUDNN_ATTN_QUERYMAP_ONE_TO_ONE (1U << 0) /* multiple Q-s map to multiple (K,V) sets when beam size > 1 */
#define CUDNN_ATTN_DISABLE_PROJ_BIASES 0         /* no biases in attention input and output projections */
#define CUDNN_ATTN_ENABLE_PROJ_BIASES (1U << 1)  /* use biases in attention input and output projections */

struct cudnnAttnStruct;
typedef struct cudnnAttnStruct *cudnnAttnDescriptor_t;

cudnnStatus_t CUDNNWINAPI
cudnnCreateAttnDescriptor(cudnnAttnDescriptor_t *attnDesc);

cudnnStatus_t CUDNNWINAPI
cudnnDestroyAttnDescriptor(cudnnAttnDescriptor_t attnDesc);

cudnnStatus_t CUDNNWINAPI
cudnnSetAttnDescriptor(cudnnAttnDescriptor_t attnDesc,
                       unsigned attnMode,
                       int nHeads,
                       double smScaler,
                       cudnnDataType_t dataType,
                       cudnnDataType_t computePrec,
                       cudnnMathType_t mathType,
                       cudnnDropoutDescriptor_t attnDropoutDesc,
                       cudnnDropoutDescriptor_t postDropoutDesc,
                       int qSize,
                       int kSize,
                       int vSize,
                       int qProjSize,
                       int kProjSize,
                       int vProjSize,
                       int oProjSize,
                       int qoMaxSeqLength,
                       int kvMaxSeqLength,
                       int maxBatchSize,
                       int maxBeamSize);

cudnnStatus_t CUDNNWINAPI
cudnnGetAttnDescriptor(cudnnAttnDescriptor_t attnDesc,
                       unsigned *attnMode,
                       int *nHeads,
                       double *smScaler,
                       cudnnDataType_t *dataType,
                       cudnnDataType_t *computePrec,
                       cudnnMathType_t *mathType,
                       cudnnDropoutDescriptor_t *attnDropoutDesc,
                       cudnnDropoutDescriptor_t *postDropoutDesc,
                       int *qSize,
                       int *kSize,
                       int *vSize,
                       int *qProjSize,
                       int *kProjSize,
                       int *vProjSize,
                       int *oProjSize,
                       int *qoMaxSeqLength,
                       int *kvMaxSeqLength,
                       int *maxBatchSize,
                       int *maxBeamSize);

cudnnStatus_t CUDNNWINAPI
cudnnGetMultiHeadAttnBuffers(cudnnHandle_t handle,
                             const cudnnAttnDescriptor_t attnDesc,
                             size_t *weightSizeInBytes,
                             size_t *workSpaceSizeInBytes,
                             size_t *reserveSpaceSizeInBytes);

typedef enum {
    CUDNN_MH_ATTN_Q_WEIGHTS = 0, /* input projection weights for 'queries' */
    CUDNN_MH_ATTN_K_WEIGHTS = 1, /* input projection weights for 'keys' */
    CUDNN_MH_ATTN_V_WEIGHTS = 2, /* input projection weights for 'values' */
    CUDNN_MH_ATTN_O_WEIGHTS = 3, /* output projection weights */
    CUDNN_MH_ATTN_Q_BIASES  = 4, /* input projection bias tensor for 'queries' */
    CUDNN_MH_ATTN_K_BIASES  = 5, /* input projection bias for 'keys' */
    CUDNN_MH_ATTN_V_BIASES  = 6, /* input projection bias for 'values' */
    CUDNN_MH_ATTN_O_BIASES  = 7, /* output projection biases */
} cudnnMultiHeadAttnWeightKind_t;

#define CUDNN_ATTN_WKIND_COUNT 8 /* Number of attention weight/bias tensors */

cudnnStatus_t CUDNNWINAPI
cudnnGetMultiHeadAttnWeights(cudnnHandle_t handle,
                             const cudnnAttnDescriptor_t attnDesc,
                             cudnnMultiHeadAttnWeightKind_t wKind,
                             size_t weightSizeInBytes,
                             const void *weights,
                             cudnnTensorDescriptor_t wDesc,
                             void **wAddr);

cudnnStatus_t CUDNNWINAPI
cudnnMultiHeadAttnForward(cudnnHandle_t handle,
                          const cudnnAttnDescriptor_t attnDesc,
                          int currIdx,
                          const int loWinIdx[],
                          const int hiWinIdx[],
                          const int devSeqLengthsQO[],
                          const int devSeqLengthsKV[],
                          const cudnnSeqDataDescriptor_t qDesc,
                          const void *queries,
                          const void *residuals,
                          const cudnnSeqDataDescriptor_t kDesc,
                          const void *keys,
                          const cudnnSeqDataDescriptor_t vDesc,
                          const void *values,
                          const cudnnSeqDataDescriptor_t oDesc,
                          void *out,
                          size_t weightSizeInBytes,
                          const void *weights,
                          size_t workSpaceSizeInBytes,
                          void *workSpace,
                          size_t reserveSpaceSizeInBytes,
                          void *reserveSpace);

/*
 * \brief Cross-library version checker.
 * This function is implemented differently in each sub-library. Each sublib
 * checks whether its own version matches that of its dependencies.
 * \returns CUDNN_STATUS_SUCCESS if the version check passes,
 *          CUDNN_STATUS_VERSION_MISMATCH if the versions are inconsistent.
 */
cudnnStatus_t CUDNNWINAPI
cudnnAdvInferVersionCheck(void);

#if defined(__cplusplus)
}
#endif

#endif /* CUDNN_ADV_INFER_H_ */
