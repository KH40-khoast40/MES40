# MES40
MMD Extended Shader with things that MMD doesn't support natively, *"a bit" project-diva-dedicated*

## Features
- All the existed features that are available in MMD default shader
- Animated Texture ( APNG / gif )
- Normal Map <img src="https://i.imgur.com/5ia4FJx.png" alt="alt text" width="256" height="72">
- Specular Map 
- Cube Map <img src="https://i.imgur.com/imSbAFd.png" alt="alt text" width="256" height="72">
- Premade Tangents **(v1.1)** <img src="https://i.imgur.com/bz9MQ1j.png" alt="alt text" width="256" height="72">
- Fake Subsurface Scattering **(v1.2)** <img src="https://i.imgur.com/iHqbrak.png" alt="alt text" width="256" height="360">
- Vertex Color <img src="https://i.imgur.com/cTQ7Lxb.png" alt="alt text" width="256" height="72">
- Sub Map ( Shadow or Light Map ) <img src="https://i.imgur.com/5L3jbHb.png" alt="alt text" width="256" height="72">
- Alpha Test <img src="https://i.imgur.com/9hVYS8B.png" alt="alt text" width="256" height="72">
- Soft Shadow ( ビームマンP's full_SimpleSoftShadow / そぼろ's Excellent Shadow )
- Customizable Toon, Spa, Cube Map, Specular Light values

## Usage
Apply Object.fx to the materials. (clone the fx file if you want to use the shader on 2 or more materials with different settings)

For in-depth customization, I've written comments explaining things in the Object.fx, you should be able to understand after reading it.

If you want to update your existing Object.fx to the newer version, read *Object.fx Update Guide.txt*

## Notices

- If you export a cube map from MikuMikuModel, you have to open it Noesis, and then export it out again (under .dds format), I don't why, but the cube map ripped straight out of MikuMikuModel cause error for the shader

- I *accidentally* commented a little too much on the Object.fx (about how things work) that it might make the code even harder to read, so use Object_Commentless.fx if you get confused in distinguishing the actual codes and the comments, sorry about that lol


## Credits
- Original base shader : [舞力介入P](https://www.nicovideo.jp/user/282266)
- Animated texture support : ??? (from MME sample pack)
- Normal map support : [LessThanEqual](https://twitter.com/lessthanequal?lang=en) (AlternativeFull)
- Specular map support : [KH40](https://www.deviantart.com/khoast40)
- Cube map support : AMD (from MME sample pack)
- Premade tangents support : [KH40](https://www.deviantart.com/khoast40), Internet references
- Fake Subsurface Scattering : [KH40](https://www.deviantart.com/khoast40)
- Vertex color support : [KH40](https://www.deviantart.com/khoast40)
- Sub map support : [KH40](https://www.deviantart.com/khoast40)
- Alpha test support : [KH40](https://www.deviantart.com/khoast40)
- SimpleSoftShadow : [ビームマンP](https://w.atwiki.jp/beamman)
- ExcellentShadow : [そぼろ](https://www.nicovideo.jp/mylist/17392230)
- Mixing shaders : [KH40](https://www.deviantart.com/khoast40)
- Special thanks : [FlyingSpirits-P](https://www.deviantart.com/flyingspirits-p), [Minmode](https://www.deviantart.com/minmode)
  
