//-----------------------------------------------------------------------------
//     File:          qhsuprot.h
//                    06.06.12
//     Description:   HS-Ulm Serial Protocol
//                    Header File (C++)
//
//	Version:
//            _.__	see qhsuprot.cpp !!!
//-----------------------------------------------------------------------------
#ifndef QHSUPROT_H
#define QHSUPROT_H

//##############################################################################
// Transmission Flags
#define	STARTFLAG	0xAA    // signs begin of a new transmission
#define	STOPFLAG	0xAB    // signs end of transmission
#define	ESCFLAG		0xAF    // signs next byte is coded with ESCAPEMASK

#define	ESCMASK		0x80    // TX -> byte &= ~ESCMASK / RX -> byte |= ESCMASK

#define	IDMESSAGE	0x80    // Confirmation messages  == _Command |= 0x80
#define IDSIZE		0x20	// PACKAGESIZE instead of ESCAPEFLAGS and CHECKSUM
#define	IDERROR		0xFF	// Sensor Error-ID

// PackageFlags (sign Package-State)
#define	PCKCMPL		0x01	// Complete (previous packet complete)
#define	PCKID		0x02    // IDentity byte received
#define	PCKSIZE		0x04    // PackageSize byte received
#define	PCKESC		0x08    // previous byte was an escapeflag
#define	PERRSTOP	0x10	// communication record errors
#define	PERRSTART	0x20
#define	PERRCHKSUM	0x40
#define	PERRCMD		0x80

typedef struct // structSerialPck
{
    unsigned char ID;
    unsigned char Size;
    unsigned char SizeCnt;
    unsigned char Bytes[100];
    unsigned char ChkSum;
    unsigned char Flags;
}serialPck;


class QhsuProt
{
public:
    QhsuProt();

    void Reset();
    bool MakePck(serialPck &outPackage);
    bool GetPck(serialPck &inPackage);
    int  ByteImport(unsigned char newByte);

private:
    serialPck rxPck_;			// temp. Package to handle incomming bytes
    serialPck inPck_;			// the last complete rxPck_
    serialPck outPck_;
};

#endif // QHSUPROT_H
