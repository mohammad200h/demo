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

/*
 *  cudnn_cnn_infer : cuDNN's basic definitions and inference CNN functions.
 */

#if !defined(CUDNN_CNN_INFER_H_)
#define CUDNN_CNN_INFER_H_

#pragma once
#include <cuda_runtime.h>
#include <stdint.h>

#include "cudnn_version.h"
#include "cudnn_ops_infer.h"

/* These version numbers are autogenerated, do not edit manually. */
#define CUDNN_CNN_INFER_MAJOR 8
#define CUDNN_CNN_INFER_MINOR 1
#define CUDNN_CNN_INFER_PATCH 0

#if (CUDNN_CNN_INFER_MAJOR != CUDNN_MAJOR) || (CUDNN_CNN_INFER_MINOR != CUDNN_MINOR) || \
    (CUDNN_CNN_INFER_PATCH != CUDNN_PATCHLEVEL)
#error Version mismatch in cuDNN CNN INFER!!!
#endif

#if defined(__cplusplus)
extern "C" {
#endif

typedef struct cudnnConvolutionStruct *cudnnConvolutionDescriptor_t;

/*
 *  convolution mode
 */
typedef enum { CUDNN_CONVOLUTION = 0, CUDNN_CROSS_CORRELATION = 1 } cudnnConvolutionMode_t;

/*
 * CUDNN Reorder
 */
typedef enum {
    CUDNN_DEFAULT_REORDER = 0,
    CUDNN_NO_REORDER      = 1,
} cudnnReorderType_t;

typedef struct {
    cudnnConvolutionFwdAlgo_t algo;
    cudnnStatus_t status;
    float time;
    size_t memory;
    cudnnDeterminism_t determinism;
    cudnnMathType_t mathType;
    int reserved[3];
} cudnnConvolutionFwdAlgoPerf_t;

/* Create an instance of convolution descriptor */
cudnnStatus_t CUDNNWINAPI
cudnnCreateConvolutionDescriptor(cudnnConvolutionDescriptor_t *convDesc);

/* Destroy an instance of convolution descriptor */
cudnnStatus_t CUDNNWINAPI
cudnnDestroyConvolutionDescriptor(cudnnConvolutionDescriptor_t convDesc);

cudnnStatus_t CUDNNWINAPI
cudnnSetConvolutionMathType(cudnnConvolutionDescriptor_t convDesc, cudnnMathType_t mathType);

cudnnStatus_t CUDNNWINAPI
cudnnGetConvolutionMathType(cudnnConvolutionDescriptor_t convDesc, cudnnMathType_t *mathType);

cudnnStatus_t CUDNNWINAPI
cudnnSetConvolutionGroupCount(cudnnConvolutionDescriptor_t convDesc, int groupCount);

cudnnStatus_t CUDNNWINAPI
cudnnGetConvolutionGroupCount(cudnnConvolutionDescriptor_t convDesc, int *groupCount);

cudnnStatus_t CUDNNWINAPI
cudnnSetConvolutionReorderType(cudnnConvolutionDescriptor_t convDesc, cudnnReorderType_t reorderType);

cudnnStatus_t CUDNNWINAPI
cudnnGetConvolutionReorderType(cudnnConvolutionDescriptor_t convDesc, cudnnReorderType_t *reorderType);

cudnnStatus_t CUDNNWINAPI
cudnnSetConvolution2dDescriptor(cudnnConvolutionDescriptor_t convDesc,
                                int pad_h,      /* zero-padding height */
                                int pad_w,      /* zero-padding width */
                                int u,          /* vertical filter stride */
                                int v,          /* horizontal filter stride */
                                int dilation_h, /* filter dilation in the vertical dimension */
                                int dilation_w, /* filter dilation in the horizontal dimension */
                                cudnnConvolutionMode_t mode,
                                cudnnDataType_t computeType);

cudnnStatus_t CUDNNWINAPI
cudnnGetConvolution2dDescriptor(const cudnnConvolutionDescriptor_t convDesc,
                                int *pad_h,      /* zero-padding height */
                                int *pad_w,      /* zero-padding width */
                                int *u,          /* vertical filter stride */
                                int *v,          /* horizontal filter stride */
                                int *dilation_h, /* filter dilation in the vertical dimension */
                                int *dilation_w, /* filter dilation in the horizontal dimension */
                                cudnnConvolutionMode_t *mode,
                                cudnnDataType_t *computeType);

cudnnStatus_t CUDNNWINAPI
cudnnSetConvolutionNdDescriptor(cudnnConvolutionDescriptor_t convDesc,
                                int arrayLength, /* nbDims-2 size */
                                const int padA[],
                                const int filterStrideA[],
                                const int dilationA[],
                                cudnnConvolutionMode_t mode,
                                cudnnDataType_t computeType); /* convolution data type */

/* Helper function to return the dimensions of the output tensor given a convolution descriptor */
cudnnStatus_t CUDNNWINAPI
cudnnGetConvolutionNdDescriptor(const cudnnConvolutionDescriptor_t convDesc,
                                int arrayLengthRequested,
                                int *arrayLength,
                                int padA[],
                                int strideA[],
                                int dilationA[],
                                cudnnConvolutionMode_t *mode,
                                cudnnDataType_t *computeType); /* convolution data type */

cudnnStatus_t CUDNNWINAPI
cudnnGetConvolution2dForwardOutputDim(const cudnnConvolutionDescriptor_t convDesc,
                                      const cudnnTensorDescriptor_t inputTensorDesc,
                                      const cudnnFilterDescriptor_t filterDesc,
                                      int *n,
                                      int *c,
                                      int *h,
                                      int *w);

/* Helper function to return the dimensions of the output tensor given a convolution descriptor */
cudnnStatus_t CUDNNWINAPI
cudnnGetConvolutionNdForwardOutputDim(const cudnnConvolutionDescriptor_t convDesc,
                                      const cudnnTensorDescriptor_t inputTensorDesc,
                                      const cudnnFilterDescriptor_t filterDesc,
                                      int nbDims,
                                      int tensorOuputDimA[]);

/* helper function to provide the convolution forward algo that fit best the requirement */
cudnnStatus_t CUDNNWINAPI
cudnnGetConvolutionForwardAlgorithmMaxCount(cudnnHandle_t handle, int *count);

cudnnStatus_t CUDNNWINAPI
cudnnGetConvolutionForwardAlgorithm_v7(cudnnHandle_t handle,
                                       const cudnnTensorDescriptor_t srcDesc,
                                       const cudnnFilterDescriptor_t filterDesc,
                                       const cudnnConvolutionDescriptor_t convDesc,
                                       const cudnnTensorDescriptor_t destDesc,
                                       const int requestedAlgoCount,
                                       int *returnedAlgoCount,
                                       cudnnConvolutionFwdAlgoPerf_t *perfResults);

cudnnStatus_t CUDNNWINAPI
cudnnFindConvolutionForwardAlgorithm(cudnnHandle_t handle,
                                     const cudnnTensorDescriptor_t xDesc,
                                     const cudnnFilterDescriptor_t wDesc,
                                     const cudnnConvolutionDescriptor_t convDesc,
                                     const cudnnTensorDescriptor_t yDesc,
                                     const int requestedAlgoCount,
                                     int *returnedAlgoCount,
                                     cudnnConvolutionFwdAlgoPerf_t *perfResults);

cudnnStatus_t CUDNNWINAPI
cudnnFindConvolutionForwardAlgorithmEx(cudnnHandle_t handle,
                                       const cudnnTensorDescriptor_t xDesc,
                                       const void *x,
                                       const cudnnFilterDescriptor_t wDesc,
                                       const void *w,
                                       const cudnnConvolutionDescriptor_t convDesc,
                                       const cudnnTensorDescriptor_t yDesc,
                                       void *y,
                                       const int requestedAlgoCount,
                                       int *returnedAlgoCount,
                                       cudnnConvolutionFwdAlgoPerf_t *perfResults,
                                       void *workSpace,
                                       size_t workSpaceSizeInBytes);

cudnnStatus_t CUDNNWINAPI
cudnnIm2Col(cudnnHandle_t handle,
            const cudnnTensorDescriptor_t xDesc,
            const void *x,
            const cudnnFilterDescriptor_t wDesc,
            const cudnnConvolutionDescriptor_t convDesc,
            void *colBuffer);

cudnnStatus_t CUDNNWINAPI
cudnnReorderFilterAndBias(cudnnHandle_t handle,
                          const cudnnFilterDescriptor_t filterDesc,
                          cudnnReorderType_t reorderType,
                          const void *filterData,
                          void *reorderedFilterData,
                          int reorderBias,
                          const void *biasData,
                          void *reorderedBiasData);

/* Helper function to return the minimum size of the workspace to be passed to the convolution given an algo*/
cudnnStatus_t CUDNNWINAPI
cudnnGetConvolutionForwardWorkspaceSize(cudnnHandle_t handle,
                                        const cudnnTensorDescriptor_t xDesc,
                                        const cudnnFilterDescriptor_t wDesc,
                                        const cudnnConvolutionDescriptor_t convDesc,
                                        const cudnnTensorDescriptor_t yDesc,
                                        cudnnConvolutionFwdAlgo_t algo,
                                        size_t *sizeInBytes);

/* Convolution functions: All of the form "output = alpha * Op(inputs) + beta * output" */

/* Function to perform the forward pass for batch convolution */
cudnnStatus_t CUDNNWINAPI
cudnnConvolutionForward(cudnnHandle_t handle,
                        const void *alpha,
                        const cudnnTensorDescriptor_t xDesc,
                        const void *x,
                        const cudnnFilterDescriptor_t wDesc,
                        const void *w,
                        const cudnnConvolutionDescriptor_t convDesc,
                        cudnnConvolutionFwdAlgo_t algo,
                        void *workSpace,
                        size_t workSpaceSizeInBytes,
                        const void *beta,
                        const cudnnTensorDescriptor_t yDesc,
                        void *y);

/* Fused conv/bias/activation operation : y = Act( alpha1 * conv(x) + alpha2 * z + bias ) */
cudnnStatus_t CUDNNWINAPI
cudnnConvolutionBiasActivationForward(cudnnHandle_t handle,
                                      const void *alpha1,
                                      const cudnnTensorDescriptor_t xDesc,
                                      const void *x,
                                      const cudnnFilterDescriptor_t wDesc,
                                      const void *w,
                                      const cudnnConvolutionDescriptor_t convDesc,
                                      cudnnConvolutionFwdAlgo_t algo,
                                      void *workSpace,
                                      size_t workSpaceSizeInBytes,
                                      const void *alpha2,
                                      const cudnnTensorDescriptor_t zDesc,
                                      const void *z,
                                      const cudnnTensorDescriptor_t biasDesc,
                                      const void *bias,
                                      const cudnnActivationDescriptor_t activationDesc,
                                      const cudnnTensorDescriptor_t yDesc,
                                      void *y);

/* helper function to provide the convolution backward data algo that fit best the requirement */

typedef struct {
    cudnnConvolutionBwdDataAlgo_t algo;
    cudnnStatus_t status;
    float time;
    size_t memory;
    cudnnDeterminism_t determinism;
    cudnnMathType_t mathType;
    int reserved[3];
} cudnnConvolutionBwdDataAlgoPerf_t;

cudnnStatus_t CUDNNWINAPI
cudnnGetConvolutionBackwardDataAlgorithmMaxCount(cudnnHandle_t handle, int *count);

cudnnStatus_t CUDNNWINAPI
cudnnFindConvolutionBackwardDataAlgorithm(cudnnHandle_t handle,
                                          const cudnnFilterDescriptor_t wDesc,
                                          const cudnnTensorDescriptor_t dyDesc,
                                          const cudnnConvolutionDescriptor_t convDesc,
                                          const cudnnTensorDescriptor_t dxDesc,
                                          const int requestedAlgoCount,
                                          int *returnedAlgoCount,
                                          cudnnConvolutionBwdDataAlgoPerf_t *perfResults);

cudnnStatus_t CUDNNWINAPI
cudnnFindConvolutionBackwardDataAlgorithmEx(cudnnHandle_t handle,
                                            const cudnnFilterDescriptor_t wDesc,
                                            const void *w,
                                            const cudnnTensorDescriptor_t dyDesc,
                                            const void *dy,
                                            const cudnnConvolutionDescriptor_t convDesc,
                                            const cudnnTensorDescriptor_t dxDesc,
                                            void *dx,
                                            const int requestedAlgoCount,
                                            int *returnedAlgoCount,
                                            cudnnConvolutionBwdDataAlgoPerf_t *perfResults,
                                            void *workSpace,
                                            size_t workSpaceSizeInBytes);

cudnnStatus_t CUDNNWINAPI
cudnnGetConvolutionBackwardDataAlgorithm_v7(cudnnHandle_t handle,
                                            const cudnnFilterDescriptor_t filterDesc,
                                            const cudnnTensorDescriptor_t diffDesc,
                                            const cudnnConvolutionDescriptor_t convDesc,
                                            const cudnnTensorDescriptor_t gradDesc,
                                            const int requestedAlgoCount,
                                            int *returnedAlgoCount,
                                            cudnnConvolutionBwdDataAlgoPerf_t *perfResults);

/*
 *  convolution algorithm (which requires potentially some workspace)
 */

/* Helper function to return the minimum size of the workspace to be passed to the convolution given an algo*/
cudnnStatus_t CUDNNWINAPI
cudnnGetConvolutionBackwardDataWorkspaceSize(cudnnHandle_t handle,
                                             const cudnnFilterDescriptor_t wDesc,
                                             const cudnnTensorDescriptor_t dyDesc,
                                             const cudnnConvolutionDescriptor_t convDesc,
                                             const cudnnTensorDescriptor_t dxDesc,
                                             cudnnConvolutionBwdDataAlgo_t algo,
                                             size_t *sizeInBytes);

cudnnStatus_t CUDNNWINAPI
cudnnConvolutionBackwardData(cudnnHandle_t handle,
                             const void *alpha,
                             const cudnnFilterDescriptor_t wDesc,
                             const void *w,
                             const cudnnTensorDescriptor_t dyDesc,
                             const void *dy,
                             const cudnnConvolutionDescriptor_t convDesc,
                             cudnnConvolutionBwdDataAlgo_t algo,
                             void *workSpace,
                             size_t workSpaceSizeInBytes,
                             const void *beta,
                             const cudnnTensorDescriptor_t dxDesc,
                             void *dx);

/* Helper function to calculate folding descriptors for dgrad */
cudnnStatus_t CUDNNWINAPI
cudnnGetFoldedConvBackwardDataDescriptors(const cudnnHandle_t handle,
                                          const cudnnFilterDescriptor_t filterDesc,
                                          const cudnnTensorDescriptor_t diffDesc,
                                          const cudnnConvolutionDescriptor_t convDesc,
                                          const cudnnTensorDescriptor_t gradDesc,
                                          const cudnnTensorFormat_t transformFormat,
                                          cudnnFilterDescriptor_t foldedFilterDesc,
                                          cudnnTensorDescriptor_t paddedDiffDesc,
                                          cudnnConvolutionDescriptor_t foldedConvDesc,
                                          cudnnTensorDescriptor_t foldedGradDesc,
                                          cudnnTensorTransformDescriptor_t filterFoldTransDesc,
                                          cudnnTensorTransformDescriptor_t diffPadTransDesc,
                                          cudnnTensorTransformDescriptor_t gradFoldTransDesc,
                                          cudnnTensorTransformDescriptor_t gradUnfoldTransDesc);

/* cudnnFusedOps... */
struct cudnnFusedOpsConstParamStruct;
typedef struct cudnnFusedOpsConstParamStruct *cudnnFusedOpsConstParamPack_t;

struct cudnnFusedOpsVariantParamStruct;
typedef struct cudnnFusedOpsVariantParamStruct *cudnnFusedOpsVariantParamPack_t;

struct cudnnFusedOpsPlanStruct;
typedef struct cudnnFusedOpsPlanStruct *cudnnFusedOpsPlan_t;

typedef enum {
    /* each op in [ ] can be disabled by passing NULL ptr */
    /* [per channel scale], [per channel bias], [activation], convolution, [generate BN stats] */
    CUDNN_FUSED_SCALE_BIAS_ACTIVATION_CONV_BNSTATS = 0,
    /* [per channel scale], [per channel bias], [activation], convolutionBackwardWeights */
    CUDNN_FUSED_SCALE_BIAS_ACTIVATION_WGRAD = 1,
    /* utility for BN training in BN-conv fusion */
    /* computes the equivalent scale and bias from ySum ySqSum and learned scale, bias */
    /* optionally update running stats and generate saved stats */
    CUDNN_FUSED_BN_FINALIZE_STATISTICS_TRAINING = 2,
    /* utility for BN inference in BN-conv fusion */
    /* computes the equivalent scale and bias from learned running stats and learned scale, bias */
    CUDNN_FUSED_BN_FINALIZE_STATISTICS_INFERENCE = 3,
    /* reserved for future use: convolution, [per channel scale], [per channel bias], [residual add], [activation] */
    CUDNN_FUSED_CONV_SCALE_BIAS_ADD_ACTIVATION = 4,
    /* reserved for future use: [per channel scale], [per channel bias], [residual add],  activation, bitmask */
    CUDNN_FUSED_SCALE_BIAS_ADD_ACTIVATION_GEN_BITMASK = 5,
    /* reserved for future use */
    CUDNN_FUSED_DACTIVATION_FORK_DBATCHNORM = 6,
} cudnnFusedOps_t;

typedef enum {
    /* set XDESC: pass previously initialized cudnnTensorDescriptor_t */
    /* get XDESC: pass previously created cudnnTensorDescriptor_t */
    CUDNN_PARAM_XDESC = 0,
    /* set/get XDATA_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_XDATA_PLACEHOLDER = 1,
    /* set/get BN_MODE: pass cudnnBatchNormMode_t* */
    CUDNN_PARAM_BN_MODE = 2,
    /* set CUDNN_PARAM_BN_EQSCALEBIAS_DESC: pass previously initialized cudnnTensorDescriptor_t */
    /* get CUDNN_PARAM_BN_EQSCALEBIAS_DESC: pass previously created cudnnTensorDescriptor_t */
    CUDNN_PARAM_BN_EQSCALEBIAS_DESC = 3,
    /* set/get BN_EQSCALE_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_BN_EQSCALE_PLACEHOLDER = 4,
    /* set/get BN_EQBIAS_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_BN_EQBIAS_PLACEHOLDER = 5,
    /* set ACTIVATION_DESC: pass previously initialized cudnnActivationDescriptor_t */
    /* get ACTIVATION_DESC: pass previously created cudnnActivationDescriptor_t */
    CUDNN_PARAM_ACTIVATION_DESC = 6,
    /* set CONV_DESC: pass previously initialized cudnnConvolutionDescriptor_t */
    /* get CONV_DESC: pass previously created cudnnConvolutionDescriptor_t */
    CUDNN_PARAM_CONV_DESC = 7,
    /* set WDESC: pass previously initialized cudnnFilterDescriptor_t */
    /* get WDESC: pass previously created cudnnFilterDescriptor_t */
    CUDNN_PARAM_WDESC = 8,
    /* set/get WDATA_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_WDATA_PLACEHOLDER = 9,
    /* set DWDESC: pass previously initialized cudnnFilterDescriptor_t */
    /* get DWDESC: pass previously created cudnnFilterDescriptor_t */
    CUDNN_PARAM_DWDESC = 10,
    /* set/get DWDATA_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_DWDATA_PLACEHOLDER = 11,
    /* set YDESC: pass previously initialized cudnnTensorDescriptor_t */
    /* get YDESC: pass previously created cudnnTensorDescriptor_t */
    CUDNN_PARAM_YDESC = 12,
    /* set/get YDATA_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_YDATA_PLACEHOLDER = 13,
    /* set DYDESC: pass previously initialized cudnnTensorDescriptor_t */
    /* get DYDESC: pass previously created cudnnTensorDescriptor_t */
    CUDNN_PARAM_DYDESC = 14,
    /* set/get DYDATA_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_DYDATA_PLACEHOLDER = 15,
    /* set YSTATS_DESC: pass previously initialized cudnnTensorDescriptor_t */
    /* get YSTATS_DESC: pass previously created cudnnTensorDescriptor_t */
    CUDNN_PARAM_YSTATS_DESC = 16,
    /* set/get YSUM_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_YSUM_PLACEHOLDER = 17,
    /* set/get YSQSUM_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_YSQSUM_PLACEHOLDER = 18,
    /* set CUDNN_PARAM_BN_SCALEBIAS_MEANVAR_DESC: pass previously initialized cudnnTensorDescriptor_t */
    /* get CUDNN_PARAM_BN_SCALEBIAS_MEANVAR_DESC: pass previously created cudnnTensorDescriptor_t */
    CUDNN_PARAM_BN_SCALEBIAS_MEANVAR_DESC = 19,
    /* set/get CUDNN_PARAM_BN_SCALE_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_BN_SCALE_PLACEHOLDER = 20,
    /* set/get CUDNN_PARAM_BN_BIAS_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_BN_BIAS_PLACEHOLDER = 21,
    /* set/get CUDNN_PARAM_BN_SAVED_MEAN_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_BN_SAVED_MEAN_PLACEHOLDER = 22,
    /* set/get CUDNN_PARAM_BN_SAVED_INVSTD_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_BN_SAVED_INVSTD_PLACEHOLDER = 23,
    /* set/get CUDNN_PARAM_BN_RUNNING_MEAN_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_BN_RUNNING_MEAN_PLACEHOLDER = 24,
    /* set/get CUDNN_PARAM_BN_RUNNING_VAR_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_BN_RUNNING_VAR_PLACEHOLDER = 25,

    /* set ZDESC: pass previously initialized cudnnTensorDescriptor_t */
    /* get ZDESC: pass previously created cudnnTensorDescriptor_t */
    CUDNN_PARAM_ZDESC = 26,
    /* set/get ZDATA_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_ZDATA_PLACEHOLDER = 27,
    /* set BN_Z_EQSCALEBIAS_DESC: pass previously initialized cudnnTensorDescriptor_t */
    /* get BN_Z_EQSCALEBIAS_DESC: pass previously created cudnnTensorDescriptor_t */
    CUDNN_PARAM_BN_Z_EQSCALEBIAS_DESC = 28,
    /* set/get BN_Z_EQSCALE_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_BN_Z_EQSCALE_PLACEHOLDER = 29,
    /* set/get BN_Z_EQBIAS_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_BN_Z_EQBIAS_PLACEHOLDER = 30,

    /* set ACTIVATION_BITMASK_DESC: pass previously initialized cudnnTensorDescriptor_t */
    /* get ACTIVATION_BITMASK_DESC: pass previously created cudnnTensorDescriptor_t */
    CUDNN_PARAM_ACTIVATION_BITMASK_DESC = 31,
    /* set/get ACTIVATION_BITMASK_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_ACTIVATION_BITMASK_PLACEHOLDER = 32,

    /* set DXDESC: pass previously initialized cudnnTensorDescriptor_t */
    /* get DXDESC: pass previously created cudnnTensorDescriptor_t */
    CUDNN_PARAM_DXDESC = 33,
    /* set/get DXDATA_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_DXDATA_PLACEHOLDER = 34,
    /* set DZDESC: pass previously initialized cudnnTensorDescriptor_t */
    /* get DZDESC: pass previously created cudnnTensorDescriptor_t */
    CUDNN_PARAM_DZDESC = 35,
    /* set/get DZDATA_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_DZDATA_PLACEHOLDER = 36,
    /* set/get CUDNN_PARAM_BN_DSCALE_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_BN_DSCALE_PLACEHOLDER = 37,
    /* set/get CUDNN_PARAM_BN_DBIAS_PLACEHOLDER: pass cudnnFusedOpsPointerPlaceHolder_t* */
    CUDNN_PARAM_BN_DBIAS_PLACEHOLDER = 38,
} cudnnFusedOpsConstParamLabel_t;

typedef enum {
    CUDNN_PTR_NULL         = 0,
    CUDNN_PTR_ELEM_ALIGNED = 1,
    CUDNN_PTR_16B_ALIGNED  = 2,
} cudnnFusedOpsPointerPlaceHolder_t;

typedef enum {
    /* set: pass void* pointing to dev memory */
    /* get: pass void** pointing to host memory */
    CUDNN_PTR_XDATA              = 0,
    CUDNN_PTR_BN_EQSCALE         = 1,
    CUDNN_PTR_BN_EQBIAS          = 2,
    CUDNN_PTR_WDATA              = 3,
    CUDNN_PTR_DWDATA             = 4,
    CUDNN_PTR_YDATA              = 5,
    CUDNN_PTR_DYDATA             = 6,
    CUDNN_PTR_YSUM               = 7,
    CUDNN_PTR_YSQSUM             = 8,
    CUDNN_PTR_WORKSPACE          = 9,
    CUDNN_PTR_BN_SCALE           = 10,
    CUDNN_PTR_BN_BIAS            = 11,
    CUDNN_PTR_BN_SAVED_MEAN      = 12,
    CUDNN_PTR_BN_SAVED_INVSTD    = 13,
    CUDNN_PTR_BN_RUNNING_MEAN    = 14,
    CUDNN_PTR_BN_RUNNING_VAR     = 15,
    CUDNN_PTR_ZDATA              = 16,
    CUDNN_PTR_BN_Z_EQSCALE       = 17,
    CUDNN_PTR_BN_Z_EQBIAS        = 18,
    CUDNN_PTR_ACTIVATION_BITMASK = 19,
    CUDNN_PTR_DXDATA             = 20,
    CUDNN_PTR_DZDATA             = 21,
    CUDNN_PTR_BN_DSCALE          = 22,
    CUDNN_PTR_BN_DBIAS           = 23,

    /* set/get: pass size_t* pointing to host memory */
    CUDNN_SCALAR_SIZE_T_WORKSPACE_SIZE_IN_BYTES = 100,
    /* set/get: pass int64_t* pointing to host memory */
    CUDNN_SCALAR_INT64_T_BN_ACCUMULATION_COUNT = 101,
    /* set/get: pass double* pointing to host memory */
    CUDNN_SCALAR_DOUBLE_BN_EXP_AVG_FACTOR = 102,
    /* set/get: pass double* pointing to host memory */
    CUDNN_SCALAR_DOUBLE_BN_EPSILON = 103,
} cudnnFusedOpsVariantParamLabel_t;

cudnnStatus_t CUDNNWINAPI
cudnnCnnInferVersionCheck(void);

#if defined(__cplusplus)
}
#endif

#endif /* CUDNN_CNN_INFER_H_ */