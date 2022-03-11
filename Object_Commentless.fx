//Customizable settings for MES40
//The #define lines either take 0 (disabled) or 1 (enabled) as the value, or a texture's name
//The float lines can take any decimal number, but not all of them will produce nice visual

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//NOTICE: If you use HgShadow with the shader, go to the "HgShadow_ViewportMap.fxsub" in the "HgShadow Custom FOV" folder, these settings will be repeated at the beginning of the file, edit them there the same way as you do here. Finally, apply that fxsub on the model in the "HgS_VMap" tab

#define CUSTOM_FOV 0

	#define Custom_Fov_Model "MES40 Controller.pmd"
	#define Custom_Fov_Bone "fov"
	#define Custom_Fov_Axis 1 // 1=x | 2=y | 3=z

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//#define AnimatedTexture "animated.gif"

//#define NormalMapTexture  ".png"

	#define Toon_Use_NormalMap 1
	#define Spa_CubeMap_Use_NormalMap 1
	#define SpecularLight_Use_NormalMap 1
	
	float NormalMap_Intensity = 1;
	#define NormalMap_Animated 0
	
//#define SpecularMapTexture  ".png"

	#define Spa_CubeMap_Use_SpecularMap 1
	#define SpecularLight_Use_SpecularMap 1
	
	float SpecularMap_Saturation = 1;
	#define SpecularMap_Animated 0

//#define CubeMapTexture "cubemap.dds"

//#define ShadingMapTexture ".png"

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

float Toon_Intensity = 1;
float Toon_Brightness = 1;
float Toon_Gradient = 3;

float Spa_CubeMap_Intensity = 1;
float Spa_CubeMap_Saturation = 1;
#define CubeMap_Affected_By_LightDirection 0

float SpecularLight_Intensity = 1;
float SpecularLight_Focus = 50;
#define SpecularLight_Affected_By_LightDirection 1

float Spa_CubeMap_SpecularLight_Tint = 1;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

float3 Rim_Color = float3(1,1,1);

	#define Rim_Directional 1
	
		float Rim_Length = 0.5; //SMALLER number means LONGER rim, only works when the rim is directional

	float Rim_Intensity = 0;
	float Rim_Gradient = 3;
		
	//float Rim_Shadow_Area_Intensity = 0.5;
		
	#define Rim_Use_NormalMap 1
	#define Rim_Use_SpecularMap 1
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define LIGHTSOURCES 0

	#define LightSource_Use_NormalMap 1
	#define LightSource_Use_SpecularMap 1
	#define LightSource_Use_Toon_Gradient 0
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define SUBSURFACETOON 0

	float3 Subsurface_Color = float3(1,0,0);
	
	//#define ThicknessMapTexture "thickness.png"

	float Subsurface_Toon_Intensity = 0.5;
	float Subsurface_Toon_Gradient = 2.5;
	
	float Subsurface_Rim_Intensity = 0.25;
	float Subsurface_Rim_Gradient = 0.75;
	
	//float Subsurface_Rim_Shadow_Area_Intensity = 0.5;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define PARALLAX 0

	//#define HeightMapTexture "height.png"
	
	float Parallax_Scale = 0.1;
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define VERTEXCOLOR 0

	float Vertex_Color_Intensity = 1;

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

#define IBL 0

	//#define IBLTexture "ibl.dds"
	
	float IBL_Intensity = 1;
	float IBL_Brightness = 1;
	float IBL_Saturation = 1;
	float IBL_Blur = 0;
	
	#define IBL_Resolution 1
	#define IBL_Use_NormalMap 1

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define SOFTSHADOW 1
//0: MMD's Standard Shadow
//1: HariganeP's HgShadow (Must load HgShadow.x to enable soft shadow)

	#define Shadow_Sharp 0

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define TOONSHADING 1

	#define HALFLAMBERT 0

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define ALPHATEST 0

	float Alpha_Threshold = 0.5; //Scale: 0-1

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#include "MES40 Sync.fxsub"