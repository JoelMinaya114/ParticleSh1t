// Some version core

// This shader calculates and outputs the depth of each fragment as an alpha value, 
// which could be used for rendering effects like fog or transparency based on distance.

// Hold data for the vertex normal and texture corrdinates
in vec3 fragmentVertexNormal;
in vec2 fragmentTexCoord;

out vec4 color;

// Define near and far planes of the camera's view frustum( visible area) - map depth values
float near = 0.1;
float far = 100.0;

float LinearizeDepth(float depth);

// Main fragment shader function to calculate and output the depth of each fragment.
// It uses LinearizeDepth() to convert non-linear depth to linear depth for accurate depth-based effects.
// The depth is stored in the alpha channel of the output color to allow for depth-based transparency or fog effects.

void main()
{
    float depth = LinearizeDepth(g1_FragCoord.z) / far;
    color = vec4(1.0, 1.0, 1.0, depth);
}

float LinearizeDepth(float depth)
{
    float z = depth * 2.0 - 1.0; // back to NDC
    return (2.0 * near * far) / (far + near - z * (far - near));
}