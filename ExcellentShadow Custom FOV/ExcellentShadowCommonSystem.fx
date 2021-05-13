

#define EXCELLENT_SHADOW


//�@��MMD�N�����ɂ��̃t�@�C����ύX�����ۂ́A
//�@�@MME�������X�V����Ȃ��̂ŕK���蓮�Łu�S�čX�V�v���s������


//�V���h�E��K�p����A���t�@�l��臒l
const float ShadowAlphaThreshold = 0.85;


//MMD�W���̃V���h�E�𗘗p���邩�ǂ���
//�����ɂ���ƃA�b�v���̉e�ɃW���M�[���o�₷���Ȃ�܂����A
//�e�̗֊s�́u���ɂ��Ɂv�������Ȃ�܂��B
//1�ŗL���A0�Ŗ���
#define MMDSHADOW_USING   1

//�}���`�T���v�����O�ɂ��ȈՃ\�t�g�V���h�E���ʂ�ǉ����A
//�e�̗֊s����芊�炩�ɂ��܂��B�኱�d���Ȃ�܂��B
#define MULTISAMPLING   1


//�i�����x��
//0: ���x�D��
//1: �Ђ�����
//2: ���i���@(VRAM1GB�ȏ㐄��)
//3: ���i���@(VRAM2GB�ȏ㐄��)
//4: �t�����[�h
//5: �I�[�o�[���[�h
#define EXSHADOW_QUALITY  2


//�Ǝ��Z���t�V���h�EZ�o�b�t�@�̃T�C�Y
#if EXSHADOW_QUALITY==0
    #define SHADOWBUFSIZE   1024
#elif EXSHADOW_QUALITY==1
    #define SHADOWBUFSIZE   1600
#elif EXSHADOW_QUALITY==2
    #define SHADOWBUFSIZE   2048
#elif EXSHADOW_QUALITY==3
    #define SHADOWBUFSIZE   3072
#elif EXSHADOW_QUALITY==4
    #define SHADOWBUFSIZE   3072
#else
    #define SHADOWBUFSIZE   4096
#endif


////////////////////////////////////////////////////////////////////////////////////////////////


float4 VecToQuaternion(float3 vec1, float3 vec2){
    float4 val;
    
    float3 axis = normalize(cross(vec1, vec2));
    float rad = acos(dot(vec1, vec2));
    
    val.w = cos(rad / 2);
    
    val.x = axis.x * sin(rad / 2);
    val.y = axis.y * sin(rad / 2);
    val.z = axis.z * sin(rad / 2);
    
    return val;
}

float4x4 QuaternionToMatrix(float4 qt){
    float4x4 val = {
        {1-2*qt.y*qt.y-2*qt.z*qt.z, 2*qt.x*qt.y+2*qt.w*qt.z,   2*qt.x+qt.z-2*qt.w*qt.y  , 0},
        {2*qt.x*qt.y-2*qt.w*qt.z,   1-2*qt.x*qt.x-2*qt.z*qt.z, 2*qt.y+qt.z+2*qt.w*qt.x  , 0},
        {2*qt.x*qt.z+2*qt.w*qt.y,   2*qt.y*qt.z-2*qt.w*qt.x,   1-2*qt.x*qt.x-2*qt.y*qt.y, 0},
        {0,0,0,1}
    };
    
    return val;
}

float4x4 VecToMatrix(float3 vec1, float3 vec2){
    
    float3 axis = normalize(cross(vec1, vec2));
    
    float nx = axis.x;
    float ny = axis.y;
    float nz = axis.z;
    
    float c = dot(vec1, vec2);
    float rad = acos(c);
    float nc = 1 - c;
    float s = sin(rad);
    
    float4x4 val = {
        {nx*nx*nc+c,    nx*ny*nc-nz*s, nz*nx*nc+ny*s, 0},
        {nx*ny*nc+nz*s, ny*ny*nc+c,    ny*nz*nc-nx*s, 0},
        {nz*nx*nc-ny*s, ny*nz*nc+nx*s, nz*nz*nc+c,    0},
        {0,0,0,1}
    };
    
    float4x4 val2 = {
        {1,0,0,0},
        {0,1,0,0},
        {0,0,1,0},
        {0,0,0,1}
    };
    
    //val = (abs(abs(c) - 1) > 0.001) ? val : val2;
    
    return val;
    
    //return QuaternionToMatrix(VecToQuaternion(vec1, vec2));
}



