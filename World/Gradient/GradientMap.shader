shader_type canvas_item;
render_mode unshaded;

uniform sampler2D gradient: hint_black;

void fragment(){
	vec4 input_color = texture(SCREEN_TEXTURE, SCREEN_UV);
	float grayscale_value = dot(input_color.rgb, vec3(0.299,0.587,0.114));
	vec3 sampled_color = texture(gradient, vec2(grayscale_value, 0.0)).rgb;
	
	COLOR.rgb = sampled_color;
	COLOR.a = input_color.a;
}