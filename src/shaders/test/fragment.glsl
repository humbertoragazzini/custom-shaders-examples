
#define PI 3.14159
varying vec2 vUv;
//	Classic Perlin 2D Noise 
//	by Stefan Gustavson
//
vec4 permute(vec4 x)
{
    return mod(((x*34.0)+1.0)*x, 289.0);
}
vec2 fade(vec2 t)
{
    return t*t*t*(t*(t*6.0-15.0)+10.0);
}

float cnoise(vec2 P)
{
    vec4 Pi = floor(P.xyxy) + vec4(0.0, 0.0, 1.0, 1.0);
    vec4 Pf = fract(P.xyxy) - vec4(0.0, 0.0, 1.0, 1.0);
    Pi = mod(Pi, 289.0); // To avoid truncation effects in permutation
    vec4 ix = Pi.xzxz;
    vec4 iy = Pi.yyww;
    vec4 fx = Pf.xzxz;
    vec4 fy = Pf.yyww;
    vec4 i = permute(permute(ix) + iy);
    vec4 gx = 2.0 * fract(i * 0.0243902439) - 1.0; // 1/41 = 0.024...
    vec4 gy = abs(gx) - 0.5;
    vec4 tx = floor(gx + 0.5);
    gx = gx - tx;
    vec2 g00 = vec2(gx.x,gy.x);
    vec2 g10 = vec2(gx.y,gy.y);
    vec2 g01 = vec2(gx.z,gy.z);
    vec2 g11 = vec2(gx.w,gy.w);
    vec4 norm = 1.79284291400159 - 0.85373472095314 * vec4(dot(g00, g00), dot(g01, g01), dot(g10, g10), dot(g11, g11));
    g00 *= norm.x;
    g01 *= norm.y;
    g10 *= norm.z;
    g11 *= norm.w;
    float n00 = dot(g00, vec2(fx.x, fy.x));
    float n10 = dot(g10, vec2(fx.y, fy.y));
    float n01 = dot(g01, vec2(fx.z, fy.z));
    float n11 = dot(g11, vec2(fx.w, fy.w));
    vec2 fade_xy = fade(Pf.xy);
    vec2 n_x = mix(vec2(n00, n01), vec2(n10, n11), fade_xy.x);
    float n_xy = mix(n_x.x, n_x.y, fade_xy.y);
    return 2.3 * n_xy;
}
float random(vec2 st)
{
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}
vec2 rotate(vec2 uv, float rotation, vec2 mid)
{
    return vec2(
      cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
      cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
    );
}
void main()
{
    //pattern custom beto
    //gl_FragColor = vec4(vUv, 1.0, 1.0);
    //gl_FragColor = vec4(vUv, 0.0, 1.0);
    //gl_FragColor = vec4(vUv, 0.7, 1.0);

    //pattern custom beto 2
    //gl_FragColor = vec4(vUv.x,vUv.x, vUv.x, 1.0);
    //float r = abs(sin(vUv.y*6.28))*abs(cos(vUv.x*6.28));
    //float g = abs(sin(vUv.x*6.28))*abs(cos(vUv.y*6.28));
    //float b = abs(sin(vUv.y*6.28))*abs(cos(vUv.x*6.28));
    //gl_FragColor = vec4(r,g,b, 1.0);

    //Pattern 3
    //float strength = vUv.x;

    //Pattern 4
    //float strength = vUv.y;
    
    //Pattern 5
    //float strength = -vUv.y + 1.0;
    
    //Pattern 6
    //float strength = vUv.y * 10.0;
   
    //Pattern 7
    //float strength = mod(vUv.y * 10.0, 1.0 );
     
    //Pattern 8
    //float strength = step(0.5,mod(vUv.y * 10.0, 1.0 ));
     
    //Pattern 9 
    // float strength = step(0.8,mod(vUv.y * 10.0, 1.0 ));
    
    //Pattern 10 
    //float strength = step(0.8,mod(vUv.x * 10.0, 1.0 ));
     
    //Pattern 11
    //float strength = step(0.8,mod(vUv.y * 10.0, 1.0 )) +  step(0.8,mod(vUv.x * 10.0, 1.0 )) ;
   
    //Pattern 12
    //float strength = step(0.8,mod(vUv.y * 10.0, 1.0 )) * step(0.8,mod(vUv.x * 10.0, 1.0 ));

    //Pattern 13
    //float strength = step(0.4,mod(vUv.x * 10.0, 1.0 )) * step(0.8,mod(vUv.y * 10.0, 1.0 ));

     //Pattern 14
    //float vertical  = step(0.4,mod(vUv.x * 10.0, 1.0 )) * step(0.8,mod(vUv.y * 10.0, 1.0 ));
    //float horizontal  = step(0.8,mod(vUv.x * 10.0, 1.0 )) * step(0.4,mod(vUv.y * 10.0, 1.0 ));
    //float strength = vertical + horizontal;

    //Pattern 15
    //float vertical  = step(0.4,mod(( - vUv.x) * 10.0, 1.0)) * step(0.8,mod((0.025 - vUv.y) * 10.0, 1.0));
    //float horizontal  = step(0.8,mod((0.22 - vUv.x) * 10.0, 1.0 )) * step(0.4,mod((0.005- vUv.y) * 10.0, 1.0 ));
     
    //Pattern 16
    //float strength = abs(vUv.x - 0.5);

    //Pattern 17
    //float strength = min(abs(vUv.y - 0.5), abs(vUv.x - 0.5));

    // used in my website
    //float strength = abs(cos(vUv.y*3.14)) + abs(cos(vUv.x*3.14))-0.1;

    //Pattern 18
    //float strength = max(abs(vUv.y - 0.5), abs(vUv.x - 0.5));

    //Pattern 19
    // this is my float strength =  step(0.2,max(abs(vUv.y - 0.5), abs(vUv.x - 0.5))) - step(0.25,max(abs(vUv.y - 0.5), abs(vUv.x - 0.5)));

    //float square1 = step(0.2,max(abs(vUv.y - 0.5), abs(vUv.x - 0.5)));
    //float square2 = 1.0 -  step(0.25,max(abs(vUv.y - 0.5), abs(vUv.x - 0.5)));
    //pattern 20
    //float strength = square1 * square2;
    
    //pattern 21
    //float strength = floor(vUv.x * 10.0)/10.0;

    //pattern 22
    //float valueX = floor(vUv.x * 10.0)/10.0;
    ////float valueY = floor(vUv.y * 10.0)/10.0;

    //float strength = valueX*valueY;
    
    //pattern 23
    //float strength = random(vUv);

    //pattern 24
    //float randomX = floor(vUv.x * 10.0)/10.0;
    //float randomY = floor(vUv.y * 10.0)/10.0;
    //float strength = random(vec2(randomX,randomY)) * random(vec2(randomX,randomY));

    //pattern 25
    //float randomX = floor(vUv.x * 10.0)/10.0;
    //float randomY = floor((vUv.y + vUv.x) * 10.0)/10.0;
    //float strength = random(vec2(randomX,randomY)) * random(vec2(randomX,randomY));

    //pattern 26
    //float strength = length(vec2(0.5 - vUv.x,0.5 - vUv.y));
   
    //pattern 27
    //float strength = length(vUv - 0.5);
    //float strength = distance(vUv,vec2(0.5));

    //pattern 28
    //float strength = 1.0 - length(vUv - 0.5);

    //pattern 29 check this for the primalport project
    //float strength = 0.02/ distance(vUv,vec2(0.5)) - 0.2;

     //pattern 30
    //vec2 lightUv = vec2(
    //    vUv.x * 0.2 + 0.4,
    //    vUv.y
    //);
    //float strength = 0.015 / distance(lightUv,vec2(0.5));

    //pattern 31
    //vec2 lightUvX = vec2(
    //    vUv.x * 0.2 + 0.4,
    //    vUv.y
    //);

    //vec2 lightUvY = vec2(
    //    vUv.x,
    //    vUv.y * 0.2 + 0.4
    //);
    //float strength = (0.015 / distance(lightUvX,vec2(0.5))) * (0.015 / distance(lightUvY,vec2(0.5)));


    //pattern 32
    //vec2 lightUvX = vec2(
    //    rotate(vUv, PI /4.0,vec2(0.5)).x * 0.2 + 0.4,
    //    rotate(vUv, PI /4.0,vec2(0.5)).y
    //);

    //vec2 lightUvY = vec2(
    //    rotate(vUv, PI /4.0,vec2(0.5)).x,
    //    rotate(vUv, PI /4.0,vec2(0.5)).y * 0.2 + 0.4
    //);
    //float strength = (0.015 / distance(lightUvX,vec2(0.5))) * (0.015 / distance(lightUvY,vec2(0.5)));

    //pattern 33
    //float strength = 1.0 - step(distance(vUv,vec2(0.5)),0.25);
 
    //pattern 34
    //float strength = abs(distance(vUv,vec2(0.5))-0.25);
        
    //pattern 35
    //float strength = 1.0 - step(abs(distance(vUv,vec2(0.5))-0.30),0.015);
         
    //pattern 36
    //float strength = 1.0 - (1.0 - step(abs(distance(vUv,vec2(0.5))-0.30),0.015));
        
    //pattern 37 this is my shader
    //float strength = 1.0 - (1.0 - step(abs(distance(vUv,vec2(0.5,0.1*sin(vUv.x*20.0)+0.5))-0.30),0.015));
       
    //pattern 38
    //vec2 waveUv = vec2(
    //            vUv.x + sin(vUv.y*20.0) * 0.15,
    //            vUv.y + sin(vUv.x*20.0) * 0.15
    //        );
    //float strength = 1.0 - step(0.01, abs(distance(waveUv, vec2(0.5))-0.25));    
     
    //pattern 39
    //vec2 waveUv = vec2(
    //            vUv.x + sin(vUv.y*120.0) * 0.05,
    //            vUv.y + sin(vUv.x*120.0) * 0.05
    //        );
    //float strength = 1.0 - step(0.01, abs(distance(waveUv, vec2(0.5))-0.25));    

    // pattern 40 
    //float angle = atan(vUv.x,vUv.y);
    //float strength = angle;

    // pattern 41 
    //float angle = atan(vUv.x-0.5,vUv.y-0.5);
    //float strength = angle;

    // pattern 42 
    //float angle = atan(vUv.x-0.5,vUv.y-0.5);
    //angle /= PI * 2.0;
    //angle += 0.5;
    //float strength = angle;

    // pattern 43
    //float angle = atan(vUv.x-0.5,vUv.y-0.5);
    //angle /= PI * 2.0;
    //angle += 0.5;
    //float strength = mod(angle*100.0,1.0);

    // pattern 44
    //float angle = atan(vUv.x-0.5,vUv.y-0.5);
    //angle /= PI * 2.0;
    //angle += 0.5;
    //float strength = sin(angle*50.0);


    // pattern 45 this is from bruno
    //float angle = atan(vUv.x - 0.5, vUv.y - 0.5 );
    //angle /= PI * 2.0;
    //angle += 0.5;
    //float sinusoid = sin(angle *100.0);
    //float radius = 0.25 + sinusoid * 0.02;
    //float strength = (1.0 - step(0.011,abs(distance(vUv, vec2(0.5)) - radius)));
    
    // pattern 46
    // float strength = cnoise(vUv * 10.0);
    
    // pattern 47
    //float strength = step(0.0,cnoise(vUv * 10.0));
   
    // pattern 48
    //float strength = 1.0 - abs(cnoise(vUv * 10.0));
  
    // pattern 49
    //float strength = sin(cnoise(vUv * 20.0)*20.0);

    // pattern 50
    float strength = sin(cnoise(vUv * 20.0)*20.0);

    gl_FragColor = vec4(strength,strength,strength, 1.0);
}
