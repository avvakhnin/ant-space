varying highp vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec4 var_light;

uniform lowp vec4 tint;
uniform lowp vec4 color;

void main()
{
	// Pre-multiply alpha since all runtime textures already are
	vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
	vec4 color = color  * tint_pm;

	// Diffuse light calculations
	vec3 ambient_light = vec3(0.2);
	vec3 diff_light = vec3(normalize(var_light.xyz - var_position.xyz));
	diff_light = max(dot(var_normal,diff_light), 0.0) + ambient_light;
	diff_light = clamp(diff_light, 0.0, 1.0);

	gl_FragColor = vec4(color.rgb*diff_light,1.0);
}