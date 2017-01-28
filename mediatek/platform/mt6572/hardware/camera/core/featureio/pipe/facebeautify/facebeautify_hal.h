
#ifndef _FACEBEAUTIFY_HAL_H_
#define _FACEBEAUTIFY_HAL_H_

#include "featureio/facebeautify_hal_base.h"
#include "MTKFaceBeauty.h"

class MTKFacebeautify;

class halFACEBEAUTIFY: public halFACEBEAUTIFYBase 
{
public:
    //
    static halFACEBEAUTIFYBase* getInstance();
    virtual void destroyInstance();
    //
    /////////////////////////////////////////////////////////////////////////
    //
    // halFDBase () -
    //! \brief FD Hal constructor
    //
    /////////////////////////////////////////////////////////////////////////                       
    halFACEBEAUTIFY(); 

    /////////////////////////////////////////////////////////////////////////
    //
    // ~mhalCamBase () -
    //! \brief mhal cam base descontrustor 
    //
    /////////////////////////////////////////////////////////////////////////    
    virtual ~halFACEBEAUTIFY();

    /////////////////////////////////////////////////////////////////////////
    //
    // mHalFACEBEAUTIFYInit () -
    //! \brief init facebeautify
    //
    /////////////////////////////////////////////////////////////////////////    
    virtual MINT32 mHalFacebeautifyInit(void* FaceBeautyEnvInfo);

    /////////////////////////////////////////////////////////////////////////
    //
    // mHalFacebeautifyUninit () -
    //! \brief facebeautify uninit 
    //
    /////////////////////////////////////////////////////////////////////////    
    virtual MINT32 mHalFacebeautifyUninit();
    
    /////////////////////////////////////////////////////////////////////////
    //
    // mHalSTEP2 () -
    //! 
    //
    /////////////////////////////////////////////////////////////////////////    
    virtual MINT32 mHalSTEP2(void* ImgSrcAddr, void* FaceMetadata, void* FaceBeautyResultInfo);
    
    /////////////////////////////////////////////////////////////////////////
    //
    // mHalSTEP3 () -
    //! 
    //
    /////////////////////////////////////////////////////////////////////////    
    virtual MINT32 mHalSTEP3(void* ImgSrcAddr, void* FaceBeautyResultInfo);
    
    /////////////////////////////////////////////////////////////////////////
    //
    // mHalSTEP1 () -
    //! 
    //
    ///////////////////////////////////////////////////////////////////////// 
    virtual MINT32 mHalSTEP1(void* ImgSrcAddr, void* FaceBeautyResultInfo);

    /////////////////////////////////////////////////////////////////////////
    //
    // mHalSTEP4 () -
    //! 
    //
    /////////////////////////////////////////////////////////////////////////    
    virtual MINT32 mHalSTEP4(void* ImgSrcAddr,void* BlurResultAdr,void* AplhaMapBuffer,void* FaceBeautyResultInfo);
   
    /////////////////////////////////////////////////////////////////////////
    //
    // mHalSTEP5 () -
    //! 
    //
    /////////////////////////////////////////////////////////////////////////    
    virtual MINT32 mHalSTEP5(void* ImgSrcAddr,void* AplhaMapColorBuffer,void* FaceBeautyResultInfo);

    /////////////////////////////////////////////////////////////////////////
    //
    // mHalSTEP6 () -
    //! 
    //
    /////////////////////////////////////////////////////////////////////////    
    virtual MINT32 mHalSTEP6(void* ImgSrcAddr,void* WarpWorkBufAdr,void* FaceBeautyResultInfo);
            
    /////////////////////////////////////////////////////////////////////////
    //
    // getWorkingBuffSize () -
    //! 
    //
    /////////////////////////////////////////////////////////////////////////         
    virtual MINT32 getWorkingBuffSize(int SrcImgWidth, int SrcImgHeight, int Step2SrcImgWidth, int Step2SrcImgHeight, int Step1SrcImgWidth, int Step1SrcImgHeight);
       
protected:


private:
    MTKFaceBeauty* m_pMTKFacebeautifyObj;
    MTKFaceBeautyProcInfo FaceBeautyProcInfo;
};

#endif

