varying vec2 vUv;
void main()
{
    //gl_FragColor = vec4(vUv, 1.0, 1.0);
    //gl_FragColor = vec4(vUv, 0.0, 1.0);
    //gl_FragColor = vec4(vUv, 0.7, 1.0);
    //gl_FragColor = vec4(vUv.x,vUv.x, vUv.x, 1.0);
    //float r = abs(sin(vUv.y*6.28))*abs(cos(vUv.x*6.28));
    //float g = abs(sin(vUv.x*6.28))*abs(cos(vUv.y*6.28));
    //float b = abs(sin(vUv.y*6.28))*abs(cos(vUv.x*6.28));
    //gl_FragColor = vec4(r,g,b, 1.0);
    gl_FragColor = vec4(vUv,0.7, 1.0);
}
