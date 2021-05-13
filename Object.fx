//Customizable settings for MES40

//Custom settings per object (Apply this fx to the object)

//The #define lines either take 0 (disabled) or 1 (enabled) as the value, or a texture's name

//The float lines can take any decimal number, but not all of them will produce nice visual

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//NOTICE: If you use the ExcellentShadow version of the shader, then ignore this section. Go to the "ExcellentShadowObject.fxsub" in the "ExcellentShadow Custom FOV" folder, these settings will be repeated at the beginning of the file, edit them there, not here. Finally, apply that fxsub on the model in the "ScreenShadowMap" tab

#define CUSTOM_FOV 0 //Can serve as decimal FOV, and/or to apply the FOV of ripped Diva camera automatically

	#define Custom_Fov_Model "MES40 Controller.pmd"
	#define Custom_Fov_Bone "fov"
	#define Custom_Fov_Axis 1 // 1=x | 2=y | 3=z ; Determine which direction of the bone controls the FOV value

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//#define AnimatedTexture "animated.gif" //GIF or APNG (Optional, delete the double slash at the beginning of the line to enable it)

//#define NormalMapTexture  ".png" //Normal Map (Optional, delete the double slash at the beginning of the line to enable it)

	#define Toon_Use_NormalMap 1
	#define Spa_CubeMap_Use_NormalMap 1
	#define SpecularLight_Use_NormalMap 1
	
	float NormalMap_Intensity = 1;
	#define NormalMap_Animated 0
	
//#define SpecularMapTexture  ".png" //Specular Map (Optional, delete the double slash at the beginning of the line to enable it)

	#define Spa_CubeMap_Use_SpecularMap 1
	#define SpecularLight_Use_SpecularMap 1
	
	float SpecularMap_Saturation = 1;
	#define SpecularMap_Animated 0

//#define CubeMapTexture "cubemap.dds" //.dds cube map (Optional, delete the double slash at the beginning of the line to enable it)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//See custom_basic.png for details, leave these things alone if you want to keep the same setting as MMD's default shader

float Toon_Intensity = 1; //Should only be set somewhere from 0 to 1, out of that range will cause visual problems
float Toon_Brightness = 1;
float Toon_Gradient = 3; //MMD default is 3

float Spa_CubeMap_Intensity = 1;
float Spa_CubeMap_Saturation = 1;
#define CubeMap_Affected_By_LightDirection 0 //1 is enabled, 0 is disabled

float SpecularLight_Intensity = 1;
float SpecularLight_Focus = 50; //Add double slash at the beginning of the line to disable this, making it has the same value as the Reflection box in PMXE
#define SpecularLight_Affected_By_LightDirection 1 //1 is enabled (MMD default), 0 is disabled

float Spa_CubeMap_SpecularLight_Tint = 1; //Should be set from 0 to 1. 1 will give the tinted shine as vanilla MMD, 0 will give a dull, untinted shine, values between 0 and 1 are the blends of the two


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//See custom_rim.png for details

float3 Rim_Color = float3(1,1,1); //RGB value, scale: 0-1

	float Rim_Intensity = 0; //Set it 0 to disable rim lighting completely
	float Rim_Gradient = 3;
		
	//float Rim_Shadow_Area_Intensity = 0.5; //Add double slash at the beginning of the line to auto-caculate the value
		
	#define Rim_Use_NormalMap 1 //Apply for the subsurface rim glow too, since they are basically the same thing
	#define Rim_Use_SpecularMap 1
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//See custom_subsurface.png for details

#define SUBSURFACETOON 0 //Enable or disable subsurface toon, can be use as fake subsurface scattering, might take a while to get a decent result

	float3 Subsurface_Color = float3(1,0,0); //RGB value, scale: 0-1
	
	//#define ThicknessMapTexture "thickness.png" //Thickness Map (Optional, delete the double slash at the beginning of the line to enable it), it should be the AO map generated from Metaseq, Blender,...

	float Subsurface_Toon_Intensity = 0.5;
	float Subsurface_Toon_Gradient = 2.5; //Should be around 85% - 125% of the Toon_Gradient's value, but feel free to try any number
	
	float Subsurface_Rim_Intensity = 0.25;
	float Subsurface_Rim_Gradient = 0.75;
	
	//float Subsurface_Rim_Shadow_Area_Intensity = 0.5; //Add double slash at the beginning of the line to auto-caculate the value

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define PARALLAX 0 //Enable or disable parallax effect

	//#define HeightMapTexture "height.png" //The whiter, the higher (Optional when you disable parallax, delete the double slash at the beginning of the line to enable it)
	
	float Parallax_Scale = 0.1; //Equal to parallaxMapScale in RayCast
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define VERTEXCOLOR 0 //Enable or disable vertex color, model will turn black (or has messed up color) if it don't have vertex color (or if you choose the wrong AddUV )

	float Vertex_Color_Intensity = 1; // Setting it 0 does the same thing as disabling vertex color, except the transparency will still be affected, the higher/lower the value is, the more/less visible the vertex color is

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
	//0: Overwrite
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

	float Alpha_Threshold = 0.5; //Scale: 0-1

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#include "MES40 Sync.fxsub"