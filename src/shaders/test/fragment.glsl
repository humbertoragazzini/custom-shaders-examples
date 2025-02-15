varying vec2 vUv;
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
    float strength = mod(vUv.y * 10.0, 1.0);
    
    gl_FragColor = vec4(strength,strength,strength, 1.0);
}