float3   ES_CameraPos1   : POSITION  < string Object = "Camera"; >;
float3   LightDirVec     : DIRECTION < string Object = "Light"; >;
float4x4 BaseWorldMatrix : WORLD;

float size0 : CONTROLOBJECT < string name = "ExcellentShadow.x"; string item = "Si"; >;
//float3 move1 : CONTROLOBJECT < string name = "ExcellentShadow.x"; >;
float4x4 es_mat1 : CONTROLOBJECT < string name = "ExcellentShadow.x"; >;
static float3 es_move1 = float3(es_mat1._41, es_mat1._42, es_mat1._43 );

//�J�����ƃV���h�E���S�̋���
static float CameraDistance1 = length(ES_CameraPos1 - es_move1);

#define SIZERATE 130
#define SIZERATE_FAR 8

static float size1 = size0 * 0.1;// * max(1, CameraDistance1 / 1000);

static float size = size1 * SIZERATE; //�̈敝
static float size_far = size1 * SIZERATE * SIZERATE_FAR;

static float ZFar = size1 * 400; //�̈�[��

static float4x4 LightWorldMatrix = {
    {1/size, 0, 0, 0},
    {0, 1/size, 0, 0},
    {0, 0, 1/size, 0},
    {-es_move1.x/size, -es_move1.y/size, -es_move1.z/size, 1}
};

static float4x4 LightWorldMatrix_far = {
    {1/size_far, 0, 0, 0},
    {0, 1/size_far, 0, 0},
    {0, 0, 1/size_far, 0},
    {-es_move1.x/size_far, -es_move1.y/size, -es_move1.z/size_far, 1}
};

static float4x4 LightViewMatrix = VecToMatrix(float3(0,0,1), normalize(LightDirVec));

static float4x4 LightProjMatrix = {
    {1, 0, 0, 0},
    {0, 1, 0, 0},
    {0, 0, 1/ZFar, 0},
    {0, 0, 0.5, 1}
};

static float4x4 InternalLightWorldViewProjMatrix = mul(BaseWorldMatrix, mul(mul(LightWorldMatrix, LightViewMatrix), LightProjMatrix));
static float4x4 InternalLightWorldViewProjMatrix_far = mul(BaseWorldMatrix, mul(mul(LightWorldMatrix_far, LightViewMatrix), LightProjMatrix));


static const float sampstep = 1.0 / SHADOWBUFSIZE;



////////////////////////////////////////////////////////////////////////////////////////////////
//MMM�Ή�

#ifdef MIKUMIKUMOVING
    
    #define GETPOS MMM_SkinnedPosition(IN.Pos, IN.BlendWeight, IN.BlendIndices, IN.SdefC, IN.SdefR0, IN.SdefR1)
    
    int voffset : VERTEXINDEXOFFSET;
    
#else
    
    struct MMM_SKINNING_INPUT{
        float4 Pos : POSITION;
        float2 Tex : TEXCOORD0;
        float4 AddUV1 : TEXCOORD1;
        float4 AddUV2 : TEXCOORD2;
        float4 AddUV3 : TEXCOORD3;
        float3 Normal : NORMAL;
        int Index     : _INDEX;
    };
    
    #define GETPOS (IN.Pos)
    
    const int voffset = 0;
    
#endif

////////////////////////////////////////////////////////////////////////////////////////////

