//Customizable settings for MES40

//Custom settings per object (Apply this fx to the object)
//The #define lines either take 0 (disabled) or 1 (enabled) as the value, or a texture's name
//The float lines can take any decimal number, but not all of them will produce nice visual

//NOTICE: IF YOU WANT TO USE HGSHADOW, REMEMBER TO USE THE ONE INCLUDED WITH THIS SHADER (there are some features that require editing the options of HgShadow which are only available in this version)
//NOTICE: IF YOU WANT TO USE HGSHADOW, REMEMBER TO USE THE ONE INCLUDED WITH THIS SHADER
//NOTICE: IF YOU WANT TO USE HGSHADOW, REMEMBER TO USE THE ONE INCLUDED WITH THIS SHADER
//NOTICE: IF YOU WANT TO USE HGSHADOW, REMEMBER TO USE THE ONE INCLUDED WITH THIS SHADER
//NOTICE: IF YOU WANT TO USE HGSHADOW, REMEMBER TO USE THE ONE INCLUDED WITH THIS SHADER

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define BLENDMODE 0 //Blend the model with the background
//0: Normal
//1: Multiply
//2: Linear Dodge (Add)

//The texture's background should be white (in case of "Multiply") or black (in case of "Linear Dodge"), not transparent

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Open "HgShadow_ViewPortMap.fxsub". These settings will be repeated at the beginning of the file, edit them there the same way as you do here. It's required to make the shadow responds to the custom FOV

#define CUSTOM_FOV 0 //Can serve as decimal FOV, and/or to apply the FOV of ripped Diva camera automatically

	#define Custom_Fov_Model "MES40 Controller.pmx"
	#define Custom_Fov_Bone "fov"
	#define Custom_Fov_Axis 1 // 1=x | 2=y | 3=z ; Determine which direction of the bone controls the FOV value

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//#define AnimatedTexture "animated.gif" //GIF or APNG (Optional, delete the double slash at the beginning of the line to enable it)

//#define NormalMapTexture  ".png" //Normal Map (Optional, delete the double slash at the beginning of the line to enable it)
		
	#define NormalMap_Invert_Red 0 //Invert the red channel of the normal map
	#define NormalMap_Invert_Green 0 //Invert the green channel of the normal map

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

//#define ShadingMapTexture ".png" //Black is always shaded, white is normal

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//See custom_basic.png for details, leave these things alone if you want to keep the same setting as MMD's default shader

float Toon_Intensity = 1; //Should only be set somewhere from 0 to 1, out of that range will cause visual problems
float Toon_Brightness = 1;
float Toon_Gradient = 3; //MMD default is 3

float Spa_CubeMap_Intensity = 1;
float Spa_CubeMap_Saturation = 1;
#define CubeMap_Affected_By_LightDirection 0 //1 is enabled, 0 is disabled

float SpecularLight_Intensity = 1;
float SpecularLight_Focus = 50;
#define SpecularLight_Affected_By_LightDirection 1 //1 is enabled (MMD default), 0 is disabled

float Spa_CubeMap_SpecularLight_Tint = 1; //Should be set from 0 to 1. 1 will give the tinted shine as vanilla MMD, 0 will give a dull, untinted shine, values between 0 and 1 are the blends of the two

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//See custom_rim.png for details

float3 Rim_Color = float3(1,1,1); //RGB value, scale: 0-1

	#define Rim_Directional 1
	
		float Rim_Length = 0.5; //SMALLER number means LONGER rim, only works when the rim is directional

	float Rim_Intensity = 0; //Set it 0 to disable rim lighting completely
	float Rim_Gradient = 3;
		
	//float Rim_Shadow_Area_Intensity = 0.5; //Add double slash at the beginning of the line to auto-caculate the value
		
	#define Rim_Use_NormalMap 1 //Apply for the subsurface rim glow too, since they are basically the same thing
	#define Rim_Use_SpecularMap 1
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define LIGHTSOURCES 0 //Turn this off to improve performance if the model doesn't need to be lit by these lights

	#define LightSource_Use_NormalMap 1
	#define LightSource_Use_SpecularMap 1
	#define LightSource_Use_Toon_Gradient 0 //Enable this will make Toon_Gradient controls how smooth/sharp the casted lightings are in the same fashion as how Toon_Gradient works with the toon

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define PUNI_ENGINE 0 //To use the physic of PuniEngine

//If you use HgShadow with this feature enabled, open "HgShadow_ShadowMap.fxsub" AND "HgShadow_ViewportMap.fxsub", change the "#define PUNI_ENGINE" in there to 1 as well

//After you enable this feature, you still need to apply the 2 fxsub(s) of PuniEngine into its tabs in MME like the usual process. I'm speaking with the assumption that you know how to setup PuniEngine already
//During the moment AFTER you enable this feature in this shader and BEFORE you apply PuniEngine's fxsub(s), the model's lighting will be weird. It's a normal thing to happen, it also occurs with the original shader of PuniEngine

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//See custom_subsurface.png for details

#define SUBSURFACETOON 0 //Enable or disable subsurface toon, can be use as fake subsurface scattering, might take a while to get a decent result

	float3 Subsurface_Color = float3(1,0,0); //RGB value, scale: 0-1
	
	//#define ThicknessMapTexture "thickness.png" //Thickness Map (Optional, delete the double slash at the beginning of the line to enable it), it should be the AO map generated from Metaseq, Blender,...

	float Subsurface_Toon_Intensity = 0.5;
	float Subsurface_Toon_Gradient = 3; //Should be around 85% - 125% of the Toon_Gradient's value, but feel free to try any number
	
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

#define IBL 0 //Enable or disable image-based lighting

//If you have a problem of the lighting having seams, you can use cubemap making programs like CubeMapGen to down-sample the cubemap directly, and not rely on IBL_Resolution

	#define IBLTexture "cubemap.dds" //Delete the double slash at the beginning of the line to enable it, if you disable it while IBL is on, IBL will use CubeMapTexture instead
	
	float IBL_Intensity = 1;
	float IBL_Brightness = 1;
	float IBL_Saturation = 1;
	float IBL_Blur = 0; //Increase it in case the color is still not smooth even when IBL_Resolution is set to 1
	
	#define IBL_Resolution 1 //Can be as high as the resolution of a face of the cubemap, but generally you should set it to 1 or 2 to have smooth color
	#define IBL_Use_NormalMap 1

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define SOFTSHADOW 1
//0: MMD's Standard Shadow
//1: HariganeP's HgShadow (Must load HgShadow.x to enable soft shadow)

	#define Shadow_Sharp 0 //Sharpen the shadow to make it be more fitting to 2D artstyle, only works decently with HgShadow on

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define TOONSHADING 1

	#define HALFLAMBERT 0

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define ALPHATEST 0
//Should be enabled for objects have complex texture transparency like trees... but not recommended for textures that have gradient transparency

	float Alpha_Threshold = 0.5; //Scale: 0-1

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#include "MES40 Sync.fxsub"