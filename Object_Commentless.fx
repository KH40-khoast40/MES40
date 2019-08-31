
//I have to shut up

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//#define AnimatedTexture "animated.gif"

//#define NormalMapTexture  "noneN.png"

	#define Toon_Use_NormalMap 1
	#define Spa_CubeMap_Use_NormalMap 1
	#define SpecularLight_Use_NormalMap 1
	
//#define SpecularMapTexture  "noneS.png"

	#define Spa_CubeMap_Use_SpecularMap 1
	#define SpecularLight_Use_SpecularMap 1

//#define CubeMapTexture "cubemap.dds"

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define Toon_Intensity 1
#define Toon_Brightness 1
#define Toon_Gradient 3

#define Spa_CubeMap_Intensity 1
#define Spa_CubeMap_Saturation 1

#define SpecularLight_Intensity 1
#define SpecularLight_Focus 50
#define SpecularLight_Affected_By_LightDirection 1

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define TANGENT 0

#define Tangent_Stored_At TEXCOORD3
//AddUV1 = TEXCOORD1
//AddUV2 = TEXCOORD2
//AddUV3 = TEXCOORD3
//AddUV4 = TEXCOORD4

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define VERTEXCOLOR 0

#define Vertex_Color_Stored_At TEXCOORD2
//AddUV1 = TEXCOORD1
//AddUV2 = TEXCOORD2
//AddUV3 = TEXCOORD3
//AddUV4 = TEXCOORD4

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define SUBMAP 0

//#define SubMapTexture "submap.png"

#define Sub_Map_Stored_At TEXCOORD1
//AddUV1 = TEXCOORD1
//AddUV2 = TEXCOORD2
//AddUV3 = TEXCOORD3
//AddUV4 = TEXCOORD4

#define Sub_Map_Type 1
//0: Overwrite
//1: Shadow Map
//2: Light Map
//3: Shadow and Light Map

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define SOFTSHADOW 0
//0: MMD's Standard Shadow
//1: Beamman's SimpleSoftShadow
//2: Sovoro's ExcellentShadow (Must load ExcellentShadow.x to enable soft shadow)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define TOONSHADING 1

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define ALPHATEST 0

#define AlphaThreshold 0.5 //Scale: 0-1

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#if SOFTSHADOW == 0
	#include "MES40.fxsub"
#elif SOFTSHADOW == 1
	#include "MES40 SimpleSoftShadow.fxsub"
#elif SOFTSHADOW == 2
	#include "MES40 ExcellentShadow.fxsub"
#endif