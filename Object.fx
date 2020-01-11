
//Custom settings per object (Apply this fx to the object)

//When I don't explain what's the meaning of 0 and 1 does in a define line, you can understand it as:
	// 0 : Disabled
	// 1 : Enabled

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//#define AnimatedTexture "animated.gif" //GIF or APNG (Optional, delete the double slash at the beginning of the line to enable it)

//#define NormalMapTexture  "noneN.png" //Normal Map (Optional, delete the double slash at the beginning of the line to enable it)

	#define Toon_Use_NormalMap 1
	#define Spa_CubeMap_Use_NormalMap 1
	#define SpecularLight_Use_NormalMap 1
	
//#define SpecularMapTexture  "noneS.png" //Specular Map (Optional, delete the double slash at the beginning of the line to enable it)

	#define Spa_CubeMap_Use_SpecularMap 1
	#define SpecularLight_Use_SpecularMap 1

//#define CubeMapTexture "cubemap.dds" //.dds cube map (Optional, delete the double slash at the beginning of the line to enable it)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//See custom_basic.png for details, leave these things alone if you want to keep the same setting as MMD's default shader

#define Toon_Intensity 1 //Should only be set somewhere from 0 to 1, out of that range will cause visual problems
#define Toon_Brightness 1
#define Toon_Gradient 3 //MMD default is 3

#define Spa_CubeMap_Intensity 1
#define Spa_CubeMap_Saturation 1

#define SpecularLight_Intensity 1
#define SpecularLight_Focus 50 //Add double slash at the beginning of the line to disable this, making it has the same value as the Reflection box in PMXE
#define SpecularLight_Affected_By_LightDirection 1 //1 is enabled (MMD default), 0 is disabled

#define Spa_CubeMap_SpecularLight_Tint 1 //Should be set from 0 to 1. 1 will give the tinted shine as vanilla MMD, 0 will give a dull, untinted shine, values between 0 and 1 are the blends of the two


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//See custom_rim.png for details

float3 Rim_Color = float3(1,1,1); //RGB value, scale: 0-1

	#define Rim_Intensity 0 //Set it 0 to disable rim lighting completely
	#define Rim_Gradient 3
		
	//#define Rim_Shadow_Area_Intensity 0.5 //Add double slash at the beginning of the line to auto-caculate the value
		
	#define Rim_Use_NormalMap 1 //Apply for the subsurface rim glow too, since they are basically the same thing
	#define Rim_Use_SpecularMap 1
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//See custom_subsurface.png for details

#define SUBSURFACETOON 0 //Enable or disable subsurface toon, can be use as fake subsurface scattering, might take a while to get a decent result

	float3 Subsurface_Toon_Color = float3(1,0,0); //RGB value, scale: 0-1
	
	//#define ThicknessMapTexture "thickness.png" //Thickness Map (Optional, delete the double slash at the beginning of the line to enable it), it should be the AO map generated from Metaseq, Blender,...

	#define Subsurface_Toon_Intensity 0.5
	#define Subsurface_Toon_Gradient 2.5 //Should be around 85% - 125% of the Toon_Gradient's value, but feel free to try any number
	
	#define Subsurface_Rim_Glow_Intensity 0.25
	#define Subsurface_Rim_Glow_Gradient 0.75
	
	//#define Subsurface_Rim_Glow_Shadow_Area_Intensity 0.5 //Add double slash at the beginning of the line to auto-caculate the value

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define TANGENT 0 //Enable or disable tangent, the model's normals will be messed up if it don't have pre-made tangent (or if you choose the wrong AddUV )

	#define Tangent_Stored_At TEXCOORD3 //Don't leave this empty, even if you disable tangent
	//AddUV1 = TEXCOORD1
	//AddUV2 = TEXCOORD2
	//AddUV3 = TEXCOORD3
	//AddUV4 = TEXCOORD4

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define VERTEXCOLOR 0 //Enable or disable vertex color, model will turn black (or has messed up color) if it don't have vertex color (or if you choose the wrong AddUV )

	#define Vertex_Color_Stored_At TEXCOORD2 //Don't leave this empty, even if you disable vertex color
	//AddUV1 = TEXCOORD1
	//AddUV2 = TEXCOORD2
	//AddUV3 = TEXCOORD3
	//AddUV4 = TEXCOORD4

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define SUBMAP 0 //Enable or disable submap, model will turn black (or has messed up UV) if it don't have submap UV (or if you choose the wrong AddUV )

	//#define SubMapTexture "submap.png" //Optional when you disable submap, add double slash at the beginning of the line in case you don't have a submap to put in

	#define Sub_Map_Stored_At TEXCOORD1 //Don't leave this empty, even if you disable submap
	//AddUV1 = TEXCOORD1
	//AddUV2 = TEXCOORD2
	//AddUV3 = TEXCOORD3
	//AddUV4 = TEXCOORD4

	#define Sub_Map_Type 1
	//0: Overwrite (Who use this!?!?)
	//1: Shadow Map (Take dark parts to blend with the diffuse texture)
	//2: Light Map (Take bright parts to blend with the diffuse texture)
	//3: Shadow and Light Map (Take both dark and bright parts to blend with the diffuse texture)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define SOFTSHADOW 0
//0: MMD's Standard Shadow
//1: Beamman's SimpleSoftShadow
//2: Sovoro's ExcellentShadow (Must load ExcellentShadow.x to enable soft shadow)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define TOONSHADING 1
//Should be disabled when doing realistic faces,...

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define ALPHATEST 0
//Should be enabled for objects have complex texture transparency like trees, some certain models' hair,... that MMD might have trouble rendering/ Or for you lazy-ass don't bother to re-order things like Miku's lace,...)

	#define AlphaThreshold 0.5 //Scale: 0-1

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#if SOFTSHADOW == 0
	#include "MES40.fxsub"
#elif SOFTSHADOW == 1
	#include "MES40 SimpleSoftShadow.fxsub"
#elif SOFTSHADOW == 2
	#include "MES40 ExcellentShadow.fxsub"
#endif