varying float tDist;
varying float lDist;



void main()
{
	float str = 1.0 - abs(tDist - 0.5) * 2.0 / lDist;
	gl_FragColor = vec4(str);
}
