varying highp vec3 var_position;

void main()
{
	gl_FragColor = vec4(0.0,(var_position.xy/100.0 + 1.0) * 0.3, 1.0);
}

