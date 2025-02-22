
[[ stitchable ]] half4 metaltest(float2 position, SwiftUI::Layer l, float4 boundingRect, float progress, float x, float y) {

    float2 size = float2(boundingRect[2],boundingRect[3]);
    float2 uv = position / size;
    float2 c = float2(0.5,0.5);
    float2 gp = floor(position / 2.0) * 2.0;
    
    float distance = length_squared(uv - c);
    
    float2 newpos = uv;
    float diff = dot(uv, c);
    newpos.x += cos(diff - distance * x) * progress;
    newpos.y += sin(diff - distance * y) * progress;

    half3 color = l.sample(newpos * size).rgb;

    return half4(color,1);
}
