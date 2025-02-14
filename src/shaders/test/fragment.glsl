varying vec2 vUv;
void main()
{
    //gl_FragColor = vec4(vUv, 1.0, 1.0);
    //gl_FragColor = vec4(vUv, 0.0, 1.0);
    //gl_FragColor = vec4(vUv, 0.7, 1.0);
    //gl_FragColor = vec4(vUv.x,vUv.x, vUv.x, 1.0);
    gl_FragColor = vec4(vUv.x,vUv.y, vUv.x, 1.0);
}
