
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//  File:           qhsuprot.cpp
//                  06.06.12
//  Description:    HS-Ulm Serial Protocol class
//                  Source File (C++)
//
//	Version:
//            0.01
//-----------------------------------------------------------------------------


#include "qhsuprot.h"

QhsuProt::QhsuProt()
{
    rxPck_.Flags = PCKCMPL;
    rxPck_.ID = 0;
}

//------------------------------------------------------------------------------
void QhsuProt::Reset()
{
    rxPck_.Flags = PCKCMPL;
    rxPck_.ID = 0;
}

//------------------------------------------------------------------------------
int QhsuProt::ByteImport(unsigned char newByte)
{
    if (!(rxPck_.Flags & PCKCMPL)				// it's a new package
          && !(rxPck_.ID & IDMESSAGE)           //   it's data package
          &&(rxPck_.ID & IDSIZE)				//   it's a package with size info
          &&(rxPck_.SizeCnt < rxPck_.Size))     //   it's not the the stop flag
    {
        if (rxPck_.Flags & PCKSIZE)			// the size is received
        {
            rxPck_.Bytes[rxPck_.SizeCnt++] = newByte;
        }
        else
        {
            rxPck_.Size = newByte - 4;
            rxPck_.Flags += PCKSIZE;
            return PCKSIZE;
        }
    return 0;
    }

    switch (newByte)
    {
        case STARTFLAG:							// always do (STARTFLAG)
                    rxPck_.ID = 0;     			//  clear IDenntity Byte
                    rxPck_.Size = 1;
                    rxPck_.SizeCnt = 0;  			//  reset DataBuffer
                    rxPck_.ChkSum = 0;
                    if (rxPck_.Flags & PCKCMPL)	// prev. Pack. complete ?
                    {
                    rxPck_.Flags = 0;	    //  reset Command Flags
                    }
                    else
                    {                           // no -> StopError
                        rxPck_.Flags = 0;	    //  reset Command Flags
                        return PERRSTOP;
                    }
                    break;
      case ESCFLAG:
                    if ((rxPck_.Flags & PCKCMPL)||(rxPck_.Flags & PCKESC))
                    {
                        rxPck_.Flags |= PERRCMD;// error
                        return PERRCMD;
                    }
                    else
                        rxPck_.Flags |= PCKESC;	// set EscapeFlag
                    break;
      case STOPFLAG:
                if ((rxPck_.Flags & PCKCMPL)||(rxPck_.SizeCnt < 1))
                    {
                        rxPck_.Flags |= PERRSTART;	// missing StartFlag
                    return PERRSTART;
                    }
                    else
                    {
                        rxPck_.Flags |= PCKCMPL; 	// set StopFlag
                        if ( rxPck_.ID & IDSIZE)
                        {
                            inPck_ = rxPck_;
                            return PCKCMPL;
                        }
                        rxPck_.ChkSum = rxPck_.ID;	//  and calc. CHKSUM
                        for (int j = 0; j<(rxPck_.SizeCnt-1);j++)
                            if ((rxPck_.Bytes[j]==STARTFLAG)
                                ||(rxPck_.Bytes[j]==STOPFLAG)
                                ||(rxPck_.Bytes[j]==ESCFLAG)
                                )
                                rxPck_.ChkSum += (rxPck_.Bytes[j] & ~ESCMASK);
                            else
                                rxPck_.ChkSum += rxPck_.Bytes[j];
                        if (rxPck_.ChkSum != rxPck_.Bytes[--rxPck_.SizeCnt])
                        {                              	// remove CHKSUM
                            rxPck_.Flags |= PERRCHKSUM;	// CheckSumError
                            return PERRCHKSUM;
                        }
                        else
                        {
                            rxPck_.Size = rxPck_.SizeCnt;
                            inPck_ = rxPck_;
                            return PCKCMPL;
                        }
                    }//else (!missing startflag)
                break;
      default:
                if (rxPck_.Flags & PCKCMPL)
                {								// StartError
                    rxPck_.Flags |= PERRSTART;	//   (missing flag)
                    return PERRSTART;
                }
                if (!rxPck_.Flags)              // new transmission
                {                           	//   -> this is PackageID
                    rxPck_.Flags = PCKID;		//   set flag
                    rxPck_.ID = newByte;
                    return PCKID;
                }
                 else                    	// running transmisssion
                {
                    rxPck_.Bytes[(++rxPck_.SizeCnt)-1] = newByte; /* TODO : ??? ++C -1 ??? */
                    if (rxPck_.Flags & PCKESC)	//   check EscapeFlag
                    {
                        rxPck_.Bytes[rxPck_.SizeCnt-1] |= ESCMASK;
                        rxPck_.Flags &= ~PCKESC;//   clear EscapeFlag
                    }
                }
              break;// default
    }//switch (newByte)

    return 0;
}
//------------------------------------------------------------------------------

bool QhsuProt::GetPck(serialPck &inPackage)
{
    inPackage = inPck_;
    return true;
}
//------------------------------------------------------------------------------

bool QhsuProt::MakePck(serialPck &outPackage)
{
    outPck_.Bytes[0] = STARTFLAG;				// STARTFLAG
    if ((outPackage.ID==STARTFLAG)
            ||(outPackage.ID==STOPFLAG)          	// ID != FLAG !!!
            ||(outPackage.ID==ESCFLAG))
        return false;

    outPck_.ID = outPackage.ID;
    outPck_.Bytes[1] = outPackage.ID;
    outPck_.Size = 2;
    outPck_.ChkSum = outPackage.ID;

    for (int i = 0; i < outPackage.Size-1;i++) 	// DATA
    {
        if ((outPackage.Bytes[i]==STARTFLAG)
                ||(outPackage.Bytes[i]==STOPFLAG)
                ||(outPackage.Bytes[i]==ESCFLAG))
        {
            outPck_.Bytes[outPck_.Size++] = ESCFLAG;
            if (!outPck_.Size)
                return false;			// overflow occured
            outPackage.Bytes[i] &= ~ESCMASK;
        }
        outPck_.Bytes[outPck_.Size++] = outPackage.Bytes[i];
        if (!outPck_.Size)
            return false;				// overflow occured
        outPck_.ChkSum += outPackage.Bytes[i];        	// calc. chkSum;
    }

    if ((outPck_.ChkSum==STARTFLAG)
            ||(outPck_.ChkSum==STOPFLAG)
            ||(outPck_.ChkSum==ESCFLAG))
    {
        outPck_.Bytes[outPck_.Size++] = ESCFLAG;
        outPck_.ChkSum &= ~ESCMASK;
    }
    outPck_.Bytes[outPck_.Size++] = outPck_.ChkSum;
    outPck_.Bytes[outPck_.Size++] = STOPFLAG;
    if (outPck_.Size<4)
        return false;					// overflow occured
    outPackage = outPck_;
    return true;
}
