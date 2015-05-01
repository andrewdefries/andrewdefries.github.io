---
output:
  html_document:
    keep_md: yes
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
```

#Pesticide Report: cypermethrinSplit_1

##This is a 2-dimensional projection of the molecule

![cypermethrinSplit_1](/home/cheminfused/Desktop/andrewdefries.github.io/MarkdownGallery/cypermethrinSplit_1.png)

The following is a cladogram to find nearest neighbors by the PubChem IDs indicated

![cypermethrinSplit_1](/home/cheminfused/Desktop/andrewdefries.github.io/MarkdownGallery/hclust.png)


```r
library(rgl)
open3d()
```

```
## glX 
##   1
```

```r
#load data file
data<-read.table("cypermethrinSplit_1.xyz")
```

```
## Warning in file(file, "rt"): cannot open file 'cypermethrinSplit_1.xyz':
## No such file or directory
```

```
## Error in file(file, "rt"): cannot open the connection
```

```r
x<-data$V2
y<-data$V3
z<-data$V4

#color atoms by legend
atomcolor<-data$V1

#https://en.wikipedia.org/wiki/CPK_coloring
atomcolor<-gsub("H", "white", atomcolor)
atomcolor<-gsub("Cl", "green", atomcolor)
atomcolor<-gsub("C", "black", atomcolor)
atomcolor<-gsub("N", "blue", atomcolor)
atomcolor<-gsub("F", "green", atomcolor)
atomcolor<-gsub("O", "red", atomcolor)
atomcolor<-gsub("Br", "brown", atomcolor)
atomcolor<-gsub("P", "orange", atomcolor)
atomcolor<-gsub("Na", "violet", atomcolor)
atomcolor<-gsub("S", "yellow", atomcolor)

#atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))

spheres3d(x, y, z, col=atomcolor)
```

<script src="CanvasMatrix.js" type="text/javascript"></script>
<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript">
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new Object();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
8.83577, 5.27241, 3.80986, 0, 1, 0, 1, 1,
10.16742, 2.79616, 4.70714, 0, 1, 0, 1, 1,
3.68306, 1.08687, 5.41607, 1, 0, 0, 1, 1,
5.66635, 1.41215, 6.5038, 1, 0, 0, 1, 1,
0.70777, 2.77235, 9.18068, 1, 0, 0, 1, 1,
1.65954, -1.48474, 4.8428, 0, 0, 1, 1, 1,
5.43109, 4.32496, 5.41189, 0, 0, 0, 1, 1,
6.17669, 3.60066, 4.29822, 0, 0, 0, 1, 1,
4.89971, 3.00404, 4.8711, 0, 0, 0, 1, 1,
5.97495, 4.37831, 6.82183, 0, 0, 0, 1, 1,
4.69041, 5.5858, 5.03008, 0, 0, 0, 1, 1,
7.51366, 3.03498, 4.53383, 0, 0, 0, 1, 1,
4.81942, 1.76487, 5.69009, 0, 0, 0, 1, 1,
8.69918, 3.64472, 4.3686, 0, 0, 0, 1, 1,
3.44078, -0.13263, 6.15927, 0, 0, 0, 1, 1,
2.84836, 0.2173, 7.55905, 0, 0, 0, 1, 1,
2.44961, -0.88501, 5.42672, 0, 0, 0, 1, 1,
2.04173, 1.36148, 7.80027, 0, 0, 0, 1, 1,
3.02876, -0.67183, 8.63272, 0, 0, 0, 1, 1,
1.43173, 1.60074, 9.05486, 0, 0, 0, 1, 1,
2.4569, -0.41614, 9.88948, 0, 0, 0, 1, 1,
1.67304, 0.72123, 10.10643, 0, 0, 0, 1, 1,
-0.3774, 2.87428, 10.03315, 0, 0, 0, 1, 1,
-1.32423, 1.86854, 10.24438, 0, 0, 0, 1, 1,
-0.59157, 4.134, 10.61103, 0, 0, 0, 1, 1,
-2.44595, 2.11114, 11.05314, 0, 0, 0, 1, 1,
-1.71261, 4.37654, 11.41551, 0, 0, 0, 1, 1,
-2.63969, 3.36227, 11.63943, 0, 0, 0, 1, 1,
6.07764, 4.01243, 3.29363, 1, 1, 1, 1, 1,
4.04932, 3.08551, 4.19096, 1, 1, 1, 1, 1,
6.50037, 5.32396, 6.99111, 1, 1, 1, 1, 1,
4.25397, 5.52276, 4.02753, 1, 1, 1, 1, 1,
3.87884, 5.7812, 5.73871, 1, 1, 1, 1, 1,
5.37391, 6.44155, 5.04373, 1, 1, 1, 1, 1,
5.14863, 4.31736, 7.53885, 1, 1, 1, 1, 1,
6.68004, 3.57622, 7.05266, 1, 1, 1, 1, 1,
7.54348, 1.99832, 4.8619, 1, 1, 1, 1, 1,
4.37389, -0.69735, 6.26997, 1, 1, 1, 1, 1,
1.8697, 2.0872, 7.00734, 1, 1, 1, 1, 1,
3.6168, -1.57964, 8.50851, 1, 1, 1, 1, 1,
2.62519, -1.11074, 10.71069, 1, 1, 1, 1, 1,
1.26986, 0.90788, 11.09881, 1, 1, 1, 1, 1,
-1.22091, 0.89627, 9.77307, 1, 1, 1, 1, 1,
0.11062, 4.94266, 10.42622, 1, 1, 1, 1, 1,
-3.18218, 1.32652, 11.21394, 1, 1, 1, 1, 1,
-1.86875, 5.35881, 11.85645, 1, 1, 1, 1, 1,
-3.51651, 3.54976, 12.25645, 1, 1, 1, 1, 1
]);
var values7 = v;
var normLoc7 = gl.getAttribLocation(prog7, "aNorm");
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
var normMatLoc7 = gl.getUniformLocation(prog7,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = 0, yOffs = 0, drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 11.88042;
var distance = 41.72948;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -3.325455, -2.430955, -7.77504 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -41.72948);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[1] );
// ****** spheres object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc7, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc7 );
gl.vertexAttribPointer(normLoc7,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc7, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 47; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values7[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values7[baseofs], 
values7[baseofs+1], 
values7[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values7[ofs], 
values7[ofs+1], 
values7[ofs+2],
values7[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var listeners = {
1: [ 1 ]
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
var l = listeners[activeModel[activeSubscene]];
saveMat = new Object();
for (var i = 0; i < l.length; i++) 
saveMat[l[i]] = new CanvasMatrix4(userMatrix[l[i]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
var l = listeners[activeModel[activeSubscene]];
for (i = 0; i < l.length; i++) {
userMatrix[l[i]].load(saveMat[l[i]]);
userMatrix[l[i]].rotate(angle, axis[0], axis[1], axis[2]);
}
drawScene();
}
var y0zoom = 0;
var zoom0 = 0;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = new Object();
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
zoom0[l[i]] = log(zoom[l[i]]);
}
var zoommove = function(x, y) {
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
zoom[l[i]] = exp(zoom0[l[i]] + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
fov0 = fov[l[i]];
}
var fovmove = function(x, y) {
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
fov[l[i]] = max(1, min(179, fov0[l[i]] + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
currentElement = currentElement.offsetParent;
}
while(currentElement)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
zoom[l[i]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

This one also works.



```r
library(rgl)

#prepare the chemical space
#source("ChemicalSpace.R")

#load the 3D coordinates of the MDS space
load("cypermethrin_coord.rda")
```

```
## Warning in readChar(con, 5L, useBytes = TRUE): cannot open compressed file
## 'cypermethrin_coord.rda', probable reason 'No such file or directory'
```

```
## Error in readChar(con, 5L, useBytes = TRUE): cannot open the connection
```

```r
rgl.open(); offset <- 50; par3d(windowRect=c(offset, offset, 640+offset, 640+offset))
rm(offset); rgl.clear(); rgl.viewpoint(theta=45, phi=30, fov=60, zoom=1)
spheres3d(coord[,1], coord[,2], coord[,3], radius=0.005, color="black", alpha=1, shininess=20); aspect3d(1, 1, 1)
axes3d(col="black"); title3d("", "", "", "", "", col="black"); bg3d("white")

#need to add text labels

#source("Cladogram.R")
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 15 ****** -->
<script id="testgl2vshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 20.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testgl2vshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl2fshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 18 ****** -->
<script id="testgl2vshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl2fshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 19 ****** -->
<script id="testgl2vshader19" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl2fshader19" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 20 ****** -->
<script id="testgl2vshader20" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl2fshader20" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 21 ****** -->
<script id="testgl2vshader21" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl2fshader21" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 23 ****** -->
<script id="testgl2vshader23" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testgl2fshader23" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 24 ****** -->
<script id="testgl2vshader24" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl2fshader24" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 26 ****** -->
<script id="testgl2vshader26" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl2fshader26" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 27 ****** -->
<script id="testgl2vshader27" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testgl2fshader27" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 28 ****** -->
<script id="testgl2vshader28" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl2fshader28" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 29 ****** -->
<script id="testgl2vshader29" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testgl2fshader29" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript">
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new Object();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 8;
zoom[8] = 1;
fov[8] = 60;
userMatrix[8] = new CanvasMatrix4();
userMatrix[8].load([
0.7071068, -0.3535534, 0.6123724, 0,
0, 0.8660254, 0.5, 0,
-0.7071068, -0.3535534, 0.6123724, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testgl2vshader15" ));
gl.attachShader(prog15, getShader( gl, "testgl2fshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var v=new Float32Array([
-0.555308, -0.07330664, 0.03264253, 0.005,
-0.555308, -0.07330664, 0.03264253, 0.005,
-0.555308, -0.07330664, 0.03264253, 0.005,
-0.5262242, -0.05968625, 0.02335056, 0.005,
-0.555308, -0.07330664, 0.03264253, 0.005,
-0.555308, -0.07330664, 0.03264253, 0.005,
-0.555308, -0.07330664, 0.03264253, 0.005,
-0.555308, -0.07330664, 0.03264253, 0.005,
0.2186579, -0.03109017, 0.1123729, 0.005,
0.2186579, -0.03109017, 0.1123729, 0.005,
0.2186579, -0.03109017, 0.1123729, 0.005,
0.04402262, 0.2448753, -0.2645065, 0.005,
0.05307777, 0.2502423, -0.2855891, 0.005,
0.1452575, -0.0896545, 0.1564226, 0.005,
0.1452575, -0.0896545, 0.1564226, 0.005,
0.2161769, -0.4647377, -0.2606334, 0.005,
0.2222582, -0.4852011, -0.249078, 0.005,
-0.1970799, 0.02173918, 0.009087994, 0.005,
0.1154988, -0.04097573, 0.1290421, 0.005,
0.180702, 0.03151379, 0.1770924, 0.005,
0.09663302, 0.2585279, -0.2144108, 0.005,
0.107769, 0.254357, -0.2121437, 0.005,
0.2269412, -0.4818051, -0.256795, 0.005,
0.02466204, 0.1449793, -0.2512235, 0.005,
0.1413791, 0.1104056, 0.08063722, 0.005,
0.1620984, 0.03440731, 0.045373, 0.005,
0.09817909, 0.1776701, -0.186195, 0.005,
0.1705859, 0.03861344, 0.1744282, 0.005,
0.215142, 0.03000751, 0.2216653, 0.005,
0.179477, 0.0559084, 0.3194889, 0.005,
0.1000817, 0.2193534, -0.2565003, 0.005,
0.1058397, -0.04383015, 0.1478094, 0.005,
0.1593608, 0.0241249, 0.2900822, 0.005,
0.09950665, 0.1953572, 0.008438553, 0.005,
-0.4360199, -0.04653849, 0.0009140288, 0.005,
0.1184653, -0.06203055, 0.1174636, 0.005,
0.08204045, -0.05068108, 0.09027346, 0.005,
0.1406396, 0.07756942, 0.1782628, 0.005,
0.1612462, -0.0128507, 0.240416, 0.005,
0.07441403, 0.2415291, -0.226539, 0.005,
0.1423575, -0.01375649, 0.2265176, 0.005,
-0.4456726, -0.001304573, -0.01191926, 0.005,
0.1887393, 0.03452845, 0.3098295, 0.005,
0.06916491, 0.1758049, 0.06875154, 0.005,
0.03620352, 0.1950191, -0.2535253, 0.005,
0.1048211, 0.2252992, -0.2481818, 0.005,
0.2215042, -0.5249488, -0.2761346, 0.005,
0.03562543, 0.2348728, -0.2834473, 0.005,
-0.3427945, 0.03200547, -0.02020698, 0.005,
0.2233785, -0.4013416, -0.1914707, 0.005,
0.1304344, 0.1489681, 0.06829953, 0.005,
0.157055, -0.06164595, -0.07096512, 0.005,
-0.05397905, 0.06990948, 0.05673898, 0.005,
0.01822749, 0.04478034, -0.1158222, 0.005,
0.1523536, -0.06991076, 0.08843495, 0.005,
0.1092516, -0.08527697, 0.1183885, 0.005,
0.05712347, 0.1198789, 0.06603935, 0.005
]);
var values15 = v;
var normLoc15 = gl.getAttribLocation(prog15, "aNorm");
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var normMatLoc15 = gl.getUniformLocation(prog15,"normMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testgl2vshader17" ));
gl.attachShader(prog17, getShader( gl, "testgl2fshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
""
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgl2textureCanvas"));
var v=new Float32Array([
-0.1641834, 0.398528, 0.4276108, 0, -0.5, 0.5, 0.5,
-0.1641834, 0.398528, 0.4276108, 1, -0.5, 0.5, 0.5,
-0.1641834, 0.398528, 0.4276108, 1, 1.5, 0.5, 0.5,
-0.1641834, 0.398528, 0.4276108, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** text object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testgl2vshader18" ));
gl.attachShader(prog18, getShader( gl, "testgl2fshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var texts = [
""
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX18 = texinfo.canvasX;
var canvasY18 = texinfo.canvasY;
var ofsLoc18 = gl.getAttribLocation(prog18, "aOfs");
var texture18 = gl.createTexture();
var texLoc18 = gl.getAttribLocation(prog18, "aTexcoord");
var sampler18 = gl.getUniformLocation(prog18,"uSampler");
handleLoadedTexture(texture18, document.getElementById("testgl2textureCanvas"));
var v=new Float32Array([
-0.1641834, -0.7263033, -0.441095, 0, -0.5, 0.5, 0.5,
-0.1641834, -0.7263033, -0.441095, 1, -0.5, 0.5, 0.5,
-0.1641834, -0.7263033, -0.441095, 1, 1.5, 0.5, 0.5,
-0.1641834, -0.7263033, -0.441095, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf18 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf18);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
var textScaleLoc18 = gl.getUniformLocation(prog18,"textScale");
// ****** text object 19 ******
var prog19  = gl.createProgram();
gl.attachShader(prog19, getShader( gl, "testgl2vshader19" ));
gl.attachShader(prog19, getShader( gl, "testgl2fshader19" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog19, 0, "aPos");
gl.bindAttribLocation(prog19, 1, "aCol");
gl.linkProgram(prog19);
var texts = [
""
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX19 = texinfo.canvasX;
var canvasY19 = texinfo.canvasY;
var ofsLoc19 = gl.getAttribLocation(prog19, "aOfs");
var texture19 = gl.createTexture();
var texLoc19 = gl.getAttribLocation(prog19, "aTexcoord");
var sampler19 = gl.getUniformLocation(prog19,"uSampler");
handleLoadedTexture(texture19, document.getElementById("testgl2textureCanvas"));
var v=new Float32Array([
-0.1641834, -0.6649489, -0.3937111, 0, -0.5, 0.5, 0.5,
-0.1641834, -0.6649489, -0.3937111, 1, -0.5, 0.5, 0.5,
-0.1641834, -0.6649489, -0.3937111, 1, 1.5, 0.5, 0.5,
-0.1641834, -0.6649489, -0.3937111, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf19 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf19);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf19 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf19);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc19 = gl.getUniformLocation(prog19,"mvMatrix");
var prMatLoc19 = gl.getUniformLocation(prog19,"prMatrix");
var textScaleLoc19 = gl.getUniformLocation(prog19,"textScale");
// ****** text object 20 ******
var prog20  = gl.createProgram();
gl.attachShader(prog20, getShader( gl, "testgl2vshader20" ));
gl.attachShader(prog20, getShader( gl, "testgl2fshader20" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog20, 0, "aPos");
gl.bindAttribLocation(prog20, 1, "aCol");
gl.linkProgram(prog20);
var texts = [
""
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX20 = texinfo.canvasX;
var canvasY20 = texinfo.canvasY;
var ofsLoc20 = gl.getAttribLocation(prog20, "aOfs");
var texture20 = gl.createTexture();
var texLoc20 = gl.getAttribLocation(prog20, "aTexcoord");
var sampler20 = gl.getUniformLocation(prog20,"uSampler");
handleLoadedTexture(texture20, document.getElementById("testgl2textureCanvas"));
var v=new Float32Array([
-0.6950888, -0.1332105, -0.3937111, 0, -0.5, 0.5, 0.5,
-0.6950888, -0.1332105, -0.3937111, 1, -0.5, 0.5, 0.5,
-0.6950888, -0.1332105, -0.3937111, 1, 1.5, 0.5, 0.5,
-0.6950888, -0.1332105, -0.3937111, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf20 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf20);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf20 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf20);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc20 = gl.getUniformLocation(prog20,"mvMatrix");
var prMatLoc20 = gl.getUniformLocation(prog20,"prMatrix");
var textScaleLoc20 = gl.getUniformLocation(prog20,"textScale");
// ****** text object 21 ******
var prog21  = gl.createProgram();
gl.attachShader(prog21, getShader( gl, "testgl2vshader21" ));
gl.attachShader(prog21, getShader( gl, "testgl2fshader21" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog21, 0, "aPos");
gl.bindAttribLocation(prog21, 1, "aCol");
gl.linkProgram(prog21);
var texts = [
""
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX21 = texinfo.canvasX;
var canvasY21 = texinfo.canvasY;
var ofsLoc21 = gl.getAttribLocation(prog21, "aOfs");
var texture21 = gl.createTexture();
var texLoc21 = gl.getAttribLocation(prog21, "aTexcoord");
var sampler21 = gl.getUniformLocation(prog21,"uSampler");
handleLoadedTexture(texture21, document.getElementById("testgl2textureCanvas"));
var v=new Float32Array([
-0.6950888, -0.6649489, 0.01694989, 0, -0.5, 0.5, 0.5,
-0.6950888, -0.6649489, 0.01694989, 1, -0.5, 0.5, 0.5,
-0.6950888, -0.6649489, 0.01694989, 1, 1.5, 0.5, 0.5,
-0.6950888, -0.6649489, 0.01694989, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf21 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf21);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf21 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf21);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc21 = gl.getUniformLocation(prog21,"mvMatrix");
var prMatLoc21 = gl.getUniformLocation(prog21,"prMatrix");
var textScaleLoc21 = gl.getUniformLocation(prog21,"textScale");
// ****** lines object 23 ******
var prog23  = gl.createProgram();
gl.attachShader(prog23, getShader( gl, "testgl2vshader23" ));
gl.attachShader(prog23, getShader( gl, "testgl2fshader23" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog23, 0, "aPos");
gl.bindAttribLocation(prog23, 1, "aCol");
gl.linkProgram(prog23);
var v=new Float32Array([
-0.4, -0.54224, -0.2989432,
0.2, -0.54224, -0.2989432,
-0.4, -0.54224, -0.2989432,
-0.4, -0.5626915, -0.3147378,
-0.2, -0.54224, -0.2989432,
-0.2, -0.5626915, -0.3147378,
0, -0.54224, -0.2989432,
0, -0.5626915, -0.3147378,
0.2, -0.54224, -0.2989432,
0.2, -0.5626915, -0.3147378
]);
var buf23 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf23);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc23 = gl.getUniformLocation(prog23,"mvMatrix");
var prMatLoc23 = gl.getUniformLocation(prog23,"prMatrix");
// ****** text object 24 ******
var prog24  = gl.createProgram();
gl.attachShader(prog24, getShader( gl, "testgl2vshader24" ));
gl.attachShader(prog24, getShader( gl, "testgl2fshader24" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog24, 0, "aPos");
gl.bindAttribLocation(prog24, 1, "aCol");
gl.linkProgram(prog24);
var texts = [
"-0.4",
"-0.2",
"0",
"0.2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX24 = texinfo.canvasX;
var canvasY24 = texinfo.canvasY;
var ofsLoc24 = gl.getAttribLocation(prog24, "aOfs");
var texture24 = gl.createTexture();
var texLoc24 = gl.getAttribLocation(prog24, "aTexcoord");
var sampler24 = gl.getUniformLocation(prog24,"uSampler");
handleLoadedTexture(texture24, document.getElementById("testgl2textureCanvas"));
var v=new Float32Array([
-0.4, -0.6035945, -0.3463271, 0, -0.5, 0.5, 0.5,
-0.4, -0.6035945, -0.3463271, 1, -0.5, 0.5, 0.5,
-0.4, -0.6035945, -0.3463271, 1, 1.5, 0.5, 0.5,
-0.4, -0.6035945, -0.3463271, 0, 1.5, 0.5, 0.5,
-0.2, -0.6035945, -0.3463271, 0, -0.5, 0.5, 0.5,
-0.2, -0.6035945, -0.3463271, 1, -0.5, 0.5, 0.5,
-0.2, -0.6035945, -0.3463271, 1, 1.5, 0.5, 0.5,
-0.2, -0.6035945, -0.3463271, 0, 1.5, 0.5, 0.5,
0, -0.6035945, -0.3463271, 0, -0.5, 0.5, 0.5,
0, -0.6035945, -0.3463271, 1, -0.5, 0.5, 0.5,
0, -0.6035945, -0.3463271, 1, 1.5, 0.5, 0.5,
0, -0.6035945, -0.3463271, 0, 1.5, 0.5, 0.5,
0.2, -0.6035945, -0.3463271, 0, -0.5, 0.5, 0.5,
0.2, -0.6035945, -0.3463271, 1, -0.5, 0.5, 0.5,
0.2, -0.6035945, -0.3463271, 1, 1.5, 0.5, 0.5,
0.2, -0.6035945, -0.3463271, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15
]);
var buf24 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf24);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf24 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf24);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc24 = gl.getUniformLocation(prog24,"mvMatrix");
var prMatLoc24 = gl.getUniformLocation(prog24,"prMatrix");
var textScaleLoc24 = gl.getUniformLocation(prog24,"textScale");
// ****** lines object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-0.5725722, -0.4, -0.2989432,
-0.5725722, 0.2, -0.2989432,
-0.5725722, -0.4, -0.2989432,
-0.5929916, -0.4, -0.3147378,
-0.5725722, -0.2, -0.2989432,
-0.5929916, -0.2, -0.3147378,
-0.5725722, 0, -0.2989432,
-0.5929916, 0, -0.3147378,
-0.5725722, 0.2, -0.2989432,
-0.5929916, 0.2, -0.3147378
]);
var buf25 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf25);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
// ****** text object 26 ******
var prog26  = gl.createProgram();
gl.attachShader(prog26, getShader( gl, "testgl2vshader26" ));
gl.attachShader(prog26, getShader( gl, "testgl2fshader26" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog26, 0, "aPos");
gl.bindAttribLocation(prog26, 1, "aCol");
gl.linkProgram(prog26);
var texts = [
"-0.4",
"-0.2",
"0",
"0.2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX26 = texinfo.canvasX;
var canvasY26 = texinfo.canvasY;
var ofsLoc26 = gl.getAttribLocation(prog26, "aOfs");
var texture26 = gl.createTexture();
var texLoc26 = gl.getAttribLocation(prog26, "aTexcoord");
var sampler26 = gl.getUniformLocation(prog26,"uSampler");
handleLoadedTexture(texture26, document.getElementById("testgl2textureCanvas"));
var v=new Float32Array([
-0.6338305, -0.4, -0.3463271, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.4, -0.3463271, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.4, -0.3463271, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.4, -0.3463271, 0, 1.5, 0.5, 0.5,
-0.6338305, -0.2, -0.3463271, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.2, -0.3463271, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.2, -0.3463271, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.2, -0.3463271, 0, 1.5, 0.5, 0.5,
-0.6338305, 0, -0.3463271, 0, -0.5, 0.5, 0.5,
-0.6338305, 0, -0.3463271, 1, -0.5, 0.5, 0.5,
-0.6338305, 0, -0.3463271, 1, 1.5, 0.5, 0.5,
-0.6338305, 0, -0.3463271, 0, 1.5, 0.5, 0.5,
-0.6338305, 0.2, -0.3463271, 0, -0.5, 0.5, 0.5,
-0.6338305, 0.2, -0.3463271, 1, -0.5, 0.5, 0.5,
-0.6338305, 0.2, -0.3463271, 1, 1.5, 0.5, 0.5,
-0.6338305, 0.2, -0.3463271, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15
]);
var buf26 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf26);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf26 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf26);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc26 = gl.getUniformLocation(prog26,"mvMatrix");
var prMatLoc26 = gl.getUniformLocation(prog26,"prMatrix");
var textScaleLoc26 = gl.getUniformLocation(prog26,"textScale");
// ****** lines object 27 ******
var prog27  = gl.createProgram();
gl.attachShader(prog27, getShader( gl, "testgl2vshader27" ));
gl.attachShader(prog27, getShader( gl, "testgl2fshader27" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog27, 0, "aPos");
gl.bindAttribLocation(prog27, 1, "aCol");
gl.linkProgram(prog27);
var v=new Float32Array([
-0.5725722, -0.54224, -0.2,
-0.5725722, -0.54224, 0.3,
-0.5725722, -0.54224, -0.2,
-0.5929916, -0.5626915, -0.2,
-0.5725722, -0.54224, -0.1,
-0.5929916, -0.5626915, -0.1,
-0.5725722, -0.54224, 0,
-0.5929916, -0.5626915, 0,
-0.5725722, -0.54224, 0.1,
-0.5929916, -0.5626915, 0.1,
-0.5725722, -0.54224, 0.2,
-0.5929916, -0.5626915, 0.2,
-0.5725722, -0.54224, 0.3,
-0.5929916, -0.5626915, 0.3
]);
var buf27 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf27);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc27 = gl.getUniformLocation(prog27,"mvMatrix");
var prMatLoc27 = gl.getUniformLocation(prog27,"prMatrix");
// ****** text object 28 ******
var prog28  = gl.createProgram();
gl.attachShader(prog28, getShader( gl, "testgl2vshader28" ));
gl.attachShader(prog28, getShader( gl, "testgl2fshader28" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog28, 0, "aPos");
gl.bindAttribLocation(prog28, 1, "aCol");
gl.linkProgram(prog28);
var texts = [
"-0.2",
"-0.1",
"0",
"0.1",
"0.2",
"0.3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX28 = texinfo.canvasX;
var canvasY28 = texinfo.canvasY;
var ofsLoc28 = gl.getAttribLocation(prog28, "aOfs");
var texture28 = gl.createTexture();
var texLoc28 = gl.getAttribLocation(prog28, "aTexcoord");
var sampler28 = gl.getUniformLocation(prog28,"uSampler");
handleLoadedTexture(texture28, document.getElementById("testgl2textureCanvas"));
var v=new Float32Array([
-0.6338305, -0.6035945, -0.2, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.2, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.2, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.2, 0, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.1, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.1, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.1, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.1, 0, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0, 0, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.1, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.1, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.1, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.1, 0, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.2, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.2, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.2, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.2, 0, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.3, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.3, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.3, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.3, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf28 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf28);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf28 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf28);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc28 = gl.getUniformLocation(prog28,"mvMatrix");
var prMatLoc28 = gl.getUniformLocation(prog28,"prMatrix");
var textScaleLoc28 = gl.getUniformLocation(prog28,"textScale");
// ****** lines object 29 ******
var prog29  = gl.createProgram();
gl.attachShader(prog29, getShader( gl, "testgl2vshader29" ));
gl.attachShader(prog29, getShader( gl, "testgl2fshader29" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog29, 0, "aPos");
gl.bindAttribLocation(prog29, 1, "aCol");
gl.linkProgram(prog29);
var v=new Float32Array([
-0.5725722, -0.54224, -0.2989432,
-0.5725722, 0.2758191, -0.2989432,
-0.5725722, -0.54224, 0.3328429,
-0.5725722, 0.2758191, 0.3328429,
-0.5725722, -0.54224, -0.2989432,
-0.5725722, -0.54224, 0.3328429,
-0.5725722, 0.2758191, -0.2989432,
-0.5725722, 0.2758191, 0.3328429,
-0.5725722, -0.54224, -0.2989432,
0.2442054, -0.54224, -0.2989432,
-0.5725722, -0.54224, 0.3328429,
0.2442054, -0.54224, 0.3328429,
-0.5725722, 0.2758191, -0.2989432,
0.2442054, 0.2758191, -0.2989432,
-0.5725722, 0.2758191, 0.3328429,
0.2442054, 0.2758191, 0.3328429,
0.2442054, -0.54224, -0.2989432,
0.2442054, 0.2758191, -0.2989432,
0.2442054, -0.54224, 0.3328429,
0.2442054, 0.2758191, 0.3328429,
0.2442054, -0.54224, -0.2989432,
0.2442054, -0.54224, 0.3328429,
0.2442054, 0.2758191, -0.2989432,
0.2442054, 0.2758191, 0.3328429
]);
var buf29 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf29);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc29 = gl.getUniformLocation(prog29,"mvMatrix");
var prMatLoc29 = gl.getUniformLocation(prog29,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = 0, yOffs = 0, drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 8 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 0.7034574;
var distance = 1.620084;
var t = tan(fov[8]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[8], hlen*aspect*zoom[8], 
-hlen*zoom[8], hlen*zoom[8], near, far);
else  
prMatrix.frustum(-hlen*zoom[8], hlen*zoom[8], 
-hlen*zoom[8]/aspect, hlen*zoom[8]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.1641834, 0.1332105, -0.01694989 );
mvMatrix.scale( 0.9312105, 0.9297517, 1.203876 );   
mvMatrix.multRight( userMatrix[8] );
mvMatrix.translate(-0, -0, -1.620084);
normMatrix.makeIdentity();
normMatrix.scale( 1.073871, 1.075556, 0.8306506 );   
normMatrix.multRight( userMatrix[8] );
// ****** spheres object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc15, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc15 );
gl.vertexAttribPointer(normLoc15,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(0.9312105, 0.9297517, 1.203876);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc15, false, new Float32Array(sphereNorm.getAsArray()) );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1);
for (var i = 0; i < 57; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*4
var ofs = baseofs + 3;	       
var scale = values15[ofs];
sphereMV.scale(1.073871*scale, 1.075556*scale, 0.8306506*scale);
sphereMV.translate(values15[baseofs], 
values15[baseofs+1], 
values15[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(sphereMV.getAsArray()) );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc18, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc18 );
gl.vertexAttribPointer(texLoc18, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture18);
gl.uniform1i( sampler18, 0);
gl.enableVertexAttribArray( ofsLoc18 );
gl.vertexAttribPointer(ofsLoc18, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 19 *******
gl.useProgram(prog19);
gl.bindBuffer(gl.ARRAY_BUFFER, buf19);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf19);
gl.uniformMatrix4fv( prMatLoc19, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc19, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc19, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc19 );
gl.vertexAttribPointer(texLoc19, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture19);
gl.uniform1i( sampler19, 0);
gl.enableVertexAttribArray( ofsLoc19 );
gl.vertexAttribPointer(ofsLoc19, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 20 *******
gl.useProgram(prog20);
gl.bindBuffer(gl.ARRAY_BUFFER, buf20);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf20);
gl.uniformMatrix4fv( prMatLoc20, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc20, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc20, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc20 );
gl.vertexAttribPointer(texLoc20, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture20);
gl.uniform1i( sampler20, 0);
gl.enableVertexAttribArray( ofsLoc20 );
gl.vertexAttribPointer(ofsLoc20, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 21 *******
gl.useProgram(prog21);
gl.bindBuffer(gl.ARRAY_BUFFER, buf21);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf21);
gl.uniformMatrix4fv( prMatLoc21, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc21, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc21, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc21 );
gl.vertexAttribPointer(texLoc21, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture21);
gl.uniform1i( sampler21, 0);
gl.enableVertexAttribArray( ofsLoc21 );
gl.vertexAttribPointer(ofsLoc21, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 23 *******
gl.useProgram(prog23);
gl.bindBuffer(gl.ARRAY_BUFFER, buf23);
gl.uniformMatrix4fv( prMatLoc23, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc23, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 10);
// ****** text object 24 *******
gl.useProgram(prog24);
gl.bindBuffer(gl.ARRAY_BUFFER, buf24);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf24);
gl.uniformMatrix4fv( prMatLoc24, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc24, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc24, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc24 );
gl.vertexAttribPointer(texLoc24, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture24);
gl.uniform1i( sampler24, 0);
gl.enableVertexAttribArray( ofsLoc24 );
gl.vertexAttribPointer(ofsLoc24, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
// ****** lines object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, buf25);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 10);
// ****** text object 26 *******
gl.useProgram(prog26);
gl.bindBuffer(gl.ARRAY_BUFFER, buf26);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf26);
gl.uniformMatrix4fv( prMatLoc26, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc26, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc26, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc26 );
gl.vertexAttribPointer(texLoc26, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture26);
gl.uniform1i( sampler26, 0);
gl.enableVertexAttribArray( ofsLoc26 );
gl.vertexAttribPointer(ofsLoc26, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
// ****** lines object 27 *******
gl.useProgram(prog27);
gl.bindBuffer(gl.ARRAY_BUFFER, buf27);
gl.uniformMatrix4fv( prMatLoc27, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc27, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 28 *******
gl.useProgram(prog28);
gl.bindBuffer(gl.ARRAY_BUFFER, buf28);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf28);
gl.uniformMatrix4fv( prMatLoc28, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc28, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc28, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc28 );
gl.vertexAttribPointer(texLoc28, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture28);
gl.uniform1i( sampler28, 0);
gl.enableVertexAttribArray( ofsLoc28 );
gl.vertexAttribPointer(ofsLoc28, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 29 *******
gl.useProgram(prog29);
gl.bindBuffer(gl.ARRAY_BUFFER, buf29);
gl.uniformMatrix4fv( prMatLoc29, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc29, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
8: 0
};
var vpy0 = {
8: 0
};
var vpWidths = {
8: 504
};
var vpHeights = {
8: 504
};
var activeModel = {
8: 8
};
var activeProjection = {
8: 8
};
var listeners = {
8: [ 8 ]
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(8);
return(8);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
var l = listeners[activeModel[activeSubscene]];
saveMat = new Object();
for (var i = 0; i < l.length; i++) 
saveMat[l[i]] = new CanvasMatrix4(userMatrix[l[i]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
var l = listeners[activeModel[activeSubscene]];
for (i = 0; i < l.length; i++) {
userMatrix[l[i]].load(saveMat[l[i]]);
userMatrix[l[i]].rotate(angle, axis[0], axis[1], axis[2]);
}
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
fov0 = fov[l[i]];
}
var fovmove = function(x, y) {
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
fov[l[i]] = max(1, min(179, fov0[l[i]] + 180*(y-y0fov)/height));
drawScene();
}
var y0zoom = 0;
var zoom0 = 0;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = new Object();
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
zoom0[l[i]] = log(zoom[l[i]]);
}
var zoommove = function(x, y) {
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
zoom[l[i]] = exp(zoom0[l[i]] + (y-y0zoom)/height);
drawScene();
}
var mousedown = [trackballdown, fovdown, zoomdown];
var mousemove = [trackballmove, fovmove, zoommove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
currentElement = currentElement.offsetParent;
}
while(currentElement)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
zoom[l[i]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>

#Grep Reports



```r
#library(ChemmineR)
#sdfset<-read.SDFset("cypermethrin.sdf")
#write.table(sdfid(sdfset), file="cypermethrin.name", row.name=F, quote=F, sep="")

#system('grep -i -A 3 -B 3 "\tcypermethrin*$" /home/cheminfused/Desktop/PLOS_FULLTEXT/txt/*.txt > cypermethrin.grep')
readLines("cypermethrin.grep")
```

```
##    [1] "journal.pbio.0050035.txt-180: 65–77."                                                                                                                                                                                                                                                                                        
##    [2] "journal.pbio.0050035.txt-18. Smith LL, Rose MS, Wyatt I (1978) The pathology and biochemistry of"                                                                                                                                                                                                                            
##    [3] "journal.pbio.0050035.txt-paraquat. Ciba Found Symp 65: 321–341."                                                                                                                                                                                                                                                             
##    [4] "journal.pbio.0050035.txt:19. Giray B (2001) Cypermethrin-induced oxidative stress in rat brain and"                                                                                                                                                                                                                          
##    [5] "journal.pbio.0050035.txt-liver is prevented by vitamin E or allopurinol. Toxicol Lett 118: 139–146."                                                                                                                                                                                                                         
##    [6] "journal.pbio.0050035.txt-20. Gupta A (1999) Effect of pyrethroid-based liquid mosquito repellent"                                                                                                                                                                                                                            
##    [7] "journal.pbio.0050035.txt-inhalation on the blood-brain barrier function and oxidative damage in"                                                                                                                                                                                                                             
##    [8] "--"                                                                                                                                                                                                                                                                                                                          
##    [9] "journal.pbio.1000377.txt-The number of known predators (182 spiders) captured using this"                                                                                                                                                                                                                                    
##   [10] "journal.pbio.1000377.txt-method was insufficient for separate analysis."                                                                                                                                                                                                                                                     
##   [11] "journal.pbio.1000377.txt-We sampled arboreal arthropods (N = 1,503) by spraying tree"                                                                                                                                                                                                                                        
##   [12] "journal.pbio.1000377.txt:stems and canopies with 0.6% alphacypermethrin from a"                                                                                                                                                                                                                                              
##   [13] "journal.pbio.1000377.txt-backpack sprayer [17]. Trees were selected randomly subject to"                                                                                                                                                                                                                                     
##   [14] "journal.pbio.1000377.txt-the criteria that they were approximately 1–2 m tall (mean 6 SD:"                                                                                                                                                                                                                                   
##   [15] "journal.pbio.1000377.txt-1.7360.25 m) and occupied by the most common Acacia-ant"                                                                                                                                                                                                                                            
##   [16] "--"                                                                                                                                                                                                                                                                                                                          
##   [17] "journal.pgen.1000286.txt-al. [14] demonstrated that CYP6Z1 metabolises DDT, to date"                                                                                                                                                                                                                                         
##   [18] "journal.pgen.1000286.txt-only CYP6Z2 interacts with pyrethroids. McLaughlin et al. [15]"                                                                                                                                                                                                                                     
##   [19] "journal.pgen.1000286.txt-found that CYP6Z2 binds to two pyrethroids, permethrin and"                                                                                                                                                                                                                                         
##   [20] "journal.pgen.1000286.txt:cypermethrin. Their data, however, also suggested that the"                                                                                                                                                                                                                                         
##   [21] "journal.pgen.1000286.txt-pyrethroids were not metabolised by this P450 highlighting the"                                                                                                                                                                                                                                     
##   [22] "journal.pgen.1000286.txt-importance of functionally characterising putative candidates"                                                                                                                                                                                                                                      
##   [23] "journal.pgen.1000286.txt-involved in pyrethroid metabolism. These earlier studies have"                                                                                                                                                                                                                                      
##   [24] "--"                                                                                                                                                                                                                                                                                                                          
##   [25] "journal.pgen.1000286.txt-, which were 5 to"                                                                                                                                                                                                                                                                                  
##   [26] "journal.pgen.1000286.txt-10-fold slower than the rates observed for the in vitro P450"                                                                                                                                                                                                                                       
##   [27] "journal.pgen.1000286.txt-metabolism of pyrethroids reported from other species; the"                                                                                                                                                                                                                                         
##   [28] "journal.pgen.1000286.txt:lepidopteran CYP6B8 has a Vmax for a-cypermethrin of"                                                                                                                                                                                                                                               
##   [29] "journal.pgen.1000286.txt-13 min21"                                                                                                                                                                                                                                                                                           
##   [30] "journal.pgen.1000286.txt-[38] whereas rat CYP3A2 has 14-fold higher turnover"                                                                                                                                                                                                                                                
##   [31] "journal.pgen.1000286.txt-than CYP6P3, although the Km for deltamethrin is not"                                                                                                                                                                                                                                               
##   [32] "--"                                                                                                                                                                                                                                                                                                                          
##   [33] "journal.pgen.1000286.txt-enhance the activity of some P450s [8]. Indeed, increased levels of"                                                                                                                                                                                                                                
##   [34] "journal.pgen.1000286.txt-cytochrome b5 are associated with P450 mediated insecticide"                                                                                                                                                                                                                                        
##   [35] "journal.pgen.1000286.txt-resistance in some insects and are directly involved in CYP6D1"                                                                                                                                                                                                                                     
##   [36] "journal.pgen.1000286.txt:mediated cypermethrin metabolism in the house fly [40]."                                                                                                                                                                                                                                            
##   [37] "journal.pgen.1000286.txt-Investigations are underway to examine the influence of"                                                                                                                                                                                                                                            
##   [38] "journal.pgen.1000286.txt-Figure 5. Time course of pyrethroid metabolism. (A) Reactions were performed at 30uC with 10 mM deltamethrin or (B) 10 mM permethrin"                                                                                                                                                               
##   [39] "journal.pgen.1000286.txt-stereoisomer mixture. Concentrations were determined by HPLC peak integration (Mean values6S.E.M., N = 3)."                                                                                                                                                                                         
##   [40] "--"                                                                                                                                                                                                                                                                                                                          
##   [41] "journal.pgen.1000286.txt-esterase that metabolize the pyrethroid insecticides deltamethrin and esfenva-"                                                                                                                                                                                                                     
##   [42] "journal.pgen.1000286.txt-lerate. Drug Metab Dispos 35: 1664–1671."                                                                                                                                                                                                                                                           
##   [43] "journal.pgen.1000286.txt-40. Zhang M, Scott JG (1996) Cytochrome b5 is essential for cytochrome P450 6D1-"                                                                                                                                                                                                                   
##   [44] "journal.pgen.1000286.txt:mediated cypermethrin resistance in LPR house flies. Pestic Biochem Physiol 55:"                                                                                                                                                                                                                    
##   [45] "journal.pgen.1000286.txt-150–156."                                                                                                                                                                                                                                                                                           
##   [46] "journal.pgen.1000286.txt-41. Benjamini Y, Hochberg Y (1995) Controlling the false discovery rate: a practical"                                                                                                                                                                                                               
##   [47] "journal.pgen.1000286.txt-and powerful approach to multiple testing. J Roy Stat Soc B 57: 289–300."                                                                                                                                                                                                                           
##   [48] "--"                                                                                                                                                                                                                                                                                                                          
##   [49] "journal.pgen.1000999.txt-expressed 63-fold in the resistant clone, consistent with the 64-"                                                                                                                                                                                                                                  
##   [50] "journal.pgen.1000999.txt-fold increase in the enzyme previously reported in aphids with FE4"                                                                                                                                                                                                                                 
##   [51] "journal.pgen.1000999.txt-genes at R3 levels [19]. A previous study examining the"                                                                                                                                                                                                                                            
##   [52] "journal.pgen.1000999.txt:susceptibility of the 5191A clone to the pyrethroid a-cypermethrin"                                                                                                                                                                                                                                 
##   [53] "journal.pgen.1000999.txt-reported a resistance factor of 33 to this compound which is similar"                                                                                                                                                                                                                               
##   [54] "journal.pgen.1000999.txt-to the level of resistance displayed by other aphid clones with the"                                                                                                                                                                                                                                
##   [55] "journal.pgen.1000999.txt-R3 level of esterase overproduction [13]. However, the enhanced"                                                                                                                                                                                                                                    
##   [56] "--"                                                                                                                                                                                                                                                                                                                          
##   [57] "journal.pgen.1000999.txt-Cuticular proteins and seasonal photoperiodism in aphids. Insect Biochem Mol"                                                                                                                                                                                                                       
##   [58] "journal.pgen.1000999.txt-Biol doi:10.1016/j.ibmb.2009.12.001."                                                                                                                                                                                                                                                               
##   [59] "journal.pgen.1000999.txt-27. Valles SM, Dong K, Brenner RJ (2000) Mechanisms responsible for"                                                                                                                                                                                                                                
##   [60] "journal.pgen.1000999.txt:cypermethrin resistance in a strain of German cockroach, Blattella germanica."                                                                                                                                                                                                                      
##   [61] "journal.pgen.1000999.txt-Pestic Biochem Physiol 66: 195–205."                                                                                                                                                                                                                                                                
##   [62] "journal.pgen.1000999.txt-28. Ahmad M, Denholm I, Bromilow RH (2006) Delayed cuticular penetration and"                                                                                                                                                                                                                       
##   [63] "journal.pgen.1000999.txt-enhanced metabolism of deltamethrin in pyrethroid-resistant strains of"                                                                                                                                                                                                                             
##   [64] "--"                                                                                                                                                                                                                                                                                                                          
##   [65] "journal.pmed.0030373.txt-trial. Lancet 365: 1474–1480."                                                                                                                                                                                                                                                                      
##   [66] "journal.pmed.0030373.txt-10. Maxwell CA, Chambo W, Mwaimu M, Magogo F, Carneiro IA, et al. (2003)"                                                                                                                                                                                                                           
##   [67] "journal.pmed.0030373.txt-Variation in malaria transmission and morbidity with altitude in Tanzania"                                                                                                                                                                                                                          
##   [68] "journal.pmed.0030373.txt:and with introduction of alphacypermethrin treated nets. Malar J 10: 28."                                                                                                                                                                                                                           
##   [69] "journal.pmed.0030373.txt-11. Alilio MS, Kitua A, Njunwa K, Medina M, Ronn AM, et al. (2004) Malaria"                                                                                                                                                                                                                         
##   [70] "journal.pmed.0030373.txt-control at the district level in Africa: The case of Muheza district in"                                                                                                                                                                                                                            
##   [71] "journal.pmed.0030373.txt-northeast Tanzania. Am J Trop Med Hyg 71: 205–213."                                                                                                                                                                                                                                                 
##   [72] "--"                                                                                                                                                                                                                                                                                                                          
##   [73] "journal.pmed.1000357.txt-c"                                                                                                                                                                                                                                                                                                  
##   [74] "journal.pmed.1000357.txt-Thiodicarb (6), methylcarb (1)."                                                                                                                                                                                                                                                                    
##   [75] "journal.pmed.1000357.txt-d"                                                                                                                                                                                                                                                                                                  
##   [76] "journal.pmed.1000357.txt:Cyfluthrin (5), cypermethrin (7), d-trans allethrin (4), fenvalerate (4), flumethrin (6), unspecified pyrethroid (20)."                                                                                                                                                                             
##   [77] "journal.pmed.1000357.txt-e"                                                                                                                                                                                                                                                                                                  
##   [78] "journal.pmed.1000357.txt-Azadirachtin (5), chromafenozide (1), flufenoxuron (1), tebufenozide (3), thiacloprid (1), novaluron (1)."                                                                                                                                                                                          
##   [79] "journal.pmed.1000357.txt-f"                                                                                                                                                                                                                                                                                                  
##   [80] "--"                                                                                                                                                                                                                                                                                                                          
##   [81] "journal.pntd.0000336.txt-interruption of vectorial and transfusional transmission in the Southern Cone"                                                                                                                                                                                                                      
##   [82] "journal.pntd.0000336.txt-countries. Memorias do Instituto Oswaldo Cruz 98(5): 577–91."                                                                                                                                                                                                                                       
##   [83] "journal.pntd.0000336.txt-4. Zerba EN, Wallace G, Picollo MI, Casabe´ N, de Licastro S, et al. (1997)"                                                                                                                                                                                                                        
##   [84] "journal.pntd.0000336.txt:Evaluation of beta-cypermethrin for the control of Triatoma infestans. Revista"                                                                                                                                                                                                                     
##   [85] "journal.pntd.0000336.txt-Panamericana de Salud Publica 1: 133–137."                                                                                                                                                                                                                                                          
##   [86] "journal.pntd.0000336.txt-5. Wastavino GR, Cabrera-Bravo M, Garcı´a De La Torre G, Vences-Blanco M,"                                                                                                                                                                                                                          
##   [87] "journal.pntd.0000336.txt-Herna´ndez AR, et al. (2004) Insecticide and community interventions to control"                                                                                                                                                                                                                    
##   [88] "--"                                                                                                                                                                                                                                                                                                                          
##   [89] "journal.pntd.0000363.txt-spraying rounds a community was considered under surveillance"                                                                                                                                                                                                                                      
##   [90] "journal.pntd.0000363.txt-phase. Suspension concentrate (SC) deltamethrin applied at"                                                                                                                                                                                                                                         
##   [91] "journal.pntd.0000363.txt-25 mg/m2"                                                                                                                                                                                                                                                                                           
##   [92] "journal.pntd.0000363.txt:or 20% SC cypermethrin at 125 mg/m2"                                                                                                                                                                                                                                                                
##   [93] "journal.pntd.0000363.txt-were the"                                                                                                                                                                                                                                                                                           
##   [94] "journal.pntd.0000363.txt-insecticides and doses most commonly used (Table S1)."                                                                                                                                                                                                                                              
##   [95] "journal.pntd.0000363.txt-Cost-effectiveness analysis"                                                                                                                                                                                                                                                                        
##   [96] "--"                                                                                                                                                                                                                                                                                                                          
##   [97] "journal.pntd.0000391.txt-In Vietnam, 24 tonnes of DDT was used for residual treatment"                                                                                                                                                                                                                                       
##   [98] "journal.pntd.0000391.txt-against malaria vectors in 1993 and 1994. However, since the"                                                                                                                                                                                                                                       
##   [99] "journal.pntd.0000391.txt-abandoning of DDT sprays in 1995, only pyrethroids (residual"                                                                                                                                                                                                                                       
##  [100] "journal.pntd.0000391.txt:spraying of l-cyhalothrin and a-cypermethrin and occasionally"                                                                                                                                                                                                                                      
##  [101] "journal.pntd.0000391.txt-deltamethrin, and permethrin-impregnated bed nets) have been"                                                                                                                                                                                                                                       
##  [102] "journal.pntd.0000391.txt-extensively used in large amounts, unlike in the other Asian"                                                                                                                                                                                                                                       
##  [103] "journal.pntd.0000391.txt-countries [2,10]. Although details regarding the amount of"                                                                                                                                                                                                                                         
##  [104] "--"                                                                                                                                                                                                                                                                                                                          
##  [105] "journal.pntd.0000391.txt-36% of the total insecticide consumption if the amount of DDT,"                                                                                                                                                                                                                                     
##  [106] "journal.pntd.0000391.txt-which is exclusively used in African countries, is excluded. Among"                                                                                                                                                                                                                                 
##  [107] "journal.pntd.0000391.txt-pyrethroids that are used for vector control, 98.7% comprise photo-"                                                                                                                                                                                                                                
##  [108] "journal.pntd.0000391.txt:stable pyrethroids such as a-cypermethrin, cypermethrin, bifenthrin,"                                                                                                                                                                                                                               
##  [109] "journal.pntd.0000391.txt-cyfluthrin, deltamethrin, etofenprox, l-cyhalothrin, and permethrin."                                                                                                                                                                                                                               
##  [110] "journal.pntd.0000391.txt-On the other hand, the most popular and long-standing"                                                                                                                                                                                                                                              
##  [111] "journal.pntd.0000391.txt-formulations using pyrethroids are mosquito coils, mosquito mats,"                                                                                                                                                                                                                                  
##  [112] "--"                                                                                                                                                                                                                                                                                                                          
##  [113] "journal.pntd.0000527.txt-and the other possessing high killing activity. Pyrethroids in the"                                                                                                                                                                                                                                 
##  [114] "journal.pntd.0000527.txt-former group such as d-allethrin, prallethrin, metofluthrin etc. are"                                                                                                                                                                                                                               
##  [115] "journal.pntd.0000527.txt-labeled as knockdown agents, and those in the latter group such as"                                                                                                                                                                                                                                 
##  [116] "journal.pntd.0000527.txt:permethrin, deltamethrin, cypermethrin etc., as killing agents. The"                                                                                                                                                                                                                                
##  [117] "journal.pntd.0000527.txt-pyrethroids belonging to the former group generally exhibit low"                                                                                                                                                                                                                                    
##  [118] "journal.pntd.0000527.txt-stability in the environment. Pyrethroids are typically used as a"                                                                                                                                                                                                                                  
##  [119] "journal.pntd.0000527.txt-‘spatial repellent’ in mosquito coils, mats, and vaporizer liquids to"                                                                                                                                                                                                                              
##  [120] "--"                                                                                                                                                                                                                                                                                                                          
##  [121] "journal.pntd.0000527.txt-the factors causing the discrepancy in pyrethroid susceptibility in"                                                                                                                                                                                                                                
##  [122] "journal.pntd.0000527.txt-different regions in the southern areas and Central Highlands."                                                                                                                                                                                                                                     
##  [123] "journal.pntd.0000527.txt-Actually, after abandonment of DDT sprays in 1995, many"                                                                                                                                                                                                                                            
##  [124] "journal.pntd.0000527.txt:photostable pyrethroids (l-cyhalothrin, a-cypermethrin, deltame-"                                                                                                                                                                                                                                   
##  [125] "journal.pntd.0000527.txt-thrin, and permethrin) have been used to treat the interiors of"                                                                                                                                                                                                                                    
##  [126] "journal.pntd.0000527.txt-houses as a residual spray and in the manufacture of pyrethroid-"                                                                                                                                                                                                                                   
##  [127] "journal.pntd.0000527.txt-impregnated bed nets for malaria control in Vietnam [1,18–20]."                                                                                                                                                                                                                                     
##  [128] "--"                                                                                                                                                                                                                                                                                                                          
##  [129] "journal.pntd.0000584.txt-116. Nunes CM, Lima VM, Paula HB, Perri SH, Andrade AM, et al. (2008) Dog"                                                                                                                                                                                                                          
##  [130] "journal.pntd.0000584.txt-culling and replacement in an area endemic for visceral leishmaniasis in Brazil."                                                                                                                                                                                                                   
##  [131] "journal.pntd.0000584.txt-Vet Parasitol 153: 19–23."                                                                                                                                                                                                                                                                          
##  [132] "journal.pntd.0000584.txt:117. De Silans LN, Dedet JP, Arias JR (1998) Field monitoring of cypermethrin"                                                                                                                                                                                                                      
##  [133] "journal.pntd.0000584.txt-residual effect on the mortality rates of the Phlebotomine sand fly Lutzomyia"                                                                                                                                                                                                                      
##  [134] "journal.pntd.0000584.txt-longipalpis in the state of Paraiba, Brazil. Mem Inst Oswaldo Cruz 93: 339–344."                                                                                                                                                                                                                    
##  [135] "journal.pntd.0000584.txt-118. Mazzarri MB, Feliciangeli MD, Maroli M, Hernandez A, Bravo A (1997)"                                                                                                                                                                                                                           
##  [136] "--"                                                                                                                                                                                                                                                                                                                          
##  [137] "journal.pntd.0000587.txt-Nepal, respectively, owning at least one bed net before the trial"                                                                                                                                                                                                                                  
##  [138] "journal.pntd.0000587.txt-started. Some of the villages were sprayed as a part of the national"                                                                                                                                                                                                                               
##  [139] "journal.pntd.0000587.txt-VL control programs of India and Nepal using DDT and alpha-"                                                                                                                                                                                                                                        
##  [140] "journal.pntd.0000587.txt:cypermethrin, respectively. For ethical reasons there was no"                                                                                                                                                                                                                                       
##  [141] "journal.pntd.0000587.txt-interference in the execution of these programs but IRS"                                                                                                                                                                                                                                            
##  [142] "journal.pntd.0000587.txt-information was gathered and considered in the analysis."                                                                                                                                                                                                                                           
##  [143] "journal.pntd.0000587.txt-Figure 1. Location of the 12 clusters, 6 in Muzaffarpur district, India and 6 in Sunsari district, Nepal selected for the entomological"                                                                                                                                                            
##  [144] "--"                                                                                                                                                                                                                                                                                                                          
##  [145] "journal.pntd.0000859.txt-methrin or lambdacyhalothrin) targeting communities reporting at"                                                                                                                                                                                                                                   
##  [146] "journal.pntd.0000859.txt-least one VL case in the previous year [4]. In Bangladesh vector-"                                                                                                                                                                                                                                  
##  [147] "journal.pntd.0000859.txt-control activities are practically inexistent [5]. The use of Long"                                                                                                                                                                                                                                 
##  [148] "journal.pntd.0000859.txt:Lasting Insecticidal Nets (LN), deltamethrin, alphacypermethrin or"                                                                                                                                                                                                                                 
##  [149] "journal.pntd.0000859.txt-permethrin based [6], have been postulated as an alternative or"                                                                                                                                                                                                                                    
##  [150] "journal.pntd.0000859.txt-complimentary approach as the current vector control strategies are"                                                                                                                                                                                                                                
##  [151] "journal.pntd.0000859.txt-failing to control VL in the region [7,8]. Among other reasons, P."                                                                                                                                                                                                                                 
##  [152] "--"                                                                                                                                                                                                                                                                                                                          
##  [153] "journal.pntd.0000859.txt-was susceptible in the other 3 more inland located study sites. In"                                                                                                                                                                                                                                 
##  [154] "journal.pntd.0000859.txt-Nepal the use of DDT for IRS was stopped in early 1990’s and"                                                                                                                                                                                                                                       
##  [155] "journal.pntd.0000859.txt-from 1995 the IRS policy was mainly based on the use of"                                                                                                                                                                                                                                            
##  [156] "journal.pntd.0000859.txt:pyrethroids (mainly alphacypermethrin) but only in villages with"                                                                                                                                                                                                                                   
##  [157] "journal.pntd.0000859.txt-VL cases [4]. This underlines once more that DDT resistance in P."                                                                                                                                                                                                                                  
##  [158] "journal.pntd.0000859.txt-argentipes has been mainly attributed to indoor spraying with this"                                                                                                                                                                                                                                 
##  [159] "journal.pntd.0000859.txt-insecticide and its frequency of application [8,18], but the use of"                                                                                                                                                                                                                                
##  [160] "--"                                                                                                                                                                                                                                                                                                                          
##  [161] "journal.pntd.0001202.txt-Veille_sanitaire/Les_champs_de_competences/Dengue/PEP/PEP_Martini-"                                                                                                                                                                                                                                 
##  [162] "journal.pntd.0001202.txt-que/pep_mq_2010/pe_deng_mar_10_15.pdf. 4 p."                                                                                                                                                                                                                                                        
##  [163] "journal.pntd.0001202.txt-10. Floore TG, Dukes JC, Boike AH, Jr., Greer MJ, Coughlin JS (1992) Evaluation"                                                                                                                                                                                                                    
##  [164] "journal.pntd.0001202.txt:of three candidate cypermethrin-piperonyl butoxide formulations compared"                                                                                                                                                                                                                           
##  [165] "journal.pntd.0001202.txt-with Scourge against adult Culex quinquefasciatus. J Am Mosq Control Assoc 8:"                                                                                                                                                                                                                      
##  [166] "journal.pntd.0001202.txt-97–98."                                                                                                                                                                                                                                                                                             
##  [167] "journal.pntd.0001202.txt-11. WHO (2006) Report of the Scientific Working Group on Dengue. Document"                                                                                                                                                                                                                          
##  [168] "--"                                                                                                                                                                                                                                                                                                                          
##  [169] "journal.pntd.0001243.txt-Methods: Using a laboratory box assay, resting patterns of two population strains of female Ae. aegypti (THAI and PERU)"                                                                                                                                                                            
##  [170] "journal.pntd.0001243.txt-were evaluated against two material types (cotton and polyester) at various dark:light surface area coverage (SAC) ratio and"                                                                                                                                                                       
##  [171] "journal.pntd.0001243.txt-contrast configuration (horizontal and vertical) under chemical-free and treated conditions. Chemicals evaluated were"                                                                                                                                                                              
##  [172] "journal.pntd.0001243.txt:alphacypermethrin and DDT at varying concentrations."                                                                                                                                                                                                                                               
##  [173] "journal.pntd.0001243.txt-Results: Under chemical-free conditions, dark material had significantly higher resting counts compared to light material at"                                                                                                                                                                       
##  [174] "journal.pntd.0001243.txt-all SAC, and significantly increased when material was in horizontal configuration. Cotton elicited stronger response than"                                                                                                                                                                         
##  [175] "journal.pntd.0001243.txt-polyester. Within the treatment assays, significantly higher resting counts were observed on chemical-treated dark material"                                                                                                                                                                        
##  [176] "--"                                                                                                                                                                                                                                                                                                                          
##  [177] "journal.pntd.0001243.txt-time points and closed afterwards to maintain darkness in the box"                                                                                                                                                                                                                                  
##  [178] "journal.pntd.0001243.txt-throughout the rest of the test procedure."                                                                                                                                                                                                                                                         
##  [179] "journal.pntd.0001243.txt-Chemicals and treatment procedures"                                                                                                                                                                                                                                                                 
##  [180] "journal.pntd.0001243.txt:Chemicals evaluated in this study, DDT and alphacypermethrin,"                                                                                                                                                                                                                                      
##  [181] "journal.pntd.0001243.txt-were chosen based on current status of World Health Organization"                                                                                                                                                                                                                                   
##  [182] "journal.pntd.0001243.txt-Pesticide Evaluation Scheme (WHOPES) residual chemical recom-"                                                                                                                                                                                                                                      
##  [183] "journal.pntd.0001243.txt-mendations and/or historical use in vector control programs [40]."                                                                                                                                                                                                                                  
##  [184] "journal.pntd.0001243.txt-Chemicals were acquired as technical grade material purchased"                                                                                                                                                                                                                                      
##  [185] "journal.pntd.0001243.txt-from Sigma-Aldrich (St. Louis, MO): DDT (CAS 50-29-3),"                                                                                                                                                                                                                                             
##  [186] "journal.pntd.0001243.txt:alphacypermethrin (CAS 67375-30-8). For resting experiments"                                                                                                                                                                                                                                        
##  [187] "journal.pntd.0001243.txt-with chemical, dark material strips were treated with various doses"                                                                                                                                                                                                                                
##  [188] "journal.pntd.0001243.txt-(2.5; 25 and 250 nmol/cm2"                                                                                                                                                                                                                                                                          
##  [189] "journal.pntd.0001243.txt:) of alphacypermethrin or DDT diluted"                                                                                                                                                                                                                                                              
##  [190] "journal.pntd.0001243.txt-in acetone solution. Assay concentrations were selected according to"                                                                                                                                                                                                                               
##  [191] "journal.pntd.0001243.txt-previous behavioral studies with these chemicals [32,33,36]."                                                                                                                                                                                                                                       
##  [192] "journal.pntd.0001243.txt-Treatment solutions were applied evenly to individual material"                                                                                                                                                                                                                                     
##  [193] "--"                                                                                                                                                                                                                                                                                                                          
##  [194] "journal.pntd.0001243.txt-only exception to this being with the PERU strain against DDT"                                                                                                                                                                                                                                      
##  [195] "journal.pntd.0001243.txt-250 nm/cm2"                                                                                                                                                                                                                                                                                         
##  [196] "journal.pntd.0001243.txt-using polyester (r = 0.75, P = 0.03); and with the"                                                                                                                                                                                                                                                 
##  [197] "journal.pntd.0001243.txt:THAI strain against alphacypermethrin 2.5 and 25 nm/cm2"                                                                                                                                                                                                                                            
##  [198] "journal.pntd.0001243.txt-using"                                                                                                                                                                                                                                                                                              
##  [199] "journal.pntd.0001243.txt-polyester (r = 0.8, P = 0.01; and r = 0.74, P = 0.03 respectively)."                                                                                                                                                                                                                                
##  [200] "journal.pntd.0001243.txt-Effect of vertical versus horizontal material configur-"                                                                                                                                                                                                                                            
##  [201] "--"                                                                                                                                                                                                                                                                                                                          
##  [202] "journal.pntd.0001243.txt-resting patterns. For both strains, resting observations on the"                                                                                                                                                                                                                                    
##  [203] "journal.pntd.0001243.txt-dark chemical-treated strips were significantly higher using cotton"                                                                                                                                                                                                                                
##  [204] "journal.pntd.0001243.txt-as opposed to polyester. These results were consistent for both Ae."                                                                                                                                                                                                                                
##  [205] "journal.pntd.0001243.txt:aegypti strains using alphacypermethrin and DDT, at each test"                                                                                                                                                                                                                                      
##  [206] "journal.pntd.0001243.txt-dose, regardless of SAC and material configuration. There were"                                                                                                                                                                                                                                     
##  [207] "journal.pntd.0001243.txt-two exceptions to this which were the THAI strain when exposed"                                                                                                                                                                                                                                     
##  [208] "journal.pntd.0001243.txt-to DDT 250 nmol/cm2"                                                                                                                                                                                                                                                                                
##  [209] "--"                                                                                                                                                                                                                                                                                                                          
##  [210] "journal.pntd.0001243.txt-well as under field conditions in experimental huts [Thainchum"                                                                                                                                                                                                                                     
##  [211] "journal.pntd.0001243.txt-Chemicals Actions on Ae. aegypti Resting Behavior"                                                                                                                                                                                                                                                  
##  [212] "journal.pntd.0001243.txt-www.plosntds.org 6 July 2011 | Volume 5 | Issue 7 | e1243"                                                                                                                                                                                                                                          
##  [213] "journal.pntd.0001243.txt:\fTable2.RestingobservationsofAe.aegyptiTHAIstrainwithinbothtreatment(alphacypermethrin)andmatchedcontrolconditions."                                                                                                                                                                               
##  [214] "journal.pntd.0001243.txt-alphacypermet"                                                                                                                                                                                                                                                                                      
##  [215] "journal.pntd.0001243.txt-hrindoses"                                                                                                                                                                                                                                                                                          
##  [216] "journal.pntd.0001243.txt-(nmol/cm2"                                                                                                                                                                                                                                                                                          
##  [217] "--"                                                                                                                                                                                                                                                                                                                          
##  [218] "journal.pntd.0001243.txt-that KD/mortality would be low in these test populations. More"                                                                                                                                                                                                                                     
##  [219] "journal.pntd.0001243.txt-importantly, the THAI strain still exhibited a contact irritant"                                                                                                                                                                                                                                    
##  [220] "journal.pntd.0001243.txt-response (indicated by increased flying) when exposed to both"                                                                                                                                                                                                                                      
##  [221] "journal.pntd.0001243.txt:alphacypermethrin and DDT. These results indicate that sub-"                                                                                                                                                                                                                                        
##  [222] "journal.pntd.0001243.txt-lethal approaches to vector control may be effective in resistance"                                                                                                                                                                                                                                 
##  [223] "journal.pntd.0001243.txt-management."                                                                                                                                                                                                                                                                                        
##  [224] "journal.pntd.0001243.txt-Perhaps most important for operational significance is the"                                                                                                                                                                                                                                         
##  [225] "journal.pntd.0001243.txt-observation that was made in the test chamber during chemical"                                                                                                                                                                                                                                      
##  [226] "journal.pntd.0001243.txt-trials indicating that both mosquito strains continued to rest in"                                                                                                                                                                                                                                  
##  [227] "journal.pntd.0001243.txt:Table 4. Resting observations of Ae. aegypti PERU strain within both treatment (alphacypermethrin) and matched control"                                                                                                                                                                             
##  [228] "journal.pntd.0001243.txt-conditions."                                                                                                                                                                                                                                                                                        
##  [229] "journal.pntd.0001243.txt:alphacypermethrin"                                                                                                                                                                                                                                                                                  
##  [230] "journal.pntd.0001243.txt-doses"                                                                                                                                                                                                                                                                                              
##  [231] "journal.pntd.0001243.txt-(nmol/cm2"                                                                                                                                                                                                                                                                                          
##  [232] "journal.pntd.0001243.txt-) Material"                                                                                                                                                                                                                                                                                         
##  [233] "--"                                                                                                                                                                                                                                                                                                                          
##  [234] "journal.pntd.0001243.txt-www.plosntds.org 9 July 2011 | Volume 5 | Issue 7 | e1243"                                                                                                                                                                                                                                          
##  [235] "journal.pntd.0001243.txt-\fgreater proportions on dark chemical-treated material versus safe-"                                                                                                                                                                                                                               
##  [236] "journal.pntd.0001243.txt-sites (i.e. chemical-free light material, assay lids and floor) when"                                                                                                                                                                                                                               
##  [237] "journal.pntd.0001243.txt:any dose of either alphacypermethrin or DDT were used. Even"                                                                                                                                                                                                                                        
##  [238] "journal.pntd.0001243.txt-under test conditions in which shifting to safe-sites were expected"                                                                                                                                                                                                                                
##  [239] "journal.pntd.0001243.txt-(i.e., 25% SAC), results show no consistent increase in resting"                                                                                                                                                                                                                                    
##  [240] "journal.pntd.0001243.txt-counts on chemical-free material. As expected, however, when"                                                                                                                                                                                                                                       
##  [241] "--"                                                                                                                                                                                                                                                                                                                          
##  [242] "journal.pntd.0001243.txt-green cotton and polyester."                                                                                                                                                                                                                                                                        
##  [243] "journal.pntd.0001243.txt-(DOC)"                                                                                                                                                                                                                                                                                              
##  [244] "journal.pntd.0001243.txt-Table S3 Resting observations of Ae. aegypti THAI strain against"                                                                                                                                                                                                                                   
##  [245] "journal.pntd.0001243.txt:alphacypermethrin treatment conditions."                                                                                                                                                                                                                                                            
##  [246] "journal.pntd.0001243.txt-(DOC)"                                                                                                                                                                                                                                                                                              
##  [247] "journal.pntd.0001243.txt-Table S4 Resting observations of Ae. aegypti THAI strain against"                                                                                                                                                                                                                                   
##  [248] "journal.pntd.0001243.txt-DDT treatment conditions."                                                                                                                                                                                                                                                                          
##  [249] "journal.pntd.0001243.txt-(DOC)"                                                                                                                                                                                                                                                                                              
##  [250] "journal.pntd.0001243.txt-Table S5 Resting observations of Ae. aegypti PERU strain against"                                                                                                                                                                                                                                   
##  [251] "journal.pntd.0001243.txt:alphacypermethrin and DDT treatment conditions."                                                                                                                                                                                                                                                    
##  [252] "journal.pntd.0001243.txt-(DOC)"                                                                                                                                                                                                                                                                                              
##  [253] "journal.pntd.0001243.txt-Acknowledgments"                                                                                                                                                                                                                                                                                    
##  [254] "journal.pntd.0001243.txt-We thank Theeraphap Chareonviriyaphap, Kasetsart University, Bangkok,"                                                                                                                                                                                                                              
##  [255] "--"                                                                                                                                                                                                                                                                                                                          
##  [256] "journal.pntd.0001243.txt-251–259."                                                                                                                                                                                                                                                                                           
##  [257] "journal.pntd.0001243.txt-51. Kanutcharee T, Achee NL, Bangs MJ, Grieco JP, Suwonkerd W, et al. (2009)"                                                                                                                                                                                                                       
##  [258] "journal.pntd.0001243.txt-Irritancy and repellency behavioral responses of three strains of Aedes aegypti"                                                                                                                                                                                                                    
##  [259] "journal.pntd.0001243.txt:exposed to DDT and a-cypermethrin. J Med Entomol 46: 1407–1414."                                                                                                                                                                                                                                    
##  [260] "journal.pntd.0001243.txt-52. Polsomboon S, Poolprasert P, Suwonkerd W, Bangs MJ, Tanasinchayakul S,"                                                                                                                                                                                                                         
##  [261] "journal.pntd.0001243.txt-Akratanakul P, Chareonviriyaphap T (2008) Biting patterns of Anopheles minimus"                                                                                                                                                                                                                     
##  [262] "journal.pntd.0001243.txt-complex (Diptera: Culicidae) in experimental huts treated with DDT and"                                                                                                                                                                                                                             
##  [263] "--"                                                                                                                                                                                                                                                                                                                          
##  [264] "journal.pntd.0001276.txt-and financial management of the footbaths that included two"                                                                                                                                                                                                                                        
##  [265] "journal.pntd.0001276.txt-technical managers of the footbath trained at CIRDES and the"                                                                                                                                                                                                                                       
##  [266] "journal.pntd.0001276.txt-treasurer of the GLK. In addition, a first liter of active ingredient"                                                                                                                                                                                                                              
##  [267] "journal.pntd.0001276.txt:(alpha-cypermethrin, Dominex, FMC, Philadelphia, USA) was"                                                                                                                                                                                                                                          
##  [268] "journal.pntd.0001276.txt-provided and used for treatment at the recommended concentra-"                                                                                                                                                                                                                                      
##  [269] "journal.pntd.0001276.txt-tion (0,005%) [6]. The farmers then paid a treatment fee per head"                                                                                                                                                                                                                                  
##  [270] "journal.pntd.0001276.txt-of cattle (5 to 10 FCFA i.e. euro 0.08 to 0.16) including the salary"                                                                                                                                                                                                                               
##  [271] "--"                                                                                                                                                                                                                                                                                                                          
##  [272] "journal.pntd.0002074.txt-Methods: Contact irritancy (escape) behavior, knockdown and 24 hour mortality rates were quantified in populations of"                                                                                                                                                                              
##  [273] "journal.pntd.0002074.txt-female Ae. aegypti under laboratory conditions and validated in the field (Thailand and Peru) using experimental huts."                                                                                                                                                                             
##  [274] "journal.pntd.0002074.txt-Evaluations were conducted using varying concentrations and treatment surface area coverage (SAC) of three pyrethroid"                                                                                                                                                                              
##  [275] "journal.pntd.0002074.txt:insecticides: alphacypermethrin, lambacyhalothrin and deltamethrin."                                                                                                                                                                                                                                
##  [276] "journal.pntd.0002074.txt:Results: Under laboratory conditions, exposure of Ae. aegypti to alphacypermethrin using the standard field application rate"                                                                                                                                                                       
##  [277] "journal.pntd.0002074.txt-(FAR) resulted in escape responses at 25% and 50% SAC that were comparable with escape responses at 100% SAC."                                                                                                                                                                                      
##  [278] "journal.pntd.0002074.txt-Significant escape responses were also observed at ,100% SAC using KFAR of all test compounds. In most trials, KD and"                                                                                                                                                                              
##  [279] "journal.pntd.0002074.txt-24 hour mortality rates were higher in mosquitoes that did not escape than in those that escaped. In Thailand, field"                                                                                                                                                                               
##  [280] "journal.pntd.0002074.txt-validation studies indicated an early time of exit (by four hours) and 40% increase in escape using KFAR of"                                                                                                                                                                                        
##  [281] "journal.pntd.0002074.txt:alphacypermethrin at 75% SAC compared to a matched chemical-free control. In Peru, however, the maximum increase in"                                                                                                                                                                                
##  [282] "journal.pntd.0002074.txt:Ae. aegypti escape from alphacypermethrin-treated huts was 11%."                                                                                                                                                                                                                                    
##  [283] "journal.pntd.0002074.txt-Conclusions/Significance: Results presented here suggest a potential role for sublethal and focal application of contact"                                                                                                                                                                           
##  [284] "journal.pntd.0002074.txt-irritant chemicals in an Ae. aegypti push-pull strategy to reduce human–vector contact inside treated homes. However, the"                                                                                                                                                                          
##  [285] "journal.pntd.0002074.txt-impact of an increase in escape response on dengue virus transmission is currently unknown and will depend on rate of"                                                                                                                                                                              
##  [286] "--"                                                                                                                                                                                                                                                                                                                          
##  [287] "journal.pntd.0002074.txt-Health Organization Pesticide Evaluation Scheme (WHOPES)"                                                                                                                                                                                                                                           
##  [288] "journal.pntd.0002074.txt-recommendations and/or historical use in vector control programs"                                                                                                                                                                                                                                   
##  [289] "journal.pntd.0002074.txt-[34]. Compounds were acquired as neat grade material purchased"                                                                                                                                                                                                                                     
##  [290] "journal.pntd.0002074.txt:from Sigma-Aldrich (St. Louis, MO): alphacypermethrin (CAS"                                                                                                                                                                                                                                         
##  [291] "journal.pntd.0002074.txt-67375-30-8), lambdacyhalothrin (CAS 91465-08-6), and deltame-"                                                                                                                                                                                                                                      
##  [292] "journal.pntd.0002074.txt-thrin (CAS 52918-63-5). Test concentrations evaluated included"                                                                                                                                                                                                                                     
##  [293] "journal.pntd.0002074.txt-WHO recommended field application rates (FAR) and KFAR;"                                                                                                                                                                                                                                            
##  [294] "journal.pntd.0002074.txt-where FAR = 7.2 nmol/cm2"                                                                                                                                                                                                                                                                           
##  [295] "journal.pntd.0002074.txt-(0.03 g/m2"                                                                                                                                                                                                                                                                                         
##  [296] "journal.pntd.0002074.txt:) for alphacypermethrin"                                                                                                                                                                                                                                                                            
##  [297] "journal.pntd.0002074.txt-and lambdacyhalothrin, and 4.9 nmol/cm2"                                                                                                                                                                                                                                                            
##  [298] "journal.pntd.0002074.txt-(0.025 g/m2"                                                                                                                                                                                                                                                                                        
##  [299] "journal.pntd.0002074.txt-) for"                                                                                                                                                                                                                                                                                              
##  [300] "--"                                                                                                                                                                                                                                                                                                                          
##  [301] "journal.pntd.0002074.txt-control for individual bias. At the end of each experimental day, all"                                                                                                                                                                                                                              
##  [302] "journal.pntd.0002074.txt-mosquitoes that remained inside the huts were collected using"                                                                                                                                                                                                                                      
##  [303] "journal.pntd.0002074.txt-backpack (Thailand) and Prokopack (Peru) [36] aspiration. The"                                                                                                                                                                                                                                      
##  [304] "journal.pntd.0002074.txt:following treatments were tested in Thailand: alphacypermethrin"                                                                                                                                                                                                                                    
##  [305] "journal.pntd.0002074.txt-at FAR and KFAR at 75% D:L SAC; and in Peru:"                                                                                                                                                                                                                                                       
##  [306] "journal.pntd.0002074.txt:alphacypermethrin at FAR and KFAR at 100%, 75%, 50%,"                                                                                                                                                                                                                                               
##  [307] "journal.pntd.0002074.txt-and 25% D:L SAC."                                                                                                                                                                                                                                                                                   
##  [308] "journal.pntd.0002074.txt-Data analysis"                                                                                                                                                                                                                                                                                      
##  [309] "journal.pntd.0002074.txt-Laboratory evaluations. All analyses were performed using"                                                                                                                                                                                                                                          
##  [310] "--"                                                                                                                                                                                                                                                                                                                          
##  [311] "journal.pntd.0002074.txt-3. In general, escape was higher in treatment assays as compared"                                                                                                                                                                                                                                   
##  [312] "journal.pntd.0002074.txt-to matched controls. Most importantly, significant escape response"                                                                                                                                                                                                                                 
##  [313] "journal.pntd.0002074.txt-was observed at KFAR and/or at SAC less than 100% for each"                                                                                                                                                                                                                                         
##  [314] "journal.pntd.0002074.txt:pyrethroid evaluated (Tables 1–3). Against alphacypermethrin"                                                                                                                                                                                                                                       
##  [315] "journal.pntd.0002074.txt-treatment, corrected percent escape ranged from 8–49% with"                                                                                                                                                                                                                                         
##  [316] "journal.pntd.0002074.txt-highest responses observed at FAR for all SAC evaluated (Table 1)."                                                                                                                                                                                                                                 
##  [317] "journal.pntd.0002074.txt-Percent escape was comparable among all treatment coverages at"                                                                                                                                                                                                                                     
##  [318] "--"                                                                                                                                                                                                                                                                                                                          
##  [319] "journal.pntd.0002074.txt-Contact Irritancy of Aedes aegypti"                                                                                                                                                                                                                                                                 
##  [320] "journal.pntd.0002074.txt-PLOS Neglected Tropical Diseases | www.plosntds.org 4 February 2013 | Volume 7 | Issue 2 | e2074"                                                                                                                                                                                                   
##  [321] "journal.pntd.0002074.txt-\fTable1.EscaperesponsesofAedesaegypti1"                                                                                                                                                                                                                                                            
##  [322] "journal.pntd.0002074.txt:todifferentconcentrationsandcoverageofalphacypermethrinunderlaboratoryconditions."                                                                                                                                                                                                                  
##  [323] "journal.pntd.0002074.txt-No.escaping(mean2"                                                                                                                                                                                                                                                                                  
##  [324] "journal.pntd.0002074.txt-±SE)"                                                                                                                                                                                                                                                                                               
##  [325] "journal.pntd.0002074.txt:Alphacypermethrinconcentration"                                                                                                                                                                                                                                                                     
##  [326] "journal.pntd.0002074.txt-(nmoles/cm2"                                                                                                                                                                                                                                                                                        
##  [327] "journal.pntd.0002074.txt-)SAC3"                                                                                                                                                                                                                                                                                              
##  [328] "journal.pntd.0002074.txt-(%)"                                                                                                                                                                                                                                                                                                
##  [329] "--"                                                                                                                                                                                                                                                                                                                          
##  [330] "journal.pntd.0002074.txt-than in those that escaped (Table S1 and Table 4, respectively);"                                                                                                                                                                                                                                   
##  [331] "journal.pntd.0002074.txt-however, there was minimal KD observed overall in test"                                                                                                                                                                                                                                             
##  [332] "journal.pntd.0002074.txt-populations that escaped with rates ranging from 0–25% in all test"                                                                                                                                                                                                                                 
##  [333] "journal.pntd.0002074.txt:chemicals. Highest KD was observed using alphacypermethrin at"                                                                                                                                                                                                                                      
##  [334] "journal.pntd.0002074.txt-100%D SAC and FAR (Table S1). No KD was observed in"                                                                                                                                                                                                                                                
##  [335] "journal.pntd.0002074.txt-mosquitoes that escaped against lambdacyhalothrin or deltamethrin"                                                                                                                                                                                                                                  
##  [336] "journal.pntd.0002074.txt-(Table S1). For mosquitoes that did not escape, percentage KD"                                                                                                                                                                                                                                      
##  [337] "journal.pntd.0002074.txt:ranged from 0–48%, 0–15% and 0–1% using alphacypermethrin,"                                                                                                                                                                                                                                         
##  [338] "journal.pntd.0002074.txt-lambdacyhalothrin and deltamethrin, respectively, with highest"                                                                                                                                                                                                                                     
##  [339] "journal.pntd.0002074.txt:rates occurring in alphacypermethrin trials using FAR (Table S1)."                                                                                                                                                                                                                                  
##  [340] "journal.pntd.0002074.txt-Most importantly, KD observed in both mosquito cohorts that"                                                                                                                                                                                                                                        
##  [341] "journal.pntd.0002074.txt-escaped and those that did not were comparable between 100% and"                                                                                                                                                                                                                                    
##  [342] "journal.pntd.0002074.txt-25% SAC for each test concentration and chemical evaluated."                                                                                                                                                                                                                                        
##  [343] "--"                                                                                                                                                                                                                                                                                                                          
##  [344] "journal.pntd.0002074.txt-escaped the laboratory assay (Table 4). Mortality ranged from 0–"                                                                                                                                                                                                                                   
##  [345] "journal.pntd.0002074.txt-100%, 0–25%, and 0–7% in mosquitoes that escaped and from"                                                                                                                                                                                                                                          
##  [346] "journal.pntd.0002074.txt-45–84%, 0.5–28%, and 1–16% in those that did not escape for"                                                                                                                                                                                                                                        
##  [347] "journal.pntd.0002074.txt:alphacypermethrin, lambdacyhalothrin and deltamethrin, respec-"                                                                                                                                                                                                                                     
##  [348] "journal.pntd.0002074.txt:tively. For alphacypermethrin, highest mortality was observed at"                                                                                                                                                                                                                                   
##  [349] "journal.pntd.0002074.txt-FAR 100%D in mosquitoes that escaped and 25%D in those that"                                                                                                                                                                                                                                        
##  [350] "journal.pntd.0002074.txt-did not escape, although the latter was statistically comparable"                                                                                                                                                                                                                                   
##  [351] "journal.pntd.0002074.txt-among all SAC using both test concentrations (Table 4)."                                                                                                                                                                                                                                            
##  [352] "--"                                                                                                                                                                                                                                                                                                                          
##  [353] "journal.pntd.0002074.txt-Thailand. In comparison to the matched control hut, there"                                                                                                                                                                                                                                          
##  [354] "journal.pntd.0002074.txt-was a 42.3% and 46.4% increase in the percentage of marked Ae."                                                                                                                                                                                                                                     
##  [355] "journal.pntd.0002074.txt-aegypti females that exited huts containing fabric panels treated at"                                                                                                                                                                                                                               
##  [356] "journal.pntd.0002074.txt:FAR and KFAR alphacypermethrin, respectively (Table 5);"                                                                                                                                                                                                                                            
##  [357] "journal.pntd.0002074.txt-although these results were statistically comparable among"                                                                                                                                                                                                                                         
##  [358] "journal.pntd.0002074.txt-treatment and control conditions (P = 0.4). In both treatment"                                                                                                                                                                                                                                      
##  [359] "journal.pntd.0002074.txt-huts, the percentage of KD mosquitoes collected indoors were"                                                                                                                                                                                                                                       
##  [360] "--"                                                                                                                                                                                                                                                                                                                          
##  [361] "journal.pntd.0002074.txt-relative humidity (P = 0.6) readings were comparable among all"                                                                                                                                                                                                                                     
##  [362] "journal.pntd.0002074.txt-huts during the trials (Table 5)."                                                                                                                                                                                                                                                                  
##  [363] "journal.pntd.0002074.txt-Peru. The percentage of Ae. aegypti that exited from huts treated"                                                                                                                                                                                                                                  
##  [364] "journal.pntd.0002074.txt:with alphacypermethrin at FAR (at all SAC) (P = 0.8) and"                                                                                                                                                                                                                                           
##  [365] "journal.pntd.0002074.txt-percentage dead 24 hours post-escape (P = 0.3) was comparable to"                                                                                                                                                                                                                                   
##  [366] "journal.pntd.0002074.txt-control, with 0–11% increase in escape compared to the untreated"                                                                                                                                                                                                                                   
##  [367] "journal.pntd.0002074.txt-hut (Table 6). However, the percentage of KD mosquitoes inside the"                                                                                                                                                                                                                                 
##  [368] "--"                                                                                                                                                                                                                                                                                                                          
##  [369] "journal.pntd.0002074.txt-with chemical (even 25% SAC) than in the untreated hut indicating"                                                                                                                                                                                                                                  
##  [370] "journal.pntd.0002074.txt-a chemical effect (Table 6). Similar results in escape (P = 0.2) and"                                                                                                                                                                                                                               
##  [371] "journal.pntd.0002074.txt-mortality (P = 0.9) rates 24 hours post-escape were observed using"                                                                                                                                                                                                                                 
##  [372] "journal.pntd.0002074.txt:alphacypermethrin at KFAR treatment (Table 6). Unlike the FAR"                                                                                                                                                                                                                                      
##  [373] "journal.pntd.0002074.txt-trials, percentage KD inside the huts (P = 0.2) and 24 hour mortality"                                                                                                                                                                                                                              
##  [374] "journal.pntd.0002074.txt-rates (P = 0.4) in these KD populations were comparable between"                                                                                                                                                                                                                                    
##  [375] "journal.pntd.0002074.txt-treated and untreated huts at all SAC (Table 6). The percentage of"                                                                                                                                                                                                                                 
##  [376] "--"                                                                                                                                                                                                                                                                                                                          
##  [377] "journal.pntd.0002074.txt-WHO recommended field application rate (FAR) = 7.2 nm/cm2"                                                                                                                                                                                                                                          
##  [378] "journal.pntd.0002074.txt-or 0.03 g/m2"                                                                                                                                                                                                                                                                                       
##  [379] "journal.pntd.0002074.txt-for"                                                                                                                                                                                                                                                                                                
##  [380] "journal.pntd.0002074.txt:alphacypermethrin and lambdacyhalothrin; and 4.9 nm/cm2"                                                                                                                                                                                                                                            
##  [381] "journal.pntd.0002074.txt-or 0.025 g/m2"                                                                                                                                                                                                                                                                                      
##  [382] "journal.pntd.0002074.txt-for"                                                                                                                                                                                                                                                                                                
##  [383] "journal.pntd.0002074.txt-deltamethrin."                                                                                                                                                                                                                                                                                      
##  [384] "--"                                                                                                                                                                                                                                                                                                                          
##  [385] "journal.pntd.0002074.txt-pounds based on chemical levels required for vector mortality"                                                                                                                                                                                                                                      
##  [386] "journal.pntd.0002074.txt-[34]. Our field studies in Thailand corroborate this finding with a"                                                                                                                                                                                                                                
##  [387] "journal.pntd.0002074.txt-46% increase in the percentage of Ae. aegypti exiting a hut treated"                                                                                                                                                                                                                                
##  [388] "journal.pntd.0002074.txt:with alphacypermethrin at KFAR and significantly more mos-"                                                                                                                                                                                                                                         
##  [389] "journal.pntd.0002074.txt-quitoes exiting the treated hut prematurely, by four hours,"                                                                                                                                                                                                                                        
##  [390] "journal.pntd.0002074.txt-compared to the control hut. The time of vector escape from"                                                                                                                                                                                                                                        
##  [391] "journal.pntd.0002074.txt-inside a treated space is as important as the total density of escape"                                                                                                                                                                                                                              
##  [392] "--"                                                                                                                                                                                                                                                                                                                          
##  [393] "journal.pntd.0002074.txt-probability that contact (i.e., biting) of the human host has or can"                                                                                                                                                                                                                               
##  [394] "journal.pntd.0002074.txt-been prevented. Combined, these results are similar with previous"                                                                                                                                                                                                                                  
##  [395] "journal.pntd.0002074.txt-studies conducted in Thailand that found significant escape"                                                                                                                                                                                                                                        
##  [396] "journal.pntd.0002074.txt:response in an Ae. aegypti local strain to alphacypermethrin tested"                                                                                                                                                                                                                                
##  [397] "journal.pntd.0002074.txt-at concentrations below the WHO FAR and continue to support"                                                                                                                                                                                                                                        
##  [398] "journal.pntd.0002074.txt-the fact that insecticides can be used to elicit irritant actions even if"                                                                                                                                                                                                                          
##  [399] "journal.pntd.0002074.txt-applied at concentrations below toxic levels [26,28,39]."                                                                                                                                                                                                                                           
##  [400] "--"                                                                                                                                                                                                                                                                                                                          
##  [401] "journal.pntd.0002074.txt-were not provided the opportunity to escape from the test arena so"                                                                                                                                                                                                                                 
##  [402] "journal.pntd.0002074.txt-measurements of exiting were not captured [31]."                                                                                                                                                                                                                                                    
##  [403] "journal.pntd.0002074.txt-We report here that exposure of Ae. aegypti females to"                                                                                                                                                                                                                                             
##  [404] "journal.pntd.0002074.txt:alphacypermethrin using FAR at 25% and 50% SAC resulted in"                                                                                                                                                                                                                                         
##  [405] "journal.pntd.0002074.txt-escape responses that were comparable with those reported at"                                                                                                                                                                                                                                       
##  [406] "journal.pntd.0002074.txt-100% SAC. In addition, escape responses greater than controls"                                                                                                                                                                                                                                      
##  [407] "journal.pntd.0002074.txt-were also observed using treatment coverage at ,100% at the"                                                                                                                                                                                                                                        
##  [408] "--"                                                                                                                                                                                                                                                                                                                          
##  [409] "journal.pntd.0002074.txt-the combination effect of light color (reduction of preferred resting"                                                                                                                                                                                                                              
##  [410] "journal.pntd.0002074.txt-sites) and the irritating chemical. Field studies from Thailand also"                                                                                                                                                                                                                               
##  [411] "journal.pntd.0002074.txt-indicated a substantial premature escape and an average of 40%"                                                                                                                                                                                                                                     
##  [412] "journal.pntd.0002074.txt:increase in exiting an alphacypermethrin-treated hut using 75%"                                                                                                                                                                                                                                     
##  [413] "journal.pntd.0002074.txt-SAC. Combined, these results demonstrate that, irrespective of"                                                                                                                                                                                                                                     
##  [414] "journal.pntd.0002074.txt-treatment concentrations, substantial escape responses can be"                                                                                                                                                                                                                                      
##  [415] "journal.pntd.0002074.txt-elicited in Ae. aegypti test populations at treatment coverage below"                                                                                                                                                                                                                               
##  [416] "journal.pntd.0002074.txt-Table5.Percentageescape,indoorKD,escapeesmortalityofAe.aegypti1"                                                                                                                                                                                                                                    
##  [417] "journal.pntd.0002074.txt:usingalphacypermethrintreatedhutsinThailand."                                                                                                                                                                                                                                                       
##  [418] "journal.pntd.0002074.txt-Concentrations"                                                                                                                                                                                                                                                                                     
##  [419] "journal.pntd.0002074.txt-(nmoles/cm2"                                                                                                                                                                                                                                                                                        
##  [420] "journal.pntd.0002074.txt-)SAC2"                                                                                                                                                                                                                                                                                              
##  [421] "--"                                                                                                                                                                                                                                                                                                                          
##  [422] "journal.pntd.0002074.txt-advantages in engaging market forces to promote such products,"                                                                                                                                                                                                                                     
##  [423] "journal.pntd.0002074.txt-rather than relying solely on public health appeals."                                                                                                                                                                                                                                               
##  [424] "journal.pntd.0002074.txt-Experimental hut experiments in Peru showed only an 8.7%"                                                                                                                                                                                                                                           
##  [425] "journal.pntd.0002074.txt:increase in escape from huts treated with alphacypermethrin at"                                                                                                                                                                                                                                     
##  [426] "journal.pntd.0002074.txt-FAR using 75% SAC as compared to an untreated hut and no"                                                                                                                                                                                                                                           
##  [427] "journal.pntd.0002074.txt:increase in escape rate when alphacypermethrin was used at"                                                                                                                                                                                                                                         
##  [428] "journal.pntd.0002074.txt-KFAR, irrespective of the SAC. In addition, the time of exit in"                                                                                                                                                                                                                                    
##  [429] "journal.pntd.0002074.txt-Peru trials was comparable between treatments and chemical-"                                                                                                                                                                                                                                        
##  [430] "journal.pntd.0002074.txt-free control. These results are in contrast to both laboratory and"                                                                                                                                                                                                                                 
##  [431] "--"                                                                                                                                                                                                                                                                                                                          
##  [432] "journal.pntd.0002074.txt-rather than remaining on the surface where the mosquitoes make"                                                                                                                                                                                                                                     
##  [433] "journal.pntd.0002074.txt-contact [49]. However, the chemical was shown to be available"                                                                                                                                                                                                                                      
##  [434] "journal.pntd.0002074.txt-for uptake and effect based on indoor KD rates observed within"                                                                                                                                                                                                                                     
##  [435] "journal.pntd.0002074.txt:alphacypermethrin-treated huts. The difference between our"                                                                                                                                                                                                                                         
##  [436] "journal.pntd.0002074.txt-laboratory findings, where minimal escape occurred from control"                                                                                                                                                                                                                                    
##  [437] "journal.pntd.0002074.txt-Table6.Percentageescape,indoorKD,andmortalityofAe.aegypti1"                                                                                                                                                                                                                                         
##  [438] "journal.pntd.0002074.txt:usingalphacypermethrintreatedhutsinPeru."                                                                                                                                                                                                                                                           
##  [439] "journal.pntd.0002074.txt-Concentrations"                                                                                                                                                                                                                                                                                     
##  [440] "journal.pntd.0002074.txt-(nmoles/cm2"                                                                                                                                                                                                                                                                                        
##  [441] "journal.pntd.0002074.txt-)SAC2"                                                                                                                                                                                                                                                                                              
##  [442] "--"                                                                                                                                                                                                                                                                                                                          
##  [443] "journal.pntd.0002074.txt-Control Assoc 24: 460–462."                                                                                                                                                                                                                                                                         
##  [444] "journal.pntd.0002074.txt-33. Kanutcharee T, Achee NL, Bangs MJ, Grieco JP, Suwonkerd W, et al (2009)"                                                                                                                                                                                                                        
##  [445] "journal.pntd.0002074.txt-Irritancy and repellency behavioral responses of three strains of Aedes aegypti"                                                                                                                                                                                                                    
##  [446] "journal.pntd.0002074.txt:exposed to DDT and a-cypermethrin. J Med Entomol 46: 1407–1414."                                                                                                                                                                                                                                    
##  [447] "journal.pntd.0002074.txt-34. WHO [World Health Organization] (2009a) WHO recommended insecticides"                                                                                                                                                                                                                           
##  [448] "journal.pntd.0002074.txt-for indoor residual spraying against malaria vectors. Geneva, Switzerland:"                                                                                                                                                                                                                         
##  [449] "journal.pntd.0002074.txt-World Health Organization. Available: http://apps.who.int/malaria/cmc_"                                                                                                                                                                                                                             
##  [450] "--"                                                                                                                                                                                                                                                                                                                          
##  [451] "journal.pntd.0002074.txt-Control Strategy in Iquitos, Peru and Kanchanaburi, Thailand. Am J Trop Med"                                                                                                                                                                                                                        
##  [452] "journal.pntd.0002074.txt-Hyg 84 (2): 208–217."                                                                                                                                                                                                                                                                               
##  [453] "journal.pntd.0002074.txt-45. Ansari MA, Razdan RK (2003) Bio-efficacy and operational feasibility of"                                                                                                                                                                                                                        
##  [454] "journal.pntd.0002074.txt:alphacypermethrin (Fendona) impregnated mosquito nets to control rural"                                                                                                                                                                                                                             
##  [455] "journal.pntd.0002074.txt-malaria in northern India. J Vector Borne Dis 40(1–2):33–42."                                                                                                                                                                                                                                       
##  [456] "journal.pntd.0002074.txt-46. Yadav RS, Sampath RR, Sharma VP (2001) Deltamethrin treated bednets for"                                                                                                                                                                                                                        
##  [457] "journal.pntd.0002074.txt-control of malaria transmitted by Anopheles culicifacies (Diptera: Culicidae) in"                                                                                                                                                                                                                   
##  [458] "--"                                                                                                                                                                                                                                                                                                                          
##  [459] "journal.pntd.0002158.txt-with deltamethrin upon completion of the 8 MPS survey. Likewise,"                                                                                                                                                                                                                                   
##  [460] "journal.pntd.0002158.txt-sites found infested with T. infestans at 12 MPS (including adjacent"                                                                                                                                                                                                                               
##  [461] "journal.pntd.0002158.txt-sites within the same house compound and other sites that had not"                                                                                                                                                                                                                                  
##  [462] "journal.pntd.0002158.txt:been sprayed at 8 MPS) were sprayed with SC b-cypermethrin (the"                                                                                                                                                                                                                                    
##  [463] "journal.pntd.0002158.txt-only insecticide available to the vector control program at that time)."                                                                                                                                                                                                                            
##  [464] "journal.pntd.0002158.txt-To assess the impact of double-dose insecticide application on"                                                                                                                                                                                                                                     
##  [465] "journal.pntd.0002158.txt-persistent infestations, standard (50 mg/m2"                                                                                                                                                                                                                                                        
##  [466] "journal.pntd.0002158.txt-) and double-dose"                                                                                                                                                                                                                                                                                  
##  [467] "journal.pntd.0002158.txt-(100 mg/m2"                                                                                                                                                                                                                                                                                         
##  [468] "journal.pntd.0002158.txt:) treatments with SC b-cypermethrin were assigned"                                                                                                                                                                                                                                                  
##  [469] "journal.pntd.0002158.txt-at random to infested peridomestic sites while a standard pyrethroid"                                                                                                                                                                                                                               
##  [470] "journal.pntd.0002158.txt-insecticide dose was applied in domiciles."                                                                                                                                                                                                                                                         
##  [471] "journal.pntd.0002158.txt-In view of the infestation levels recorded, from 17 MPS and"                                                                                                                                                                                                                                        
##  [472] "journal.pntd.0002158.txt-thereafter the spray criterion was modified to full-spray coverage"                                                                                                                                                                                                                                 
##  [473] "journal.pntd.0002158.txt-of infested house compounds (i.e., all sites within a house with 1 or"                                                                                                                                                                                                                              
##  [474] "journal.pntd.0002158.txt-more sites infested with T. infestans were treated with insecticide)."                                                                                                                                                                                                                              
##  [475] "journal.pntd.0002158.txt:Double-dose b-cypermethrin was used at 17 MPS. Field and"                                                                                                                                                                                                                                           
##  [476] "journal.pntd.0002158.txt-laboratory-based evidence of local pyrethroid resistance [35]"                                                                                                                                                                                                                                      
##  [477] "journal.pntd.0002158.txt-supported the application of a standard dose of malathion (1 g/"                                                                                                                                                                                                                                    
##  [478] "journal.pntd.0002158.txt-m2"                                                                                                                                                                                                                                                                                                 
##  [479] "--"                                                                                                                                                                                                                                                                                                                          
##  [480] "journal.pntd.0002158.txt-All sites from all houses"                                                                                                                                                                                                                                                                          
##  [481] "journal.pntd.0002158.txt-4 Apr/08 None None 0 (0) None"                                                                                                                                                                                                                                                                      
##  [482] "journal.pntd.0002158.txt-8 Aug/08 Selective (site-level) Deltamethrin Standard or double 89 (52) Only sites infested at 4 or 8 MPS and adjacent sites"                                                                                                                                                                       
##  [483] "journal.pntd.0002158.txt:12 Dec/08 Selective (site-level) b-cypermethrin Standard or double 27 (20) Only sites infested at 12 MPS and adjacent sites"                                                                                                                                                                        
##  [484] "journal.pntd.0002158.txt-17 May/09 Selective (house-"                                                                                                                                                                                                                                                                        
##  [485] "journal.pntd.0002158.txt-level)"                                                                                                                                                                                                                                                                                             
##  [486] "journal.pntd.0002158.txt:b-cypermethrin Double 347 (29) All sites from houses with $1 site infested at 17 MPS"                                                                                                                                                                                                               
##  [487] "journal.pntd.0002158.txt-22 Oct/09 Selective (house-"                                                                                                                                                                                                                                                                        
##  [488] "journal.pntd.0002158.txt-level)"                                                                                                                                                                                                                                                                                             
##  [489] "journal.pntd.0002158.txt-Malathion Standard 74 (8) All sites from houses with $1 site infested at 22 MPS"                                                                                                                                                                                                                    
##  [490] "--"                                                                                                                                                                                                                                                                                                                          
##  [491] "journal.pntd.0002186.txt-the HAT vectors. Successful installation of public dips and later"                                                                                                                                                                                                                                  
##  [492] "journal.pntd.0002186.txt-increased private initiatives to install dips or spray livestock with"                                                                                                                                                                                                                              
##  [493] "journal.pntd.0002186.txt-acaricides ranging from dichlorodiphenyltrichloroethane (DDT),"                                                                                                                                                                                                                                     
##  [494] "journal.pntd.0002186.txt:dieldrin and cypermethrin to organophosphates to amitraz in both"                                                                                                                                                                                                                                   
##  [495] "journal.pntd.0002186.txt-countries in the 1980s and 1990 saw corresponding reduction in"                                                                                                                                                                                                                                     
##  [496] "journal.pntd.0002186.txt-tsetse population."                                                                                                                                                                                                                                                                                 
##  [497] "journal.pntd.0002186.txt-Water sources for both livestock and domestic use may influence"                                                                                                                                                                                                                                    
##  [498] "--"                                                                                                                                                                                                                                                                                                                          
##  [499] "journal.pone.0000716.txt-these compounds over a range of concentrations proved that all were toxic, some were contact irritants, and even fewer were"                                                                                                                                                                        
##  [500] "journal.pone.0000716.txt-non-contact repellents. Of many chemicals tested, three were selected for testing in experimental huts to confirm that"                                                                                                                                                                             
##  [501] "journal.pone.0000716.txt-chemical actions documented in laboratory tests are also expressed in the field. The laboratory tests showed the primary"                                                                                                                                                                           
##  [502] "journal.pone.0000716.txt:action of DDT is repellent, alphacypermethrin is irritant, and dieldrin is only toxic. These tests were followed with hut studies in"                                                                                                                                                               
##  [503] "journal.pone.0000716.txt-Thailand against marked-released populations. DDT exhibited a highly protective level of repellency that kept mosquitoes"                                                                                                                                                                           
##  [504] "journal.pone.0000716.txt:outside of huts. Alphacypermethrin did not keep mosquitoes out, but its strong irritant action caused them to prematurely exit"                                                                                                                                                                     
##  [505] "journal.pone.0000716.txt-the treated house. Dieldrin was highly toxic but showed no irritant or repellent action. Based on the combination of laboratory"                                                                                                                                                                    
##  [506] "journal.pone.0000716.txt-and confirmatory field data, we propose a new paradigm for classifying chemicals used for vector control according to how the"                                                                                                                                                                      
##  [507] "journal.pone.0000716.txt-chemicals actually function to prevent disease transmission inside houses. The new classification scheme will characterize"                                                                                                                                                                         
##  [508] "--"                                                                                                                                                                                                                                                                                                                          
##  [509] "journal.pone.0000716.txt-larvae from Pateuy Village, Saiyok District, Kanchanaburi Province,"                                                                                                                                                                                                                                
##  [510] "journal.pone.0000716.txt-western Thailand (14u209110N, 98u599450E). Baseline toxicity data"                                                                                                                                                                                                                                  
##  [511] "journal.pone.0000716.txt-revealed this population to be highly resistant to DDT, tolerant to"                                                                                                                                                                                                                                
##  [512] "journal.pone.0000716.txt:alphacypermethrin and susceptible to dieldrin."                                                                                                                                                                                                                                                     
##  [513] "journal.pone.0000716.txt-Test compounds"                                                                                                                                                                                                                                                                                     
##  [514] "journal.pone.0000716.txt-Data presented here evolved from a larger ongoing research"                                                                                                                                                                                                                                         
##  [515] "journal.pone.0000716.txt-project to find a chemical that might be a cost-effective substitute"                                                                                                                                                                                                                               
##  [516] "--"                                                                                                                                                                                                                                                                                                                          
##  [517] "journal.pone.0000716.txt-based on the distinct actions that were exhibited in the laboratory."                                                                                                                                                                                                                               
##  [518] "journal.pone.0000716.txt-Data will be presented on these chemicals alone. Based on"                                                                                                                                                                                                                                          
##  [519] "journal.pone.0000716.txt-laboratory tests, one of the three (dieldrin) was toxic but had no"                                                                                                                                                                                                                                 
##  [520] "journal.pone.0000716.txt:repellent or irritant actions. Another (alphacypermethrin) had"                                                                                                                                                                                                                                     
##  [521] "journal.pone.0000716.txt-irritant and toxic actions; but had no repellent action. The third"                                                                                                                                                                                                                                 
##  [522] "journal.pone.0000716.txt-chemical (DDT) exhibited all three actions; repellency, irritancy,"                                                                                                                                                                                                                                 
##  [523] "journal.pone.0000716.txt-and toxicity."                                                                                                                                                                                                                                                                                      
##  [524] "--"                                                                                                                                                                                                                                                                                                                          
##  [525] "journal.pone.0000716.txt-Actions of IRS Chemicals"                                                                                                                                                                                                                                                                           
##  [526] "journal.pone.0000716.txt-PLoS ONE | www.plosone.org 2 August 2007 | Issue 8 | e716"                                                                                                                                                                                                                                          
##  [527] "journal.pone.0000716.txt-\fThe test compounds were DDT (1,1 Bis(4-chlorophenyl)-2,2,2-"                                                                                                                                                                                                                                      
##  [528] "journal.pone.0000716.txt:trichloroethane, 98%)(Sigma-Aldrich), alphacypermethrin (a race-"                                                                                                                                                                                                                                   
##  [529] "journal.pone.0000716.txt-mate comprising (S) alpha-cyano-3-phenoxybenzyl (1R, 3R)-3-(2,2"                                                                                                                                                                                                                                    
##  [530] "journal.pone.0000716.txt-dichlorovinyl) 2,2-dimethyl cyclopropane carboxylate and (R)"                                                                                                                                                                                                                                       
##  [531] "journal.pone.0000716.txt-alpha-cyano-3-phenoxybenzyl (1S, 3S)-3-(2,2 dichlorovinyl) 2,2-"                                                                                                                                                                                                                                    
##  [532] "--"                                                                                                                                                                                                                                                                                                                          
##  [533] "journal.pone.0000716.txt-Field netting treatment"                                                                                                                                                                                                                                                                            
##  [534] "journal.pone.0000716.txt-We applied each compound in hut treatments at a dose that"                                                                                                                                                                                                                                          
##  [535] "journal.pone.0000716.txt-closely approximated the WHO recommended field application"                                                                                                                                                                                                                                         
##  [536] "journal.pone.0000716.txt:rate. In this case we applied alphacypermethrin at 2.5 nmoles/cm2"                                                                                                                                                                                                                                  
##  [537] "journal.pone.0000716.txt-(0.03 g/m2"                                                                                                                                                                                                                                                                                         
##  [538] "journal.pone.0000716.txt-recommended use equates to 7.2 nmoles/cm2"                                                                                                                                                                                                                                                          
##  [539] "journal.pone.0000716.txt-), DDT"                                                                                                                                                                                                                                                                                             
##  [540] "--"                                                                                                                                                                                                                                                                                                                          
##  [541] "journal.pone.0000716.txt-general, mean number and corrected percent escaping from"                                                                                                                                                                                                                                           
##  [542] "journal.pone.0000716.txt-treated chambers increased with increasing concentrations of the"                                                                                                                                                                                                                                   
##  [543] "journal.pone.0000716.txt-chemical treatment (Table 1). A significant (P,0.05) contact"                                                                                                                                                                                                                                       
##  [544] "journal.pone.0000716.txt:irritancy response to alphacypermethrin was observed at treatment"                                                                                                                                                                                                                                  
##  [545] "journal.pone.0000716.txt-concentrations of 0.25 nmoles/cm2"                                                                                                                                                                                                                                                                  
##  [546] "journal.pone.0000716.txt-and higher. In other words,"                                                                                                                                                                                                                                                                        
##  [547] "journal.pone.0000716.txt:alphacypermethrin functioned as a contact irritant at all test"                                                                                                                                                                                                                                     
##  [548] "journal.pone.0000716.txt-concentrations. DDT produced significant contact irritancy"                                                                                                                                                                                                                                         
##  [549] "journal.pone.0000716.txt-responses at concentrations of 2.5 nmoles/cm2"                                                                                                                                                                                                                                                      
##  [550] "journal.pone.0000716.txt-and higher"                                                                                                                                                                                                                                                                                         
##  [551] "--"                                                                                                                                                                                                                                                                                                                          
##  [552] "journal.pone.0000716.txt-Spatial Repellent Responses"                                                                                                                                                                                                                                                                        
##  [553] "journal.pone.0000716.txt-The spatial repellent test, however, showed the mean percent"                                                                                                                                                                                                                                       
##  [554] "journal.pone.0000716.txt-responding was nearly uniform among treatment concentrations of"                                                                                                                                                                                                                                    
##  [555] "journal.pone.0000716.txt:alphacypermethrin, ranging from 8–20%, and the percent"                                                                                                                                                                                                                                             
##  [556] "journal.pone.0000716.txt-responding for dieldrin ranged from 7–17%. The mean percent"                                                                                                                                                                                                                                        
##  [557] "journal.pone.0000716.txt-Table 1. Response of female Aedes aegypti1"                                                                                                                                                                                                                                                         
##  [558] "journal.pone.0000716.txt-in the contact irritancy assay to selected chemicals in the laboratory."                                                                                                                                                                                                                            
##  [559] "--"                                                                                                                                                                                                                                                                                                                          
##  [560] "journal.pone.0000716.txt-2.5 6 (60) 3.560.4 1.860.5 1968 0.0519"                                                                                                                                                                                                                                                             
##  [561] "journal.pone.0000716.txt-25 6 (60) 4.060.2 1.060.2 3363 0.0022"                                                                                                                                                                                                                                                              
##  [562] "journal.pone.0000716.txt-250 6 (60) 6.260.6 1.560.5 5666 0.0022"                                                                                                                                                                                                                                                             
##  [563] "journal.pone.0000716.txt:a-cypermethrin 0.25 6 (60) 6.761.0 1.560.6 55618 0.0087"                                                                                                                                                                                                                                            
##  [564] "journal.pone.0000716.txt-2.5 10 (100) 5.861.0 2.160.4 51610 0.0119"                                                                                                                                                                                                                                                          
##  [565] "journal.pone.0000716.txt-25 8 (80) 5.260.6 2.060.5 53610 0.0016"                                                                                                                                                                                                                                                             
##  [566] "journal.pone.0000716.txt-250 11 (110) 5.060.4 2.260.4 71610 0.0001"                                                                                                                                                                                                                                                          
##  [567] "--"                                                                                                                                                                                                                                                                                                                          
##  [568] "journal.pone.0000716.txt-spatial activity index was calculated by factoring in the percent"                                                                                                                                                                                                                                  
##  [569] "journal.pone.0000716.txt-responding. These weighted values showed an increased response"                                                                                                                                                                                                                                     
##  [570] "journal.pone.0000716.txt-to increasing doses of DDT as well as directional movement away"                                                                                                                                                                                                                                    
##  [571] "journal.pone.0000716.txt:from the treated cylinder. With alphacypermethrin, there was no"                                                                                                                                                                                                                                    
##  [572] "journal.pone.0000716.txt-statistical significance in directional movement or increase in"                                                                                                                                                                                                                                    
##  [573] "journal.pone.0000716.txt-response with increasing concentrations (Fig 2B)."                                                                                                                                                                                                                                                  
##  [574] "journal.pone.0000716.txt-Toxic Responses"                                                                                                                                                                                                                                                                                    
##  [575] "journal.pone.0000716.txt:Of the three compounds, only alphacypermethrin gave consistent"                                                                                                                                                                                                                                     
##  [576] "journal.pone.0000716.txt-high levels (72–98% range) of knockdown at all treatment"                                                                                                                                                                                                                                           
##  [577] "journal.pone.0000716.txt-concentrations after a one hour exposure (Table 3). The two"                                                                                                                                                                                                                                        
##  [578] "journal.pone.0000716.txt:lowest concentrations of alphacypermethrin resulted in greater"                                                                                                                                                                                                                                     
##  [579] "journal.pone.0000716.txt-than 50% mortality after 24 hours (Fig 2C). One hundred percent"                                                                                                                                                                                                                                    
##  [580] "journal.pone.0000716.txt-mortality was obtained at the two higher doses. Dieldrin showed"                                                                                                                                                                                                                                    
##  [581] "journal.pone.0000716.txt-very low levels of knockdown after a one hour exposure but high"                                                                                                                                                                                                                                    
##  [582] "--"                                                                                                                                                                                                                                                                                                                          
##  [583] "journal.pone.0000716.txt-mortality at 25 nmoles/cm2"                                                                                                                                                                                                                                                                         
##  [584] "journal.pone.0000716.txt-). On the other hand, DDT showed"                                                                                                                                                                                                                                                                   
##  [585] "journal.pone.0000716.txt-Figure 2. (A) Corrected percent escape (weighted based on percent responding), (B) Weighted spatial activity index, (C) Twenty four hour"                                                                                                                                                           
##  [586] "journal.pone.0000716.txt:mortality for DDT, alphacypermethrin and dieldrin."                                                                                                                                                                                                                                                 
##  [587] "journal.pone.0000716.txt-doi:10.1371/journal.pone.0000716.g002"                                                                                                                                                                                                                                                              
##  [588] "journal.pone.0000716.txt-Actions of IRS Chemicals"                                                                                                                                                                                                                                                                           
##  [589] "journal.pone.0000716.txt-PLoS ONE | www.plosone.org 5 August 2007 | Issue 8 | e716"                                                                                                                                                                                                                                          
##  [590] "--"                                                                                                                                                                                                                                                                                                                          
##  [591] "journal.pone.0000716.txt-mosquitoes released at the control hut entered the hut. This"                                                                                                                                                                                                                                       
##  [592] "journal.pone.0000716.txt-equates to a 59% reduction in numbers entering the DDT treated"                                                                                                                                                                                                                                     
##  [593] "journal.pone.0000716.txt-hut compared to the control hut. In contrast, there were no"                                                                                                                                                                                                                                        
##  [594] "journal.pone.0000716.txt:significant differences in numbers entering the alphacypermethrin"                                                                                                                                                                                                                                  
##  [595] "journal.pone.0000716.txt-treated hut compared to the paired control hut (P = 0.24). Actual"                                                                                                                                                                                                                                  
##  [596] "journal.pone.0000716.txt:values were 198 (50%) recaptured entering the alphacypermethrin"                                                                                                                                                                                                                                    
##  [597] "journal.pone.0000716.txt-treated hut compared to 153 (39%) entering the control hut."                                                                                                                                                                                                                                        
##  [598] "journal.pone.0000716.txt-Dieldrin showed similar results in that there was no significant"                                                                                                                                                                                                                                   
##  [599] "journal.pone.0000716.txt-Table 2. Response of female Aedes aegypti1"                                                                                                                                                                                                                                                         
##  [600] "--"                                                                                                                                                                                                                                                                                                                          
##  [601] "journal.pone.0000716.txt-2.5 12 29 (5) 0.62 (0.12) 38.0 0.0010"                                                                                                                                                                                                                                                              
##  [602] "journal.pone.0000716.txt-25 12 33 (1) 0.62 (0.07) 39.0 0.0005"                                                                                                                                                                                                                                                               
##  [603] "journal.pone.0000716.txt-250 9 53 (6) 0.49 (0.05) 22.5 0.0039"                                                                                                                                                                                                                                                               
##  [604] "journal.pone.0000716.txt:a-cypermethrin 0.25 9 12 (2) 20.04 (0.23) 20.5 1.0000"                                                                                                                                                                                                                                              
##  [605] "journal.pone.0000716.txt-2.5 9 8 (4) 20.07 (0.12) 0.0 1.0000"                                                                                                                                                                                                                                                                
##  [606] "journal.pone.0000716.txt-25 10 15 (3) 0.16 (0.23) 6.5 0.4844"                                                                                                                                                                                                                                                                
##  [607] "journal.pone.0000716.txt-250 9 20 (2) 20.13 (0.21) 25.5 0.5625"                                                                                                                                                                                                                                                              
##  [608] "--"                                                                                                                                                                                                                                                                                                                          
##  [609] "journal.pone.0000716.txt-SR, signed-rank statistic derived through PROC UNIVARIATE (SAS 1999)."                                                                                                                                                                                                                              
##  [610] "journal.pone.0000716.txt-doi:10.1371/journal.pone.0000716.t002"                                                                                                                                                                                                                                                              
##  [611] "journal.pone.0000716.txt-......................................................................."                                                                                                                                                                                                                            
##  [612] "journal.pone.0000716.txt:Table 3. Knockdown (KD) and adulticide activity(MORT) of DDT, alphacypermethrin and dieldrin against female Aedes aegypti1"                                                                                                                                                                         
##  [613] "journal.pone.0000716.txt-obtained from laboratory assays."                                                                                                                                                                                                                                                                   
##  [614] "journal.pone.0000716.txt-. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ."
##  [615] "journal.pone.0000716.txt-Chemical Treatment (nmoles/cm2) Number of trials (No. mosq.) 1 h KD2"                                                                                                                                                                                                                               
##  [616] "--"                                                                                                                                                                                                                                                                                                                          
##  [617] "journal.pone.0000716.txt-2.5 3 (60) 262 563"                                                                                                                                                                                                                                                                                 
##  [618] "journal.pone.0000716.txt-25 3 (60) 060 565"                                                                                                                                                                                                                                                                                  
##  [619] "journal.pone.0000716.txt-250 6 (120) 161 1569"                                                                                                                                                                                                                                                                               
##  [620] "journal.pone.0000716.txt:a-cypermethrin 0.25 6 (120) 73613 5466"                                                                                                                                                                                                                                                             
##  [621] "journal.pone.0000716.txt-2.5 6 (120) 72618 63619"                                                                                                                                                                                                                                                                            
##  [622] "journal.pone.0000716.txt-25 6 (120) 9861 10060"                                                                                                                                                                                                                                                                              
##  [623] "journal.pone.0000716.txt-250 6 (120) 9862 10060"                                                                                                                                                                                                                                                                             
##  [624] "--"                                                                                                                                                                                                                                                                                                                          
##  [625] "journal.pone.0000716.txt-Differences between the treatment and control huts for time of"                                                                                                                                                                                                                                     
##  [626] "journal.pone.0000716.txt-entry were not statistically significant."                                                                                                                                                                                                                                                          
##  [627] "journal.pone.0000716.txt-The time trend for the exiting populations from the DDT,"                                                                                                                                                                                                                                           
##  [628] "journal.pone.0000716.txt:alphacypermethrin and dieldrin huts with their matched controls"                                                                                                                                                                                                                                    
##  [629] "journal.pone.0000716.txt-can be seen in Figure 4. There was a 14% increase in exiting from"                                                                                                                                                                                                                                  
##  [630] "journal.pone.0000716.txt-the DDT treated hut (326 mosquitoes) compared to the control"                                                                                                                                                                                                                                       
##  [631] "journal.pone.0000716.txt-hut (281 mosquitoes). A total of 18 marked mosquitoes were"                                                                                                                                                                                                                                         
##  [632] "--"                                                                                                                                                                                                                                                                                                                          
##  [633] "journal.pone.0000716.txt-period. The total return in numbers exiting from the alphacy-"                                                                                                                                                                                                                                      
##  [634] "journal.pone.0000716.txt-permethrin hut was 289 (72%) compared with 216 (54%) exiting"                                                                                                                                                                                                                                       
##  [635] "journal.pone.0000716.txt-from the control hut. The time trend is presented in Figure 3."                                                                                                                                                                                                                                     
##  [636] "journal.pone.0000716.txt:Differences in numbers exiting the alphacypermethrin treated hut"                                                                                                                                                                                                                                   
##  [637] "journal.pone.0000716.txt-compared to the matched control hut equates to a 25% increase in"                                                                                                                                                                                                                                   
##  [638] "journal.pone.0000716.txt-exiting. A total of 64 marked mosquitoes were collected from the"                                                                                                                                                                                                                                   
##  [639] "journal.pone.0000716.txt:floor in the alphacypermethrin treated hut. All knocked down"                                                                                                                                                                                                                                       
##  [640] "journal.pone.0000716.txt-specimens were dead at the end of the 24-h holding period. For"                                                                                                                                                                                                                                     
##  [641] "journal.pone.0000716.txt-dieldrin, considerably more mosquitoes were collected exiting the"                                                                                                                                                                                                                                  
##  [642] "journal.pone.0000716.txt-control hut (76 females) than the treated hut (29 females). Few"                                                                                                                                                                                                                                    
##  [643] "--"                                                                                                                                                                                                                                                                                                                          
##  [644] "journal.pone.0000716.txt-collection when the greatest number of Ae. aegypti were still able to"                                                                                                                                                                                                                              
##  [645] "journal.pone.0000716.txt-escape, we found very little difference in exiting between treatment"                                                                                                                                                                                                                               
##  [646] "journal.pone.0000716.txt-(20 females) and control huts (17 females)."                                                                                                                                                                                                                                                        
##  [647] "journal.pone.0000716.txt:Figure 3. Entering Ae. aegypti by time for treated and matched control huts using DDT, alphacypermethrin and dieldrin."                                                                                                                                                                             
##  [648] "journal.pone.0000716.txt-doi:10.1371/journal.pone.0000716.g003"                                                                                                                                                                                                                                                              
##  [649] "journal.pone.0000716.txt-Actions of IRS Chemicals"                                                                                                                                                                                                                                                                           
##  [650] "journal.pone.0000716.txt-PLoS ONE | www.plosone.org 7 August 2007 | Issue 8 | e716"                                                                                                                                                                                                                                          
##  [651] "--"                                                                                                                                                                                                                                                                                                                          
##  [652] "journal.pone.0000716.txt-was an increase of 31% exiting over that observed in the control"                                                                                                                                                                                                                                   
##  [653] "journal.pone.0000716.txt-hut during the first half of the day. The results for alphacyperme-"                                                                                                                                                                                                                                
##  [654] "journal.pone.0000716.txt-thrin were more dramatic. A total of 281 mosquitoes exited the"                                                                                                                                                                                                                                     
##  [655] "journal.pone.0000716.txt:alphacypermethrin hut by 1200 hr with an additional 51"                                                                                                                                                                                                                                             
##  [656] "journal.pone.0000716.txt-mosquitoes collected in the hut as knockdown. A total of 146"                                                                                                                                                                                                                                       
##  [657] "journal.pone.0000716.txt-marked mosquitoes were collected from the exit traps in the"                                                                                                                                                                                                                                        
##  [658] "journal.pone.0000716.txt-control huts in the first half of the collection with only 2 specimens"                                                                                                                                                                                                                             
##  [659] "journal.pone.0000716.txt-on the floor (knocked down). This equated to a 55% increase in"                                                                                                                                                                                                                                     
##  [660] "journal.pone.0000716.txt:exiting mosquitoes by midday from the alphacypermethrin treated"                                                                                                                                                                                                                                    
##  [661] "journal.pone.0000716.txt-hut compared to the matched control hut. This same treatment of"                                                                                                                                                                                                                                    
##  [662] "journal.pone.0000716.txt-the data was not performed for dieldrin due to its extreme toxicity"                                                                                                                                                                                                                                
##  [663] "journal.pone.0000716.txt-and lack of a behavior modifying action."                                                                                                                                                                                                                                                           
##  [664] "--"                                                                                                                                                                                                                                                                                                                          
##  [665] "journal.pone.0000716.txt-for 24 hrs, a total of 251 remained alive (76% survival rate)"                                                                                                                                                                                                                                      
##  [666] "journal.pone.0000716.txt-compared to 278 (99% survival rate) remaining alive for the control."                                                                                                                                                                                                                               
##  [667] "journal.pone.0000716.txt-Of those that were on the floor (knocked down) inside the hut, only 1"                                                                                                                                                                                                                              
##  [668] "journal.pone.0000716.txt:(6%) remained alive. In the alphacypermethrin hut, 205 (71%"                                                                                                                                                                                                                                        
##  [669] "journal.pone.0000716.txt-survival rate) mosquitoes removed from the traps remained alive,"                                                                                                                                                                                                                                   
##  [670] "journal.pone.0000716.txt-compared to 212 (98% survival rate) that remained alive from the"                                                                                                                                                                                                                                   
##  [671] "journal.pone.0000716.txt-control traps. All the mosquitoes that were collected in the hut that"                                                                                                                                                                                                                              
##  [672] "--"                                                                                                                                                                                                                                                                                                                          
##  [673] "journal.pone.0000716.txt-proportions repelled (spatial repellency), proportions stimulated"                                                                                                                                                                                                                                  
##  [674] "journal.pone.0000716.txt-to prematurely exit (contact irritancy), and proportions that died"                                                                                                                                                                                                                                 
##  [675] "journal.pone.0000716.txt-(toxicity). Estimates of proportions repelled were taken from hut"                                                                                                                                                                                                                                  
##  [676] "journal.pone.0000716.txt:entry data. For DDT, alphacypermethrin and dieldrin the"                                                                                                                                                                                                                                            
##  [677] "journal.pone.0000716.txt-proportions repelled were 59%, 0% and 0% respectively. Contact"                                                                                                                                                                                                                                     
##  [678] "journal.pone.0000716.txt:Figure 4. Exiting Ae. aegypti by time for treated and matched control huts using DDT, alphacypermethrin and dieldrin."                                                                                                                                                                              
##  [679] "journal.pone.0000716.txt-doi:10.1371/journal.pone.0000716.g004"                                                                                                                                                                                                                                                              
##  [680] "journal.pone.0000716.txt-Actions of IRS Chemicals"                                                                                                                                                                                                                                                                           
##  [681] "journal.pone.0000716.txt-PLoS ONE | www.plosone.org 8 August 2007 | Issue 8 | e716"                                                                                                                                                                                                                                          
##  [682] "journal.pone.0000716.txt-\firritant actions were measured by numbers escaping into exit traps"                                                                                                                                                                                                                               
##  [683] "journal.pone.0000716.txt-during the first 7 hours of observations. The proportions exiting"                                                                                                                                                                                                                                  
##  [684] "journal.pone.0000716.txt:were 31% (DDT), 55% (alphacypermethrin) and 0% (dieldrin)."                                                                                                                                                                                                                                         
##  [685] "journal.pone.0000716.txt-Toxicity was estimated from two parameters; number dead on the"                                                                                                                                                                                                                                     
##  [686] "journal.pone.0000716.txt-floor and number in exit traps that died after 24 hours. The two"                                                                                                                                                                                                                                   
##  [687] "journal.pone.0000716.txt-parameters for DDT were 5% dead on the floor, and 11% of those"                                                                                                                                                                                                                                     
##  [688] "--"                                                                                                                                                                                                                                                                                                                          
##  [689] "journal.pone.0000716.txt-24 hours each day, these statistics cover only 7 hours, not 24."                                                                                                                                                                                                                                    
##  [690] "journal.pone.0000716.txt-These statistics suggest that DDT reduced risk from 100"                                                                                                                                                                                                                                            
##  [691] "journal.pone.0000716.txt-mosquitoes by 73% within the first 7 hours."                                                                                                                                                                                                                                                        
##  [692] "journal.pone.0000716.txt:In huts sprayed with alphacypermethrin, all 100 mosquitoes"                                                                                                                                                                                                                                         
##  [693] "journal.pone.0000716.txt-would enter the house. Of the 100 that entered, 15 would die. Of"                                                                                                                                                                                                                                   
##  [694] "journal.pone.0000716.txt-the remaining 85, 46 would exit prematurely and 9 of those would"                                                                                                                                                                                                                                   
##  [695] "journal.pone.0000716.txt-die. This leaves 39 mosquitoes that theoretically could bite and"                                                                                                                                                                                                                                   
##  [696] "journal.pone.0000716.txt-survive. The spatial repellent, contact irritant, and toxic actions of"                                                                                                                                                                                                                             
##  [697] "journal.pone.0000716.txt:alphacypermethrin sum to 61% protection."                                                                                                                                                                                                                                                           
##  [698] "journal.pone.0000716.txt-In huts sprayed with dieldrin, all 100 mosquitoes would enter"                                                                                                                                                                                                                                      
##  [699] "journal.pone.0000716.txt-the house. Of the 100 that enter, 75 would die before exiting. Of"                                                                                                                                                                                                                                  
##  [700] "journal.pone.0000716.txt-the 25 that exit, 17 would escape and subsequently die. This would"                                                                                                                                                                                                                                 
##  [701] "--"                                                                                                                                                                                                                                                                                                                          
##  [702] "journal.pone.0000716.txt-permethrin to function primarily as a contact irritant and secondarily"                                                                                                                                                                                                                             
##  [703] "journal.pone.0000716.txt-as a toxicant, but it does not elicit a significant spatial repellent"                                                                                                                                                                                                                              
##  [704] "journal.pone.0000716.txt-response with Ae. aegypti mosquitoes. Prior hut studies against malaria"                                                                                                                                                                                                                            
##  [705] "journal.pone.0000716.txt:vectors confirmed these findings with alphacypermethrin as general"                                                                                                                                                                                                                                 
##  [706] "journal.pone.0000716.txt-characteristics of pyrethroid insecticides [15]. Dieldrin functioned"                                                                                                                                                                                                                               
##  [707] "journal.pone.0000716.txt-primarily as a toxicant but shows no behavior modifying actions,"                                                                                                                                                                                                                                   
##  [708] "journal.pone.0000716.txt-which seems to increase its killing potential."                                                                                                                                                                                                                                                     
##  [709] "--"                                                                                                                                                                                                                                                                                                                          
##  [710] "journal.pone.0000716.txt-through the mechanism of spatial repellency means that DDT"                                                                                                                                                                                                                                         
##  [711] "journal.pone.0000716.txt-basically functions as a form of chemical screening, which stops"                                                                                                                                                                                                                                   
##  [712] "journal.pone.0000716.txt-mosquitoes from entering houses and transmitting malaria."                                                                                                                                                                                                                                          
##  [713] "journal.pone.0000716.txt:Alphacypermethrin, on the other hand, is primarily a contact"                                                                                                                                                                                                                                       
##  [714] "journal.pone.0000716.txt-irritant and a toxicant as exhibited by the pronounced exiting"                                                                                                                                                                                                                                     
##  [715] "journal.pone.0000716.txt-response and high knockdown in laboratory assays and inside the"                                                                                                                                                                                                                                    
##  [716] "journal.pone.0000716.txt-huts. However, this compound did not elicit a repellent response"                                                                                                                                                                                                                                   
##  [717] "--"                                                                                                                                                                                                                                                                                                                          
##  [718] "journal.pone.0001549.txt-The availability and use of medicines to control sea lice burdens"                                                                                                                                                                                                                                  
##  [719] "journal.pone.0001549.txt-in Scotland has changed considerably in the last decade and since"                                                                                                                                                                                                                                  
##  [720] "journal.pone.0001549.txt-2005 only two therapeutants have been in common use; the"                                                                                                                                                                                                                                           
##  [721] "journal.pone.0001549.txt:topical treatment cypermethrin (ExcisH, Novartis Animal Health)"                                                                                                                                                                                                                                    
##  [722] "journal.pone.0001549.txt-and the in-feed treatment emamectin benzoate (SLICEH, Schering"                                                                                                                                                                                                                                     
##  [723] "journal.pone.0001549.txt-Plough Animal Health). Both ectoparasiticides are widely used"                                                                                                                                                                                                                                      
##  [724] "journal.pone.0001549.txt-and, since obtaining UK Market Authorisation in 2000, the use of"                                                                                                                                                                                                                                   
##  [725] "--"                                                                                                                                                                                                                                                                                                                          
##  [726] "journal.pone.0001549.txt-an in-feed therapeutant, it can be safely and effectively"                                                                                                                                                                                                                                          
##  [727] "journal.pone.0001549.txt-administered during adverse weather conditions and whole sites/"                                                                                                                                                                                                                                    
##  [728] "journal.pone.0001549.txt-loch systems can be medicated in a coordinated manner."                                                                                                                                                                                                                                             
##  [729] "journal.pone.0001549.txt:Cypermethrin bath treatments are more labour intensive and"                                                                                                                                                                                                                                         
##  [730] "journal.pone.0001549.txt-can be stressful to the fish; these interventions are applied more"                                                                                                                                                                                                                                 
##  [731] "journal.pone.0001549.txt-frequently toward the end of the production cycle when salmon"                                                                                                                                                                                                                                      
##  [732] "journal.pone.0001549.txt-are larger and in-feed treatments are consequently more costly."                                                                                                                                                                                                                                    
##  [733] "--"                                                                                                                                                                                                                                                                                                                          
##  [734] "journal.pone.0001549.txt-which did not have the necessary pre/post treatment sea lice data"                                                                                                                                                                                                                                  
##  [735] "journal.pone.0001549.txt-required for further efficacy analysis. Of the remaining 108"                                                                                                                                                                                                                                       
##  [736] "journal.pone.0001549.txt-treatments, 22 were followed-up with another sea lice treatment"                                                                                                                                                                                                                                    
##  [737] "journal.pone.0001549.txt:(either cypermethrin or emamectin benzoate) within 12 weeks."                                                                                                                                                                                                                                       
##  [738] "journal.pone.0001549.txt-A summary of the treatment episodes in each of the data sets is"                                                                                                                                                                                                                                    
##  [739] "journal.pone.0001549.txt-presented in Table 2. The number of treatment episodes, and sites"                                                                                                                                                                                                                                  
##  [740] "journal.pone.0001549.txt-on which they were administered, varied over the five-year period"                                                                                                                                                                                                                                  
##  [741] "--"                                                                                                                                                                                                                                                                                                                          
##  [742] "journal.pone.0001549.txt-doi:10.1371/journal.pone.0001549.t002"                                                                                                                                                                                                                                                              
##  [743] "journal.pone.0001549.txt-Efficacy of Emamectin Benzoate"                                                                                                                                                                                                                                                                     
##  [744] "journal.pone.0001549.txt-PLoS ONE | www.plosone.org 3 February 2008 | Volume 3 | Issue 2 | e1549"                                                                                                                                                                                                                            
##  [745] "journal.pone.0001549.txt:\fthey were followed up with at least one cypermethrin treatment"                                                                                                                                                                                                                                   
##  [746] "journal.pone.0001549.txt-within a matter of weeks. The other difference of note was the"                                                                                                                                                                                                                                     
##  [747] "journal.pone.0001549.txt-lower proportion of effective treatments present within the"                                                                                                                                                                                                                                        
##  [748] "journal.pone.0001549.txt-reduced data set. However, of the 77 treatments that were"                                                                                                                                                                                                                                          
##  [749] "--"                                                                                                                                                                                                                                                                                                                          
##  [750] "journal.pone.0001549.txt-former method is better suited to regions where only one sea lice"                                                                                                                                                                                                                                  
##  [751] "journal.pone.0001549.txt-medicine is available for use [23] as it is difficult to compare in-"                                                                                                                                                                                                                               
##  [752] "journal.pone.0001549.txt-feed emamectin benzoate treatments alone with emamectin"                                                                                                                                                                                                                                            
##  [753] "journal.pone.0001549.txt:benzoate and topical cypermethrin treatments. Assessing efficacy"                                                                                                                                                                                                                                   
##  [754] "journal.pone.0001549.txt-over the entire production cycle can also become complicated if"                                                                                                                                                                                                                                    
##  [755] "journal.pone.0001549.txt-stocks are split between sites for the second year of production or"                                                                                                                                                                                                                                
##  [756] "journal.pone.0001549.txt-when the length of time that fish are at sea varies between sites and"                                                                                                                                                                                                                              
##  [757] "--"                                                                                                                                                                                                                                                                                                                          
##  [758] "journal.pone.0002284.txt-xylostella to the Cry1C protein, presented in Cry1C-expressing"                                                                                                                                                                                                                                     
##  [759] "journal.pone.0002284.txt-plants or as a purified toxin or in a formulated insecticide, and to"                                                                                                                                                                                                                               
##  [760] "journal.pone.0002284.txt-four commonly used insecticides against P. xylostella: spinosad, l-"                                                                                                                                                                                                                                
##  [761] "journal.pone.0002284.txt:cyhalothrin, cypermethrin and indoxacarb. Then we assessed"                                                                                                                                                                                                                                         
##  [762] "journal.pone.0002284.txt-parasitism by D. insulare in populations of P. xylostella that were"                                                                                                                                                                                                                                
##  [763] "journal.pone.0002284.txt-resistant or susceptible to Cry1C or the insecticides, and also the"                                                                                                                                                                                                                                
##  [764] "journal.pone.0002284.txt-direct effects of these materials on D. insulare."                                                                                                                                                                                                                                                  
##  [765] "--"                                                                                                                                                                                                                                                                                                                          
##  [766] "journal.pone.0002284.txt-(resistance ratio (RR) = LC50 of tested strain/LC50 of the"                                                                                                                                                                                                                                         
##  [767] "journal.pone.0002284.txt-susceptible strain G88) of 8,445 to spinosad, while the Waipio"                                                                                                                                                                                                                                     
##  [768] "journal.pone.0002284.txt-strain showed a high level of resistance to indoxacarb (RR = 321),"                                                                                                                                                                                                                                 
##  [769] "journal.pone.0002284.txt:l-cyhalothrin (RR = 4,700) and cypermethrin (RR = 373). The"                                                                                                                                                                                                                                        
##  [770] "journal.pone.0002284.txt-Cry1C-resistant strain had RR values of 1,436 to the formulated"                                                                                                                                                                                                                                    
##  [771] "journal.pone.0002284.txt-Cry1C product (MC) and .4,167 to purified 1C."                                                                                                                                                                                                                                                      
##  [772] "journal.pone.0002284.txt-We confirmed that most individuals of the resistant P. xylostella"                                                                                                                                                                                                                                  
##  [773] "--"                                                                                                                                                                                                                                                                                                                          
##  [774] "journal.pone.0002284.txt-this was not significantly different from the control group. All"                                                                                                                                                                                                                                   
##  [775] "journal.pone.0002284.txt-tested insecticides were very toxic to D. insulare, in comparison with"                                                                                                                                                                                                                             
##  [776] "journal.pone.0002284.txt-purified Cry1C and the Cry1C plant. All D. insulare adults died"                                                                                                                                                                                                                                    
##  [777] "journal.pone.0002284.txt:after contacting residues of l-cyhalothrin for 2 h, cypermethrin"                                                                                                                                                                                                                                   
##  [778] "journal.pone.0002284.txt-and spinosad for 12 h, and indoxacarb for 24 h."                                                                                                                                                                                                                                                    
##  [779] "journal.pone.0002284.txt-Discussion"                                                                                                                                                                                                                                                                                         
##  [780] "journal.pone.0002284.txt-One of the perceived risks associated with growing Bt plants is"                                                                                                                                                                                                                                    
##  [781] "--"                                                                                                                                                                                                                                                                                                                          
##  [782] "journal.pone.0002284.txt-insecticides to some parasitoids, either through contact or"                                                                                                                                                                                                                                        
##  [783] "journal.pone.0002284.txt-ingestion, has been frequently reported [31–33]. In our study, all"                                                                                                                                                                                                                                 
##  [784] "journal.pone.0002284.txt-parasitoids were killed within 24 h in our contact bioassays with l-"                                                                                                                                                                                                                               
##  [785] "journal.pone.0002284.txt:cyhalothrin, cypermethrin, spinosad, and indoxacarb, while none"                                                                                                                                                                                                                                    
##  [786] "journal.pone.0002284.txt-died from the Cry1C toxin or Cry1C broccoli plants (Table 2)."                                                                                                                                                                                                                                      
##  [787] "journal.pone.0002284.txt-Similarly, in contact bioassays Xu et al. [32] found l-cyhalothrin,"                                                                                                                                                                                                                                
##  [788] "journal.pone.0002284.txt-indoxacarb, and spinosad had dramatic negative effects on D."                                                                                                                                                                                                                                       
##  [789] "--"                                                                                                                                                                                                                                                                                                                          
##  [790] "journal.pone.0002284.txt-difference"                                                                                                                                                                                                                                                                                         
##  [791] "journal.pone.0002284.txt-2 12 24 48 72"                                                                                                                                                                                                                                                                                      
##  [792] "journal.pone.0002284.txt-Indoxacarb 80 15 0 - - B"                                                                                                                                                                                                                                                                           
##  [793] "journal.pone.0002284.txt:Cypermethrin 20 0 - - - C"                                                                                                                                                                                                                                                                          
##  [794] "journal.pone.0002284.txt-l-cyhalothrin 0 - - - - D"                                                                                                                                                                                                                                                                          
##  [795] "journal.pone.0002284.txt-Spinosad 15 0 - - - C"                                                                                                                                                                                                                                                                              
##  [796] "journal.pone.0002284.txt-MC (Cry1C) 100 100 100 100 100 A"                                                                                                                                                                                                                                                                   
##  [797] "--"                                                                                                                                                                                                                                                                                                                          
##  [798] "journal.pone.0002284.txt-Parasitoids may influence the evolution of resistance in their"                                                                                                                                                                                                                                     
##  [799] "journal.pone.0002284.txt-host populations. Populations of parasitoids will be disadvantaged"                                                                                                                                                                                                                                 
##  [800] "journal.pone.0002284.txt-when the commonly used formulated insecticides we tested (l-"                                                                                                                                                                                                                                       
##  [801] "journal.pone.0002284.txt:cyhalothrin, cypermethrin,indoxacarb, and spinosad) are applied"                                                                                                                                                                                                                                    
##  [802] "journal.pone.0002284.txt-in the field compared to application or transgenic expression of the"                                                                                                                                                                                                                               
##  [803] "journal.pone.0002284.txt-lepidopteran-active Cry toxins expressed in plants. Decreased"                                                                                                                                                                                                                                      
##  [804] "journal.pone.0002284.txt-parasitoid populations would likely allow higher pest populations"                                                                                                                                                                                                                                  
##  [805] "--"                                                                                                                                                                                                                                                                                                                          
##  [806] "journal.pone.0002284.txt-(Cry1C-R) which can easily survive on Cry1C Bt broccoli plants"                                                                                                                                                                                                                                     
##  [807] "journal.pone.0002284.txt-[17,36,37]; 2) Pearl strain which has a high level of resistance to"                                                                                                                                                                                                                                
##  [808] "journal.pone.0002284.txt-spinosad [38]; 3) Waipio strain which is resistant to indoxacarb"                                                                                                                                                                                                                                   
##  [809] "journal.pone.0002284.txt:[14], l-cyhalothrin and cypermethrin and; 4) Geneva 88 strain"                                                                                                                                                                                                                                      
##  [810] "journal.pone.0002284.txt-[12,16] which is susceptible to Cry1C and conventional insecti-"                                                                                                                                                                                                                                    
##  [811] "journal.pone.0002284.txt-cides. The hymenopteran endoparasitoid, Diadegma insulare, was"                                                                                                                                                                                                                                     
##  [812] "journal.pone.0002284.txt-originally field collected in Florida and subsequently reared in our"                                                                                                                                                                                                                               
##  [813] "--"                                                                                                                                                                                                                                                                                                                          
##  [814] "journal.pone.0002284.txt-xylostella, were tested: spinosad (SpinTor 2 SC, Dow AgroSciences,"                                                                                                                                                                                                                                 
##  [815] "journal.pone.0002284.txt-Indianapolis, IN), indoxacarb (Avaunt 30% WDG, DuPont Crop"                                                                                                                                                                                                                                         
##  [816] "journal.pone.0002284.txt-Protection, Newark, DE), l-cyhalothrin (Warrior T 1CS, Zeneca"                                                                                                                                                                                                                                      
##  [817] "journal.pone.0002284.txt:Ag, Wilmington DE) and cypermethrin (Ammo 2.5 EC, FMC Co.,"                                                                                                                                                                                                                                         
##  [818] "journal.pone.0002284.txt-Philadelphia, PA)."                                                                                                                                                                                                                                                                                 
##  [819] "journal.pone.0002284.txt-Impact of Bt Plants, Cry1C Toxin and Formulated"                                                                                                                                                                                                                                                    
##  [820] "journal.pone.0002284.txt-Insecticides on Different P. xylostella Strains"                                                                                                                                                                                                                                                    
##  [821] "--"                                                                                                                                                                                                                                                                                                                          
##  [822] "journal.pone.0002284.txt-chamber. Mortality of P. xylostella was recorded by correcting the"                                                                                                                                                                                                                                 
##  [823] "journal.pone.0002284.txt-parasitism rate of D. insulare on spinosad-treated P. xylostella from"                                                                                                                                                                                                                              
##  [824] "journal.pone.0002284.txt-the Pearl strain. Mortalities of the Waipio strain (after treatment"                                                                                                                                                                                                                                
##  [825] "journal.pone.0002284.txt:with 50 mg (AI)/L of indoxacarb, l-cyhalothrin or cypermethrin)"                                                                                                                                                                                                                                    
##  [826] "journal.pone.0002284.txt-and Cry1C-R strain (feeding on 1000 mg (AI)/L MC and purified"                                                                                                                                                                                                                                      
##  [827] "journal.pone.0002284.txt-Cry1C treated broccoli leaves or Cry1C broccoli leaves for 2 d)"                                                                                                                                                                                                                                    
##  [828] "journal.pone.0002284.txt-were investigated as described above for the Pearl strain."                                                                                                                                                                                                                                         
##  [829] "--"                                                                                                                                                                                                                                                                                                                          
##  [830] "journal.pone.0002284.txt-Second instar P. xylostella were fed with insecticide-treated or"                                                                                                                                                                                                                                   
##  [831] "journal.pone.0002284.txt-Cry1C toxin-treated broccoli leaves or Cry1C broccoli leaves for"                                                                                                                                                                                                                                   
##  [832] "journal.pone.0002284.txt-24 h, before exposure to D. insulare. The concentration of"                                                                                                                                                                                                                                         
##  [833] "journal.pone.0002284.txt:indoxacarb, l-cyhalothrin or cypermethrin solutions used for leaf"                                                                                                                                                                                                                                  
##  [834] "journal.pone.0002284.txt-treatments was 50 mg (AI)/L with 0.1% Bond spreader sticker; the"                                                                                                                                                                                                                                   
##  [835] "journal.pone.0002284.txt-concentration of the spinosad solution was 100 mg (AI)/L; the"                                                                                                                                                                                                                                      
##  [836] "journal.pone.0002284.txt-concentration of the MC or purified Cry1C solution was 1000 mg"                                                                                                                                                                                                                                     
##  [837] "--"                                                                                                                                                                                                                                                                                                                          
##  [838] "journal.pone.0002284.txt-Contact Toxicity of Bt Plants, Cry1C or Formulated"                                                                                                                                                                                                                                                 
##  [839] "journal.pone.0002284.txt-Insecticides to D. insulare"                                                                                                                                                                                                                                                                        
##  [840] "journal.pone.0002284.txt-The same concentration of each insecticide used above (50 mg"                                                                                                                                                                                                                                       
##  [841] "journal.pone.0002284.txt:(AI)/L for indoxacarb, l-cyhalothrin and cypermethrin; 100 mg"                                                                                                                                                                                                                                      
##  [842] "journal.pone.0002284.txt-(AI)/L for spinosad) was used for evaluating contact toxicity to D."                                                                                                                                                                                                                                
##  [843] "journal.pone.0002284.txt-insulare adults, compared with the Cry1C toxin (1000 mg (AI)/L)"                                                                                                                                                                                                                                    
##  [844] "journal.pone.0002284.txt-and a Cry1C broccoli plant. Glass vials (length 9.5 cm, dia. 2.5 cm)"                                                                                                                                                                                                                               
##  [845] "--"                                                                                                                                                                                                                                                                                                                          
##  [846] "journal.pone.0004161.txt-the effect of salubrinal could also be recapitulated by another"                                                                                                                                                                                                                                    
##  [847] "journal.pone.0004161.txt-inhibitor of this phosphatase. For this purpose cantharidin, was"                                                                                                                                                                                                                                   
##  [848] "journal.pone.0004161.txt-selected, which is less toxic than okadaic acid, but which also"                                                                                                                                                                                                                                    
##  [849] "journal.pone.0004161.txt:blocks PP1 (IC50 = 1.7 mM) activities [21]. Cypermethrin was also"                                                                                                                                                                                                                                  
##  [850] "journal.pone.0004161.txt-tested for comparison, which is a specific inhibitor of calcineurin/"                                                                                                                                                                                                                               
##  [851] "journal.pone.0004161.txt-PP2B (IC50 = 40 pM). Neither cantharidin nor okadaic acid can"                                                                                                                                                                                                                                      
##  [852] "journal.pone.0004161.txt-inhibit activities of this phosphatase."                                                                                                                                                                                                                                                            
##  [853] "journal.pone.0004161.txt-Only the co-administration of 0.5 mM cantharidin (Fig. 6C)"                                                                                                                                                                                                                                         
##  [854] "journal.pone.0004161.txt:but not of 10 mM cypermethrin (Fig. 6D) increased the PSI or"                                                                                                                                                                                                                                       
##  [855] "journal.pone.0004161.txt-PSI/VPA-related toxicity. This concentration of cantharidin is"                                                                                                                                                                                                                                     
##  [856] "journal.pone.0004161.txt-well below the reported IC50 for growth inhibition of various"                                                                                                                                                                                                                                      
##  [857] "journal.pone.0004161.txt-tumor cell lines [22]. Like salubrinal both phosphatase inhibitors"                                                                                                                                                                                                                                 
##  [858] "--"                                                                                                                                                                                                                                                                                                                          
##  [859] "journal.pone.0004161.txt-K562 cells were exposed to 100 nM of the proteasome inhibitor MG132, 10 mM salubrinal and VPA for 18 h as indicated, after which apoptosis"                                                                                                                                                         
##  [860] "journal.pone.0004161.txt-induction was assessed by fluorescence activated cell sorting of cells with a subdiploid (G,2N) DNA content. CHX was used at a concentration of"                                                                                                                                                    
##  [861] "journal.pone.0004161.txt-1 mg/ml. (B) K562 cells were treated as in (A), except that 5 nM bortezomib (PS-341) was used as proteasome inhibitor. (C, D) K562 cells were treated"                                                                                                                                              
##  [862] "journal.pone.0004161.txt:and analyzed as in (A) except that in (C) salubrinal was substituted by 0.5 mM cantharidin and in (D) by 10 mM cypermethrin. (E) Whole-cell lysates"                                                                                                                                                
##  [863] "journal.pone.0004161.txt-were analyzed by Western blot experiments, in which membranes were sequentially probed for P- eIF2a, eIF2a, PARP and ß-tubulin or KDEL, GADD34"                                                                                                                                                     
##  [864] "journal.pone.0004161.txt-and ß-tubulin. Each experimental condition was performed in triplicate, and the mean6SD from a representative experiment out of two to three"                                                                                                                                                       
##  [865] "journal.pone.0004161.txt-independent experiments is shown."                                                                                                                                                                                                                                                                  
##  [866] "--"                                                                                                                                                                                                                                                                                                                          
##  [867] "journal.pone.0004161.txt-supported by the observation that substitution of salubrinal with"                                                                                                                                                                                                                                  
##  [868] "journal.pone.0004161.txt-subtoxic concentrations of the phosphatase inhibitor cantharidin"                                                                                                                                                                                                                                   
##  [869] "journal.pone.0004161.txt-induced a comparable increase in PSI-mediated cytotoxicity,"                                                                                                                                                                                                                                        
##  [870] "journal.pone.0004161.txt:whereas the PP2B/calcineurin inhibitor cypermethrin proved to"                                                                                                                                                                                                                                      
##  [871] "journal.pone.0004161.txt-be ineffective. Moreover, overexpression of a dominant-negative"                                                                                                                                                                                                                                    
##  [872] "journal.pone.0004161.txt-eIF2a S51A variant did not affect PSI/salubrinal–mediated"                                                                                                                                                                                                                                          
##  [873] "journal.pone.0004161.txt-apoptosis (Fig. 11) and upregulation of ATF and CHOP, two"                                                                                                                                                                                                                                          
##  [874] "--"                                                                                                                                                                                                                                                                                                                          
##  [875] "journal.pone.0004569.txt-Populations from Southwest Uganda. J Infect Dis 197: 1598–1604."                                                                                                                                                                                                                                    
##  [876] "journal.pone.0004569.txt-25. Maxwell CA, Chambo W, Mwaimu M, Magogo F, Carneiro IA, et al. (2003)"                                                                                                                                                                                                                           
##  [877] "journal.pone.0004569.txt-Variation of malaria transmission and morbidity with altitude in Tanzania and"                                                                                                                                                                                                                      
##  [878] "journal.pone.0004569.txt:with introduction of alphacypermethrin treated nets. Malar J 2: 28."                                                                                                                                                                                                                                
##  [879] "journal.pone.0004569.txt-26. GlaxoSmithKline (2008) Update on GSK’s malaria treatments: Dacart and"                                                                                                                                                                                                                          
##  [880] "journal.pone.0004569.txt-Lapdap. http://www.gsk.com/media/pressreleases/2008/2008_pressrelease_"                                                                                                                                                                                                                             
##  [881] "journal.pone.0004569.txt-0014.htm."                                                                                                                                                                                                                                                                                          
##  [882] "--"                                                                                                                                                                                                                                                                                                                          
##  [883] "journal.pone.0008735.txt-America 89: 10920–10924."                                                                                                                                                                                                                                                                           
##  [884] "journal.pone.0008735.txt-30. Sasabe M, Wen Z, Berenbaum MR, Schuler MA (2004) Molecular analysis of"                                                                                                                                                                                                                         
##  [885] "journal.pone.0008735.txt-CYP321A1, a novel cytochrome P450 involved in metabolism of plant"                                                                                                                                                                                                                                  
##  [886] "journal.pone.0008735.txt:allelochemicals (furanocoumarins) and insecticides (cypermethrin) in Helicoverpa"                                                                                                                                                                                                                   
##  [887] "journal.pone.0008735.txt-zea. Gene 338: 163–175."                                                                                                                                                                                                                                                                            
##  [888] "journal.pone.0008735.txt-31. Glendinning JI (2002) How do herbivorous insects cope with noxious secondary"                                                                                                                                                                                                                   
##  [889] "journal.pone.0008735.txt-plant compounds in their diet? Entomologia Experimentalis et Applicata 104:"                                                                                                                                                                                                                        
##  [890] "--"                                                                                                                                                                                                                                                                                                                          
##  [891] "journal.pone.0008988.txt-475–484."                                                                                                                                                                                                                                                                                           
##  [892] "journal.pone.0008988.txt-36. Maxwell CA, Chambo W, Mwaimu M, Magogo F, Carneiro IA, et al. (2003)"                                                                                                                                                                                                                           
##  [893] "journal.pone.0008988.txt-Variation of malaria transmission and morbidity with altitude in Tanzania and"                                                                                                                                                                                                                      
##  [894] "journal.pone.0008988.txt:with introduction of alphacypermethrin treated nets. Malar J 2: 28."                                                                                                                                                                                                                                
##  [895] "journal.pone.0008988.txt-37. Baird JK, Owusu AS, Utz GC, Koram K, Barcus MJ, et al. (2002) Seasonal"                                                                                                                                                                                                                         
##  [896] "journal.pone.0008988.txt-malaria attack rates in infants and young children in northern Ghana."                                                                                                                                                                                                                              
##  [897] "journal.pone.0008988.txt-Am J Trop Med Hyg 66: 280–286."                                                                                                                                                                                                                                                                     
##  [898] "--"                                                                                                                                                                                                                                                                                                                          
##  [899] "journal.pone.0009244.txt-5. Statistics NBo (2002) United Republic of Tanzania: National Census."                                                                                                                                                                                                                             
##  [900] "journal.pone.0009244.txt-6. Maxwell CA, Chambo W, Mwaimu M, Magogo F, Carneiro IA, et al. (2003)"                                                                                                                                                                                                                            
##  [901] "journal.pone.0009244.txt-Variation of malaria transmission and morbidity with altitude in"                                                                                                                                                                                                                                   
##  [902] "journal.pone.0009244.txt:Tanzania and with introduction of alphacypermethrin treated nets."                                                                                                                                                                                                                                  
##  [903] "journal.pone.0009244.txt-Malar J 2: 28."                                                                                                                                                                                                                                                                                     
##  [904] "journal.pone.0009244.txt-7. Edmonds SM, Meadway J (2009) Getting Pregnant Women onto HAART"                                                                                                                                                                                                                                  
##  [905] "journal.pone.0009244.txt-(Highly active antiretroviral therapy); developing a strategy for advanced"                                                                                                                                                                                                                         
##  [906] "--"                                                                                                                                                                                                                                                                                                                          
##  [907] "journal.pone.0009754.txt-Aldicarb sulfone S CARB 15 208 7.2 49.6 18.0 27.5 45.8 48.1 31.0 2.8 10.0"                                                                                                                                                                                                                          
##  [908] "journal.pone.0009754.txt-Iprodione FUNG 14 208 6.7 636.0 32.6 164.5 555.2 586.6 269.7 52.4 10.0"                                                                                                                                                                                                                             
##  [909] "journal.pone.0009754.txt-Pyrethrins PYR 13 208 6.3 222.0 19.0 78.7 151.4 181.2 84.5 16.9 20.0"                                                                                                                                                                                                                               
##  [910] "journal.pone.0009754.txt:Cypermethrin PYR 13 258 5.0 131.0 4.5 13.2 95.3 114.8 31.2 11.4 1.0"                                                                                                                                                                                                                                
##  [911] "journal.pone.0009754.txt-Norflurazon S HERB 13 208 6.3 38.1 1.1 2.9 5.6 18.7 5.8 2.7 1.0"                                                                                                                                                                                                                                    
##  [912] "journal.pone.0009754.txt-Vinclozolin FUNG 13 258 5.0 27.0 1.2 4.6 21.7 24.6 8.8 2.4 1.0"                                                                                                                                                                                                                                     
##  [913] "journal.pone.0009754.txt-Cyhalothrin PYR 13 258 5.0 16.9 1.0 5.7 13.2 15.3 6.5 1.3 0.1"                                                                                                                                                                                                                                      
##  [914] "--"                                                                                                                                                                                                                                                                                                                          
##  [915] "journal.pone.0009754.txt-Trifloxystrobin PS FUNG 27 350 7.7 264.0 0.6 10.3 96.2 168.4 34.1 11.9 0.5"                                                                                                                                                                                                                         
##  [916] "journal.pone.0009754.txt-Tebufenozide IGR 27 350 7.7 58.4 2.0 12.5 28.9 30.0 14.8 2.4 2.0"                                                                                                                                                                                                                                   
##  [917] "journal.pone.0009754.txt-Diazinon OP 27 350 7.7 29.0 1.0 4.6 25.6 27.7 9.2 1.8 1.0"                                                                                                                                                                                                                                          
##  [918] "journal.pone.0009754.txt:Cypermethrin PYR 25 350 7.1 49.0 1.6 4.6 27.8 44.7 10.8 2.6 1.0"                                                                                                                                                                                                                                    
##  [919] "journal.pone.0009754.txt-Cyfluthrin PYR 24 350 6.9 33.6 1.1 5.1 9.9 9.9 6.7 1.3 1.0"                                                                                                                                                                                                                                         
##  [920] "journal.pone.0009754.txt-Azinphos methyl OP 23 350 6.6 643.0 3.9 22.0 104.7 615.3 86.2 37.1 3.0"                                                                                                                                                                                                                             
##  [921] "journal.pone.0009754.txt-Aldicarb sulfoxide S CARB 21 350 6.0 1245.0 22.0 327.0 1039.0 1146.0 493.7 85.7 20.0"                                                                                                                                                                                                               
##  [922] "--"                                                                                                                                                                                                                                                                                                                          
##  [923] "journal.pone.0009754.txt-Coumaphos OP 84 140 60.0 762.0 1.0 8.0 118.7 156.2 50.4 13.5 1.0"                                                                                                                                                                                                                                   
##  [924] "journal.pone.0009754.txt-Chlorpyrifos OP 12 140 8.6 10.7 1.0 2.2 8.5 9.7 3.4 0.9 0.1"                                                                                                                                                                                                                                        
##  [925] "journal.pone.0009754.txt-Chlorothalonil FUNG 10 140 7.1 878.0 1.5 7.2 121.1 499.5 100.2 86.5 1.0"                                                                                                                                                                                                                            
##  [926] "journal.pone.0009754.txt:Cypermethrin PYR 9 140 6.4 25.8 2.0 3.5 22.0 23.9 10.1 3.2 1.0"                                                                                                                                                                                                                                     
##  [927] "journal.pone.0009754.txt-Permethrin PYR 8 140 5.7 19600.0 12.0 35.8 5919.2 12759.6 2478.1 2446.0 10.0"                                                                                                                                                                                                                       
##  [928] "journal.pone.0009754.txt-DMPF (amitraz) FORM 8 125 6.4 9040.0 6.0 117.5 3015.8 6027.9 1249.1 1114.1 4.0"                                                                                                                                                                                                                     
##  [929] "journal.pone.0009754.txt-Esfenvalerate PYR 8 140 5.7 9.3 1.0 3.5 8.5 8.9 4.3 1.2 0.5"                                                                                                                                                                                                                                        
##  [930] "--"                                                                                                                                                                                                                                                                                                                          
##  [931] "journal.pone.0009754.txt-FenbuconazoleSFUNG1762471255.75.70.01490000183264011003.11.34.61.60.00.0"                                                                                                                                                                                                                           
##  [932] "journal.pone.0009754.txt-CyprodinilSFUNG2083501405.34.32.93320000106344194001.80.83.91.60.40.2"                                                                                                                                                                                                                              
##  [933] "journal.pone.0009754.txt-CyhalothrinPYR2583501405.010.92.1790172820200.30.10.40.10.00.0"                                                                                                                                                                                                                                     
##  [934] "journal.pone.0009754.txt:CypermethrinPYR2583501405.07.16.4135013149261321.60.70.80.20.60.3"                                                                                                                                                                                                                                  
##  [935] "journal.pone.0009754.txt-VinclozolinFUNG2583501405.01.10.0100000027400000.40.20.00.00.00.0"                                                                                                                                                                                                                                  
##  [936] "journal.pone.0009754.txt-TebufenozideIGR2083501404.87.70.723400002858230800.40.21.10.30.20.2"                                                                                                                                                                                                                                
##  [937] "journal.pone.0009754.txt-PronamideSHERB2083501404.83.10.715800002337820000.30.13.91.60.00.0"                                                                                                                                                                                                                                 
##  [938] "--"                                                                                                                                                                                                                                                                                                                          
##  [939] "journal.pone.0009754.txt-foundation (5.8% of detections, Table 5) than in comb wax"                                                                                                                                                                                                                                          
##  [940] "journal.pone.0009754.txt-(Table 1). Other frequently detected contaminants include"                                                                                                                                                                                                                                          
##  [941] "journal.pone.0009754.txt-chlorpyrifos (81%), endosulfan (38%), chlorothalonil (29%) and"                                                                                                                                                                                                                                     
##  [942] "journal.pone.0009754.txt:other pyrethroids including cypermethrin, cyfluthrin and esfenva-"                                                                                                                                                                                                                                  
##  [943] "journal.pone.0009754.txt-lerate (Table 5). Interestingly, three distinct old foundation"                                                                                                                                                                                                                                     
##  [944] "journal.pone.0009754.txt-Figure 2. Correlations of pollen and wax chlorothalonil residues (ppb) with total fungicide contents in paired colony samples."                                                                                                                                                                     
##  [945] "journal.pone.0009754.txt-Regressions of pollen chlorothalonil (A) and wax chlorothalonil (B) with total fungicides."                                                                                                                                                                                                         
##  [946] "--"                                                                                                                                                                                                                                                                                                                          
##  [947] "journal.pone.0009754.txt-Endosulfan I CYC 8 21 38.1 11.0 1.2 2.4 5.8 8.4 3.3 1.1"                                                                                                                                                                                                                                            
##  [948] "journal.pone.0009754.txt-Coumaphos oxon OP 7 13 53.8 102.0 6.5 27.3 62.4 82.2 36.0 11.6"                                                                                                                                                                                                                                     
##  [949] "journal.pone.0009754.txt-Chlorothalonil FUNG 6 21 28.6 60.0 1.3 11.4 39.1 49.6 18.2 8.7"                                                                                                                                                                                                                                     
##  [950] "journal.pone.0009754.txt:Cypermethrin PYR 5 21 23.8 131.0 6.5 8.3 120.2 125.6 51.6 27.3"                                                                                                                                                                                                                                     
##  [951] "journal.pone.0009754.txt-Endosulfan II CYC 5 21 23.8 4.7 1.1 1.9 3.6 4.1 2.1 0.7"                                                                                                                                                                                                                                            
##  [952] "journal.pone.0009754.txt-Cyfluthrin PYR 4 21 19.0 14.0 6.9 7.4 12.1 13.1 8.9 1.7"                                                                                                                                                                                                                                            
##  [953] "journal.pone.0009754.txt-Esfenvalerate PYR 4 21 19.0 19.0 1.1 2.8 14.2 16.6 6.4 4.2"                                                                                                                                                                                                                                         
##  [954] "--"                                                                                                                                                                                                                                                                                                                          
##  [955] "journal.pone.0009754.txt-bee LD50 for deltamethrin. This level can be lethal depending on"                                                                                                                                                                                                                                   
##  [956] "journal.pone.0009754.txt-pollen consumption rates by differing castes, or wax transfer rates"                                                                                                                                                                                                                                
##  [957] "journal.pone.0009754.txt-to brood or indirectly to pollen. Moreover, some bee residues of"                                                                                                                                                                                                                                   
##  [958] "journal.pone.0009754.txt:deltamethrin, fenpropathrin and cypermethrin (Table 4) are"                                                                                                                                                                                                                                         
##  [959] "journal.pone.0009754.txt-above levels shown to disorient foragers [51] and cause CCD-like"                                                                                                                                                                                                                                   
##  [960] "journal.pone.0009754.txt-symptoms (see above). It is important to note that pyrethroids are"                                                                                                                                                                                                                                 
##  [961] "journal.pone.0009754.txt-rarely found alone, and in 50% of our pollen and wax samples co-"                                                                                                                                                                                                                                   
##  [962] "journal.pone.0009754.txt-occur with chlorothalonil, a fungicide known to increase bee"                                                                                                                                                                                                                                       
##  [963] "journal.pone.0009754.txt:toxicity of cypermethrin by greater than 5-fold [52]. Bee toxicity of"                                                                                                                                                                                                                              
##  [964] "journal.pone.0009754.txt-the pyrethroid bifenthrin doubles after Apistan (fluvalinate)"                                                                                                                                                                                                                                      
##  [965] "journal.pone.0009754.txt-treatment [53], which frequently coincides in our samples."                                                                                                                                                                                                                                         
##  [966] "journal.pone.0009754.txt-Potential for interactions among multiple pyrethroids and"                                                                                                                                                                                                                                          
##  [967] "--"                                                                                                                                                                                                                                                                                                                          
##  [968] "journal.pone.0014720.txt-Coumaphos Ogranophosphate INSECT Mod 8079 100 281 22100 1"                                                                                                                                                                                                                                          
##  [969] "journal.pone.0014720.txt-Coumaphos oxon metabolite 596 100 10 3140 1"                                                                                                                                                                                                                                                        
##  [970] "journal.pone.0014720.txt-Cyfluthrin Pyrethroid INSECT Low 43 17 8 79 2"                                                                                                                                                                                                                                                      
##  [971] "journal.pone.0014720.txt:Cypermethrin Pyrethroid INSECT High 2 8 * 2 2"                                                                                                                                                                                                                                                      
##  [972] "journal.pone.0014720.txt-Cyprodinil Anilinopyrimidine FUNG 27 31 13 61 16"                                                                                                                                                                                                                                                   
##  [973] "journal.pone.0014720.txt-Diazinon Ogranophosphate INSECT High 1 15 1 2 1"                                                                                                                                                                                                                                                    
##  [974] "journal.pone.0014720.txt-Dicofol Organochlorine INSECT Low 6 23 4 8 1"                                                                                                                                                                                                                                                       
##  [975] "--"                                                                                                                                                                                                                                                                                                                          
##  [976] "journal.pone.0016108.txt-5. MacDonald G (1957) The epidemiology and control of malaria. London: Oxford"                                                                                                                                                                                                                      
##  [977] "journal.pone.0016108.txt-University Press."                                                                                                                                                                                                                                                                                  
##  [978] "journal.pone.0016108.txt-6. Papadopoulos E, Bartram D, Carpenter C, Mellor P, Wall R (2009) Efficacy of"                                                                                                                                                                                                                     
##  [979] "journal.pone.0016108.txt:alphacypermethrin applied to cattle and sheep against the biting midge Culicoides"                                                                                                                                                                                                                  
##  [980] "journal.pone.0016108.txt-nubeculosus. Vet Parasitol 163: 110–114."                                                                                                                                                                                                                                                           
##  [981] "journal.pone.0016108.txt-7. Webb L, Beaumont DJ, Nager RG, McCracken DI (2010) Field-scale dispersal"                                                                                                                                                                                                                        
##  [982] "journal.pone.0016108.txt-of Aphodius dung beetles (Coleoptera: Scarabaeidae) in response to avermectin"                                                                                                                                                                                                                      
##  [983] "--"                                                                                                                                                                                                                                                                                                                          
##  [984] "journal.pone.0019205.txt-(Vestergaard Frandsen) LLINs in August to September 2007 and"                                                                                                                                                                                                                                       
##  [985] "journal.pone.0019205.txt-2008 respectively. In Litoral province houses were sprayed semi-"                                                                                                                                                                                                                                   
##  [986] "journal.pone.0019205.txt-annually from August 2007 through September 2009 with the"                                                                                                                                                                                                                                          
##  [987] "journal.pone.0019205.txt:pyrethroid insecticide Alpha Cypermethrin (FendonaTM"                                                                                                                                                                                                                                               
##  [988] "journal.pone.0019205.txt-, Avima/"                                                                                                                                                                                                                                                                                           
##  [989] "journal.pone.0019205.txt-BASF, South Africa and HI Kara, India), in January 2010 with the"                                                                                                                                                                                                                                   
##  [990] "journal.pone.0019205.txt-carbamate insecticide bendiocarb (FicamTM"                                                                                                                                                                                                                                                          
##  [991] "--"                                                                                                                                                                                                                                                                                                                          
##  [992] "journal.pone.0019205.txt-and from July 2010 with the pyrethroid insecticide deltamethrin"                                                                                                                                                                                                                                    
##  [993] "journal.pone.0019205.txt-(K-OrthrinTM"                                                                                                                                                                                                                                                                                       
##  [994] "journal.pone.0019205.txt-, Bayer, South Africa). In Kie Ntem province IRS"                                                                                                                                                                                                                                                   
##  [995] "journal.pone.0019205.txt:was carried out semi-annually with Alpha Cypermethrin from July"                                                                                                                                                                                                                                    
##  [996] "journal.pone.0019205.txt-2008, with DeltamethrinTM"                                                                                                                                                                                                                                                                          
##  [997] "journal.pone.0019205.txt-from January 2010 and with"                                                                                                                                                                                                                                                                         
##  [998] "journal.pone.0019205.txt-bendiocarb in July 2010. In addition, villages not covered by"                                                                                                                                                                                                                                      
##  [999] "--"                                                                                                                                                                                                                                                                                                                          
## [1000] "journal.pone.0021711.txt-transmission along the Kenyan coast. Am J Trop Med Hyg 68: 734–742."                                                                                                                                                                                                                                
## [1001] "journal.pone.0021711.txt-28. Maxwell CA, Chambo W, Mwaimu M, Magogo F, Carneiro IA, et al. (2003)"                                                                                                                                                                                                                           
## [1002] "journal.pone.0021711.txt-Variation of malaria transmission and morbidity with altitude in Tanzania and"                                                                                                                                                                                                                      
## [1003] "journal.pone.0021711.txt:with introduction of alphacypermethrin treated nets. Malar J 2: 28."                                                                                                                                                                                                                                
## [1004] "journal.pone.0021711.txt-29. O’Meara WP, Mwangi TW, Williams TN, McKenzie FE, Snow RW, et al."                                                                                                                                                                                                                               
## [1005] "journal.pone.0021711.txt-(2008) Relationship between exposure, clinical malaria, and age in an area of"                                                                                                                                                                                                                      
## [1006] "journal.pone.0021711.txt-changing transmission intensity. Am J Trop Med Hyg 79: 185–191."                                                                                                                                                                                                                                    
## [1007] "--"                                                                                                                                                                                                                                                                                                                          
## [1008] "journal.pone.0022574.txt-the amount of DDT, which is exclusively used in African"                                                                                                                                                                                                                                            
## [1009] "journal.pone.0022574.txt-countries, is excluded. Among pyrethroids that are used for"                                                                                                                                                                                                                                        
## [1010] "journal.pone.0022574.txt-vector control, 98.7% comprise photostable pyrethroids such as"                                                                                                                                                                                                                                     
## [1011] "journal.pone.0022574.txt:m-cypermethrin, m-cyhalothrin, cyfluthrin, cypermethrin, delta-"                                                                                                                                                                                                                                    
## [1012] "journal.pone.0022574.txt-methrin (type II), etofenprox, bifenthrin, and permethrin (type I)"                                                                                                                                                                                                                                 
## [1013] "journal.pone.0022574.txt-[6]. Vector resistance against these pyrethroids has been a"                                                                                                                                                                                                                                        
## [1014] "journal.pone.0022574.txt-worldwide concern. It is expected that the use of photo-unstable"                                                                                                                                                                                                                                   
## [1015] "--"                                                                                                                                                                                                                                                                                                                          
## [1016] "journal.pone.0022574.txt-tions. Photostable pyrethroids consist of 2 structurally different"                                                                                                                                                                                                                                 
## [1017] "journal.pone.0022574.txt-types of chemicals according to the presence of m-cyano moiety,"                                                                                                                                                                                                                                    
## [1018] "journal.pone.0022574.txt-type I (permethrin, etofenprox, etc.) and type II (deltamethrin,"                                                                                                                                                                                                                                   
## [1019] "journal.pone.0022574.txt:lambda-cyhalothrin, cypermethrin, etc.). Siegert et al. [42]"                                                                                                                                                                                                                                       
## [1020] "journal.pone.0022574.txt-reported that the OlysetH Net, slow-released polyethylene"                                                                                                                                                                                                                                          
## [1021] "journal.pone.0022574.txt-formulation containing 1000 mg of permethrin per m2"                                                                                                                                                                                                                                                
## [1022] "journal.pone.0022574.txt-, fitted"                                                                                                                                                                                                                                                                                           
## [1023] "--"                                                                                                                                                                                                                                                                                                                          
## [1024] "journal.pone.0023403.txt-in the QTC279 strain of Tribolium castaneum. Proc Natl Acad Sci USA 107:"                                                                                                                                                                                                                           
## [1025] "journal.pone.0023403.txt-8557–8562."                                                                                                                                                                                                                                                                                         
## [1026] "journal.pone.0023403.txt-30. Korytko PJ, Scott JG (1998) CYP6D1 protects thoracic ganglia of houseflies"                                                                                                                                                                                                                     
## [1027] "journal.pone.0023403.txt:from the neurotoxic insecticide cypermethrin. Archi Insect Biochem Physio 37:"                                                                                                                                                                                                                      
## [1028] "journal.pone.0023403.txt-57–63."                                                                                                                                                                                                                                                                                             
## [1029] "journal.pone.0023403.txt-31. Carino FA, Koener JF, Plapp FW, Jr., Feyereisen R (1992) Expression of the"                                                                                                                                                                                                                     
## [1030] "journal.pone.0023403.txt-cytochrome P450 gene CYP6A1 in the housefly, Musca domestica. In: Mullin CA,"                                                                                                                                                                                                                       
## [1031] "--"                                                                                                                                                                                                                                                                                                                          
## [1032] "journal.pone.0025137.txt-impact of indoor residual spraying on malaria morbidity using a sentinel site"                                                                                                                                                                                                                      
## [1033] "journal.pone.0025137.txt-surveillance system in Western Uganda. Am J Trop Med Hyg 81: 611–614."                                                                                                                                                                                                                              
## [1034] "journal.pone.0025137.txt-12. Tseng LF, Chang WC, Ferreira MC, Wu CH, Rampao HS, et al. (2008) Rapid"                                                                                                                                                                                                                         
## [1035] "journal.pone.0025137.txt:control of malaria by means of indoor residual spraying of alphacypermethrin in"                                                                                                                                                                                                                    
## [1036] "journal.pone.0025137.txt-the Democratic Republic of Sao Tome and Principe. Am J Trop Med Hyg 78:"                                                                                                                                                                                                                            
## [1037] "journal.pone.0025137.txt-248–250."                                                                                                                                                                                                                                                                                           
## [1038] "journal.pone.0025137.txt-13. Menendez C, Schellenberg D, Macete E, Aide P, Kahigwa E, et al. (2007)"                                                                                                                                                                                                                         
## [1039] "--"                                                                                                                                                                                                                                                                                                                          
## [1040] "journal.pone.0029127.txt-way to control this pest. In recent years, in China, geographically"                                                                                                                                                                                                                                
## [1041] "journal.pone.0029127.txt-widespread populations of B. dorsalis have developed high levels of"                                                                                                                                                                                                                                
## [1042] "journal.pone.0029127.txt-resistance to commonly used insecticides, such as trichlorphon, b-"                                                                                                                                                                                                                                 
## [1043] "journal.pone.0029127.txt:cypermethrin, and avermectin [32]. However, the molecular"                                                                                                                                                                                                                                          
## [1044] "journal.pone.0029127.txt-mechanisms of resistance are still unknown and the main obstacle"                                                                                                                                                                                                                                   
## [1045] "journal.pone.0029127.txt-to further research is the limited amount of genetic information."                                                                                                                                                                                                                                  
## [1046] "journal.pone.0029127.txt-To assist research on insecticide resistance, we surveyed our"                                                                                                                                                                                                                                      
## [1047] "--"                                                                                                                                                                                                                                                                                                                          
## [1048] "journal.pone.0029242.txt-First Report on Co-Occurrence Knockdown Resistance"                                                                                                                                                                                                                                                 
## [1049] "journal.pone.0029242.txt:Mutations and Susceptibility to Beta-Cypermethrin in"                                                                                                                                                                                                                                               
## [1050] "journal.pone.0029242.txt-Anopheles sinensis from Jiangsu Province, China"                                                                                                                                                                                                                                                    
## [1051] "journal.pone.0029242.txt-Wei-Long Tan1,2"                                                                                                                                                                                                                                                                                    
## [1052] "journal.pone.0029242.txt-, Zhong-Ming Wang1"                                                                                                                                                                                                                                                                                 
## [1053] "--"                                                                                                                                                                                                                                                                                                                          
## [1054] "journal.pone.0029242.txt-the PCR-RFLP method was more sensitive and specific whereas the cPASA method was more convenient and suitable. The"                                                                                                                                                                                 
## [1055] "journal.pone.0029242.txt-significant positive correlation between kdr allele frequency and bioassay-based resistance phenotype demonstrates that"                                                                                                                                                                            
## [1056] "journal.pone.0029242.txt-the frequency of L1014F and L1014C substitutions in the kdr gene provides a useful molecular marker for monitoring beta-"                                                                                                                                                                           
## [1057] "journal.pone.0029242.txt:cypermethrin resistance in natural populations of An. sinensis. Our results point to the L1014F substitution as the key"                                                                                                                                                                            
## [1058] "journal.pone.0029242.txt:mutation associated with beta-cypermethrin resistance. The high resistance and mutation frequency detected in the five"                                                                                                                                                                             
## [1059] "journal.pone.0029242.txt-populations also suggest cross-resistance with other pyrethroids may occur in An. sinensis, highlighting the need for further"                                                                                                                                                                      
## [1060] "journal.pone.0029242.txt-surveys to map insecticide resistance in China and the adoption of a rational management of insecticide application for"                                                                                                                                                                            
## [1061] "journal.pone.0029242.txt-resistance management and mosquito vector control."                                                                                                                                                                                                                                                 
## [1062] "journal.pone.0029242.txt-Citation: Tan W-L, Wang Z-M, Li C-X, Chu H-L, Xu Y, et al. (2012) First Report on Co-Occurrence Knockdown Resistance Mutations and Susceptibility to Beta-"                                                                                                                                         
## [1063] "journal.pone.0029242.txt:Cypermethrin in Anopheles sinensis from Jiangsu Province, China. PLoS ONE 7(1): e29242. doi:10.1371/journal.pone.0029242"                                                                                                                                                                           
## [1064] "journal.pone.0029242.txt-Editor: Erika Martins Braga, Universidade Federal de Minas Gerais, Brazil"                                                                                                                                                                                                                          
## [1065] "journal.pone.0029242.txt-Received June 3, 2011; Accepted November 23, 2011; Published January 17, 2012"                                                                                                                                                                                                                      
## [1066] "journal.pone.0029242.txt-Copyright: ß 2012 Tan et al. This is an open-access article distributed under the terms of the Creative Commons Attribution License, which permits unrestricted"                                                                                                                                    
## [1067] "--"                                                                                                                                                                                                                                                                                                                          
## [1068] "journal.pone.0029242.txt-doi:10.1371/journal.pone.0029242.g001"                                                                                                                                                                                                                                                              
## [1069] "journal.pone.0029242.txt-kdr Mutations in Anepheles sinensis"                                                                                                                                                                                                                                                                
## [1070] "journal.pone.0029242.txt-PLoS ONE | www.plosone.org 2 January 2012 | Volume 7 | Issue 1 | e29242"                                                                                                                                                                                                                            
## [1071] "journal.pone.0029242.txt:\fpopulations. Beta-cypermethrin powder (Tianjin Pesticide Co."                                                                                                                                                                                                                                     
## [1072] "journal.pone.0029242.txt-Ltd, China), the mostly widely used insecticide in the malaria"                                                                                                                                                                                                                                     
## [1073] "journal.pone.0029242.txt-control effort in Jiangsu province, was completely dissolved in"                                                                                                                                                                                                                                    
## [1074] "journal.pone.0029242.txt-acetone. The stock solution, with a final concentration of 20 ppm,"                                                                                                                                                                                                                                 
## [1075] "--"                                                                                                                                                                                                                                                                                                                          
## [1076] "journal.pone.0029242.txt-volume. The electrophoresis was performed with 4% agarose at"                                                                                                                                                                                                                                       
## [1077] "journal.pone.0029242.txt-150 V for 90 min."                                                                                                                                                                                                                                                                                  
## [1078] "journal.pone.0029242.txt-Results"                                                                                                                                                                                                                                                                                            
## [1079] "journal.pone.0029242.txt:Species identification and beta-cypermethrin resistance"                                                                                                                                                                                                                                            
## [1080] "journal.pone.0029242.txt-of Anopheles populations"                                                                                                                                                                                                                                                                           
## [1081] "journal.pone.0029242.txt-Two hundred and ninety specimens of Anopheles complex"                                                                                                                                                                                                                                              
## [1082] "journal.pone.0029242.txt-mosquitoes were collected during the survey and tested with a"                                                                                                                                                                                                                                      
## [1083] "--"                                                                                                                                                                                                                                                                                                                          
## [1084] "journal.pone.0029242.txt-to be An. sinensis in agreement with the known geographic"                                                                                                                                                                                                                                          
## [1085] "journal.pone.0029242.txt-distribution of species within the An. anthropophagus complex in"                                                                                                                                                                                                                                   
## [1086] "journal.pone.0029242.txt-Jiangsu province, eastern China. In the bioassays, the five"                                                                                                                                                                                                                                        
## [1087] "journal.pone.0029242.txt:populations all showed high resistance to beta-cypermethrin"                                                                                                                                                                                                                                        
## [1088] "journal.pone.0029242.txt-(Table 2). Resistance ratios of LC50 for the five populations were"                                                                                                                                                                                                                                 
## [1089] "journal.pone.0029242.txt-found to range from 700 to 2100-fold, much higher than the 3.5-"                                                                                                                                                                                                                                    
## [1090] "journal.pone.0029242.txt-to 5-fold reported for An. sinensis mosquitoes from Liaoning"                                                                                                                                                                                                                                       
## [1091] "--"                                                                                                                                                                                                                                                                                                                          
## [1092] "journal.pone.0029242.txt-(G/G) and (G/T), was inferred by the three fragments of 155-bp,"                                                                                                                                                                                                                                    
## [1093] "journal.pone.0029242.txt-Table 2. Values of 50% lethal concentration (LC50) for the five"                                                                                                                                                                                                                                    
## [1094] "journal.pone.0029242.txt-An. sinensis resistant field populations compared to the"                                                                                                                                                                                                                                           
## [1095] "journal.pone.0029242.txt:susceptible lab strain in response to beta-cypermethrin."                                                                                                                                                                                                                                           
## [1096] "journal.pone.0029242.txt-Mosquito Population LC50(ppm) 95% confidence interval R/S*"                                                                                                                                                                                                                                         
## [1097] "journal.pone.0029242.txt-SS 0.001 0.0002–0.001 1"                                                                                                                                                                                                                                                                            
## [1098] "journal.pone.0029242.txt-XZ 0.9 0.3–3.5 900"                                                                                                                                                                                                                                                                                 
## [1099] "--"                                                                                                                                                                                                                                                                                                                          
## [1100] "journal.pone.0029242.txt-kdr Mutations in Anepheles sinensis"                                                                                                                                                                                                                                                                
## [1101] "journal.pone.0029242.txt-PLoS ONE | www.plosone.org 6 January 2012 | Volume 7 | Issue 1 | e29242"                                                                                                                                                                                                                            
## [1102] "journal.pone.0029242.txt-\fFrequency of L1014F and L1014C substitutions in"                                                                                                                                                                                                                                                  
## [1103] "journal.pone.0029242.txt:response to beta-cypermethrin"                                                                                                                                                                                                                                                                      
## [1104] "journal.pone.0029242.txt-Spearman’s rank correlation analysis based on the correlate"                                                                                                                                                                                                                                        
## [1105] "journal.pone.0029242.txt-analysis showed significant correlations between the LC50 and the"                                                                                                                                                                                                                                  
## [1106] "journal.pone.0029242.txt-kdr allele frequencies of kdr-F and kdr-C (p#0.01). Regression"                                                                                                                                                                                                                                     
## [1107] "--"                                                                                                                                                                                                                                                                                                                          
## [1108] "journal.pone.0029242.txt-doi:10.1371/journal.pone.0029242.t004"                                                                                                                                                                                                                                                              
## [1109] "journal.pone.0029242.txt-Figure 6. Correlation between LC50 and percentage frequencies for kdr alleles and genotypes. (A), (B), (C), (D): exponential correlation"                                                                                                                                                           
## [1110] "journal.pone.0029242.txt-relationship between frequencies of kdr-F and kdr-C, kdr-C, F/C genotype, kdr-F genotype and the 50% lethal concentration of the five populations"                                                                                                                                                  
## [1111] "journal.pone.0029242.txt:against beta-cypermethrin."                                                                                                                                                                                                                                                                         
## [1112] "journal.pone.0029242.txt-doi:10.1371/journal.pone.0029242.g006"                                                                                                                                                                                                                                                              
## [1113] "journal.pone.0029242.txt-kdr Mutations in Anepheles sinensis"                                                                                                                                                                                                                                                                
## [1114] "journal.pone.0029242.txt-PLoS ONE | www.plosone.org 7 January 2012 | Volume 7 | Issue 1 | e29242"                                                                                                                                                                                                                            
## [1115] "journal.pone.0029242.txt-\ftypes of molecular mutations were found at L1014 alleles in the"                                                                                                                                                                                                                                  
## [1116] "journal.pone.0029242.txt-Xuzhou (XZ) population, in which the resistance level was about"                                                                                                                                                                                                                                    
## [1117] "journal.pone.0029242.txt:900 fold that of the susceptible SS strain to Beta-cypermethrin."                                                                                                                                                                                                                                   
## [1118] "journal.pone.0029242.txt-The first point mutation, with TTG (Leu) being replaced with"                                                                                                                                                                                                                                       
## [1119] "journal.pone.0029242.txt-TTT (Phe), accords with prior reports of the kdr mutation in An."                                                                                                                                                                                                                                   
## [1120] "journal.pone.0029242.txt-gambiae [39], Cx. p. pallens [36], Cx. p. quinquefasciatus [40]. The"                                                                                                                                                                                                                               
## [1121] "--"                                                                                                                                                                                                                                                                                                                          
## [1122] "journal.pone.0029242.txt-thus the Leu/Phe substitution is thought to directly cause the"                                                                                                                                                                                                                                     
## [1123] "journal.pone.0029242.txt-heightening of the insect’s resistance based on the results of the"                                                                                                                                                                                                                                 
## [1124] "journal.pone.0029242.txt-bioassay. Since all the tested field populations showed high"                                                                                                                                                                                                                                       
## [1125] "journal.pone.0029242.txt:resistance to beta-cypermethrin, the relationship between L1014F"                                                                                                                                                                                                                                   
## [1126] "journal.pone.0029242.txt-substitution frequency and mosquito survival when challenged"                                                                                                                                                                                                                                       
## [1127] "journal.pone.0029242.txt:with beta-cypermethrin was analyzed in this study. The L1014F"                                                                                                                                                                                                                                      
## [1128] "journal.pone.0029242.txt-substitution not only showed a strong positive correlation with"                                                                                                                                                                                                                                    
## [1129] "journal.pone.0029242.txt-LC50 (R2"                                                                                                                                                                                                                                                                                           
## [1130] "journal.pone.0029242.txt-= 0.9519) but also a significantly high frequency (75% to"                                                                                                                                                                                                                                          
## [1131] "journal.pone.0029242.txt-84%), corresponding to the resistance level against beta-cyper-"                                                                                                                                                                                                                                    
## [1132] "journal.pone.0029242.txt-methrin in all the field populations (700 to 2100-fold). This finding"                                                                                                                                                                                                                              
## [1133] "journal.pone.0029242.txt-therefore supports previous studies that suggested that the L1014F"                                                                                                                                                                                                                                 
## [1134] "journal.pone.0029242.txt:substitution is the key mutation responsible of beta-cypermethrin"                                                                                                                                                                                                                                  
## [1135] "journal.pone.0029242.txt-resistance. An alternative substitution of leucine to cysteine (Leu to"                                                                                                                                                                                                                             
## [1136] "journal.pone.0029242.txt-Cys) in the same location showed a relative low frequency within"                                                                                                                                                                                                                                   
## [1137] "journal.pone.0029242.txt-populations; in spite of its strong positive correlation with LC50,"                                                                                                                                                                                                                                
## [1138] "journal.pone.0029242.txt-this Leu/Cys substitution is unlikely to play an important role in"                                                                                                                                                                                                                                 
## [1139] "journal.pone.0029242.txt:beta-cypermethrin resistance. Martinez-Torres [22] reported that"                                                                                                                                                                                                                                   
## [1140] "journal.pone.0029242.txt-L1014S substitution in one strain showed a slight increase in"                                                                                                                                                                                                                                      
## [1141] "journal.pone.0029242.txt-resistance to pyrethroids but greatly increased DDT resistance. It"                                                                                                                                                                                                                                 
## [1142] "journal.pone.0029242.txt-seems reasonable to suppose, therefore, that the L1014C"                                                                                                                                                                                                                                            
## [1143] "--"                                                                                                                                                                                                                                                                                                                          
## [1144] "journal.pone.0029242.txt-pyrethroid insecticides for agricultural purposes, and possibly for"                                                                                                                                                                                                                                
## [1145] "journal.pone.0029242.txt-domestic protection, may be a major factor contributing to the"                                                                                                                                                                                                                                     
## [1146] "journal.pone.0029242.txt-increasing insecticide resistance of An. sinensis. Although beta-"                                                                                                                                                                                                                                  
## [1147] "journal.pone.0029242.txt:cypermethrin is not widely used for agricultural purposes, the high"                                                                                                                                                                                                                                
## [1148] "journal.pone.0029242.txt-resistance against it exhibited by mosquitoes throughout the region"                                                                                                                                                                                                                                
## [1149] "journal.pone.0029242.txt-suggests that cross-resistance with other pyrethroids may be"                                                                                                                                                                                                                                       
## [1150] "journal.pone.0029242.txt-occurring in An. sinensis, so rational management of insecticide"                                                                                                                                                                                                                                   
## [1151] "--"                                                                                                                                                                                                                                                                                                                          
## [1152] "journal.pone.0029242.txt-2. Li J, Zhou H, Shen B, Zhu G, Cao J (2002) Experiment observation on residual"                                                                                                                                                                                                                    
## [1153] "journal.pone.0029242.txt-effect of Anopheles by pyrethroid-impregnated bednet. Chinese Journal of"                                                                                                                                                                                                                           
## [1154] "journal.pone.0029242.txt-Schistosomiasis Control 1: 32–34."                                                                                                                                                                                                                                                                  
## [1155] "journal.pone.0029242.txt:3. Li P, Luo D, Li A, Lu D, Li D, et al. (1997) Field trial of alphacypermethrin-"                                                                                                                                                                                                                  
## [1156] "journal.pone.0029242.txt-impregnated bed nets for malaria and mosquito control. Chinese Journal of"                                                                                                                                                                                                                          
## [1157] "journal.pone.0029242.txt-Parasitology and Parasitic Diseases 3: 223–226."                                                                                                                                                                                                                                                    
## [1158] "journal.pone.0029242.txt-4. Lu B, Gao J, Zhang B (1963) Study on the behavior of Anopheles sinensis"                                                                                                                                                                                                                         
## [1159] "--"                                                                                                                                                                                                                                                                                                                          
## [1160] "journal.pone.0030862.txt-Eventually, no persistent accumulative product was detected by gas chromatopraphy-mass spectrometry (GC-MS) analysis."                                                                                                                                                                              
## [1161] "journal.pone.0030862.txt-This is the first report of a novel pathway of degradation of bifenthrin by hydrolysis of ester linkage and cleavage of"                                                                                                                                                                            
## [1162] "journal.pone.0030862.txt-biphenyl in a microorganism. Furthermore, strain ZS-02 degraded a variety of pyrethroids including bifenthrin, cyfluthrin,"                                                                                                                                                                         
## [1163] "journal.pone.0030862.txt:deltamethrin, fenvalerate, cypermethrin, and fenpropathrin. In different contaminated soils introduced with strain ZS-02,"                                                                                                                                                                          
## [1164] "journal.pone.0030862.txt-65–75% of the 50 mg?kg21"                                                                                                                                                                                                                                                                           
## [1165] "journal.pone.0030862.txt-bifenthrin was eliminated within 10 days, suggesting the yeast could be a promising candidate"                                                                                                                                                                                                      
## [1166] "journal.pone.0030862.txt-for remediation of environments affected by bifenthrin. Finally, this is the first described yeast capable of degrading"                                                                                                                                                                            
## [1167] "--"                                                                                                                                                                                                                                                                                                                          
## [1168] "journal.pone.0030862.txt-Chemicals and media"                                                                                                                                                                                                                                                                                
## [1169] "journal.pone.0030862.txt-Technical grade bifenthrin (98% purity), cyfluthrin (95%"                                                                                                                                                                                                                                           
## [1170] "journal.pone.0030862.txt-purity), deltamethrin (98% purity), fenvalerate (91.2% purity),"                                                                                                                                                                                                                                    
## [1171] "journal.pone.0030862.txt:cypermethrin (92.9% purity), and fenpropathrin (93% purity) used"                                                                                                                                                                                                                                   
## [1172] "journal.pone.0030862.txt-in this study were obtained from Zhongshan Aestar Fine Chemical"                                                                                                                                                                                                                                    
## [1173] "journal.pone.0030862.txt-Inc., Ltd, China. Chromatographic grade acetonitrile were"                                                                                                                                                                                                                                          
## [1174] "journal.pone.0030862.txt-purchased from Sigma-Aldrich, USA. All other chemicals and"                                                                                                                                                                                                                                         
## [1175] "--"                                                                                                                                                                                                                                                                                                                          
## [1176] "journal.pone.0030862.txt-concentrations of bifenthrin (100–600 mg?L21"                                                                                                                                                                                                                                                       
## [1177] "journal.pone.0030862.txt-) and with various"                                                                                                                                                                                                                                                                                 
## [1178] "journal.pone.0030862.txt-pyrethroids including bifenthrin, cyfluthrin, deltamethrin, fenva-"                                                                                                                                                                                                                                 
## [1179] "journal.pone.0030862.txt:lerate, cypermethrin, and fenpropathrin (50 mg?L21"                                                                                                                                                                                                                                                 
## [1180] "journal.pone.0030862.txt-) were carried"                                                                                                                                                                                                                                                                                     
## [1181] "journal.pone.0030862.txt-out in MSM supplemented with 1% glucose for 5 days at pH 7.2"                                                                                                                                                                                                                                       
## [1182] "journal.pone.0030862.txt-at 32uC."                                                                                                                                                                                                                                                                                           
## [1183] "--"                                                                                                                                                                                                                                                                                                                          
## [1184] "journal.pone.0030862.txt-shown in Fig. 6. The strain was capable of metabolizing all of the"                                                                                                                                                                                                                                 
## [1185] "journal.pone.0030862.txt-pyrethroids tested. Bifenthrin was the most preferred substrate,"                                                                                                                                                                                                                                   
## [1186] "journal.pone.0030862.txt-with a degradation rate of 95.1% within 5 days of incubation."                                                                                                                                                                                                                                      
## [1187] "journal.pone.0030862.txt:Cyfluthrin, deltamethrin, fenvalerate, cypermethrin, and fenpro-"                                                                                                                                                                                                                                   
## [1188] "journal.pone.0030862.txt-pathrin were degraded slower than bifenthrin, with degradation"                                                                                                                                                                                                                                     
## [1189] "journal.pone.0030862.txt-rates of 94.8%, 93.4%, 92.6%, 87.7%, and 51.3%, respectively."                                                                                                                                                                                                                                      
## [1190] "journal.pone.0030862.txt-Identification of bifenthrin metabolites"                                                                                                                                                                                                                                                           
## [1191] "--"                                                                                                                                                                                                                                                                                                                          
## [1192] "journal.pone.0030862.txt-degradation. Another important feature which is worth mention-"                                                                                                                                                                                                                                     
## [1193] "journal.pone.0030862.txt-ing is that this strain was capable of degrading a variety of of"                                                                                                                                                                                                                                   
## [1194] "journal.pone.0030862.txt-pyrethroids including bifenthrin, cyfluthrin, deltamethrin, fenva-"                                                                                                                                                                                                                                 
## [1195] "journal.pone.0030862.txt:lerate, cypermethrin, and fenpropathrin, demonstrating that the"                                                                                                                                                                                                                                    
## [1196] "journal.pone.0030862.txt-pyrethroid hydrolase involved in degradation may have broad-"                                                                                                                                                                                                                                       
## [1197] "journal.pone.0030862.txt-spectrum substrate specificity. Bifenthrin was degraded faster than"                                                                                                                                                                                                                                
## [1198] "journal.pone.0030862.txt-other pyrethroids tested, suggesting that presence of the cyano"                                                                                                                                                                                                                                    
## [1199] "--"                                                                                                                                                                                                                                                                                                                          
## [1200] "journal.pone.0030862.txt-doi:10.1371/journal.pone.0030862.t004"                                                                                                                                                                                                                                                              
## [1201] "journal.pone.0030862.txt-Bioremediation of Bifenthrin-Contaminated Soils"                                                                                                                                                                                                                                                    
## [1202] "journal.pone.0030862.txt-PLoS ONE | www.plosone.org 11 February 2012 | Volume 7 | Issue 2 | e30862"                                                                                                                                                                                                                          
## [1203] "journal.pone.0030862.txt:\fcyfluthrin, deltamethrin, fenvalerate, and cypermethrin were"                                                                                                                                                                                                                                     
## [1204] "journal.pone.0030862.txt-degraded at much faster rates than fenpropathrin, indicating that"                                                                                                                                                                                                                                  
## [1205] "journal.pone.0030862.txt-with fluoro, bromo, chloroben, or chloro group on the"                                                                                                                                                                                                                                              
## [1206] "journal.pone.0030862.txt-chrysanthemic acid greatly improved the degradation efficiencies."                                                                                                                                                                                                                                  
## [1207] "--"                                                                                                                                                                                                                                                                                                                          
## [1208] "journal.pone.0030862.txt-a novel pathway of degradation of bifenthrin by hydrolysis of ester"                                                                                                                                                                                                                                
## [1209] "journal.pone.0030862.txt-linkage and cleavage of biphenyl in a microorganism. The"                                                                                                                                                                                                                                           
## [1210] "journal.pone.0030862.txt-bifenthrin metabolic pathway by ZS-02, however, appears to be"                                                                                                                                                                                                                                      
## [1211] "journal.pone.0030862.txt:similar to the initial step of cypermethrin degradation by"                                                                                                                                                                                                                                         
## [1212] "journal.pone.0030862.txt-Micrococcus sp. strain CPN 1, in which cypermthrin was converted"                                                                                                                                                                                                                                   
## [1213] "journal.pone.0030862.txt-to an acid and an alcohol by hydrolysis [28]."                                                                                                                                                                                                                                                      
## [1214] "journal.pone.0030862.txt-The potential of strain ZS-02 to eliminate bifenthrin in"                                                                                                                                                                                                                                           
## [1215] "--"                                                                                                                                                                                                                                                                                                                          
## [1216] "journal.pone.0030862.txt-126–132."                                                                                                                                                                                                                                                                                           
## [1217] "journal.pone.0030862.txt-Bioremediation of Bifenthrin-Contaminated Soils"                                                                                                                                                                                                                                                    
## [1218] "journal.pone.0030862.txt-PLoS ONE | www.plosone.org 12 February 2012 | Volume 7 | Issue 2 | e30862"                                                                                                                                                                                                                          
## [1219] "journal.pone.0030862.txt:\f14. Jin YX, Zheng SS, Fu ZW (2011) Embryonic exposure to cypermethrin induces"                                                                                                                                                                                                                    
## [1220] "journal.pone.0030862.txt-apoptosis and immunotoxicity in zebrafish (Danio rerio). Fish Shellfish Immunol"                                                                                                                                                                                                                    
## [1221] "journal.pone.0030862.txt-30: 1049–1054."                                                                                                                                                                                                                                                                                     
## [1222] "journal.pone.0030862.txt-15. Perry MJ, Venners SA, Barr DB, Xu XP (2007) Environmental pyrethroid and"                                                                                                                                                                                                                       
## [1223] "--"                                                                                                                                                                                                                                                                                                                          
## [1224] "journal.pone.0030862.txt-16. Wang C, Chen F, Zhang Q, Fang Z (2009) Chronic toxicity and cytotoxicity of"                                                                                                                                                                                                                    
## [1225] "journal.pone.0030862.txt-synthetic pyrethroid insecticide cis-bifenthrin. J Environ Sci 21: 1710–1715."                                                                                                                                                                                                                      
## [1226] "journal.pone.0030862.txt-17. Ansari AR, Rahman S, Kaur M, Anjum S, Raisuddin S (2011) In vivo cytogenetic"                                                                                                                                                                                                                   
## [1227] "journal.pone.0030862.txt:and oxidative stress-inducing effects of cypermethrin in freshwater fish, Channa"                                                                                                                                                                                                                   
## [1228] "journal.pone.0030862.txt-punctata Bloch. Ecotoxicol Environ Saf 74: 150–156."                                                                                                                                                                                                                                                
## [1229] "journal.pone.0030862.txt-18. US EPA (2009) Endocrine Disruptor Screening Program (EDSP). US"                                                                                                                                                                                                                                 
## [1230] "journal.pone.0030862.txt-EPA,Washington, DC."                                                                                                                                                                                                                                                                                
## [1231] "--"                                                                                                                                                                                                                                                                                                                          
## [1232] "journal.pone.0030862.txt-Classification of Pesticides by Hazard and Guidelinesto Classification 2009,"                                                                                                                                                                                                                       
## [1233] "journal.pone.0030862.txt-WHO, Geneva."                                                                                                                                                                                                                                                                                       
## [1234] "journal.pone.0030862.txt-24. Fenlon AK, Jones CK, Semple TK (2011) The effect of soil:water ratios on the"                                                                                                                                                                                                                   
## [1235] "journal.pone.0030862.txt:induction of isoproturon, cypermethrin and diazinon mineralisation. Chemo-"                                                                                                                                                                                                                         
## [1236] "journal.pone.0030862.txt-sphere 82: 163–168."                                                                                                                                                                                                                                                                                
## [1237] "journal.pone.0030862.txt-25. Singh BK, Walker A (2006) Microbial degradation of organophosphorus"                                                                                                                                                                                                                            
## [1238] "journal.pone.0030862.txt-compounds. FEMS Microbiol Rev 30: 428–471."                                                                                                                                                                                                                                                         
## [1239] "--"                                                                                                                                                                                                                                                                                                                          
## [1240] "journal.pone.0030862.txt-Bacillus cereus. Appl Environ Microbiol 59: 2007–2013."                                                                                                                                                                                                                                             
## [1241] "journal.pone.0030862.txt-27. Grant RJ, Daniell TJ, Betts WB (2002) Isolation and identification of synthetic"                                                                                                                                                                                                                
## [1242] "journal.pone.0030862.txt-pyrethroid-degrading bacteria. J Appl Microbiol 92: 534–540."                                                                                                                                                                                                                                       
## [1243] "journal.pone.0030862.txt:28. Tallur PN, Megadi VB, Ninnekar HZ (2008) Biodegradation of cypermethrin by"                                                                                                                                                                                                                     
## [1244] "journal.pone.0030862.txt-Micrococcus sp. strain CPN 1. Biodegradation 28: 77–82."                                                                                                                                                                                                                                            
## [1245] "journal.pone.0030862.txt-29. Guo P, Wang BZ, Hang BJ, Li L, Ali SW, et al. (2009) Pyrethroid- degrading"                                                                                                                                                                                                                     
## [1246] "journal.pone.0030862.txt-Sphingobium sp. JZ-2 and the purification and characterization of a novel"                                                                                                                                                                                                                          
## [1247] "journal.pone.0030862.txt-pyrethroid hydrolase. Int Biodeter Biodegr 63: 1107–1112."                                                                                                                                                                                                                                          
## [1248] "journal.pone.0030862.txt-30. Zhang C, Jia L, Wang SH, Qu J, Xu LL, et al. (2010) Biodegradation of beta-"                                                                                                                                                                                                                    
## [1249] "journal.pone.0030862.txt:cypermethrin by two Serratia spp. with different cell surface hydrophobicity."                                                                                                                                                                                                                      
## [1250] "journal.pone.0030862.txt-Bioresoure Technol 101: 3423–3429."                                                                                                                                                                                                                                                                 
## [1251] "journal.pone.0030862.txt-31. Wang BZ, Ma Y, Zhou WY, Zheng JW, He J, et al. (2011) Biodegradation of"                                                                                                                                                                                                                        
## [1252] "journal.pone.0030862.txt-synthetic pyrethroids by Ochrobactrum tritici strain pyd-1. World J Microbiol"                                                                                                                                                                                                                      
## [1253] "--"                                                                                                                                                                                                                                                                                                                          
## [1254] "journal.pone.0030862.txt-isolated Streptomyces aureus strain HP-S-01. Appl Microbiol Biotechnol 90:"                                                                                                                                                                                                                         
## [1255] "journal.pone.0030862.txt-1471–1483."                                                                                                                                                                                                                                                                                         
## [1256] "journal.pone.0030862.txt-34. Chen SH, Hu MY, Liu JJ, Zhong GH, Yang L, et al. (2011) Biodegradation of"                                                                                                                                                                                                                      
## [1257] "journal.pone.0030862.txt:beta-cypermethrin and 3-phenoxybenzoic acid by a novel Ochrobactrum lupini"                                                                                                                                                                                                                         
## [1258] "journal.pone.0030862.txt-DG-S-01. J Hazard Mater 187: 433–440."                                                                                                                                                                                                                                                              
## [1259] "journal.pone.0030862.txt-35. Barnett JA, Payne RW, Yarrow D (2000) Yeasts: Characteristics and"                                                                                                                                                                                                                              
## [1260] "journal.pone.0030862.txt-Identification, 3rd ed. Cambridge University Press, Cambridge, UK."                                                                                                                                                                                                                                 
## [1261] "--"                                                                                                                                                                                                                                                                                                                          
## [1262] "journal.pone.0030862.txt-37. Tamura K, Dudley J, Nei M (2007) MEGA4: molecular evolutionary genetics"                                                                                                                                                                                                                        
## [1263] "journal.pone.0030862.txt-analysis (MEGA) software version 4.0. Mol Biol Evol 24: 1596–1599."                                                                                                                                                                                                                                 
## [1264] "journal.pone.0030862.txt-38. Zhang C, Wang SH, Yan YC (2011) Isomerization and biodegradation of beta-"                                                                                                                                                                                                                      
## [1265] "journal.pone.0030862.txt:cypermethrin by Pseudomonas aeruginosa CH7 with biosurfactant production."                                                                                                                                                                                                                          
## [1266] "journal.pone.0030862.txt-Bioresource Technol 102: 7139–7146."                                                                                                                                                                                                                                                                
## [1267] "journal.pone.0030862.txt-39. Cycon´ M, Wojcik M, Piotrowska-Seget Z (2009) Biodegradation of the"                                                                                                                                                                                                                            
## [1268] "journal.pone.0030862.txt-organophosphorus insecticide diazinon by Serratia sp. and Pseudomonas sp. and"                                                                                                                                                                                                                      
## [1269] "--"                                                                                                                                                                                                                                                                                                                          
## [1270] "journal.pone.0030862.txt-41. Chen SH, Yang L, Hu MY, Liu JJ (2011) Biodegradation of fenvalerate and 3-"                                                                                                                                                                                                                     
## [1271] "journal.pone.0030862.txt-phenoxybenzoic acid by a novel Stenotrophomonas sp. strain ZS-S-01 and its use in"                                                                                                                                                                                                                  
## [1272] "journal.pone.0030862.txt-bioremediation of contaminated soils. Appl Microbiol Biotechnol 90: 755–767."                                                                                                                                                                                                                       
## [1273] "journal.pone.0030862.txt:42. Chen SH, Geng P, Xiao Y, Hu MY (2011) Bioremediation of b-cypermethrin"                                                                                                                                                                                                                         
## [1274] "journal.pone.0030862.txt-and 3-phenoxybenzaldehyde contaminated soils using Streptomyces aureus HP-"                                                                                                                                                                                                                         
## [1275] "journal.pone.0030862.txt-S-01. Appl Microbiol Biotechnol, in press."                                                                                                                                                                                                                                                         
## [1276] "journal.pone.0030862.txt-43. Wang YQ, Zhang JS, Zhou JT, Zhang ZP (2009) Biodegradation of 4-"                                                                                                                                                                                                                               
## [1277] "--"                                                                                                                                                                                                                                                                                                                          
## [1278] "journal.pone.0030967.txt-68. Clements AN (1999) The biology of mosquitoes. 2, sensory reception and"                                                                                                                                                                                                                         
## [1279] "journal.pone.0030967.txt-behaviour: Chapman & Hall. ."                                                                                                                                                                                                                                                                       
## [1280] "journal.pone.0030967.txt-69. Mosha FW, Lyimo IN, Oxborough RM, Matowo J, Malima R, et al. (2008)"                                                                                                                                                                                                                            
## [1281] "journal.pone.0030967.txt:Comparative efficacies of permethrin-, deltamethrin- and a-cypermethrin-"                                                                                                                                                                                                                           
## [1282] "journal.pone.0030967.txt-treated nets, against Anopheles arabiensis and Culex quinquefasciatus in northern"                                                                                                                                                                                                                  
## [1283] "journal.pone.0030967.txt-Tanzania. Ann Trop Med and Parasitol 102: 367–376."                                                                                                                                                                                                                                                 
## [1284] "journal.pone.0030967.txt-70. Lines JD, Myamba J, Curtis CF (1987) Experimental hut trials of permethrin-"                                                                                                                                                                                                                    
## [1285] "--"                                                                                                                                                                                                                                                                                                                          
## [1286] "journal.pone.0031481.txt-Crop Sciences, Lyons, France) treated polyester fibre at"                                                                                                                                                                                                                                           
## [1287] "journal.pone.0031481.txt-25 mg/m2"                                                                                                                                                                                                                                                                                           
## [1288] "journal.pone.0031481.txt-."                                                                                                                                                                                                                                                                                                  
## [1289] "journal.pone.0031481.txt:5- Alphacypermethrin (Fendona SC; BASF Agricultural"                                                                                                                                                                                                                                                
## [1290] "journal.pone.0031481.txt-Products, Limburgerhof, Germany) treated polyester fibre"                                                                                                                                                                                                                                           
## [1291] "journal.pone.0031481.txt-at 25 mg/m2"                                                                                                                                                                                                                                                                                        
## [1292] "journal.pone.0031481.txt-."                                                                                                                                                                                                                                                                                                  
## [1293] "--"                                                                                                                                                                                                                                                                                                                          
## [1294] "journal.pone.0031481.txt-KO TAB 1-2-3 LN (deltamethrin) 38 (33–43) 88 (75–101) 62 (53–71) 38 (37–41) 90 (66–97) 64 (48–76)"                                                                                                                                                                                                  
## [1295] "journal.pone.0031481.txt-IconMaxx LN (lambdacyhalothrin) 44 (37–51) 74 (59–89) 75 (66–72) 45 (24–65) 72 (49–86) 76 (59–87)"                                                                                                                                                                                                  
## [1296] "journal.pone.0031481.txt-Deltamethrin ITN 29 (23–34) 76 (73–79) 78 (74–83) 32 (15–49) 76 (65–84) 77 (67–85)"                                                                                                                                                                                                                 
## [1297] "journal.pone.0031481.txt:Alphacypermethrin ITN 36 (31–40) 71 (62–80) 68 (62–74) 41 (19–60) 71 (39–89) 68 (62–79)"                                                                                                                                                                                                            
## [1298] "journal.pone.0031481.txt-Carbosulfan ITN 67 (63–71) 99 (97–100) 100 (100-100) 65 (46–77) 99 (97–100) 100 (100-100)"                                                                                                                                                                                                          
## [1299] "journal.pone.0031481.txt-doi:10.1371/journal.pone.0031481.t001"                                                                                                                                                                                                                                                              
## [1300] "journal.pone.0031481.txt-Figure 2. Overall mortality of free flying mosquitoes ±95% confidence interval. Anopheles arabiensis (white), An. gambiae (black) and An."                                                                                                                                                          
## [1301] "--"                                                                                                                                                                                                                                                                                                                          
## [1302] "journal.pone.0031481.txt-KO TAB 1-2-3 LN 100 (50) 100 (50) [7]"                                                                                                                                                                                                                                                              
## [1303] "journal.pone.0031481.txt-IconMaxx LN 96 (50) 100 (50) [8]"                                                                                                                                                                                                                                                                   
## [1304] "journal.pone.0031481.txt-Deltamethrin ITN 98 (57) 100 (100) [4,6]"                                                                                                                                                                                                                                                           
## [1305] "journal.pone.0031481.txt:Alphacypermethrin ITN 93 (67) 84 (100) [5,6]"                                                                                                                                                                                                                                                       
## [1306] "journal.pone.0031481.txt-Carbosulfan ITN 100 (100) 100 (100) [4]"                                                                                                                                                                                                                                                            
## [1307] "journal.pone.0031481.txt-doi:10.1371/journal.pone.0031481.t002"                                                                                                                                                                                                                                                              
## [1308] "journal.pone.0031481.txt-Table 3. Blood feeding rates and insecticide-induced feeding inhibition of free flying Anopheline mosquitoes."                                                                                                                                                                                      
## [1309] "--"                                                                                                                                                                                                                                                                                                                          
## [1310] "journal.pone.0031481.txt-[24] 49 a"                                                                                                                                                                                                                                                                                          
## [1311] "journal.pone.0031481.txt-[26] 79 a"                                                                                                                                                                                                                                                                                          
## [1312] "journal.pone.0031481.txt-[45] [4,6]"                                                                                                                                                                                                                                                                                         
## [1313] "journal.pone.0031481.txt:Alphacypermethrin ITN 17 (10–27) 9 (4–19) 10 (5–19) 24 c"                                                                                                                                                                                                                                           
## [1314] "journal.pone.0031481.txt-[31 c"                                                                                                                                                                                                                                                                                              
## [1315] "journal.pone.0031481.txt-] 27 b"                                                                                                                                                                                                                                                                                             
## [1316] "journal.pone.0031481.txt-[68] 69 a"                                                                                                                                                                                                                                                                                          
## [1317] "--"                                                                                                                                                                                                                                                                                                                          
## [1318] "journal.pone.0031481.txt-experimental hut evaluation of Olyset nets against anopheline mosquitoes after"                                                                                                                                                                                                                     
## [1319] "journal.pone.0031481.txt-seven years use in Tanzanian villages. Malaria Journal 7: 38."                                                                                                                                                                                                                                      
## [1320] "journal.pone.0031481.txt-6. Mosha FW, Lyimo IN, Oxborough RM, Matowo J, Malima R, et al. (2008)"                                                                                                                                                                                                                             
## [1321] "journal.pone.0031481.txt:Comparative efficacies of permethrin-, deltamethrin- and alpha-cypermethrin-"                                                                                                                                                                                                                       
## [1322] "journal.pone.0031481.txt-treated nets, against Anopheles arabiensis and Culex quinquefasciatus in"                                                                                                                                                                                                                           
## [1323] "journal.pone.0031481.txt-northern Tanzania. Ann Trop Med Parasitol 102: 367–376."                                                                                                                                                                                                                                            
## [1324] "journal.pone.0031481.txt-7. WHOPES (2007) Review of: Spinosad 0.5% GR & 12% SC, Lambda-"                                                                                                                                                                                                                                     
## [1325] "--"                                                                                                                                                                                                                                                                                                                          
## [1326] "journal.pone.0031481.txt-[82] 6 b"                                                                                                                                                                                                                                                                                           
## [1327] "journal.pone.0031481.txt-[88] 16 a"                                                                                                                                                                                                                                                                                          
## [1328] "journal.pone.0031481.txt-[81]"                                                                                                                                                                                                                                                                                               
## [1329] "journal.pone.0031481.txt:Alphacypermethrin ITN 84 (80–88) 95 (85–98) 100 (96–100) 2 d"                                                                                                                                                                                                                                       
## [1330] "journal.pone.0031481.txt-[82] 4 d"                                                                                                                                                                                                                                                                                           
## [1331] "journal.pone.0031481.txt-[91] 9 b"                                                                                                                                                                                                                                                                                           
## [1332] "journal.pone.0031481.txt-[91]"                                                                                                                                                                                                                                                                                               
## [1333] "--"                                                                                                                                                                                                                                                                                                                          
## [1334] "journal.pone.0031889.txt-8. Abedi ZH, Brown AWA (1961) DDT-resistance hazard in North American"                                                                                                                                                                                                                              
## [1335] "journal.pone.0031889.txt-populations of Aedes aegypti. Mosquito News 21: 4."                                                                                                                                                                                                                                                 
## [1336] "journal.pone.0031889.txt-9. da-Cunha MP, Lima JBP, Brogdon WG, Moya GE, Valle D (2005) Monitoring"                                                                                                                                                                                                                           
## [1337] "journal.pone.0031889.txt:of resistance to the pyrethroid cypermethrin in Brazilian Aedes aegypti (Diptera :"                                                                                                                                                                                                                 
## [1338] "journal.pone.0031889.txt-Culicidae) populations collected between 2001 and 2003. Memorias Do Instituto"                                                                                                                                                                                                                      
## [1339] "journal.pone.0031889.txt-Oswaldo Cruz 100: 441–444."                                                                                                                                                                                                                                                                         
## [1340] "journal.pone.0031889.txt-10. Lima JBP, Da-Cunha MP, Da Silva RC, Galardo AKR, Soares SD, et al. (2003)"                                                                                                                                                                                                                      
## [1341] "--"                                                                                                                                                                                                                                                                                                                          
## [1342] "journal.pone.0031963.txt-vol. 177. Rome: FAO/WHO Joint Publications."                                                                                                                                                                                                                                                        
## [1343] "journal.pone.0031963.txt-25. Szeto SY, MacCarthy HR, Oloffs PC, Shepherd RF (1979) The fate of acephate"                                                                                                                                                                                                                     
## [1344] "journal.pone.0031963.txt-and carbaryl in water. J Environ Sci Health B 14: 635–654."                                                                                                                                                                                                                                         
## [1345] "journal.pone.0031963.txt:26. Battu R, Sahoo S, Jyot G (2009) Persistence of Acephate and Cypermethrin on"                                                                                                                                                                                                                    
## [1346] "journal.pone.0031963.txt-Cotton Leaves, Cottonseed, Lint and Soil. Bull Environ Contam Toxicol 82:"                                                                                                                                                                                                                          
## [1347] "journal.pone.0031963.txt-124–128."                                                                                                                                                                                                                                                                                           
## [1348] "journal.pone.0031963.txt-27. Wang L, Wen Y, Guo X, Wang G, Li S, et al. (2010) Degradation of"                                                                                                                                                                                                                               
## [1349] "--"                                                                                                                                                                                                                                                                                                                          
## [1350] "journal.pone.0034249.txt-(captan), Flint Flowable25 (trifloxystrobin), cyprodinil, Antracol"                                                                                                                                                                                                                                 
## [1351] "journal.pone.0034249.txt-WG (propineb), calcium carbonate, and copper organic com-"                                                                                                                                                                                                                                          
## [1352] "journal.pone.0034249.txt-pounds as fungicide, and machine oil, organophosphorus"                                                                                                                                                                                                                                             
## [1353] "journal.pone.0034249.txt:compounds (e.g. chlorpyrifos), pyrethroid (e.g. cypermethrin),"                                                                                                                                                                                                                                     
## [1354] "journal.pone.0034249.txt-and neonicotinoid (e.g. clothianidin) as insecticide. In comparison,"                                                                                                                                                                                                                               
## [1355] "journal.pone.0034249.txt-the trees in Orchard A-organic (Japan Agricultural Standard (JAS)"                                                                                                                                                                                                                                  
## [1356] "journal.pone.0034249.txt-organic; owned by Hirosaki University) in the neighboring field"                                                                                                                                                                                                                                    
## [1357] "--"                                                                                                                                                                                                                                                                                                                          
## [1358] "journal.pone.0034936.txt-]o could be due to a calcium-"                                                                                                                                                                                                                                                                      
## [1359] "journal.pone.0034936.txt-dependent dephosphorylation of AQP4. The protein phosphatase"                                                                                                                                                                                                                                       
## [1360] "journal.pone.0034936.txt-2B, calcineurin, is activated by calcium [20]. Indeed, following"                                                                                                                                                                                                                                   
## [1361] "journal.pone.0034936.txt:15min preincubation with cypermethrin (5nM), a potent inhibitor"                                                                                                                                                                                                                                    
## [1362] "journal.pone.0034936.txt-of calcineurin, astrocyte water permeability recorded after 5min of"                                                                                                                                                                                                                                
## [1363] "journal.pone.0034936.txt-35mM [K+"                                                                                                                                                                                                                                                                                           
## [1364] "journal.pone.0034936.txt-]o was increased by 25% (0.016 6 0.0008 versus 0.020"                                                                                                                                                                                                                                               
## [1365] "--"                                                                                                                                                                                                                                                                                                                          
## [1366] "journal.pone.0034936.txt-]i peak at about 180s. Lower right panel shows summarized"                                                                                                                                                                                                                                          
## [1367] "journal.pone.0034936.txt-calcium data normalized to the peak [Ca2+"                                                                                                                                                                                                                                                          
## [1368] "journal.pone.0034936.txt-]i induced by ATP, n = 103. (B)"                                                                                                                                                                                                                                                                    
## [1369] "journal.pone.0034936.txt:After preincubation with the calcineurin inhibitor cypermethrin, 35mM"                                                                                                                                                                                                                              
## [1370] "journal.pone.0034936.txt-potassium significantly increased astrocyte water permeability at 5min"                                                                                                                                                                                                                             
## [1371] "journal.pone.0034936.txt-(*p,0.01, n = 73–89). Values are means6SEM, n; number of cells."                                                                                                                                                                                                                                    
## [1372] "journal.pone.0034936.txt-doi:10.1371/journal.pone.0034936.g003"                                                                                                                                                                                                                                                              
## [1373] "--"                                                                                                                                                                                                                                                                                                                          
## [1374] "journal.pone.0034936.txt-ATP."                                                                                                                                                                                                                                                                                               
## [1375] "journal.pone.0034936.txt-Drugs Used in Water Permeability- and Intracellular"                                                                                                                                                                                                                                                
## [1376] "journal.pone.0034936.txt-Calcium Measurements"                                                                                                                                                                                                                                                                               
## [1377] "journal.pone.0034936.txt:Cypermethrin (5nM, 15min) from Sigma and KT 5720 (1mM,"                                                                                                                                                                                                                                             
## [1378] "journal.pone.0034936.txt-5min) from Merck, were applied before exposure to high"                                                                                                                                                                                                                                             
## [1379] "journal.pone.0034936.txt-extracellular potassium. For [Ca2+"                                                                                                                                                                                                                                                                 
## [1380] "journal.pone.0034936.txt-]i and water permeability"                                                                                                                                                                                                                                                                          
## [1381] "--"                                                                                                                                                                                                                                                                                                                          
## [1382] "journal.pone.0036366.txt-castaneum, herbst (coleoptera: tenebrionidae). Comp Biochem"                                                                                                                                                                                                                                        
## [1383] "journal.pone.0036366.txt-Physiol C Pharmacol Toxicol Endocrinol 94: 419–423."                                                                                                                                                                                                                                                
## [1384] "journal.pone.0036366.txt-96. Valles SM, Dong K, Brenner R (2000) Mechanisms responsible for"                                                                                                                                                                                                                                 
## [1385] "journal.pone.0036366.txt:cypermethrin resistance in a strain of German cockroach, Blattella germanica."                                                                                                                                                                                                                      
## [1386] "journal.pone.0036366.txt-Pestic Biochem Physiol 66 66: 195–205."                                                                                                                                                                                                                                                             
## [1387] "journal.pone.0036366.txt-97. Auld JR, Agrawal AA, Relyea RA (2010) Re-evaluating the costs and limits of"                                                                                                                                                                                                                    
## [1388] "journal.pone.0036366.txt-adaptive phenotypic plasticity. Proceedings of the Royal Society B-Biological"                                                                                                                                                                                                                      
## [1389] "--"                                                                                                                                                                                                                                                                                                                          
## [1390] "journal.pone.0037124.txt-Burkina Faso, more than 20,000 insecticide impregnated targets"                                                                                                                                                                                                                                     
## [1391] "journal.pone.0037124.txt-were deployed along the Mouhoun River and its tributaries to"                                                                                                                                                                                                                                       
## [1392] "journal.pone.0037124.txt-drastically reduce tsetse densities in the PATTEC intervention"                                                                                                                                                                                                                                     
## [1393] "journal.pone.0037124.txt:area. Cypermethrin-based pour-on treatment was applied on"                                                                                                                                                                                                                                          
## [1394] "journal.pone.0037124.txt-cattle in the buffer areas, located at the borders of the study area"                                                                                                                                                                                                                               
## [1395] "journal.pone.0037124.txt-along 10 km of the Mouhoun River and its tributaries [35]. In"                                                                                                                                                                                                                                      
## [1396] "journal.pone.0037124.txt-addition the eastern branch of the Mouhoun River was treated"                                                                                                                                                                                                                                       
## [1397] "--"                                                                                                                                                                                                                                                                                                                          
## [1398] "journal.pone.0037586.txt-microgram quantities of protein utilizing the principle of protein-dye binding."                                                                                                                                                                                                                    
## [1399] "journal.pone.0037586.txt-Anal Biochem 72: 248–254."                                                                                                                                                                                                                                                                          
## [1400] "journal.pone.0037586.txt-12. Ottea JA, Ibrahim SA, Younis AM, Young RJ (2000) Mechanisms of pyrethroid"                                                                                                                                                                                                                      
## [1401] "journal.pone.0037586.txt:resistance in larvae and adults from a cypermethrin-selected strain of Heliothis"                                                                                                                                                                                                                   
## [1402] "journal.pone.0037586.txt-virescens. Pestic Biochem Phys 66: 20–32."                                                                                                                                                                                                                                                          
## [1403] "journal.pone.0037586.txt-13. Rose RL, Barbhaiya L, Roe RM, Rock GC, Hodgson E (1995) Cytochrome"                                                                                                                                                                                                                             
## [1404] "journal.pone.0037586.txt-P450-associated resistance and the development of biochemical diagnostic assays"                                                                                                                                                                                                                    
## [1405] "--"                                                                                                                                                                                                                                                                                                                          
## [1406] "journal.pone.0038137.txt-16. Singh BK (2009) Organophosphorus-degrading bacteria: ecology and industrial"                                                                                                                                                                                                                    
## [1407] "journal.pone.0038137.txt-applications. Nature Rev Microbiol 7: 156–163."                                                                                                                                                                                                                                                     
## [1408] "journal.pone.0038137.txt-17. Chen SH, Hu MY, Liu JJ, Zhong GH, Yang L, et al. (2011) Biodegradation of"                                                                                                                                                                                                                      
## [1409] "journal.pone.0038137.txt:beta-cypermethrin and 3-phenoxybenzoic acid by a novel Ochrobactrum lupini"                                                                                                                                                                                                                         
## [1410] "journal.pone.0038137.txt-DG-S-01. J Hazard Mater 187: 433–440."                                                                                                                                                                                                                                                              
## [1411] "journal.pone.0038137.txt-18. Chen SH, Luo JJ, Hu MY, Geng P, Zhang YB (2012) Microbial detoxification of"                                                                                                                                                                                                                    
## [1412] "journal.pone.0038137.txt-bifenthrin by a novel yeast and its potential for contaminated soils treatment."                                                                                                                                                                                                                    
## [1413] "--"                                                                                                                                                                                                                                                                                                                          
## [1414] "journal.pone.0038137.txt-carbofuran by Pichia anomala strain HQ-C-01 and its application for"                                                                                                                                                                                                                                
## [1415] "journal.pone.0038137.txt-bioremediation of contaminated soils. Biol Fert Soils 47: 917–923."                                                                                                                                                                                                                                 
## [1416] "journal.pone.0038137.txt-21. Chen SH, Luo JJ, Hu MY, Lai KP, Geng P, et al. (2012) Enhancement of"                                                                                                                                                                                                                           
## [1417] "journal.pone.0038137.txt:cypermethrin degradation by a coculture of Bacillus cereus ZH-3 and"                                                                                                                                                                                                                                
## [1418] "journal.pone.0038137.txt-Streptomyces aureus HP-S-01. Bioresource Technol 110: 97–104."                                                                                                                                                                                                                                      
## [1419] "journal.pone.0038137.txt-22. Zhang C, Wang SH, Yan YC (2011) Isomerization and biodegradation of beta-"                                                                                                                                                                                                                      
## [1420] "journal.pone.0038137.txt:cypermethrin by Pseudomonas aeruginosa CH7 with biosurfactant production."                                                                                                                                                                                                                          
## [1421] "journal.pone.0038137.txt-Bioresource Technol 102: 7139–7146."                                                                                                                                                                                                                                                                
## [1422] "journal.pone.0038137.txt:23. Chen SH, Geng P, Xiao Y, Hu MY (2012) Bioremediation of b-cypermethrin"                                                                                                                                                                                                                         
## [1423] "journal.pone.0038137.txt-and 3-phenoxybenzaldehyde contaminated soils using Streptomyces aureus HP-"                                                                                                                                                                                                                         
## [1424] "journal.pone.0038137.txt-S-01. Appl Microbiol Biotechnol 94: 505–515."                                                                                                                                                                                                                                                       
## [1425] "journal.pone.0038137.txt-24. Singh BK, Walker A, Morgan JA, Wright DJ (2004) Biodegradation of"                                                                                                                                                                                                                              
## [1426] "--"                                                                                                                                                                                                                                                                                                                          
## [1427] "journal.pone.0039439.txt-explanation would be that the population has cross resistance to"                                                                                                                                                                                                                                   
## [1428] "journal.pone.0039439.txt-other insecticides that are applied as adulticides, but this is not the"                                                                                                                                                                                                                            
## [1429] "journal.pone.0039439.txt-case for this strain, which is susceptible to the pyrethroids"                                                                                                                                                                                                                                      
## [1430] "journal.pone.0039439.txt:deltamethrin, cypermethrin, malathion (organophosphate) and"                                                                                                                                                                                                                                        
## [1431] "journal.pone.0039439.txt-pyriproxyfen (a juvenile hormone analogue) [22]. Only one gene,"                                                                                                                                                                                                                                    
## [1432] "journal.pone.0039439.txt-CYP6N12, was over expressed in both larvae and adult females,"                                                                                                                                                                                                                                      
## [1433] "journal.pone.0039439.txt-albeit at lower levels in the latter. The application of temephos"                                                                                                                                                                                                                                  
## [1434] "--"                                                                                                                                                                                                                                                                                                                          
## [1435] "journal.pone.0039439.txt-Santos et al. [22] was used at F20, in the microarray and q-RT-"                                                                                                                                                                                                                                    
## [1436] "journal.pone.0039439.txt-PCR assays,. This strain has been previously tested against other"                                                                                                                                                                                                                                  
## [1437] "journal.pone.0039439.txt-chemical insecticides and showed to be susceptible to malathion"                                                                                                                                                                                                                                    
## [1438] "journal.pone.0039439.txt:(organophosphate), cypermethrin, deltamethrin (pyrethroid) and"                                                                                                                                                                                                                                     
## [1439] "journal.pone.0039439.txt-pyriproxyfen (a juvenile hormone analogue). Ae. aegypti RecL was"                                                                                                                                                                                                                                   
## [1440] "journal.pone.0039439.txt-used as a reference of susceptibility to temephos. This strain is"                                                                                                                                                                                                                                  
## [1441] "journal.pone.0039439.txt-original from Recife, Pernambuco, Brazil and has been kept in the"                                                                                                                                                                                                                                  
## [1442] "--"                                                                                                                                                                                                                                                                                                                          
## [1443] "journal.pone.0039439.txt-analysis of genes showing variable expression following a blood meal in"                                                                                                                                                                                                                            
## [1444] "journal.pone.0039439.txt-Anopheles gambiae. Insect Mol Biol 14: 365–373."                                                                                                                                                                                                                                                    
## [1445] "journal.pone.0039439.txt-25. Sharma SK, Upadhyay AK, Haque MA, Tyagi PK, Raghavendra K, et al."                                                                                                                                                                                                                              
## [1446] "journal.pone.0039439.txt:(2010) Wash-resistance and field evaluation of alphacypermethrin treated long-"                                                                                                                                                                                                                     
## [1447] "journal.pone.0039439.txt-lasting insecticidal net (Interceptor) against malaria vectors Anopheles"                                                                                                                                                                                                                           
## [1448] "journal.pone.0039439.txt-culicifacies and Anopheles fluviatilis in a tribal area of Orissa, India. Acta Trop"                                                                                                                                                                                                                
## [1449] "journal.pone.0039439.txt-116: 24–30."                                                                                                                                                                                                                                                                                        
## [1450] "--"                                                                                                                                                                                                                                                                                                                          
## [1451] "journal.pone.0041072.txt-Hanna et al. [34] observed the inhibition effect of b-CD on the"                                                                                                                                                                                                                                    
## [1452] "journal.pone.0041072.txt-photocatalytic degradation of pentachlorophenol in distilled water,"                                                                                                                                                                                                                                
## [1453] "journal.pone.0041072.txt-and also Orgova´nyi et al. [35] reported an inhibition of the"                                                                                                                                                                                                                                      
## [1454] "journal.pone.0041072.txt:photodegradation of the insecticide cypermethrin by complexation"                                                                                                                                                                                                                                   
## [1455] "journal.pone.0041072.txt-with two methylated CDs (RAMEB and DIMEB)."                                                                                                                                                                                                                                                         
## [1456] "journal.pone.0041072.txt-Figure 3. Determination of the stoichiometry of the complex. Continuous variation plot (Job plot) of the absorption change in dependence"                                                                                                                                                           
## [1457] "journal.pone.0041072.txt-of the bentazon mole fraction."                                                                                                                                                                                                                                                                     
## [1458] "--"                                                                                                                                                                                                                                                                                                                          
## [1459] "journal.pone.0041072.txt-Degradation of pentachlorophenol in cyclodextrin extraction effluent using a"                                                                                                                                                                                                                       
## [1460] "journal.pone.0041072.txt-photocatalytic process. Science of the Total Environment 332: 51–60."                                                                                                                                                                                                                               
## [1461] "journal.pone.0041072.txt-35. Orgova´nyi J, Otta KH, Po¨ppl L, Fenyvesi E´, Za´ray G (2005) Spectrophoto-"                                                                                                                                                                                                                    
## [1462] "journal.pone.0041072.txt:metric and thermoanalytical study of cypermethrin/cyclodextrin complexes."                                                                                                                                                                                                                          
## [1463] "journal.pone.0041072.txt-Microchemical Journal 79: 77–82."                                                                                                                                                                                                                                                                   
## [1464] "journal.pone.0041072.txt-36. Dua K, Ramana MV, Singh Sara UV, Himaja M, Agrawal A, et al. (2007)"                                                                                                                                                                                                                            
## [1465] "journal.pone.0041072.txt-Investigation of Enhancement of Solubility of Norfloxacin -Cyclodextrin in"                                                                                                                                                                                                                         
## [1466] "--"                                                                                                                                                                                                                                                                                                                          
## [1467] "journal.pone.0042857.txt-controlling for seasonality and age. Considering patients less than five years of age there was a modest decrease in the odds"                                                                                                                                                                      
## [1468] "journal.pone.0042857.txt-of malaria following the 1st"                                                                                                                                                                                                                                                                       
## [1469] "journal.pone.0042857.txt-round of IRS using DDT (OR = 0.76, p,0.001) and the 2nd"                                                                                                                                                                                                                                            
## [1470] "journal.pone.0042857.txt:round using alpha-cypermethrin"                                                                                                                                                                                                                                                                     
## [1471] "journal.pone.0042857.txt-(OR = 0.83, p = 0.002). Following rounds 3–5 using bendiocarb there was a much greater decrease in the odds of malaria"                                                                                                                                                                             
## [1472] "journal.pone.0042857.txt-(ORs 0.34, 0.16, 0.17 respectively, p,0.001 for all comparisons). Overall, the impact of IRS was less pronounced among"                                                                                                                                                                             
## [1473] "journal.pone.0042857.txt-patients 5 years or older."                                                                                                                                                                                                                                                                         
## [1474] "--"                                                                                                                                                                                                                                                                                                                          
## [1475] "journal.pone.0042857.txt-Over the 4 K year study period, 5 rounds of IRS were"                                                                                                                                                                                                                                               
## [1476] "journal.pone.0042857.txt-completed (Table 1). Round 1 occurred from March-May 2008"                                                                                                                                                                                                                                          
## [1477] "journal.pone.0042857.txt-using DDT, round 2 occurred from March-April 2010 using the"                                                                                                                                                                                                                                        
## [1478] "journal.pone.0042857.txt:pyrethroid alpha-cypermethrin, and rounds 3–5 occurred at"                                                                                                                                                                                                                                          
## [1479] "journal.pone.0042857.txt-approximately 5 months intervals from August 2010 through"                                                                                                                                                                                                                                          
## [1480] "journal.pone.0042857.txt-June 2011 using the carbamate bendiocarb. Coverage of"                                                                                                                                                                                                                                              
## [1481] "journal.pone.0042857.txt-households sprayed and population protected was over 90% in"                                                                                                                                                                                                                                        
## [1482] "--"                                                                                                                                                                                                                                                                                                                          
## [1483] "journal.pone.0042857.txt-IRS. A categorical time variable was created that included the 6"                                                                                                                                                                                                                                   
## [1484] "journal.pone.0042857.txt-month period following the 1st"                                                                                                                                                                                                                                                                     
## [1485] "journal.pone.0042857.txt-round of IRS with DDT, each 4"                                                                                                                                                                                                                                                                      
## [1486] "journal.pone.0042857.txt:month period following rounds 2–5 of IRS with a-cypermethrin"                                                                                                                                                                                                                                       
## [1487] "journal.pone.0042857.txt-and then bendiocarb. The longer period following DDT was done"                                                                                                                                                                                                                                      
## [1488] "journal.pone.0042857.txt-to reflect its longer duration of action and the fact that the period"                                                                                                                                                                                                                              
## [1489] "journal.pone.0042857.txt-between rounds 2–5 was approximately 4 months. The baseline"                                                                                                                                                                                                                                        
## [1490] "--"                                                                                                                                                                                                                                                                                                                          
## [1491] "journal.pone.0042857.txt-IRS and Malaria Morbidity in Uganda"                                                                                                                                                                                                                                                                
## [1492] "journal.pone.0042857.txt-PLoS ONE | www.plosone.org 2 August 2012 | Volume 7 | Issue 8 | e42857"                                                                                                                                                                                                                             
## [1493] "journal.pone.0042857.txt-\for older (OR = 0.70, 95% CI 0.61–0.79, p,0.001). During the 4"                                                                                                                                                                                                                                    
## [1494] "journal.pone.0042857.txt:months following the 2nd round of IRS with alpha-cypermethrin"                                                                                                                                                                                                                                      
## [1495] "journal.pone.0042857.txt-there was a significant decrease in the odds of having malaria"                                                                                                                                                                                                                                     
## [1496] "journal.pone.0042857.txt-among patients less than 5 years of age (OR = 0.83, 95% CI 0.73–"                                                                                                                                                                                                                                   
## [1497] "journal.pone.0042857.txt-0.93. p = 0.002), but not among those 5 years of age or older"                                                                                                                                                                                                                                      
## [1498] "--"                                                                                                                                                                                                                                                                                                                          
## [1499] "journal.pone.0042857.txt-Percentage of the population"                                                                                                                                                                                                                                                                       
## [1500] "journal.pone.0042857.txt-protected"                                                                                                                                                                                                                                                                                          
## [1501] "journal.pone.0042857.txt-DDT March 2008–May 2008 92.4% 91.0%"                                                                                                                                                                                                                                                                
## [1502] "journal.pone.0042857.txt:alpha-cypermethrin March 9th"                                                                                                                                                                                                                                                                       
## [1503] "journal.pone.0042857.txt-2010–March 31st"                                                                                                                                                                                                                                                                                    
## [1504] "journal.pone.0042857.txt-2010 99.9% 99.9%"                                                                                                                                                                                                                                                                                   
## [1505] "journal.pone.0042857.txt-bendiocarb August 23rd"                                                                                                                                                                                                                                                                             
## [1506] "--"                                                                                                                                                                                                                                                                                                                          
## [1507] "journal.pone.0042857.txt-rounds of IRS, there was again"                                                                                                                                                                                                                                                                     
## [1508] "journal.pone.0042857.txt-evidence of modest decrease in malaria morbidity in the 4 months"                                                                                                                                                                                                                                   
## [1509] "journal.pone.0042857.txt-following the 2nd"                                                                                                                                                                                                                                                                                  
## [1510] "journal.pone.0042857.txt:round of IRS with alpha-cypermethrin, but only"                                                                                                                                                                                                                                                     
## [1511] "journal.pone.0042857.txt-among patients less than 5 years of age. Following the 3rd"                                                                                                                                                                                                                                         
## [1512] "journal.pone.0042857.txt-through"                                                                                                                                                                                                                                                                                            
## [1513] "journal.pone.0042857.txt-5th"                                                                                                                                                                                                                                                                                                
## [1514] "--"                                                                                                                                                                                                                                                                                                                          
## [1515] "journal.pone.0042857.txt-roundwithDDT"                                                                                                                                                                                                                                                                                       
## [1516] "journal.pone.0042857.txt-0.91(0.82–1.02)0.110.76(0.67–0.86),0.0010.82(0.73–0.93)0.0010.70(0.61–0.79),0.001"                                                                                                                                                                                                                  
## [1517] "journal.pone.0042857.txt-4monthsaftercompletionof2nd"                                                                                                                                                                                                                                                                        
## [1518] "journal.pone.0042857.txt:roundwithalpha-cypermethrin"                                                                                                                                                                                                                                                                        
## [1519] "journal.pone.0042857.txt-0.96(0.86–1.07)0.480.83(0.73–0.93)0.0021.12(1.03–1.23)0.011.09(0.98–1.22)0.10"                                                                                                                                                                                                                      
## [1520] "journal.pone.0042857.txt-4monthsaftercompletionof3rd"                                                                                                                                                                                                                                                                        
## [1521] "journal.pone.0042857.txt-roundwithbendiocarb"                                                                                                                                                                                                                                                                                
## [1522] "--"                                                                                                                                                                                                                                                                                                                          
## [1523] "journal.pone.0042857.txt-roundwithDDT"                                                                                                                                                                                                                                                                                       
## [1524] "journal.pone.0042857.txt-0.89(0.77–1.04)0.140.76(0.64–0.89)0.0010.78(0.66–0.91)0.0020.63(0.53–0.75),0.001"                                                                                                                                                                                                                   
## [1525] "journal.pone.0042857.txt-4monthsaftercompletionof2nd"                                                                                                                                                                                                                                                                        
## [1526] "journal.pone.0042857.txt:roundwithalpha-cypermethrin"                                                                                                                                                                                                                                                                        
## [1527] "journal.pone.0042857.txt-0.90(0.78–1.03)0140.76(0.65–0.90)0.0011.12(0.99–1.26)0.061.12(0.98–1.29)0.11"                                                                                                                                                                                                                       
## [1528] "journal.pone.0042857.txt-4monthsaftercompletionof3rd"                                                                                                                                                                                                                                                                        
## [1529] "journal.pone.0042857.txt-roundwithbendiocarb"                                                                                                                                                                                                                                                                                
## [1530] "--"                                                                                                                                                                                                                                                                                                                          
## [1531] "journal.pone.0042857.txt-classes of insecticide. For example the dramatic decrease in"                                                                                                                                                                                                                                       
## [1532] "journal.pone.0042857.txt-malaria morbidity seen after rounds 3–5 using bendiocarb may"                                                                                                                                                                                                                                       
## [1533] "journal.pone.0042857.txt-have been different if this was not preceded by the previous 2"                                                                                                                                                                                                                                     
## [1534] "journal.pone.0042857.txt:rounds using DDT and alpha-cypermethrin, respectively. Indeed,"                                                                                                                                                                                                                                     
## [1535] "journal.pone.0042857.txt-it has been suggested that in very high transmission settings several"                                                                                                                                                                                                                              
## [1536] "journal.pone.0042857.txt-years of IRS may be needed to have an appreciable health impact"                                                                                                                                                                                                                                    
## [1537] "journal.pone.0042857.txt-[27]. Another limitation of this study is the use of the SPR as the"                                                                                                                                                                                                                                
## [1538] "--"                                                                                                                                                                                                                                                                                                                          
## [1539] "journal.pone.0042857.txt-(2009) Malaria in Sao Tome and principe: on the brink of elimination after three"                                                                                                                                                                                                                   
## [1540] "journal.pone.0042857.txt-years of effective antimalarial measures. Am J Trop Med Hyg 80: 133–140."                                                                                                                                                                                                                           
## [1541] "journal.pone.0042857.txt-10. Tseng LF, Chang WC, Ferreira MC, Wu CH, Rampao HS, et al. (2008) Rapid"                                                                                                                                                                                                                         
## [1542] "journal.pone.0042857.txt:control of malaria by means of indoor residual spraying of alphacypermethrin in"                                                                                                                                                                                                                    
## [1543] "journal.pone.0042857.txt-the Democratic Republic of Sao Tome and Principe. Am J Trop Med Hyg 78:"                                                                                                                                                                                                                            
## [1544] "journal.pone.0042857.txt-248–250."                                                                                                                                                                                                                                                                                           
## [1545] "journal.pone.0042857.txt-11. Abilio AP, Kleinschmidt I, Rehman AM, Cuamba N, Ramdeen V, et al. (2011)"                                                                                                                                                                                                                       
## [1546] "--"                                                                                                                                                                                                                                                                                                                          
## [1547] "journal.pone.0047205.txt-phenoxybenzoic acid by a novel Stenotrophomonas sp. strain ZS-S-01 and its use in"                                                                                                                                                                                                                  
## [1548] "journal.pone.0047205.txt-bioremediation of contaminated soils. Appl Microbiol Biotechnol 90: 755–767."                                                                                                                                                                                                                       
## [1549] "journal.pone.0047205.txt-42. Chen SH, Hu MY, Liu JJ, Zhong GH, Yang L, et al. (2011) Biodegradation of"                                                                                                                                                                                                                      
## [1550] "journal.pone.0047205.txt:beta-cypermethrin and 3-phenoxybenzoic acid by a novel Ochrobactrum lupini"                                                                                                                                                                                                                         
## [1551] "journal.pone.0047205.txt-DG-S-01. J Hazard Mater 187: 433–440."                                                                                                                                                                                                                                                              
## [1552] "journal.pone.0047205.txt-43. Peng XX, Huang JF, Liu CL, Xiang Z, Zhou JY, et al. (2012) Biodegradation of"                                                                                                                                                                                                                   
## [1553] "journal.pone.0047205.txt-bensulphuron-methyl by a novel Penicillium pinophilum strain, BP-H-02. J Hazard"                                                                                                                                                                                                                    
## [1554] "--"                                                                                                                                                                                                                                                                                                                          
## [1555] "journal.pone.0047205.txt-bifenthrin by a novel yeast and its potential for contaminated soils treatment."                                                                                                                                                                                                                    
## [1556] "journal.pone.0047205.txt-PLoS ONE 7: e30862."                                                                                                                                                                                                                                                                                
## [1557] "journal.pone.0047205.txt-65. Chen SH, Luo JJ, Hu MY, Lai KP, Geng P, et al. (2012) Enhancement of"                                                                                                                                                                                                                           
## [1558] "journal.pone.0047205.txt:cypermethrin degradation by a coculture of Bacillus cereus ZH-3 and Streptomyces"                                                                                                                                                                                                                   
## [1559] "journal.pone.0047205.txt-aureus HP-S-01. Bioresource Technol 110: 97–104."                                                                                                                                                                                                                                                   
## [1560] "journal.pone.0047205.txt-Microbial Detoxification of Chlorpyrifos by Fungus"                                                                                                                                                                                                                                                 
## [1561] "journal.pone.0047205.txt-PLOS ONE | www.plosone.org 11 October 2012 | Volume 7 | Issue 10 | e47205"                                                                                                                                                                                                                          
## [1562] "--"                                                                                                                                                                                                                                                                                                                          
## [1563] "journal.pone.0047309.txt-genetics of resistance was also investigated to determine the inheritance to Cry1Ac resistance. To investigate the"                                                                                                                                                                                 
## [1564] "journal.pone.0047309.txt-development of resistance to Bt cotton, and selected foliar insecticides, H. armigera populations were sampled in 2010 and"                                                                                                                                                                         
## [1565] "journal.pone.0047309.txt-2011 in several cotton production regions in Pakistan. The resistance ratios (RR) for Cry1Ac, chlorpyrifos, profenofos,"                                                                                                                                                                            
## [1566] "journal.pone.0047309.txt:cypermethrin, spinosad, indoxacarb, abamectin and deltamethrin were 580-fold, 320-, 1110-, 1950-, 200-, 380, 690, and 40-"                                                                                                                                                                          
## [1567] "journal.pone.0047309.txt-fold, respectively, compared with the laboratory susceptible (Lab-PK) population. Selection of the field collected population"                                                                                                                                                                      
## [1568] "journal.pone.0047309.txt-with Cry1Ac in 2010 for five generations increased RR to 5440-fold. The selection also increased RR for deltamethrin,"                                                                                                                                                                              
## [1569] "journal.pone.0047309.txt:chlorpyrifos, profenofos, cypermethrin, spinosad, indoxacarb, abamectin to 125-folds, 650-, 2840-, 9830-, 370-, 3090-, 1330-"                                                                                                                                                                       
## [1570] "journal.pone.0047309.txt-fold. The estimated LC50s for reciprocal crosses were 105 mg/ml (Cry1Ac-SEL female 6Lab-PK male) and 81 g mg/ml (Lab-PK"                                                                                                                                                                            
## [1571] "journal.pone.0047309.txt-female 6 Cry1Ac-SEL male) suggesting that the resistance to Cry1Ac was autosomal; the degree of dominance (DLC) was"                                                                                                                                                                                
## [1572] "journal.pone.0047309.txt-0.60 and 0.57 respectively. Mixing of enzyme inhibitors significantly decreased resistance to Cry1Ac suggesting that the"                                                                                                                                                                           
## [1573] "--"                                                                                                                                                                                                                                                                                                                          
## [1574] "journal.pone.0047309.txt-Population and Field Population"                                                                                                                                                                                                                                                                    
## [1575] "journal.pone.0047309.txt-Toxicity of chlorpyrifos, profenofos Cry1Ac, indoxacarb and"                                                                                                                                                                                                                                        
## [1576] "journal.pone.0047309.txt-deltamethrin to the laboratory susceptible, Lab-PK was similar"                                                                                                                                                                                                                                     
## [1577] "journal.pone.0047309.txt:(overlapping of 95% FL; P.0.05), but higher for cypermethrin"                                                                                                                                                                                                                                       
## [1578] "journal.pone.0047309.txt-and abacmectin (Table 1). In contrast, the toxicity of spinosad was"                                                                                                                                                                                                                                
## [1579] "journal.pone.0047309.txt-significantly lower (non-overlapping of 95% FL; P,0.05) than"                                                                                                                                                                                                                                       
## [1580] "journal.pone.0047309.txt:cypermethrin and abamectin but was similar to other insecticides"                                                                                                                                                                                                                                   
## [1581] "journal.pone.0047309.txt-tested (Table 1). The slopes for all insecticides tested against Lab-"                                                                                                                                                                                                                              
## [1582] "journal.pone.0047309.txt-PK were similar, but more shallow indicating that the response in"                                                                                                                                                                                                                                  
## [1583] "journal.pone.0047309.txt-the laboratory susceptible population to tested insecticides was"                                                                                                                                                                                                                                   
## [1584] "--"                                                                                                                                                                                                                                                                                                                          
## [1585] "journal.pone.0047309.txt-The toxicity of all insecticides tested against a field collected"                                                                                                                                                                                                                                  
## [1586] "journal.pone.0047309.txt-population was significantly lower (P,0.05) at G1 compared with"                                                                                                                                                                                                                                    
## [1587] "journal.pone.0047309.txt-Lab PK. The resistance ratios for chlorpyrifos, profenofos,"                                                                                                                                                                                                                                        
## [1588] "journal.pone.0047309.txt:Cry1Ac, cypermethrin, spinosad, indoxacarb, abamectin and"                                                                                                                                                                                                                                          
## [1589] "journal.pone.0047309.txt-deltamethrin were 320-fold, 1110-, 580-, 1950-, 200-, 380, 690,"                                                                                                                                                                                                                                    
## [1590] "journal.pone.0047309.txt-and 40-fold respectively (Table 1). The slopes of the regression"                                                                                                                                                                                                                                   
## [1591] "journal.pone.0047309.txt-lines for the insecticides tested against field population at G1 were"                                                                                                                                                                                                                              
## [1592] "--"                                                                                                                                                                                                                                                                                                                          
## [1593] "journal.pone.0047309.txt-Susceptible Cry1Ac 0.58 (0.28–1.20) 1.0760.16 – – 240"                                                                                                                                                                                                                                              
## [1594] "journal.pone.0047309.txt-Susceptible Chlorpyrifos 0.46 (0.18–0.96) 1.0360.17 – – 240"                                                                                                                                                                                                                                        
## [1595] "journal.pone.0047309.txt-Susceptible Profenofos 0.50 (0.20–1.03) 1.0660.17 – – 240"                                                                                                                                                                                                                                          
## [1596] "journal.pone.0047309.txt:Susceptible Cypermethrin 0.26 (0.12–0.50) 1.2060.17 – – 240"                                                                                                                                                                                                                                        
## [1597] "journal.pone.0047309.txt-Susceptible Spinosad 1.45 (0.69–2.79) 1.1360.18 – – 240"                                                                                                                                                                                                                                            
## [1598] "journal.pone.0047309.txt-Susceptible Indoxacarb 0.90 (0.48–1.71) 1.2760.17 – – 240"                                                                                                                                                                                                                                          
## [1599] "journal.pone.0047309.txt-Susceptible Abamectin 0.23 (0.08–0.54) 0.8560.14 – – 240"                                                                                                                                                                                                                                           
## [1600] "--"                                                                                                                                                                                                                                                                                                                          
## [1601] "journal.pone.0047309.txt-Field Cry1Ac 335.7 (244.2–477.6) 2.4360.31 579 – 240"                                                                                                                                                                                                                                               
## [1602] "journal.pone.0047309.txt-Field Chlorpyrifos 148.7 (106.3–217.0) 2.2960.27 323 – 240"                                                                                                                                                                                                                                         
## [1603] "journal.pone.0047309.txt-Field Profenofos 557.4 (420.3–734.5) 3.2060.46 1115 – 240"                                                                                                                                                                                                                                          
## [1604] "journal.pone.0047309.txt:Field Cypermethrin 506.8 (387.7–680.7) 3.2860.44 1949 – 240"                                                                                                                                                                                                                                        
## [1605] "journal.pone.0047309.txt-Field Spinosad 284.7 (180.0–484.7) 1.7460.30 196 – 240"                                                                                                                                                                                                                                             
## [1606] "journal.pone.0047309.txt-Field Indoxacarb 341.2 (260.8–459.7) 3.0860.34 379 – 240"                                                                                                                                                                                                                                           
## [1607] "journal.pone.0047309.txt-Field Abamectin 159.2 (121.3–208.8) 3.1560.53 692 – 240"                                                                                                                                                                                                                                            
## [1608] "--"                                                                                                                                                                                                                                                                                                                          
## [1609] "journal.pone.0047309.txt-Cry1Ac 19.65 (11.56–33.04) 1.5060.22 34 20.21 240"                                                                                                                                                                                                                                                  
## [1610] "journal.pone.0047309.txt-Field-UNSEL (G6) Chlorpyrifos 11.75 (7.96–17.83) 2.0460.25 26 20.18 240"                                                                                                                                                                                                                            
## [1611] "journal.pone.0047309.txt-Field-UNSEL (G6) Profenofos 18.48 (12.30–27.83) 2.0560.25 37 20.25 240"                                                                                                                                                                                                                             
## [1612] "journal.pone.0047309.txt:Field-UNSEL (G6) Cypermethrin 20.07 (12.71–31.48) 1.8360.24 77 20.23 240"                                                                                                                                                                                                                           
## [1613] "journal.pone.0047309.txt-Field-UNSEL (G6) Spinosad 9.22 (5.76–14.81) 1.6660.23 6 20.25 240"                                                                                                                                                                                                                                  
## [1614] "journal.pone.0047309.txt-Field-UNSEL (G6) Indoxacarb 8.07 (4.04–14.37) 1.2960.20 9 20.27 240"                                                                                                                                                                                                                                
## [1615] "journal.pone.0047309.txt-Field-UNSEL (G6) Abamectin 9.27 (5.88–14.79) 1.7760.24 40 20.21 240"                                                                                                                                                                                                                                
## [1616] "--"                                                                                                                                                                                                                                                                                                                          
## [1617] "journal.pone.0047309.txt-However, when it was compared with Lab-PK, the RR increased"                                                                                                                                                                                                                                        
## [1618] "journal.pone.0047309.txt-from 580-fold to 5440-fold (just five generations of selection)."                                                                                                                                                                                                                                   
## [1619] "journal.pone.0047309.txt-Similarly, selection with Cry1Ac also increased RR for deltame-"                                                                                                                                                                                                                                    
## [1620] "journal.pone.0047309.txt:thrin, chlorpyrifos, profenofos, cypermethrin, spinosad, indoxa-"                                                                                                                                                                                                                                   
## [1621] "journal.pone.0047309.txt-Figure 1. Effect of Cry1Ac on development of resistance in H. armigera collected from different areas of Pakistan."                                                                                                                                                                                 
## [1622] "journal.pone.0047309.txt-doi:10.1371/journal.pone.0047309.g001"                                                                                                                                                                                                                                                              
## [1623] "journal.pone.0047309.txt-Table 2. Cross-resistance and instability pattern in a Cry1Ac-selected (Cry1Ac-SEL) population of H. armigera."                                                                                                                                                                                     
## [1624] "--"                                                                                                                                                                                                                                                                                                                          
## [1625] "journal.pone.0047309.txt-Cry1Ac 3154 (2548–4000) 3.6560.47 5438 160 – 240"                                                                                                                                                                                                                                                   
## [1626] "journal.pone.0047309.txt-Cry1Ac-SEL (G6) Chlorpyrifos 1220 (957.3–1585) 3.2860.39 2652 104 – 240"                                                                                                                                                                                                                            
## [1627] "journal.pone.0047309.txt-Cry1Ac-SEL (G6) Profenofos 1421 (998.8–2022) 2.3160.28 2842 77 – 240"                                                                                                                                                                                                                               
## [1628] "journal.pone.0047309.txt:Cry1Ac-SEL (G6) Cypermethrin 2557 (2093–3164) 4.0660.50 9834 127 – 240"                                                                                                                                                                                                                             
## [1629] "journal.pone.0047309.txt-Cry1Ac-SEL (G6) Spinosad 533.3 (322.2–836.6) 1.8860.30 368 58 – 240"                                                                                                                                                                                                                                
## [1630] "journal.pone.0047309.txt-Cry1Ac-SEL (G6) Indoxacarb 2779 (2293–3424) 4.2460.51 3088 344 – 240"                                                                                                                                                                                                                               
## [1631] "journal.pone.0047309.txt-Cry1Ac-SEL (G6) Abamectin 306.4 (222.1–430.4) 2.5260.31 1332 33 – 240"                                                                                                                                                                                                                              
## [1632] "--"                                                                                                                                                                                                                                                                                                                          
## [1633] "journal.pone.0047309.txt-Cry1Ac-UNSEL(G10) Cry1Ac 199.2 (141.6–275.7) 2.3660.35 343 10 20.30 240"                                                                                                                                                                                                                            
## [1634] "journal.pone.0047309.txt-Cry1Ac-UNSEL(G10) Chlorpyrifos 93.20 (64.45–135.9) 2.1760.28 203 8 20.28 240"                                                                                                                                                                                                                       
## [1635] "journal.pone.0047309.txt-Cry1Ac-UNSEL(G10) Profenofos 98.61 (65.18–147.4) 2.0360.25 197 5 20.29 240"                                                                                                                                                                                                                         
## [1636] "journal.pone.0047309.txt:Cry1Ac-UNSEL(G10) Cypermethrin 204.6 (153.5–268.9) 2.9660.40 787 10 20.27 240"                                                                                                                                                                                                                      
## [1637] "journal.pone.0047309.txt-Cry1Ac-UNSEL(G10) Spinosad 69.11 (44.33–105.4) 1.8160.27 48 7 20.22 240"                                                                                                                                                                                                                            
## [1638] "journal.pone.0047309.txt-Cry1Ac-UNSEL(G10) Indoxacarb 111.8 (70.27–162.5) 1.9960.32 124 14 20.35 240"                                                                                                                                                                                                                        
## [1639] "journal.pone.0047309.txt-Cry1Ac-UNSEL(G10) Abamectin 50.38 (34.99–71.88) 2.2660.31 219 5 20.20 240"                                                                                                                                                                                                                          
## [1640] "--"                                                                                                                                                                                                                                                                                                                          
## [1641] "journal.pone.0047309.txt-significant reduction (P,0.05) in resistance ratio with a reversion"                                                                                                                                                                                                                                
## [1642] "journal.pone.0047309.txt-rate of 20.21. Similarly, rearing field population without exposure"                                                                                                                                                                                                                                
## [1643] "journal.pone.0047309.txt-to insecticides also reduced ratios for chlorpyrifos, profenofos,"                                                                                                                                                                                                                                  
## [1644] "journal.pone.0047309.txt:cypermethrin, spinosad, indoxacarb and abamectin (Table 1). The"                                                                                                                                                                                                                                    
## [1645] "journal.pone.0047309.txt-reversion rate of resistance to deltamethrin in the field population"                                                                                                                                                                                                                               
## [1646] "journal.pone.0047309.txt-was the least (20.16) while it was the highest for indoxacarb"                                                                                                                                                                                                                                      
## [1647] "journal.pone.0047309.txt-(20.27; Table 1)."                                                                                                                                                                                                                                                                                  
## [1648] "--"                                                                                                                                                                                                                                                                                                                          
## [1649] "journal.pone.0047309.txt-generations (G7–G10). Bioassays carried out at G11 indicated that"                                                                                                                                                                                                                                  
## [1650] "journal.pone.0047309.txt-resistance to Cry1Ac declined significantly (P,0.05) in four"                                                                                                                                                                                                                                       
## [1651] "journal.pone.0047309.txt-generations, near the level of field evolved resistance. Likewise,"                                                                                                                                                                                                                                 
## [1652] "journal.pone.0047309.txt:resistance to chlorpyrifos, profenofos, cypermethrin, spinosad,"                                                                                                                                                                                                                                    
## [1653] "journal.pone.0047309.txt-indoxacar, abamectin and deltamethrin was also reduced signif-"                                                                                                                                                                                                                                     
## [1654] "journal.pone.0047309.txt-icantly from G6 to G10. The rate of decline of resistance in"                                                                                                                                                                                                                                       
## [1655] "journal.pone.0047309.txt-Cry1Ac-SEL population was similar to the reversion rate for the"                                                                                                                                                                                                                                    
## [1656] "--"                                                                                                                                                                                                                                                                                                                          
## [1657] "journal.pone.0047309.txt-Commercial formulations of the different insecticides used in"                                                                                                                                                                                                                                      
## [1658] "journal.pone.0047309.txt-bioassays included spinosad (Tracers 24SC, Dow Agro-Sciences,"                                                                                                                                                                                                                                      
## [1659] "journal.pone.0047309.txt-UK), indoxacarb (Stewards15SC, DuPont, Pakistan), abamectin"                                                                                                                                                                                                                                        
## [1660] "journal.pone.0047309.txt:(Agrimec TM 1.8EC, Syngenta, UK), cypermethrin 100 g"                                                                                                                                                                                                                                               
## [1661] "journal.pone.0047309.txt-L21 EC (ArrivoH 10EC; FM, Philadelphia, PA), deltamethrin"                                                                                                                                                                                                                                          
## [1662] "journal.pone.0047309.txt-105 g L21 EC (Decis SuperH 10.5EC; Bayer Crop Science,"                                                                                                                                                                                                                                             
## [1663] "journal.pone.0047309.txt-France), Profenofos 500 g L21 EC (CuracronH 50EC; Syngenta"                                                                                                                                                                                                                                         
## [1664] "--"                                                                                                                                                                                                                                                                                                                          
## [1665] "journal.pone.0047463.txt-1–56."                                                                                                                                                                                                                                                                                              
## [1666] "journal.pone.0047463.txt-20. Maxwell CA, Chambo W, Mwaimu M, Magogo F, Carneiro IA, et al. (2003)"                                                                                                                                                                                                                           
## [1667] "journal.pone.0047463.txt-Variation of malaria transmission and morbidity with altitude in Tanzania and"                                                                                                                                                                                                                      
## [1668] "journal.pone.0047463.txt:with introduction of alphacypermethrin treated nets. Malar J 2: 28."                                                                                                                                                                                                                                
## [1669] "journal.pone.0047463.txt-21. Mtove G, Nadjm B, Hendriksen IC, Amos B, Muro F, et al. (2011) Point-of-care"                                                                                                                                                                                                                   
## [1670] "journal.pone.0047463.txt-measurement of blood lactate in children admitted with febrile illness to an"                                                                                                                                                                                                                       
## [1671] "journal.pone.0047463.txt-African District Hospital. Clin Infect Dis 53: 548–554."                                                                                                                                                                                                                                            
## [1672] "--"                                                                                                                                                                                                                                                                                                                          
## [1673] "journal.pone.0050456.txt-degradation by bacterial strains belonging to the Bacillus genus."                                                                                                                                                                                                                                  
## [1674] "journal.pone.0050456.txt-Although Bacillus bacteria have been found to degrade a wide"                                                                                                                                                                                                                                       
## [1675] "journal.pone.0050456.txt-range of different xenobiotic aromatic compounds, including"                                                                                                                                                                                                                                        
## [1676] "journal.pone.0050456.txt:thiophanate-methyl [41], cypermethrin [43], chlorpyrifos [44],"                                                                                                                                                                                                                                     
## [1677] "journal.pone.0050456.txt-and 4-chloro-2-nitrophenol [45], our current results firstly describe"                                                                                                                                                                                                                              
## [1678] "journal.pone.0050456.txt-the biodegradation of 3-PBA by this genus bacteria and definitely"                                                                                                                                                                                                                                  
## [1679] "journal.pone.0050456.txt-expand this list. It is thus becoming evident that Bacillus sp. is"                                                                                                                                                                                                                                 
## [1680] "--"                                                                                                                                                                                                                                                                                                                          
## [1681] "journal.pone.0050456.txt-associated with sperm hormone levels in adult men. Reprod Toxicol 27: 155–"                                                                                                                                                                                                                         
## [1682] "journal.pone.0050456.txt-160."                                                                                                                                                                                                                                                                                               
## [1683] "journal.pone.0050456.txt-19. Yuan C, Wang C, Gao SQ, Kong TT, Chen L, et al. (2010) Effects of"                                                                                                                                                                                                                              
## [1684] "journal.pone.0050456.txt:permethrin, cypermethrin and 3-phenoxybenzoic acid on rat sperm motility"                                                                                                                                                                                                                           
## [1685] "journal.pone.0050456.txt-in vitro evaluated with computer-assisted sperm analysis. Toxicol in Vitro 24:"                                                                                                                                                                                                                     
## [1686] "journal.pone.0050456.txt-382–386."                                                                                                                                                                                                                                                                                           
## [1687] "journal.pone.0050456.txt-20. Ji GX, Xia YK, Gu AH, Shi XG, Long Y, et al. (2011) Effects of non-"                                                                                                                                                                                                                            
## [1688] "--"                                                                                                                                                                                                                                                                                                                          
## [1689] "journal.pone.0050456.txt-strain capable of metabolizing phenoxybenzoates. Appl Environ Microbiol 57:"                                                                                                                                                                                                                        
## [1690] "journal.pone.0050456.txt-1294–1300."                                                                                                                                                                                                                                                                                         
## [1691] "journal.pone.0050456.txt-24. Xie WJ, Zhou JM, Wang HY, Chen XQ (2008) Effect of nitrogen on the"                                                                                                                                                                                                                             
## [1692] "journal.pone.0050456.txt:degradation of cypermethrin and its metabolite 3-phenoxybenzoic acid in soil."                                                                                                                                                                                                                      
## [1693] "journal.pone.0050456.txt-Pedosphere 18: 638–644."                                                                                                                                                                                                                                                                            
## [1694] "journal.pone.0050456.txt-25. Singh BK (2009) Organophosphorus-degrading bacteria: Ecology and industrial"                                                                                                                                                                                                                    
## [1695] "journal.pone.0050456.txt-applications. Nature Rev Microbiol 7: 156–163."                                                                                                                                                                                                                                                     
## [1696] "--"                                                                                                                                                                                                                                                                                                                          
## [1697] "journal.pone.0050456.txt-carbofuran by Pichia anomala strain HQ-C-01 and its application for bio-"                                                                                                                                                                                                                           
## [1698] "journal.pone.0050456.txt-remediation of contaminated soils. Biol Fert Soils 47: 917–923."                                                                                                                                                                                                                                    
## [1699] "journal.pone.0050456.txt-28. Lin QS, Chen SH, Hu MY, Rizwan-ul-Haq M, Yang L, et al. (2011)"                                                                                                                                                                                                                                 
## [1700] "journal.pone.0050456.txt:Biodegradation of cypermethrin by a newly isolated actinomycetes HU-S-01"                                                                                                                                                                                                                           
## [1701] "journal.pone.0050456.txt-from wastewater sludge. Int J Environ Sci Tech 8: 45–56."                                                                                                                                                                                                                                           
## [1702] "journal.pone.0050456.txt:29. Chen SH, Geng P, Xiao Y, Hu MY (2012) Bioremediation of b-cypermethrin"                                                                                                                                                                                                                         
## [1703] "journal.pone.0050456.txt-and 3-phenoxybenzaldehyde contaminated soils using Streptomyces aureus HP-S-"                                                                                                                                                                                                                       
## [1704] "journal.pone.0050456.txt-01. Appl Microbiol Biotechnol 94: 505–515."                                                                                                                                                                                                                                                         
## [1705] "journal.pone.0050456.txt-30. Chen SH, Luo JJ, Hu MY, Geng P, Zhang YB (2012) Microbial detoxification of"                                                                                                                                                                                                                    
## [1706] "journal.pone.0050456.txt-bifenthrin by a novel yeast and its potential for contaminated soils treatment."                                                                                                                                                                                                                    
## [1707] "journal.pone.0050456.txt-PLoS ONE 7: e30862."                                                                                                                                                                                                                                                                                
## [1708] "journal.pone.0050456.txt-31. Xu YX, Sun JQ, Li XH, Li SP, Chen Y (2007) Study on cooperating"                                                                                                                                                                                                                                
## [1709] "journal.pone.0050456.txt:degradation of cypermethrin and 3-phenoxybenzoic acid by two bacteria strains."                                                                                                                                                                                                                     
## [1710] "journal.pone.0050456.txt-Acta Microbiol Sin 47: 834–837."                                                                                                                                                                                                                                                                    
## [1711] "journal.pone.0050456.txt-32. Chen SH, Hu MY, Liu JJ, Zhong GH, Yang L, et al. (2011) Biodegradation of"                                                                                                                                                                                                                      
## [1712] "journal.pone.0050456.txt:beta-cypermethrin and 3-phenoxybenzoic acid by a novel Ochrobactrum lupini"                                                                                                                                                                                                                         
## [1713] "journal.pone.0050456.txt-DG-S-01. J Hazard Mater 187: 433–440."                                                                                                                                                                                                                                                              
## [1714] "journal.pone.0050456.txt-33. Nie ZJ, Hang BJ, Cai S, Xie XT, He J, et al. (2011) Degradation of cyhalofop-"                                                                                                                                                                                                                  
## [1715] "journal.pone.0050456.txt-butyl (Cyb) by Pseudomonas azotoformans strain qdz-1 and cloning of a novel gene"                                                                                                                                                                                                                   
## [1716] "--"                                                                                                                                                                                                                                                                                                                          
## [1717] "journal.pone.0050456.txt-38. Tamura K, Dudley J, Nei M (2007) MEGA4: Molecular evolutionary genetics"                                                                                                                                                                                                                        
## [1718] "journal.pone.0050456.txt-analysis (MEGA) software version 4.0. Mol Biol Evol 24: 1596–1599."                                                                                                                                                                                                                                 
## [1719] "journal.pone.0050456.txt-39. Zhang C, Wang SH, Yan YC (2011) Isomerization and biodegradation of beta-"                                                                                                                                                                                                                      
## [1720] "journal.pone.0050456.txt:cypermethrin by Pseudomonas aeruginosa CH7 with biosurfactant production."                                                                                                                                                                                                                          
## [1721] "journal.pone.0050456.txt-Bioresour Technol 102: 7139–7146."                                                                                                                                                                                                                                                                  
## [1722] "journal.pone.0050456.txt-40. Chen SH, Hu QB, Hu MY, Luo JJ, Weng QF, et al. (2011) Isolation and"                                                                                                                                                                                                                            
## [1723] "journal.pone.0050456.txt-characterization of a fungus able to degrade pyrethroids and 3-phenoxybenzal-"                                                                                                                                                                                                                      
## [1724] "--"                                                                                                                                                                                                                                                                                                                          
## [1725] "journal.pone.0050456.txt-characterization of a novel chlorpyrifos hydrolase from Cladosporium cladosporioides"                                                                                                                                                                                                               
## [1726] "journal.pone.0050456.txt-Hu-01. PLoS ONE 7: e38137."                                                                                                                                                                                                                                                                         
## [1727] "journal.pone.0050456.txt-43. Chen SH, Luo JJ, Hu MY, Lai KP, Geng P, et al. (2012) Enhancement of"                                                                                                                                                                                                                           
## [1728] "journal.pone.0050456.txt:cypermethrin degradation by a coculture of Bacillus cereus ZH-3 and Streptomyces"                                                                                                                                                                                                                   
## [1729] "journal.pone.0050456.txt-aureus HP-S-01. Bioresour Technol 110: 97–104."                                                                                                                                                                                                                                                     
## [1730] "journal.pone.0050456.txt-44. Zhang Q, Wang BC, Cao ZY, Yu YL (2012) Plasmid-mediated bioaugmenta-"                                                                                                                                                                                                                           
## [1731] "journal.pone.0050456.txt-tion for the degradation of chlorpyrifos in soil. J Hazard Mater 221–222: 178–"                                                                                                                                                                                                                     
## [1732] "--"                                                                                                                                                                                                                                                                                                                          
## [1733] "journal.pone.0054092.txt-cropping systems. The SBI family of fungicides are known to be"                                                                                                                                                                                                                                     
## [1734] "journal.pone.0054092.txt-present in bee-collected pollen, wax and in bees themselves"                                                                                                                                                                                                                                        
## [1735] "journal.pone.0054092.txt-[2,3,57]. Five SBI fungicides demonstrated synergism with the"                                                                                                                                                                                                                                      
## [1736] "journal.pone.0054092.txt:pyrethroids alpha-cypermethrin and lambda-cyhalothrin in bees"                                                                                                                                                                                                                                      
## [1737] "journal.pone.0054092.txt-[23]. We found that a similar suite of SBI fungicides could"                                                                                                                                                                                                                                        
## [1738] "journal.pone.0054092.txt-interact synergistically with the pyrethroid tau-fluvalinate, likely"                                                                                                                                                                                                                               
## [1739] "journal.pone.0054092.txt-through inhibition of P450s, when administered at 1 or 10 nmol"                                                                                                                                                                                                                                     
## [1740] "--"                                                                                                                                                                                                                                                                                                                          
## [1741] "journal.pone.0054092.txt-compound [62,63]. Competitive P450 inhibition of tau-fluvalinate"                                                                                                                                                                                                                                   
## [1742] "journal.pone.0054092.txt-detoxication may account for this observed interaction as well."                                                                                                                                                                                                                                    
## [1743] "journal.pone.0054092.txt-Chlorothalonil has previously been shown to have an interactive"                                                                                                                                                                                                                                    
## [1744] "journal.pone.0054092.txt:effect with alpha-cypermethrin and lambda-cyhalothrin, two"                                                                                                                                                                                                                                         
## [1745] "journal.pone.0054092.txt-pyrethroids, in bees [23]."                                                                                                                                                                                                                                                                         
## [1746] "journal.pone.0054092.txt-Pyraclostrobin and boscalid applied together in a blend like"                                                                                                                                                                                                                                       
## [1747] "journal.pone.0054092.txt-Pristine moderately increased the toxicity of tau-fluvalinate."                                                                                                                                                                                                                                     
## [1748] "--"                                                                                                                                                                                                                                                                                                                          
## [1749] "journal.pone.0055781.txt-ITN Mixtures of Chlorfenapyr (Pyrrole) and"                                                                                                                                                                                                                                                         
## [1750] "journal.pone.0055781.txt:Alphacypermethrin (Pyrethroid) for Control of Pyrethroid"                                                                                                                                                                                                                                           
## [1751] "journal.pone.0055781.txt-Resistant Anopheles arabiensis and Culex"                                                                                                                                                                                                                                                           
## [1752] "journal.pone.0055781.txt-quinquefasciatus"                                                                                                                                                                                                                                                                                   
## [1753] "journal.pone.0055781.txt-Richard M. Oxborough1,2,3"                                                                                                                                                                                                                                                                          
## [1754] "--"                                                                                                                                                                                                                                                                                                                          
## [1755] "journal.pone.0055781.txt-Pyrethroid resistant Anopheles gambiae malaria vectors are widespread throughout sub-Saharan Africa and continued"                                                                                                                                                                                  
## [1756] "journal.pone.0055781.txt-efficacy of pyrethroid ITNs is under threat. Chlorfenapyr is a promising pyrrole insecticide with a unique mechanism of"                                                                                                                                                                            
## [1757] "journal.pone.0055781.txt-action conferring no cross-resistance to existing public health insecticides. Mixtures of chlorfenapyr (CFP) and"                                                                                                                                                                                   
## [1758] "journal.pone.0055781.txt:alphacypermethrin (alpha) may provide additional benefits over chlorfenapyr or alphacypermethrin used alone. An ITN"                                                                                                                                                                                
## [1759] "journal.pone.0055781.txt-mixture of CFP 100 mg/m2"                                                                                                                                                                                                                                                                           
## [1760] "journal.pone.0055781.txt-+alpha 25 mg/m2"                                                                                                                                                                                                                                                                                    
## [1761] "journal.pone.0055781.txt-was compared with CFP 100 mg/m2"                                                                                                                                                                                                                                                                    
## [1762] "--"                                                                                                                                                                                                                                                                                                                          
## [1763] "journal.pone.0055781.txt-alone for susceptible (94 vs 46%, P = 0.001) and resistant (84 vs 53%, P = 0.001) strains. In experimental huts the mixture of"                                                                                                                                                                     
## [1764] "journal.pone.0055781.txt-CFP 100+ Alpha 25 killed 58% of An. arabiensis, compared with 50% for alpha and 49% for CFP, though the differences were"                                                                                                                                                                           
## [1765] "journal.pone.0055781.txt-not significant. Blood-feeding inhibition was highest in the mixture with a 76% reduction compared to the untreated net"                                                                                                                                                                            
## [1766] "journal.pone.0055781.txt:(P = 0.001). ITN mixtures of chlorfenapyr and alphacypermethrin should restore effective control of resistant populations of"                                                                                                                                                                       
## [1767] "journal.pone.0055781.txt-An. gambiae malaria vectors, provide protection from blood-feeding, and may have benefits for resistance management,"                                                                                                                                                                               
## [1768] "journal.pone.0055781.txt-particularly in areas with low or moderate frequency of pyrethroid resistance. A wash-resistant mixture should be developed"                                                                                                                                                                        
## [1769] "journal.pone.0055781.txt-urgently."                                                                                                                                                                                                                                                                                          
## [1770] "journal.pone.0055781.txt:Citation: Oxborough RM, Kitau J, Matowo J, Feston E, Mndeme R, et al. (2013) ITN Mixtures of Chlorfenapyr (Pyrrole) and Alphacypermethrin (Pyrethroid) for"                                                                                                                                         
## [1771] "journal.pone.0055781.txt-Control of Pyrethroid Resistant Anopheles arabiensis and Culex quinquefasciatus. PLoS ONE 8(2): e55781. doi:10.1371/journal.pone.0055781"                                                                                                                                                           
## [1772] "journal.pone.0055781.txt-Editor: Basil Brooke, National Institute for Communicable Diseases/NHLS, South Africa"                                                                                                                                                                                                              
## [1773] "journal.pone.0055781.txt-Received October 1, 2012; Accepted January 4, 2013; Published February 7, 2013"                                                                                                                                                                                                                     
## [1774] "--"                                                                                                                                                                                                                                                                                                                          
## [1775] "journal.pone.0055781.txt-lothrin 18 mg/m2"                                                                                                                                                                                                                                                                                   
## [1776] "journal.pone.0055781.txt-) but provided little protection, with blood-"                                                                                                                                                                                                                                                      
## [1777] "journal.pone.0055781.txt-feeding inhibition of ,5% [15,22]. In this trial an ITN mixture of"                                                                                                                                                                                                                                 
## [1778] "journal.pone.0055781.txt:CFP and alphacypermethrin (alpha) was evaluated against"                                                                                                                                                                                                                                            
## [1779] "journal.pone.0055781.txt-pyrethroid resistant Cx. quinquefasciatus and wild An. arabiensis."                                                                                                                                                                                                                                 
## [1780] "journal.pone.0055781.txt-Methods"                                                                                                                                                                                                                                                                                            
## [1781] "journal.pone.0055781.txt-Mosquito Strains"                                                                                                                                                                                                                                                                                   
## [1782] "--"                                                                                                                                                                                                                                                                                                                          
## [1783] "journal.pone.0055781.txt-The following insecticide formulations were used for all tests:"                                                                                                                                                                                                                                    
## [1784] "journal.pone.0055781.txt-Chlorfenapyr 21.45%, Lot Number 0134S03CD, BASF (Phantom"                                                                                                                                                                                                                                           
## [1785] "journal.pone.0055781.txt-suspension concentrate (SC), BASF Agricultural Products, Lim-"                                                                                                                                                                                                                                      
## [1786] "journal.pone.0055781.txt:burgerhof, Germany); Alphacypermethrin 6%, BASF (Fendona"                                                                                                                                                                                                                                           
## [1787] "journal.pone.0055781.txt-SC; BASF Agricultural Products, Limburgerhof, Germany)."                                                                                                                                                                                                                                            
## [1788] "journal.pone.0055781.txt-Tunnel Tests"                                                                                                                                                                                                                                                                                       
## [1789] "journal.pone.0055781.txt-N1- Untreated"                                                                                                                                                                                                                                                                                      
## [1790] "journal.pone.0055781.txt-N2- Chlorfenapyr 100 mg/m2"                                                                                                                                                                                                                                                                         
## [1791] "journal.pone.0055781.txt-N3- Chlorfenapyr 200 mg/m2"                                                                                                                                                                                                                                                                         
## [1792] "journal.pone.0055781.txt:N4- Alphacypermethrin 25 mg/m2"                                                                                                                                                                                                                                                                     
## [1793] "journal.pone.0055781.txt-N5- Chlorfenapyr 100 mg/m2"                                                                                                                                                                                                                                                                         
## [1794] "journal.pone.0055781.txt:+Alphacypermethrin 25 mg/m2"                                                                                                                                                                                                                                                                        
## [1795] "journal.pone.0055781.txt-N6- Chlorfenapyr 200 mg/m2"                                                                                                                                                                                                                                                                         
## [1796] "journal.pone.0055781.txt:+Alphacypermethrin 25 mg/m2"                                                                                                                                                                                                                                                                        
## [1797] "journal.pone.0055781.txt-Experimental Hut Trial"                                                                                                                                                                                                                                                                             
## [1798] "journal.pone.0055781.txt-N1- Untreated"                                                                                                                                                                                                                                                                                      
## [1799] "journal.pone.0055781.txt-N2- Chlorfenapyr 100 mg/m2"                                                                                                                                                                                                                                                                         
## [1800] "journal.pone.0055781.txt:N3- Alphacypermethrin 25 mg/m2"                                                                                                                                                                                                                                                                     
## [1801] "journal.pone.0055781.txt-N4- Chlorfenapyr 100 mg/m2"                                                                                                                                                                                                                                                                         
## [1802] "journal.pone.0055781.txt:+Alphacypermethrin 25 mg/m2"                                                                                                                                                                                                                                                                        
## [1803] "journal.pone.0055781.txt-40 denier polyester netting was hand dipped in insecticide"                                                                                                                                                                                                                                         
## [1804] "journal.pone.0055781.txt-solution based on WHO protocols [27]. Chlorfenapyr at 100 mg/"                                                                                                                                                                                                                                      
## [1805] "journal.pone.0055781.txt-m2"                                                                                                                                                                                                                                                                                                 
## [1806] "journal.pone.0055781.txt-dosage was selected for hut trials as previous trials in Tanzania"                                                                                                                                                                                                                                  
## [1807] "journal.pone.0055781.txt-showed no significant increase in efficacy for dosages higher than"                                                                                                                                                                                                                                 
## [1808] "journal.pone.0055781.txt-100 mg/m2"                                                                                                                                                                                                                                                                                          
## [1809] "journal.pone.0055781.txt:[21]. The alphacypermethrin dosage (25 mg/m2"                                                                                                                                                                                                                                                       
## [1810] "journal.pone.0055781.txt-) was"                                                                                                                                                                                                                                                                                              
## [1811] "journal.pone.0055781.txt-selected based on WHOPES recommended dosage range 20–"                                                                                                                                                                                                                                              
## [1812] "journal.pone.0055781.txt-40 mg/m2"                                                                                                                                                                                                                                                                                           
## [1813] "--"                                                                                                                                                                                                                                                                                                                          
## [1814] "journal.pone.0055781.txt-Percentage mortality of Cx. quinquefasciatus Muheza strain after exposure in World Health Organization (WHO) resistance tests lined with treated papers at diagnostic"                                                                                                                              
## [1815] "journal.pone.0055781.txt-concentrations."                                                                                                                                                                                                                                                                                    
## [1816] "journal.pone.0055781.txt-doi:10.1371/journal.pone.0055781.t001"                                                                                                                                                                                                                                                              
## [1817] "journal.pone.0055781.txt:ITN Mixtures of Chlorfenapyr and Alphacypermethrin"                                                                                                                                                                                                                                                 
## [1818] "journal.pone.0055781.txt-PLOS ONE | www.plosone.org 2 February 2013 | Volume 8 | Issue 2 | e55781"                                                                                                                                                                                                                           
## [1819] "journal.pone.0055781.txt-\fthis purpose because they are based on a fixed exposure time that"                                                                                                                                                                                                                                
## [1820] "journal.pone.0055781.txt-may not be representative of exposure under natural conditions."                                                                                                                                                                                                                                    
## [1821] "--"                                                                                                                                                                                                                                                                                                                          
## [1822] "journal.pone.0055781.txt-Muheza 10 PBO 400+ DEF 125 51 (48–55) 2.1 (1.9–2.2)"                                                                                                                                                                                                                                                
## [1823] "journal.pone.0055781.txt-Percentage mortality of Cx. quinquefasciatus TPRI strain after exposure in cylinder bioassays lined with treated papers at diagnostic concentrations."                                                                                                                                              
## [1824] "journal.pone.0055781.txt-doi:10.1371/journal.pone.0055781.t003"                                                                                                                                                                                                                                                              
## [1825] "journal.pone.0055781.txt:ITN Mixtures of Chlorfenapyr and Alphacypermethrin"                                                                                                                                                                                                                                                 
## [1826] "journal.pone.0055781.txt-PLOS ONE | www.plosone.org 3 February 2013 | Volume 8 | Issue 2 | e55781"                                                                                                                                                                                                                           
## [1827] "journal.pone.0055781.txt-\fmay be more suitable for a non-repellent insecticide such as"                                                                                                                                                                                                                                     
## [1828] "journal.pone.0055781.txt-chlorfenapyr."                                                                                                                                                                                                                                                                                      
## [1829] "--"                                                                                                                                                                                                                                                                                                                          
## [1830] "journal.pone.0055781.txt-Fenitrothion 1.00% 195 100 (100–100)"                                                                                                                                                                                                                                                               
## [1831] "journal.pone.0055781.txt-Percentage mortality of An. arabiensis F1 wild strain after exposure in cylinder bioassays lined with treated papers at diagnostic concentrations."                                                                                                                                                 
## [1832] "journal.pone.0055781.txt-doi:10.1371/journal.pone.0055781.t004"                                                                                                                                                                                                                                                              
## [1833] "journal.pone.0055781.txt:ITN Mixtures of Chlorfenapyr and Alphacypermethrin"                                                                                                                                                                                                                                                 
## [1834] "journal.pone.0055781.txt-PLOS ONE | www.plosone.org 4 February 2013 | Volume 8 | Issue 2 | e55781"                                                                                                                                                                                                                           
## [1835] "journal.pone.0055781.txt-\fDiscussion"                                                                                                                                                                                                                                                                                       
## [1836] "journal.pone.0055781.txt-The rationale for combining CFP and alpha as an ITN mixture"                                                                                                                                                                                                                                        
## [1837] "--"                                                                                                                                                                                                                                                                                                                          
## [1838] "journal.pone.0055781.txt-alone (100 and 200), alpha alone (25), and mixtures of CFP (100/200)+alpha (25). If the superscript in a time period (0 h, 24 h, 48 h, 72 h) is the same"                                                                                                                                           
## [1839] "journal.pone.0055781.txt-there was no significant difference between treatments (P.0.05) (n = 350 p/treatment)."                                                                                                                                                                                                             
## [1840] "journal.pone.0055781.txt-doi:10.1371/journal.pone.0055781.g001"                                                                                                                                                                                                                                                              
## [1841] "journal.pone.0055781.txt:ITN Mixtures of Chlorfenapyr and Alphacypermethrin"                                                                                                                                                                                                                                                 
## [1842] "journal.pone.0055781.txt-PLOS ONE | www.plosone.org 5 February 2013 | Volume 8 | Issue 2 | e55781"                                                                                                                                                                                                                           
## [1843] "journal.pone.0055781.txt-\fwith CFP may have reduced the mean contact time of An. arabiensis"                                                                                                                                                                                                                                
## [1844] "journal.pone.0055781.txt-with the net, thereby reducing toxicity from CFP in the mixture."                                                                                                                                                                                                                                   
## [1845] "--"                                                                                                                                                                                                                                                                                                                          
## [1846] "journal.pone.0055781.txt-Figure 3. Percentage Mortality of An. arabiensis in Experimental Huts. Percentage mortality of An. arabiensis collected in experimental huts"                                                                                                                                                       
## [1847] "journal.pone.0055781.txt-with ITNs treated with alpha 25, CFP 100, and a mixture of CFP 100+ Alpha 25."                                                                                                                                                                                                                      
## [1848] "journal.pone.0055781.txt-doi:10.1371/journal.pone.0055781.g003"                                                                                                                                                                                                                                                              
## [1849] "journal.pone.0055781.txt:ITN Mixtures of Chlorfenapyr and Alphacypermethrin"                                                                                                                                                                                                                                                 
## [1850] "journal.pone.0055781.txt-PLOS ONE | www.plosone.org 6 February 2013 | Volume 8 | Issue 2 | e55781"                                                                                                                                                                                                                           
## [1851] "journal.pone.0055781.txt-\fhad high frequency L1014F kdr (86%) and elevated expression of"                                                                                                                                                                                                                                   
## [1852] "journal.pone.0055781.txt-cytochrome P450s [40], lambdacyhalothrin (18 mg/m2"                                                                                                                                                                                                                                                 
## [1853] "--"                                                                                                                                                                                                                                                                                                                          
## [1854] "journal.pone.0055781.txt-Comparison of An. arabiensis results for ITNs treated with CFP 100, alpha 25, and mixture of CFP 100+ alpha 25. If the superscript in a column is the same there was no"                                                                                                                            
## [1855] "journal.pone.0055781.txt-significant difference between treatments (P.0.05)."                                                                                                                                                                                                                                                
## [1856] "journal.pone.0055781.txt-doi:10.1371/journal.pone.0055781.t006"                                                                                                                                                                                                                                                              
## [1857] "journal.pone.0055781.txt:ITN Mixtures of Chlorfenapyr and Alphacypermethrin"                                                                                                                                                                                                                                                 
## [1858] "journal.pone.0055781.txt-PLOS ONE | www.plosone.org 7 February 2013 | Volume 8 | Issue 2 | e55781"                                                                                                                                                                                                                           
## [1859] "journal.pone.0055781.txt-\fMost malaria vector control programs have failed to implement"                                                                                                                                                                                                                                    
## [1860] "journal.pone.0055781.txt-resistance management strategies, partly due to the dearth of cost-"                                                                                                                                                                                                                                
## [1861] "--"                                                                                                                                                                                                                                                                                                                          
## [1862] "journal.pone.0055781.txt-holding) for mixture of CFP 100+ Alpha 25, CFP 100, and alpha 25 with"                                                                                                                                                                                                                              
## [1863] "journal.pone.0055781.txt-An. arabiensis F1 wild and exposure time of 3 and 30 minutes."                                                                                                                                                                                                                                      
## [1864] "journal.pone.0055781.txt-doi:10.1371/journal.pone.0055781.g005"                                                                                                                                                                                                                                                              
## [1865] "journal.pone.0055781.txt:ITN Mixtures of Chlorfenapyr and Alphacypermethrin"                                                                                                                                                                                                                                                 
## [1866] "journal.pone.0055781.txt-PLOS ONE | www.plosone.org 8 February 2013 | Volume 8 | Issue 2 | e55781"                                                                                                                                                                                                                           
## [1867] "journal.pone.0055781.txt-\f25. CDC Bottle Bioassays. Available: http://wwwcdcgov/ncidod/wbt/resistance/"                                                                                                                                                                                                                     
## [1868] "journal.pone.0055781.txt-assay/bottle/indexhtm."                                                                                                                                                                                                                                                                             
## [1869] "--"                                                                                                                                                                                                                                                                                                                          
## [1870] "journal.pone.0055781.txt-arthropods: theory and practice. Annu Rev Entomol 37: 91–112."                                                                                                                                                                                                                                      
## [1871] "journal.pone.0055781.txt-44. Tabashnik BE (1990) Implications of gene amplification for evolution and"                                                                                                                                                                                                                       
## [1872] "journal.pone.0055781.txt-management of insecticide resistance. J Econ Entomol 83: 1170–1176."                                                                                                                                                                                                                                
## [1873] "journal.pone.0055781.txt:ITN Mixtures of Chlorfenapyr and Alphacypermethrin"                                                                                                                                                                                                                                                 
## [1874] "journal.pone.0055781.txt-PLOS ONE | www.plosone.org 9 February 2013 | Volume 8 | Issue 2 | e55781"                                                                                                                                                                                                                           
## [1875] "journal.pone.0055781.txt-\f"                                                                                                                                                                                                                                                                                                 
## [1876] "--"                                                                                                                                                                                                                                                                                                                          
## [1877] "journal.pone.0055799.txt-inhibitors were purchased from Calbiochem (124011, 124005 and"                                                                                                                                                                                                                                      
## [1878] "journal.pone.0055799.txt-688000, respectively). Calyculin A (C-3987) and okadaic acid (O-"                                                                                                                                                                                                                                   
## [1879] "journal.pone.0055799.txt-2220) were obtained from LC Laboratories whereas wortmannin"                                                                                                                                                                                                                                        
## [1880] "journal.pone.0055799.txt:(W1628) and cypermethrin (36128) were purchased from Sigma."                                                                                                                                                                                                                                        
## [1881] "journal.pone.0055799.txt-GM1 monosialganglioside (G7641) and blebbistatin (B0560) were"                                                                                                                                                                                                                                      
## [1882] "journal.pone.0055799.txt-bought from Sigma. All human and mouse siRNAs were obtained"                                                                                                                                                                                                                                        
## [1883] "journal.pone.0055799.txt-from Qiagen."                                                                                                                                                                                                                                                                                       
## [1884] "--"                                                                                                                                                                                                                                                                                                                          
## [1885] "journal.pone.0055799.txt-the signal intensity on the plasma membrane was calculated. (D)"                                                                                                                                                                                                                                    
## [1886] "journal.pone.0055799.txt-Activation of a phosphatase leads to Ezrin de-phosphorylation."                                                                                                                                                                                                                                     
## [1887] "journal.pone.0055799.txt-A431 cells were treated with 2.5 mM okadaic acid, 0.5 mM"                                                                                                                                                                                                                                           
## [1888] "journal.pone.0055799.txt:calyculin A or 0.5 mM cypermethrin for 30 min before SV40"                                                                                                                                                                                                                                          
## [1889] "journal.pone.0055799.txt-incubation for another 10 min. Levels of p-ERM were determined"                                                                                                                                                                                                                                     
## [1890] "journal.pone.0055799.txt-using immunoblotting. (E) The AKT inhibitor has no effect on"                                                                                                                                                                                                                                       
## [1891] "journal.pone.0055799.txt-Ezrin de-phosphorylation. AKT activity was blocked in A431 cells"                                                                                                                                                                                                                                   
## [1892] "--"                                                                                                                                                                                                                                                                                                                          
## [1893] "journal.pone.0056604.txt-seen in other insects with known genomes. Sigma is the largest GST subclass, and the intron–exon pattern deviates"                                                                                                                                                                                  
## [1894] "journal.pone.0056604.txt-significantly from that of other species. Higher GST gene expression in the N. lugens adult migratory form reflects the higher"                                                                                                                                                                     
## [1895] "journal.pone.0056604.txt-risk of this life stage in encountering the toxins of non-host plants. After exposure to a sub-lethal dose of four insecticides,"                                                                                                                                                                   
## [1896] "journal.pone.0056604.txt:chlorpyrifos, imidacloprid, buprofezin or beta-cypermethrin, more GST genes were upregulated in S. furcifera than in N."                                                                                                                                                                            
## [1897] "journal.pone.0056604.txt-lugens. RNA interference targeting two N. lugens GST genes, NlGSTe1 and NlGSTm2, significantly increased the sensitivity of"                                                                                                                                                                        
## [1898] "journal.pone.0056604.txt:fourth instar nymphs to chlorpyrifos but not to beta-cypermethrin."                                                                                                                                                                                                                                 
## [1899] "journal.pone.0056604.txt-Conclusions/Significance: This study provides the first elucidation of the nature of the GST gene family in a delphacid"                                                                                                                                                                            
## [1900] "journal.pone.0056604.txt-species, offering new insights into the evolution of metabolic enzyme genes in insects. Further, the use of RNA interference"                                                                                                                                                                       
## [1901] "journal.pone.0056604.txt-to identify the GST genes induced by insecticides illustrates likely mechanisms for the tolerance of these insects."                                                                                                                                                                                
## [1902] "--"                                                                                                                                                                                                                                                                                                                          
## [1903] "journal.pone.0056604.txt-NlGSTd2, did not show induced over-expression to all the"                                                                                                                                                                                                                                           
## [1904] "journal.pone.0056604.txt-insecticides tested. In S. furcifera however, the two Delta GSTs,"                                                                                                                                                                                                                                  
## [1905] "journal.pone.0056604.txt-SfGSTd1 and d2 showed significant induction (more than 4.5-fold)"                                                                                                                                                                                                                                   
## [1906] "journal.pone.0056604.txt:after treatment with the synthetic pyrethroid beta-cypermethrin"                                                                                                                                                                                                                                    
## [1907] "journal.pone.0056604.txt-(Figure 9)."                                                                                                                                                                                                                                                                                        
## [1908] "journal.pone.0056604.txt-The Sigma subclass has a wide taxonomic distribution and may"                                                                                                                                                                                                                                       
## [1909] "journal.pone.0056604.txt-be essential for housekeeping-related roles in insects such as the"                                                                                                                                                                                                                                 
## [1910] "--"                                                                                                                                                                                                                                                                                                                          
## [1911] "journal.pone.0056604.txt-In N. lugens, NlGSTs2 was activated at 12 to 48 hours by"                                                                                                                                                                                                                                           
## [1912] "journal.pone.0056604.txt-chlorpyrifos, while in S. furcifera, SfGSTs1 was activated by"                                                                                                                                                                                                                                      
## [1913] "journal.pone.0056604.txt-imidacloprid (12 to 24 hours), chlorpyrifos (6 hours) and beta-"                                                                                                                                                                                                                                    
## [1914] "journal.pone.0056604.txt:cypermethrin (6 hours). GSTs from the Theta subclass have a"                                                                                                                                                                                                                                        
## [1915] "journal.pone.0056604.txt-peroxidase function and in Anopheles cracens, AcGSTT1-1 has been"                                                                                                                                                                                                                                   
## [1916] "journal.pone.0056604.txt-found to bind to organophosphates [29]. In N. lugens, NlGSTt1 was"                                                                                                                                                                                                                                  
## [1917] "journal.pone.0056604.txt-also insensitive to most insecticides except for chlorpyrifos at"                                                                                                                                                                                                                                   
## [1918] "--"                                                                                                                                                                                                                                                                                                                          
## [1919] "journal.pone.0056604.txt-B. mori, suggesting their role in detoxification of chlorinated"                                                                                                                                                                                                                                    
## [1920] "journal.pone.0056604.txt-xenobiotics [30]. In S. furcifera, SfGSTz1 was insensitive to the two"                                                                                                                                                                                                                              
## [1921] "journal.pone.0056604.txt-insecticides chlorpyrifos and buprofezin, while it was sensitive to"                                                                                                                                                                                                                                
## [1922] "journal.pone.0056604.txt:imidacloprid (24 hours) and beta-cypermethrin (12 and 48 hours)."                                                                                                                                                                                                                                   
## [1923] "journal.pone.0056604.txt-RNA interference of N. lugens GST gene expression by"                                                                                                                                                                                                                                               
## [1924] "journal.pone.0056604.txt-double-stranded RNA injection and its effect on"                                                                                                                                                                                                                                                    
## [1925] "journal.pone.0056604.txt-insecticide tolerance"                                                                                                                                                                                                                                                                              
## [1926] "--"                                                                                                                                                                                                                                                                                                                          
## [1927] "journal.pone.0056604.txt-[29]. Our findings offer new information on organophosphate"                                                                                                                                                                                                                                        
## [1928] "journal.pone.0056604.txt-insecticide tolerance conferred by the Epsilon subclass and"                                                                                                                                                                                                                                        
## [1929] "journal.pone.0056604.txt-microsomal class genes. In the case of the synthetic pyrethroid"                                                                                                                                                                                                                                    
## [1930] "journal.pone.0056604.txt:pesticide beta-cypermethrin, sensitivity was not significantly"                                                                                                                                                                                                                                     
## [1931] "journal.pone.0056604.txt-increased by either of the silenced GSTs (Figure 11), even though"                                                                                                                                                                                                                                  
## [1932] "journal.pone.0056604.txt-silencing of either GSTe7 or GSTe2 by RNA interference in A."                                                                                                                                                                                                                                       
## [1933] "journal.pone.0056604.txt-aegypti resulted in an increased susceptibility to the pyrethroid"                                                                                                                                                                                                                                  
## [1934] "--"                                                                                                                                                                                                                                                                                                                          
## [1935] "journal.pone.0056604.txt-between different planthopper populations. RNAi provided"                                                                                                                                                                                                                                           
## [1936] "journal.pone.0056604.txt-evidence for involvement of the Epsilon subclass genes and"                                                                                                                                                                                                                                         
## [1937] "journal.pone.0056604.txt-microsomal GSTs in tolerance of N. lugens to the organophosphate"                                                                                                                                                                                                                                   
## [1938] "journal.pone.0056604.txt:insecticide chlorpyrifos, although not to beta-cypermethrin."                                                                                                                                                                                                                                       
## [1939] "journal.pone.0056604.txt-Insecticide resistance is now becoming an urgent problem for"                                                                                                                                                                                                                                       
## [1940] "journal.pone.0056604.txt-the control of the three planthopper members throughout Asia."                                                                                                                                                                                                                                      
## [1941] "journal.pone.0056604.txt-Our characterization of the GST genes in N. lugens and S. furcifera"                                                                                                                                                                                                                                
## [1942] "--"                                                                                                                                                                                                                                                                                                                          
## [1943] "journal.pone.0056604.txt-GST Gene Family of Rice Delphacid Pests"                                                                                                                                                                                                                                                            
## [1944] "journal.pone.0056604.txt-PLOS ONE | www.plosone.org 10 February 2013 | Volume 8 | Issue 2 | e56604"                                                                                                                                                                                                                          
## [1945] "journal.pone.0056604.txt-\fFigure 9. Transcription profiles of nine N. lugens GSTs and nine S. furcifera GSTs in third instar-nymphs exposed to sub-lethal"                                                                                                                                                                  
## [1946] "journal.pone.0056604.txt:concentrations of four different insecticides, Imidacloprid, chlorpyrifos, beta-cypermethrin and buprofezin. For each time point (6, 12,"                                                                                                                                                           
## [1947] "journal.pone.0056604.txt-24 and 48 hours), transcription levels are expressed as mean fold transcription relative to controls (unexposed nymphs) (CT). Yellow, orange and red"                                                                                                                                               
## [1948] "journal.pone.0056604.txt-indicate significant over-transcription, whilst green, blue and black indicate significant under-transcription (Mann-Whitney test P-value,0.05. Data"                                                                                                                                               
## [1949] "journal.pone.0056604.txt-was converted by SPSS v19.0). White indicates no significant transcription variation."                                                                                                                                                                                                              
## [1950] "--"                                                                                                                                                                                                                                                                                                                          
## [1951] "journal.pone.0056604.txt-insects were collected from each replicate. The nymphs were"                                                                                                                                                                                                                                        
## [1952] "journal.pone.0056604.txt-exposed to: chlorpyrifos (an organophosphate), imidacloprid (a"                                                                                                                                                                                                                                     
## [1953] "journal.pone.0056604.txt-neonicotinoid), buprofezin (an insect growth regulator) or beta-"                                                                                                                                                                                                                                   
## [1954] "journal.pone.0056604.txt:cypermethrin (a synthetic pyrethroid) (Xinnong Chemical Indus-"                                                                                                                                                                                                                                     
## [1955] "journal.pone.0056604.txt-trial Group Co. Ltd., Taizhou, Zhejiang, China)."                                                                                                                                                                                                                                                   
## [1956] "journal.pone.0056604.txt-Quantitative PCR of GST mRNAs"                                                                                                                                                                                                                                                                      
## [1957] "journal.pone.0056604.txt-RNA was extracted according to the protocols mentioned"                                                                                                                                                                                                                                             
## [1958] "--"                                                                                                                                                                                                                                                                                                                          
## [1959] "journal.pone.0056604.txt-sample according to the protocol above for quantifying the"                                                                                                                                                                                                                                         
## [1960] "journal.pone.0056604.txt-efficiency of RNAi. Sixty 4th instar nymphs were selected at"                                                                                                                                                                                                                                       
## [1961] "journal.pone.0056604.txt-24 hours following injection, exposed to the insecticides chlorpyr-"                                                                                                                                                                                                                                
## [1962] "journal.pone.0056604.txt:ifos or beta-cypermethrin for 24 hours by microtopical application"                                                                                                                                                                                                                                 
## [1963] "journal.pone.0056604.txt-after which mortalities were calculated."                                                                                                                                                                                                                                                           
## [1964] "journal.pone.0056604.txt-Supporting Information"                                                                                                                                                                                                                                                                             
## [1965] "journal.pone.0056604.txt-Table S1 Primers for gene clone, Realtime PCR and RNA"                                                                                                                                                                                                                                              
## [1966] "--"                                                                                                                                                                                                                                                                                                                          
## [1967] "journal.pone.0056740.txt-on Malaria Transmission Intensity. PLoS Med 5: e226. doi:10.1371/"                                                                                                                                                                                                                                  
## [1968] "journal.pone.0056740.txt-journal.pmed.0050226."                                                                                                                                                                                                                                                                              
## [1969] "journal.pone.0056740.txt-18. Sharma SK, Upadhyay AK, Haque MA, Tyagi PK, Raghavendra K, et al."                                                                                                                                                                                                                              
## [1970] "journal.pone.0056740.txt:(2010) Wash-resistance and field evaluation of alphacypermethrin treated long-"                                                                                                                                                                                                                     
## [1971] "journal.pone.0056740.txt-lasting insecticidal net (Interceptor) against malaria vectors Anopheles"                                                                                                                                                                                                                           
## [1972] "journal.pone.0056740.txt-culicifacies and Anopheles fluviatilis in a tribal area of Orissa, India. Acta Trop"                                                                                                                                                                                                                
## [1973] "journal.pone.0056740.txt-116: 24–30. doi:10.1016/j.actatropica.2010.05.002."                                                                                                                                                                                                                                                 
## [1974] "--"                                                                                                                                                                                                                                                                                                                          
## [1975] "journal.pone.0060929.txt-House flies, Musca domestica L., are important pests of dairy operations worldwide, with the ability to adapt wide range of"                                                                                                                                                                        
## [1976] "journal.pone.0060929.txt-environmental conditions. There are a number of insecticides used for their management, but development of resistance is"                                                                                                                                                                           
## [1977] "journal.pone.0060929.txt-a serious problem. Insecticide mixtures could enhance the toxicity of insecticides in resistant insect pests, thus resulting as"                                                                                                                                                                    
## [1978] "journal.pone.0060929.txt:a potential resistance management tool. The toxicity of bifenthrin, cypermethrin, deltamethrin, chlorpyrifos, profenofos,"                                                                                                                                                                          
## [1979] "journal.pone.0060929.txt-emamectin benzoate and fipronil were assessed separately, and in mixtures against house flies. A field-collected population"                                                                                                                                                                        
## [1980] "journal.pone.0060929.txt-was significantly resistant to all the insecticides under investigation when compared with a laboratory susceptible strain."                                                                                                                                                                        
## [1981] "journal.pone.0060929.txt-Most of the insecticide mixtures like one pyrethroid with other compounds evaluated under two conditions (1:1-‘‘A’’ and"                                                                                                                                                                            
## [1982] "journal.pone.0060929.txt-LC50: LC50-‘‘B’’) significantly increased the toxicity of pyrethroids in the field population. Under both conditions, the"                                                                                                                                                                          
## [1983] "journal.pone.0060929.txt-combination indices of pyrethroids with other compounds, in most of the cases, were significantly below 1, suggesting"                                                                                                                                                                              
## [1984] "journal.pone.0060929.txt-synergism. The enzyme inhibitors, PBO and DEF, when used in combination with insecticides against the resistant"                                                                                                                                                                                    
## [1985] "journal.pone.0060929.txt:population, toxicities of bifenthrin, cypermethrin, deltamethrin and emamectin were significantly increased, suggesting"                                                                                                                                                                            
## [1986] "journal.pone.0060929.txt:esterase and monooxygenase based resistance mechanism. The toxicities of bifenthrin, cypermethrin and deltamethrin in"                                                                                                                                                                              
## [1987] "journal.pone.0060929.txt-the resistant population of house flies could be enhanced by the combination with chlorpyrifos, profenofos, emamectin and"                                                                                                                                                                          
## [1988] "journal.pone.0060929.txt-fipronil. The findings of the present study might have practical significance for resistance management in house flies."                                                                                                                                                                            
## [1989] "journal.pone.0060929.txt-Citation: Khan HAA, Akram W, Shad SA, Lee J-J (2013) Insecticide Mixtures Could Enhance the Toxicity of Insecticides in a Resistant Dairy Population of Musca"                                                                                                                                      
## [1990] "--"                                                                                                                                                                                                                                                                                                                          
## [1991] "journal.pone.0060929.txt-field populations of house flies from the dairies in Punjab, Pakistan"                                                                                                                                                                                                                              
## [1992] "journal.pone.0060929.txt-[16,17], an investigation was made using different combination of"                                                                                                                                                                                                                                  
## [1993] "journal.pone.0060929.txt-PLOS ONE | www.plosone.org 1 April 2013 | Volume 8 | Issue 4 | e60929"                                                                                                                                                                                                                              
## [1994] "journal.pone.0060929.txt:\fpyrethroids (bifenthrin, cypermethrin, deltamethrin) with organo-"                                                                                                                                                                                                                                
## [1995] "journal.pone.0060929.txt-phosphates (chlorpyrifos, profenofos) and new insecticides (ema-"                                                                                                                                                                                                                                   
## [1996] "journal.pone.0060929.txt-mectin benzoate, an avermectin; and fipronil, a phenypyrazole), to"                                                                                                                                                                                                                                 
## [1997] "journal.pone.0060929.txt-study the synergistic or antagonistic interaction between insecti-"                                                                                                                                                                                                                                 
## [1998] "--"                                                                                                                                                                                                                                                                                                                          
## [1999] "journal.pone.0060929.txt-laboratory at 2562uC, 6065% RH and 12L: 12D (h) photoperiod."                                                                                                                                                                                                                                       
## [2000] "journal.pone.0060929.txt-Chemicals"                                                                                                                                                                                                                                                                                          
## [2001] "journal.pone.0060929.txt-Commercial formulations of the following insecticides were used"                                                                                                                                                                                                                                    
## [2002] "journal.pone.0060929.txt:for bioassays: bifenthrin (Talstar H 100 EC, FMC) cypermethrin"                                                                                                                                                                                                                                     
## [2003] "journal.pone.0060929.txt-(ArrivoH 10 EC, FMC), deltamethrin (Decis SuperH, 10.5 EC,"                                                                                                                                                                                                                                         
## [2004] "journal.pone.0060929.txt-Bayer Crop Science), profenofos (CuracronH 50 EC, Syngenta),"                                                                                                                                                                                                                                       
## [2005] "journal.pone.0060929.txt-chlorpyrifos, emamectin benzoate (ProclaimH 019EC, Syngenta)"                                                                                                                                                                                                                                       
## [2006] "--"                                                                                                                                                                                                                                                                                                                          
## [2007] "journal.pone.0060929.txt-Insecticide Ratio n* LC50 (95% CL)** Slope 6 SE x2"                                                                                                                                                                                                                                                 
## [2008] "journal.pone.0060929.txt-df P"                                                                                                                                                                                                                                                                                               
## [2009] "journal.pone.0060929.txt-Bifenthrin 1:0 360 10.89 (9.18–13.11) 2.2360.23 2.52 3 0.47"                                                                                                                                                                                                                                        
## [2010] "journal.pone.0060929.txt:Cypermethrin 1:0 360 4.90 (4.24–5.59) 2.8660.27 2.56 3 0.47"                                                                                                                                                                                                                                        
## [2011] "journal.pone.0060929.txt-Deltamethrin 1:0 420 13.18 (11.18–15.59) 2.2560.19 1.66 4 0.79"                                                                                                                                                                                                                                     
## [2012] "journal.pone.0060929.txt-Chlorpyrifos 1:0 420 1.85 (1.55–2.18) 2.2860.20 0.49 4 0.98"                                                                                                                                                                                                                                        
## [2013] "journal.pone.0060929.txt-Profenofos 1:0 420 1.81 (1.53–2.14) 2.2360.19 1.55 4 0.82"                                                                                                                                                                                                                                          
## [2014] "--"                                                                                                                                                                                                                                                                                                                          
## [2015] "journal.pone.0060929.txt-Bifenthrin + Profenofos 1:1 420 5.32 (4.20–7.06) 1.4760.16 0.64 4 0.96"                                                                                                                                                                                                                             
## [2016] "journal.pone.0060929.txt-Bifenthrin + Emamectin 1:1 420 4.52 (3.75–5.51) 1.9060.18 6.64 4 0.17"                                                                                                                                                                                                                              
## [2017] "journal.pone.0060929.txt-Bifenthrin + Fipronil 1:1 420 2.96 (2.39–3.69) 1.5760.16 1.79 4 0.78"                                                                                                                                                                                                                               
## [2018] "journal.pone.0060929.txt:Cypermethrin + Chlorpyrifos 1:1 420 3.33 (2.71–3.55) 1.8160.18 6.71 4 0.15"                                                                                                                                                                                                                         
## [2019] "journal.pone.0060929.txt:Cypermethrin + Profenofos 1:1 360 7.10 (5.51–10.12) 1.7160.23 0.61 3 0.90"                                                                                                                                                                                                                          
## [2020] "journal.pone.0060929.txt:Cypermethrin + Emamectin 1:1 420 2.51 (2.02–3.20) 1.5960.16 0.96 4 0.92"                                                                                                                                                                                                                            
## [2021] "journal.pone.0060929.txt:Cypermethrin + Fipronil 1:1 420 4.21 (3.98–5.44) 1.7160.18 3.29 4 0.51"                                                                                                                                                                                                                             
## [2022] "journal.pone.0060929.txt-Deltamethrin + Chlorpyrifos 1:1 420 8.77 (7.25–10.97) 2.0060.18 3.08 4 0.55"                                                                                                                                                                                                                        
## [2023] "journal.pone.0060929.txt-Deltamethrin + Profenofos 1:1 420 8.82 (6.03–15.11) 1.9360.19 7.81 4 0.10"                                                                                                                                                                                                                          
## [2024] "journal.pone.0060929.txt-Deltamethrin + Emamectin 1:1 480 4.90 (4.12–5.89) 2.0460.16 6.79 5 0.24"                                                                                                                                                                                                                            
## [2025] "--"                                                                                                                                                                                                                                                                                                                          
## [2026] "journal.pone.0060929.txt-Profenofos + Bifenthrin 1:6.02 360 3.44 (2.86–4.15) 2.0460.22 2.41 3 0.49"                                                                                                                                                                                                                          
## [2027] "journal.pone.0060929.txt-Emamectin + Bifenthrin 1:3.77 420 2.65 (2.18–3.23) 1.7960.16 3.09 4 0.54"                                                                                                                                                                                                                           
## [2028] "journal.pone.0060929.txt-Fipronil + Bifenthrin 1:5.61 420 1.38 (1.33–1.95) 1.9160.18 1.47 4 0.83"                                                                                                                                                                                                                            
## [2029] "journal.pone.0060929.txt:Chlorpyrifos + Cypermethrin 1:2.65 360 2.28 (1.91–2.79) 2.0360.22 4.97 3 0.17"                                                                                                                                                                                                                      
## [2030] "journal.pone.0060929.txt:Profenofos + Cypermethrin 1:2.71 360 3.22 (2.23–5.40) 2.3460.35 5.34 3 0.15"                                                                                                                                                                                                                        
## [2031] "journal.pone.0060929.txt:Emamectin + Cypermethrin 1:1.70 360 1.24 (0.83–1.90) 2.3660.23 6.28 3 0.10"                                                                                                                                                                                                                         
## [2032] "journal.pone.0060929.txt:Fipronil + Cypermethrin 1:2.53 360 1.55 (1.30–1.84) 2.2260.23 3.77 3 0.29"                                                                                                                                                                                                                          
## [2033] "journal.pone.0060929.txt-Chlorpyrifos + Deltamethrin 1:7.12 360 5.22 (4.35–6.36) 2.0860.22 3.17 3 0.37"                                                                                                                                                                                                                      
## [2034] "journal.pone.0060929.txt-Profenofos + Deltamethrin 1:7.28 360 5.80 (4.85–7.11) 2.1160.22 1.83 3 0.61"                                                                                                                                                                                                                        
## [2035] "journal.pone.0060929.txt-Emamectin + Deltamethrin 1:4.56 360 3.46 (2.92–4.07) 2.3560.24 3.82 3 0.28"                                                                                                                                                                                                                         
## [2036] "--"                                                                                                                                                                                                                                                                                                                          
## [2037] "journal.pone.0060929.txt-observed in all combinations: bifenthrin/other non-pyrethroids."                                                                                                                                                                                                                                    
## [2038] "journal.pone.0060929.txt-The toxicity of bifenthrin increased significantly when mixed with"                                                                                                                                                                                                                                 
## [2039] "journal.pone.0060929.txt-fipronil over that of mixtures with the other non-pyrethroids at the"                                                                                                                                                                                                                               
## [2040] "journal.pone.0060929.txt:both ratios tested. For cypermethrin, the increased toxicity was"                                                                                                                                                                                                                                   
## [2041] "journal.pone.0060929.txt:observed in the following combinations: cypermethrin/chlorpyr-"                                                                                                                                                                                                                                     
## [2042] "journal.pone.0060929.txt:ifos or emamectin at the 1:1 ratio, and cypermethrin/other"                                                                                                                                                                                                                                         
## [2043] "journal.pone.0060929.txt-insecticides except profenofos, at the LC50: LC50 ratio. At the 1:1"                                                                                                                                                                                                                                
## [2044] "journal.pone.0060929.txt:ratio, the mixtures of cypermethrin/chlorpyrifos or emamectin"                                                                                                                                                                                                                                      
## [2045] "journal.pone.0060929.txt-were significantly more toxic compared to the mixture with"                                                                                                                                                                                                                                         
## [2046] "journal.pone.0060929.txt-profenofos or fipronil while at LC50: LC50 ratio, the mixture of"                                                                                                                                                                                                                                   
## [2047] "journal.pone.0060929.txt:cypermethrin with either emamectin or fipronil was significantly"                                                                                                                                                                                                                                   
## [2048] "journal.pone.0060929.txt-more toxic than the rest of the two mixtures. For deltamethrin, the"                                                                                                                                                                                                                                
## [2049] "journal.pone.0060929.txt-mixture of deltamethrin with either chlorpyrifos or emamectin at"                                                                                                                                                                                                                                   
## [2050] "journal.pone.0060929.txt-the 1:1 ratio, and with all the other insecticides at the LC50: LC50"                                                                                                                                                                                                                               
## [2051] "--"                                                                                                                                                                                                                                                                                                                          
## [2052] "journal.pone.0060929.txt-toxicities of pyrethroids/non-pyrethroids were significantly higher"                                                                                                                                                                                                                                
## [2053] "journal.pone.0060929.txt-at the LC50: LC50 ratio (non overlapping 95% CL; P,0.01) than"                                                                                                                                                                                                                                      
## [2054] "journal.pone.0060929.txt-the combinations mixed at the 1:1 ratio, except the toxicities of"                                                                                                                                                                                                                                  
## [2055] "journal.pone.0060929.txt:following combinations: cypermethrin/chlorpyrifos and deltame-"                                                                                                                                                                                                                                     
## [2056] "journal.pone.0060929.txt-thrin/profenofos (Table 1)."                                                                                                                                                                                                                                                                        
## [2057] "journal.pone.0060929.txt-The mixtures of bifenthrin, except with fipronil revealed"                                                                                                                                                                                                                                          
## [2058] "journal.pone.0060929.txt-antagonistic effect at the 1:1 ratio with combination index values"                                                                                                                                                                                                                                 
## [2059] "--"                                                                                                                                                                                                                                                                                                                          
## [2060] "journal.pone.0060929.txt-Bifenthrin + Profenofos 1:1 2.66 2.66 2.07"                                                                                                                                                                                                                                                         
## [2061] "journal.pone.0060929.txt-Bifenthrin + Emamectin 1:1 2.26 2.26 1.15"                                                                                                                                                                                                                                                          
## [2062] "journal.pone.0060929.txt-Bifenthrin + Fipronil 1:1 1.48 1.48 1.00"                                                                                                                                                                                                                                                           
## [2063] "journal.pone.0060929.txt:Cypermethrin + Chlorpyrifos 1:1 1.66 1.66 1.54"                                                                                                                                                                                                                                                     
## [2064] "journal.pone.0060929.txt:Cypermethrin + Profenofos 1:1 3.55 3.55 4.10"                                                                                                                                                                                                                                                       
## [2065] "journal.pone.0060929.txt:Cypermethrin + Emamectin 1:1 1.26 1.26 0.80"                                                                                                                                                                                                                                                        
## [2066] "journal.pone.0060929.txt:Cypermethrin + Fipronil 1:1 2.11 2.11 1.99"                                                                                                                                                                                                                                                         
## [2067] "journal.pone.0060929.txt-Deltamethrin + Chlorpyrifos 1:1 4.38 4.38 2.88"                                                                                                                                                                                                                                                     
## [2068] "journal.pone.0060929.txt-Deltamethrin + Profenofos 1:1 4.41 4.41 2.95"                                                                                                                                                                                                                                                       
## [2069] "journal.pone.0060929.txt-Deltamethrin + Emamectin 1:1 2.45 2.45 1.191.19"                                                                                                                                                                                                                                                    
## [2070] "--"                                                                                                                                                                                                                                                                                                                          
## [2071] "journal.pone.0060929.txt-Profenofos + Bifenthrin 1:6.02 0.49 2.95 0.62"                                                                                                                                                                                                                                                      
## [2072] "journal.pone.0060929.txt-Emamectin + Bifenthrin 1:3.77 0.55 2.09 0.42"                                                                                                                                                                                                                                                       
## [2073] "journal.pone.0060929.txt-Fipronil + Bifenthrin 1:5.61 0.21 1.71 0.23"                                                                                                                                                                                                                                                        
## [2074] "journal.pone.0060929.txt:Chlorpyrifos + Cypermethrin 1:2.65 0.62 1.66 0.80"                                                                                                                                                                                                                                                  
## [2075] "journal.pone.0060929.txt:Profenofos + Cypermethrin 1:2.71 0.87 2.35 1.19"                                                                                                                                                                                                                                                    
## [2076] "journal.pone.0060929.txt:Emamectin + Cypermethrin 1:1.70 0.46 0.78 0.35"                                                                                                                                                                                                                                                     
## [2077] "journal.pone.0060929.txt:Fipronil + Cypermethrin 1:2.53 0.44 1.11 0.50"                                                                                                                                                                                                                                                      
## [2078] "journal.pone.0060929.txt-Chlorpyrifos + Deltamethrin 1:7.12 0.64 4.58 0.81"                                                                                                                                                                                                                                                  
## [2079] "journal.pone.0060929.txt-Profenofos + Deltamethrin 1:7.28 0.70 5.10 0.91"                                                                                                                                                                                                                                                    
## [2080] "journal.pone.0060929.txt-Emamectin + Deltamethrin 1:4.56 0.62 2.84 0.49"                                                                                                                                                                                                                                                     
## [2081] "--"                                                                                                                                                                                                                                                                                                                          
## [2082] "journal.pone.0060929.txt-PLOS ONE | www.plosone.org 3 April 2013 | Volume 8 | Issue 4 | e60929"                                                                                                                                                                                                                              
## [2083] "journal.pone.0060929.txt-\f.1, however, at the LC50: LC50 ratio all combinations produced"                                                                                                                                                                                                                                   
## [2084] "journal.pone.0060929.txt-synergistic effect with combination index values ,1 (Table 2). For"                                                                                                                                                                                                                                 
## [2085] "journal.pone.0060929.txt:cypermethrin at the 1:1 ratio, only cypermethrin/emamectin"                                                                                                                                                                                                                                         
## [2086] "journal.pone.0060929.txt-mixture produced a synergistic effect while at the LC50: LC50"                                                                                                                                                                                                                                      
## [2087] "journal.pone.0060929.txt:ratio, except cypermethrin/profenofos, all the mixtures produced"                                                                                                                                                                                                                                   
## [2088] "journal.pone.0060929.txt-a synergistic effect. Similarly, the mixtures of deltamethrin/other"                                                                                                                                                                                                                                
## [2089] "journal.pone.0060929.txt-insecticides at the 1:1 ratio revealed antagonistic effect, while"                                                                                                                                                                                                                                  
## [2090] "journal.pone.0060929.txt-snyrgistic effect was observed at the other ratio tested (Table 2)."                                                                                                                                                                                                                                
## [2091] "--"                                                                                                                                                                                                                                                                                                                          
## [2092] "journal.pone.0060929.txt-The field collected population showed resistance to all the tested"                                                                                                                                                                                                                                 
## [2093] "journal.pone.0060929.txt-insecticides when compared with the laboratory reared susceptible"                                                                                                                                                                                                                                  
## [2094] "journal.pone.0060929.txt-strain (Table 3). The resistance ratios were 11.72, 64.79, 15.87,"                                                                                                                                                                                                                                  
## [2095] "journal.pone.0060929.txt:8.82, 22.02, 43.11 and 22.29 for bifenthrin, cypermethrin,"                                                                                                                                                                                                                                         
## [2096] "journal.pone.0060929.txt-deltamethrin, chlorpyrifos, profenofos, emamectin and fipronil,"                                                                                                                                                                                                                                    
## [2097] "journal.pone.0060929.txt-respectively, when these insecticides used alone."                                                                                                                                                                                                                                                  
## [2098] "journal.pone.0060929.txt-In most of the cases, the toxicities of pyrethroids, based on their"                                                                                                                                                                                                                                
## [2099] "--"                                                                                                                                                                                                                                                                                                                          
## [2100] "journal.pone.0060929.txt-ratio. However, bifenthrin with either emamectin or fipronil at 1:1,"                                                                                                                                                                                                                               
## [2101] "journal.pone.0060929.txt-and bifenthrin/fipronil at LC50: LC50 ratio did not increase toxicity"                                                                                                                                                                                                                              
## [2102] "journal.pone.0060929.txt-since their LC50 values were similar with bifenthrin alone based on"                                                                                                                                                                                                                                
## [2103] "journal.pone.0060929.txt:overlapping of 95% CLs. In case of cypermethrin, either it was used"                                                                                                                                                                                                                                
## [2104] "journal.pone.0060929.txt-at the ratio of 1:1 or LC50: LC50 with the other insecticides, the"                                                                                                                                                                                                                                 
## [2105] "journal.pone.0060929.txt-toxicities increased significantly compared to the toxicity of"                                                                                                                                                                                                                                     
## [2106] "journal.pone.0060929.txt:cypermethrin alone. Similarly, the toxicity of deltamethrin in-"                                                                                                                                                                                                                                    
## [2107] "journal.pone.0060929.txt-creased significantly with all the combinations at both tested ratios"                                                                                                                                                                                                                              
## [2108] "journal.pone.0060929.txt-except the combination with profenofos at the 1:1 ratio where the"                                                                                                                                                                                                                                  
## [2109] "journal.pone.0060929.txt-LC50 value was the same as for deltamethrin alone (Table 3)."                                                                                                                                                                                                                                       
## [2110] "--"                                                                                                                                                                                                                                                                                                                          
## [2111] "journal.pone.0060929.txt-Insecticide Ratio n* LC50 (95% CL)** Slope 6 SE x2"                                                                                                                                                                                                                                                 
## [2112] "journal.pone.0060929.txt-df P RR***"                                                                                                                                                                                                                                                                                         
## [2113] "journal.pone.0060929.txt-Bifenthrin 1:0 420 127.62 (104.75–157.69) 1.7460.17 1.74 4 0.78 11.72"                                                                                                                                                                                                                              
## [2114] "journal.pone.0060929.txt:Cypermethrin 1:0 480 317.45 (250.39–418.56) 1.3960.14 1.73 5 0.88 64.79"                                                                                                                                                                                                                            
## [2115] "journal.pone.0060929.txt-Deltamethrin 1:0 540 209.12 (170.00–262.11) 1.5560.12 7.93 6 0.24 15.87"                                                                                                                                                                                                                            
## [2116] "journal.pone.0060929.txt-Chlorpyrifos 1:0 360 16.31 (13.17–21.29) 1.8160.22 0.02 3 0.99 8.82"                                                                                                                                                                                                                                
## [2117] "journal.pone.0060929.txt-Profenofos 1:0 480 39.85 (32.89–49.41) 1.8460.16 7.74 5 0.17 22.02"                                                                                                                                                                                                                                 
## [2118] "--"                                                                                                                                                                                                                                                                                                                          
## [2119] "journal.pone.0060929.txt-Bifenthrin + Profenofos 1:1 420 58.39 (46.23–77.22) 1.6060.16 1.23 4 0.87 10.98"                                                                                                                                                                                                                    
## [2120] "journal.pone.0060929.txt-Bifenthrin + Emamectin 1:1 360 141.00 (113.02–187.47) 1.8160.22 1.48 3 0.69 31.19"                                                                                                                                                                                                                  
## [2121] "journal.pone.0060929.txt-Bifenthrin + Fipronil 1:1 360 100.36 (80.04–134.71) 1.8160.22 3.74 3 0.29 33.91"                                                                                                                                                                                                                    
## [2122] "journal.pone.0060929.txt:Cypermethrin + Chlorpyrifos 1:1 360 74.09 (60.73–90.64) 1.8660.21 0.15 3 0.98 22.32"                                                                                                                                                                                                                
## [2123] "journal.pone.0060929.txt:Cypermethrin + Profenofos 1:1 420 51.87 (41.94–64.17) 1.6060.16 1.68 4 0.80 7.31"                                                                                                                                                                                                                   
## [2124] "journal.pone.0060929.txt:Cypermethrin + Emamectin 1:1 480 77.45 (64.50–94.45) 1.9160.16 7.27 5 0.20 30.86"                                                                                                                                                                                                                   
## [2125] "journal.pone.0060929.txt:Cypermethrin + Fipronil 1:1 420 64.74 (50.43–85.00) 1.2960.15 1.50 4 0.82 15.38"                                                                                                                                                                                                                    
## [2126] "journal.pone.0060929.txt-Deltamethrin + Chlorpyrifos 1:1 480 93.01 (76.81–115.31) 1.8860.17 5.75 5 0.33 10.64"                                                                                                                                                                                                               
## [2127] "journal.pone.0060929.txt-Deltamethrin + Profenofos 1:1 420 152.72 (116.77–216.41) 1.3960.12 1.16 4 0.89 17.32"                                                                                                                                                                                                               
## [2128] "journal.pone.0060929.txt-Deltamethrin + Emamectin 1:1 480 90.67 (73.35–115.36) 1.6060.15 3.30 5 0.65 18.50"                                                                                                                                                                                                                  
## [2129] "--"                                                                                                                                                                                                                                                                                                                          
## [2130] "journal.pone.0060929.txt-Profenofos + Bifenthrin 1:3.20 420 26.57 (17.10–40.91) 1.6760.16 7.89 4 0.10 7.72"                                                                                                                                                                                                                  
## [2131] "journal.pone.0060929.txt-Emamectin + Bifenthrin 1:1.02 480 60.51 (48.78–76.74) 1.5060.14 1.02 5 0.96 22.92"                                                                                                                                                                                                                  
## [2132] "journal.pone.0060929.txt-Fipronil + Bifenthrin 1:2.95 420 96.82 (73.54–139.51) 1.4060.17 1.10 4 0.89 70.16"                                                                                                                                                                                                                  
## [2133] "journal.pone.0060929.txt:Chlorpyrifos + Cypermethrin 1:19.46 420 54.79 (45.09–66.50) 1.8060.17 2.25 4 0.69 24.03"                                                                                                                                                                                                            
## [2134] "journal.pone.0060929.txt:Profenofos + Cypermethrin 1:7.97 420 45.85 (35.96–60.26) 1.3560.15 0.34 4 0.99 14.23"                                                                                                                                                                                                               
## [2135] "journal.pone.0060929.txt:Emamectin + Cypermethrin 1:2.55 420 93.46 (64.89–138.78) 1.9760.18 7.76 4 0.10 75.37"                                                                                                                                                                                                               
## [2136] "journal.pone.0060929.txt:Fipronil + Cypermethrin 1:7.34 480 90.39 (75.49–109.67) 1.9460.16 1.73 5 0.89 58.32"                                                                                                                                                                                                                
## [2137] "journal.pone.0060929.txt-Chlorpyrifos + Deltamethrin 1:12.82 420 45.59 (37.15–56.36) 1.6660.16 2.14 4 0.71 8.73"                                                                                                                                                                                                             
## [2138] "journal.pone.0060929.txt-Profenofos + Deltamethrin 1:5.25 360 53.05 (32.93–82.71) 2.0160.23 5.56 3 0.14 9.51"                                                                                                                                                                                                                
## [2139] "journal.pone.0060929.txt-Emamectin + Deltamethrin 1:1.68 480 102.84 (79.24–140.15) 1.2460.12 0.78 5 0.98 29.72"                                                                                                                                                                                                              
## [2140] "--"                                                                                                                                                                                                                                                                                                                          
## [2141] "journal.pone.0060929.txt-.1) at the 1:1 ratio, however, synergistic effect was observed"                                                                                                                                                                                                                                     
## [2142] "journal.pone.0060929.txt-(combination index ,1) with all the combinations when they were"                                                                                                                                                                                                                                    
## [2143] "journal.pone.0060929.txt-tested in the ratio of LC50: LC50, except bifenthrin/fipronil"                                                                                                                                                                                                                                      
## [2144] "journal.pone.0060929.txt:mixture (combination index .1) (Table 4). For cypermethrin, all"                                                                                                                                                                                                                                    
## [2145] "journal.pone.0060929.txt-the tested combinations produced a synergistic effect in both ratios"                                                                                                                                                                                                                               
## [2146] "journal.pone.0060929.txt:tested, except the combination cypermethrin/chlorpyrifos which"                                                                                                                                                                                                                                     
## [2147] "journal.pone.0060929.txt-was antagonistic when used at the 1:1 ratio. In case of"                                                                                                                                                                                                                                            
## [2148] "journal.pone.0060929.txt-deltamethrin at the 1:1 ratio, only the combination deltame-"                                                                                                                                                                                                                                       
## [2149] "journal.pone.0060929.txt-thrin/emamectin produced synergistic effect. In contrast, all the"                                                                                                                                                                                                                                  
## [2150] "--"                                                                                                                                                                                                                                                                                                                          
## [2151] "journal.pone.0060929.txt-insecticides"                                                                                                                                                                                                                                                                                       
## [2152] "journal.pone.0060929.txt-The use of two enzyme inhibitors viz., PBO and DEF, against"                                                                                                                                                                                                                                        
## [2153] "journal.pone.0060929.txt-the field population of M. domestica largely overcame resistance to"                                                                                                                                                                                                                                
## [2154] "journal.pone.0060929.txt:bifenthrin, cypermethrin, deltamethrin, chlorpyrifos, profenofos"                                                                                                                                                                                                                                   
## [2155] "journal.pone.0060929.txt-and emamectin. PBO significantly reduced LC50 values (non"                                                                                                                                                                                                                                          
## [2156] "journal.pone.0060929.txt-overlapping of 95% CLs) for bifenthrin from 127.62 to 21.94 (6"                                                                                                                                                                                                                                     
## [2157] "journal.pone.0060929.txt:fold), cypermethrin from 317.45 to 43.86 (7 fold), deltamethrin"                                                                                                                                                                                                                                    
## [2158] "journal.pone.0060929.txt-from 209.12 to 38.76 (5 fold), chlorpyrifos from 16.31 to 6.19 (3"                                                                                                                                                                                                                                  
## [2159] "journal.pone.0060929.txt-fold), profenofos from 39.85 to 14.77 (3 fold), and emamectin from"                                                                                                                                                                                                                                 
## [2160] "journal.pone.0060929.txt-124.59 to 60.61 (2 fold). However, PBO did not produce"                                                                                                                                                                                                                                             
## [2161] "journal.pone.0060929.txt-a synergistic effect with fipronil. DEF also reduced LC50 values"                                                                                                                                                                                                                                   
## [2162] "journal.pone.0060929.txt:for bifenthrin from 127.62 to 64.35 (2 fold), cypermethrin from"                                                                                                                                                                                                                                    
## [2163] "journal.pone.0060929.txt-317.45 to 162.50 (2 fold), deltamethrin from 209.12 to 100.09 (2"                                                                                                                                                                                                                                   
## [2164] "journal.pone.0060929.txt-fold), chlorpyrifos from 16.31 to 3.66 (4 fold), and profenofos from"                                                                                                                                                                                                                               
## [2165] "journal.pone.0060929.txt-39.85 to 5.48 (7 fold). However, DEF did not show synergism with"                                                                                                                                                                                                                                   
## [2166] "--"                                                                                                                                                                                                                                                                                                                          
## [2167] "journal.pone.0060929.txt-In the laboratory susceptible strain, the combination between one"                                                                                                                                                                                                                                  
## [2168] "journal.pone.0060929.txt-pyrethroid and the other compounds produced an antagonistic"                                                                                                                                                                                                                                        
## [2169] "journal.pone.0060929.txt-interaction (in the ratio 1:1), except the following combinations:"                                                                                                                                                                                                                                 
## [2170] "journal.pone.0060929.txt:bifenthrin/fipronil and cypermethrin/emamectin where the inter-"                                                                                                                                                                                                                                    
## [2171] "journal.pone.0060929.txt-actions were additive and synergistic, respectively. In contrast, all"                                                                                                                                                                                                                              
## [2172] "journal.pone.0060929.txt-the mixtures of pyrethroid/non-pyrethroid produced a synergistic"                                                                                                                                                                                                                                   
## [2173] "journal.pone.0060929.txt-effect when used in the ratio of LC50: LC50, except the"                                                                                                                                                                                                                                            
## [2174] "journal.pone.0060929.txt:combination cypermethrin/profenofos. In the field strain, all the"                                                                                                                                                                                                                                  
## [2175] "journal.pone.0060929.txt-mixtures of pyrethroid/non-pyrethroid when used in the ratio of"                                                                                                                                                                                                                                    
## [2176] "journal.pone.0060929.txt-1:1, except the following combinations where responses were"                                                                                                                                                                                                                                        
## [2177] "journal.pone.0060929.txt:synergistic: cypermethrin/profenofos or emamectin or fipronil,"                                                                                                                                                                                                                                     
## [2178] "journal.pone.0060929.txt-and deltamethrin/emamectin. However, at the LC50: LC50 ratio,"                                                                                                                                                                                                                                      
## [2179] "journal.pone.0060929.txt-all the mixtures of pyrethroid/non-pyrethroid produced synergis-"                                                                                                                                                                                                                                   
## [2180] "journal.pone.0060929.txt-tic effect, except the combination bifenthrin/fipronil. The"                                                                                                                                                                                                                                        
## [2181] "--"                                                                                                                                                                                                                                                                                                                          
## [2182] "journal.pone.0060929.txt-[26] has documented the enhanced toxicity of bifenthrin and"                                                                                                                                                                                                                                        
## [2183] "journal.pone.0060929.txt-chlorpyrifos by new chemical insecticides in P. xylostella."                                                                                                                                                                                                                                        
## [2184] "journal.pone.0060929.txt-According to the results of present study the toxicity of"                                                                                                                                                                                                                                          
## [2185] "journal.pone.0060929.txt:bifenthrin, cypermethrin and deltamethrin against house flies"                                                                                                                                                                                                                                      
## [2186] "journal.pone.0060929.txt-could be enhanced by the addition of chlorpyrifos, profenofos, and"                                                                                                                                                                                                                                 
## [2187] "journal.pone.0060929.txt-in some cases by emamectin or fipronil, which reveal that these"                                                                                                                                                                                                                                    
## [2188] "journal.pone.0060929.txt-insecticides might be countering the resistance mechanisms in the"                                                                                                                                                                                                                                  
## [2189] "--"                                                                                                                                                                                                                                                                                                                          
## [2190] "journal.pone.0060929.txt-Bifenthrin + Profenofos 1:1 29.20 29.20 1.13"                                                                                                                                                                                                                                                       
## [2191] "journal.pone.0060929.txt-Bifenthrin + Emamectin 1:1 70.50 70.50 1.42"                                                                                                                                                                                                                                                        
## [2192] "journal.pone.0060929.txt-Bifenthrin + Fipronil 1:1 50.18 50.18 2.01"                                                                                                                                                                                                                                                         
## [2193] "journal.pone.0060929.txt:Cypermethrin + Chlorpyrifos 1:1 37.05 37.05 2.66"                                                                                                                                                                                                                                                   
## [2194] "journal.pone.0060929.txt:Cypermethrin + Profenofos 1:1 25.94 25.94 0.78"                                                                                                                                                                                                                                                     
## [2195] "journal.pone.0060929.txt:Cypermethrin + Emamectin 1:1 38.73 38.73 0.47"                                                                                                                                                                                                                                                      
## [2196] "journal.pone.0060929.txt:Cypermethrin + Fipronil 1:1 32.37 32.37 0.93"                                                                                                                                                                                                                                                       
## [2197] "journal.pone.0060929.txt-Deltamethrin + Chlorpyrifos 1:1 46.51 46.51 3.71"                                                                                                                                                                                                                                                   
## [2198] "journal.pone.0060929.txt-Deltamethrin + Profenofos 1:1 76.36 76.36 3.00"                                                                                                                                                                                                                                                     
## [2199] "journal.pone.0060929.txt-Deltamethrin + Emamectin 1:1 45.34 45.34 0.66"                                                                                                                                                                                                                                                      
## [2200] "--"                                                                                                                                                                                                                                                                                                                          
## [2201] "journal.pone.0060929.txt-Profenofos + Bifenthrin 1:3.20 6.33 20.24 0.34"                                                                                                                                                                                                                                                     
## [2202] "journal.pone.0060929.txt-Emamectin + Bifenthrin 1:1.02 29.96 30.55 0.54"                                                                                                                                                                                                                                                     
## [2203] "journal.pone.0060929.txt-Fipronil + Bifenthrin 1:2.95 24.51 72.31 1.46"                                                                                                                                                                                                                                                      
## [2204] "journal.pone.0060929.txt:Chlorpyrifos + Cypermethrin 1:19.46 2.68 52.11 0.36"                                                                                                                                                                                                                                                
## [2205] "journal.pone.0060929.txt:Profenofos + Cypermethrin 1:7.97 5.11 40.74 0.27"                                                                                                                                                                                                                                                   
## [2206] "journal.pone.0060929.txt:Emamectin + Cypermethrin 1:2.55 26.33 67.13 0.47"                                                                                                                                                                                                                                                   
## [2207] "journal.pone.0060929.txt:Fipronil + Cypermethrin 1:7.34 10.84 79.55 0.57"                                                                                                                                                                                                                                                    
## [2208] "journal.pone.0060929.txt-Chlorpyrifos + Deltamethrin 1:12.82 3.30 42.29 0.44"                                                                                                                                                                                                                                                
## [2209] "journal.pone.0060929.txt-Profenofos + Deltamethrin 1:5.25 8.49 44.56 0.40"                                                                                                                                                                                                                                                   
## [2210] "journal.pone.0060929.txt-Emamectin + Deltamethrin 1:1.68 30.37 72.47 0.72"                                                                                                                                                                                                                                                   
## [2211] "--"                                                                                                                                                                                                                                                                                                                          
## [2212] "journal.pone.0060929.txt-Strain Insecticide LC50 (95% CL) Slope6SE x2"                                                                                                                                                                                                                                                       
## [2213] "journal.pone.0060929.txt-df P RR SR*"                                                                                                                                                                                                                                                                                        
## [2214] "journal.pone.0060929.txt-Lab Bifenthrin 10.89 (9.18–13.11) 2.2360.23 2.52 3 0.47"                                                                                                                                                                                                                                            
## [2215] "journal.pone.0060929.txt:Cypermethrin 4.90 (4.24–5.59) 2.8660.27 2.56 3 0.47"                                                                                                                                                                                                                                                
## [2216] "journal.pone.0060929.txt-Deltamethrin 13.18 (11.18–15.59) 2.2560.19 1.66 4 0.79"                                                                                                                                                                                                                                             
## [2217] "journal.pone.0060929.txt-Chlorpyrifos 1.85 (1.55–2.18) 2.2860.20 0.49 4 0.98"                                                                                                                                                                                                                                                
## [2218] "journal.pone.0060929.txt-Profenofos 1.81 (1.53–2.14) 2.2360.19 1.55 4 0.82"                                                                                                                                                                                                                                                  
## [2219] "--"                                                                                                                                                                                                                                                                                                                          
## [2220] "journal.pone.0060929.txt-Fipronil 1.94 (1.62–2.40) 2.1960.24 1.83 3 0.61"                                                                                                                                                                                                                                                    
## [2221] "journal.pone.0060929.txt-Bifenthrin+PBO 8.02 (6.53–9.86) 1.8060.21 0.86 3 0.84 1"                                                                                                                                                                                                                                            
## [2222] "journal.pone.0060929.txt-Bifenthrin+DEF 11.83 (8.06–19.69) 1.9260.19 8.19 4 0.09 1"                                                                                                                                                                                                                                          
## [2223] "journal.pone.0060929.txt:Cypermethrin+PBO 3.84 (2.49–5.95) 2.3260.23 6.36 3 0.10 1"                                                                                                                                                                                                                                          
## [2224] "journal.pone.0060929.txt:Cypermethrin+DEF 5.60 (4.74–6.70) 2.3460.24 4.33 3 0.22 1"                                                                                                                                                                                                                                          
## [2225] "journal.pone.0060929.txt-Deltamethrin+PBO 9.59 (7.78–11.96) 1.7360.20 3.72 3 0.29 1"                                                                                                                                                                                                                                         
## [2226] "journal.pone.0060929.txt-Deltamethrin+DEF 16.14 (13.84–18.91) 2.5460.22 2.18 4 0.70 1"                                                                                                                                                                                                                                       
## [2227] "journal.pone.0060929.txt-Chlorpyrifos+PBO 2.54 (2.10–3.03) 2.2360.23 0.30 3 0.96 1"                                                                                                                                                                                                                                          
## [2228] "--"                                                                                                                                                                                                                                                                                                                          
## [2229] "journal.pone.0060929.txt-Fipronil+PBO 2.11 (1.71–2.73) 1.9160.23 1.91 3 0.59 1"                                                                                                                                                                                                                                              
## [2230] "journal.pone.0060929.txt-Fipronil+DEF 1.85 (1.48–2.45) 1.6660.21 1.71 3 0.64 1"                                                                                                                                                                                                                                              
## [2231] "journal.pone.0060929.txt-Field Bifenthrin 127.62 (104.75–157.69) 1.7460.17 1.74 4 0.78 11.72"                                                                                                                                                                                                                                
## [2232] "journal.pone.0060929.txt:Cypermethrin 317.45 (250.39–418.56) 1.3960.14 1.73 5 0.88 64.79"                                                                                                                                                                                                                                    
## [2233] "journal.pone.0060929.txt-Deltamethrin 209.12 (170.00–262.11) 1.5560.12 7.93 6 0.24 15.87"                                                                                                                                                                                                                                    
## [2234] "journal.pone.0060929.txt-Chlorpyrifos 16.31 (13.17–21.29) 1.8160.22 0.02 3 0.99 8.82"                                                                                                                                                                                                                                        
## [2235] "journal.pone.0060929.txt-Profenofos 39.85 (32.89–49.41) 1.8460.16 7.74 5 0.17 22.02"                                                                                                                                                                                                                                         
## [2236] "--"                                                                                                                                                                                                                                                                                                                          
## [2237] "journal.pone.0060929.txt-Fipronil 43.24 (30.34–67.40) 2.0160.19 7.56 4 0.11 22.29"                                                                                                                                                                                                                                           
## [2238] "journal.pone.0060929.txt-Bifenthrin+PBO 21.94 (17.81–27.04) 1.6560.16 0.56 4 0.97 3.33 6"                                                                                                                                                                                                                                    
## [2239] "journal.pone.0060929.txt-Bifenthrin+DEF 64.35 (41.91–100.77) 2.4460.24 6.73 3 0.08 5.44 2"                                                                                                                                                                                                                                   
## [2240] "journal.pone.0060929.txt:Cypermethrin+PBO 43.86 (35.62–54.65) 1.5360.13 8.02 5 0.16 11.42 7"                                                                                                                                                                                                                                 
## [2241] "journal.pone.0060929.txt:Cypermethrin+DEF 162.50 (124.05–233.37) 1.5160.18 2.88 4 0.58 29.93 2"                                                                                                                                                                                                                              
## [2242] "journal.pone.0060929.txt-Deltamethrin+PBO 38.76 (32.24–46.83) 1.8260.15 5.79 5 0.34 4.90 5"                                                                                                                                                                                                                                  
## [2243] "journal.pone.0060929.txt-Deltamethrin+DEF 100.09 (80.84–128.62) 1.6860.17 0.97 4 0.91 6.20 2"                                                                                                                                                                                                                                
## [2244] "journal.pone.0060929.txt-Chlorpyrifos+PBO 6.19 (5.70–7.78) 1.8560.21 1.60 3 0.66 2.44 3"                                                                                                                                                                                                                                     
## [2245] "--"                                                                                                                                                                                                                                                                                                                          
## [2246] "journal.pone.0060929.txt-enzyme inhibitors in enhancing insecticide toxicities has been"                                                                                                                                                                                                                                     
## [2247] "journal.pone.0060929.txt-studied in different insect pests. In house flies, for example, the"                                                                                                                                                                                                                                
## [2248] "journal.pone.0060929.txt-mixture of PBO with different pyrethroids increased the toxicity of"                                                                                                                                                                                                                                
## [2249] "journal.pone.0060929.txt:cypermethrin, deltamethrin and permethrin [33]. Although PBO"                                                                                                                                                                                                                                       
## [2250] "journal.pone.0060929.txt-is a very good synergist, it should be used cautiously in field due to"                                                                                                                                                                                                                             
## [2251] "journal.pone.0060929.txt-possible ill effects on non-target organisms. Moreover, the"                                                                                                                                                                                                                                        
## [2252] "journal.pone.0060929.txt-environmental protection agency (EPA) has categorized it as class"                                                                                                                                                                                                                                  
## [2253] "journal.pone.0060929.txt-C human carcinogen [34]. The occurrence of mixed function"                                                                                                                                                                                                                                          
## [2254] "journal.pone.0060929.txt-oxidase or esterase based resistance has been reported in different"                                                                                                                                                                                                                                
## [2255] "journal.pone.0060929.txt-insect pests. PBO and DEF have also showed good synergism with"                                                                                                                                                                                                                                     
## [2256] "journal.pone.0060929.txt:cypermethrin in Agrotis ipsilon and H. zea [35], S. litura [12,36] and"                                                                                                                                                                                                                             
## [2257] "journal.pone.0060929.txt-S. exigua [37]. Compared with other insecticides, emamectin and"                                                                                                                                                                                                                                    
## [2258] "journal.pone.0060929.txt-fipronil seem to resist the enzymatic attack, as there was no"                                                                                                                                                                                                                                      
## [2259] "journal.pone.0060929.txt-synergism by PBO and DEF for fipronil, and DEF for emamectin"                                                                                                                                                                                                                                       
## [2260] "--"                                                                                                                                                                                                                                                                                                                          
## [2261] "journal.pone.0060929.txt-resistance to different insecticides in disease vectors of public"                                                                                                                                                                                                                                  
## [2262] "journal.pone.0060929.txt-health importance has stressed the need to search out ways and"                                                                                                                                                                                                                                     
## [2263] "journal.pone.0060929.txt-develop strategies to manage resistance in field conditions [2]. The"                                                                                                                                                                                                                               
## [2264] "journal.pone.0060929.txt:results reveal that the toxicity of bifenthrin, cypermethrin and"                                                                                                                                                                                                                                   
## [2265] "journal.pone.0060929.txt-deltamethrin to house flies could be enhanced by the addition of"                                                                                                                                                                                                                                   
## [2266] "journal.pone.0060929.txt-chlorpyrifos, profenofos, and in some cases by emamectin or"                                                                                                                                                                                                                                        
## [2267] "journal.pone.0060929.txt-fipronil. Insecticide mixtures could be very helpful in the"                                                                                                                                                                                                                                        
## [2268] "--"                                                                                                                                                                                                                                                                                                                          
## [2269] "journal.pone.0060929.txt-Biochem Physiol 40:198–204."                                                                                                                                                                                                                                                                        
## [2270] "journal.pone.0060929.txt-23. Phokela A, Singh SP, Mehrotra KN (1999) Effect of synergists on pyrethroids"                                                                                                                                                                                                                    
## [2271] "journal.pone.0060929.txt-toxicity in adults of Helicoverpa armigera (Hubner). Pestic Res J 11:62–64."                                                                                                                                                                                                                        
## [2272] "journal.pone.0060929.txt:24. Ahmad M (2004) Potentiation/antagonism of deltamethrin and cypermethrins"                                                                                                                                                                                                                       
## [2273] "journal.pone.0060929.txt-with organophosphate insecticides in the cotton bollworm, Helicoverpa armigera"                                                                                                                                                                                                                     
## [2274] "journal.pone.0060929.txt-(Lepidoptera: Noctuidae). Pestic Biochem Physiol 80:31–42."                                                                                                                                                                                                                                         
## [2275] "journal.pone.0060929.txt-25. Keddis ME, Abdelsattar MM, Issa YH, ElGuindy MA (1986) The toxicity of"                                                                                                                                                                                                                         
## [2276] "--"                                                                                                                                                                                                                                                                                                                          
## [2277] "journal.pone.0061670.txt-avermectin and halfenprox) used to control insects with piercing-"                                                                                                                                                                                                                                  
## [2278] "journal.pone.0061670.txt-sucking mouthparts, such as the red spider, was applied to the 3"                                                                                                                                                                                                                                   
## [2279] "journal.pone.0061670.txt-fields. However, the applications of chemical pesticides (i.e.,"                                                                                                                                                                                                                                    
## [2280] "journal.pone.0061670.txt:methamidophos and cypermethrin) used to control Lepidoptera,"                                                                                                                                                                                                                                       
## [2281] "journal.pone.0061670.txt-such as the cotton bollworm, in the 2 transgenic cotton fields were"                                                                                                                                                                                                                                
## [2282] "journal.pone.0061670.txt-fewer in number than those applied to the conventional cotton"                                                                                                                                                                                                                                      
## [2283] "journal.pone.0061670.txt-field (Fig. 1). Therefore, the differences in the spraying of chemical"                                                                                                                                                                                                                             
## [2284] "--"                                                                                                                                                                                                                                                                                                                          
## [2285] "journal.pone.0063307.txt-carcinoma of the tongue and esophagus, and thyroid malignancies"                                                                                                                                                                                                                                    
## [2286] "journal.pone.0063307.txt-[20-22,35–37]. In skin cancer, a recent study has shown that"                                                                                                                                                                                                                                       
## [2287] "journal.pone.0063307.txt-galectin-7 is induced during neoplastic transformation of the skin"                                                                                                                                                                                                                                 
## [2288] "journal.pone.0063307.txt:following exposure to cypermethrin, a highly carcinogenic"                                                                                                                                                                                                                                          
## [2289] "journal.pone.0063307.txt-insecticide used for agricultural and domestic applications [38]."                                                                                                                                                                                                                                  
## [2290] "journal.pone.0063307.txt-Because melanoma represents one of the most dangerous forms of"                                                                                                                                                                                                                                     
## [2291] "journal.pone.0063307.txt-skin cancer, we investigated the role of galectin-7 in melanoma. In"                                                                                                                                                                                                                                
## [2292] "--"                                                                                                                                                                                                                                                                                                                          
## [2293] "journal.pone.0063307.txt-37. Alves PM, Godoy GP, Gomes DQ, Medeiros AM, de Souza LB, et al. (2011)"                                                                                                                                                                                                                          
## [2294] "journal.pone.0063307.txt-Significance of galectins-1, -3, -4 and -7 in the progression of squamous cell"                                                                                                                                                                                                                     
## [2295] "journal.pone.0063307.txt-carcinoma of the tongue. Pathol Res Pract 207: 236–240."                                                                                                                                                                                                                                            
## [2296] "journal.pone.0063307.txt:38. George J, Srivastava AK, Singh R, Shukla Y (2011) Cypermethrin exposure"                                                                                                                                                                                                                        
## [2297] "journal.pone.0063307.txt-leads to regulation of proteins expression involved in neoplastic transformation"                                                                                                                                                                                                                   
## [2298] "journal.pone.0063307.txt-in mouse skin. Proteomics 11: 4411–4421."                                                                                                                                                                                                                                                           
## [2299] "journal.pone.0063307.txt-39. Villeneuve C, Baricault L, Canelle L, Barboule N, Racca C, et al. (2011)"
```

<canvas id="testgl3textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 15 ****** -->
<script id="testgl3vshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl3fshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 20.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testgl3vshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl3fshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 18 ****** -->
<script id="testgl3vshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl3fshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 19 ****** -->
<script id="testgl3vshader19" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl3fshader19" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 20 ****** -->
<script id="testgl3vshader20" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl3fshader20" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 21 ****** -->
<script id="testgl3vshader21" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl3fshader21" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 30 ****** -->
<script id="testgl3vshader30" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testgl3fshader30" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 31 ****** -->
<script id="testgl3vshader31" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl3fshader31" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 32 ****** -->
<script id="testgl3vshader32" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testgl3fshader32" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 33 ****** -->
<script id="testgl3vshader33" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl3fshader33" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 34 ****** -->
<script id="testgl3vshader34" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testgl3fshader34" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 35 ****** -->
<script id="testgl3vshader35" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testgl3fshader35" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 36 ****** -->
<script id="testgl3vshader36" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testgl3fshader36" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript">
function testgl3webGLStart() {
var debug = function(msg) {
document.getElementById("testgl3debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl3canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new Object();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 8;
zoom[8] = 1;
fov[8] = 60;
userMatrix[8] = new CanvasMatrix4();
userMatrix[8].load([
0.7071068, -0.3535534, 0.6123724, 0,
0, 0.8660254, 0.5, 0,
-0.7071068, -0.3535534, 0.6123724, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl3textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgl3textureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testgl3vshader15" ));
gl.attachShader(prog15, getShader( gl, "testgl3fshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var v=new Float32Array([
-0.555308, -0.07330664, 0.03264253, 0.005,
-0.555308, -0.07330664, 0.03264253, 0.005,
-0.555308, -0.07330664, 0.03264253, 0.005,
-0.5262242, -0.05968625, 0.02335056, 0.005,
-0.555308, -0.07330664, 0.03264253, 0.005,
-0.555308, -0.07330664, 0.03264253, 0.005,
-0.555308, -0.07330664, 0.03264253, 0.005,
-0.555308, -0.07330664, 0.03264253, 0.005,
0.2186579, -0.03109017, 0.1123729, 0.005,
0.2186579, -0.03109017, 0.1123729, 0.005,
0.2186579, -0.03109017, 0.1123729, 0.005,
0.04402262, 0.2448753, -0.2645065, 0.005,
0.05307777, 0.2502423, -0.2855891, 0.005,
0.1452575, -0.0896545, 0.1564226, 0.005,
0.1452575, -0.0896545, 0.1564226, 0.005,
0.2161769, -0.4647377, -0.2606334, 0.005,
0.2222582, -0.4852011, -0.249078, 0.005,
-0.1970799, 0.02173918, 0.009087994, 0.005,
0.1154988, -0.04097573, 0.1290421, 0.005,
0.180702, 0.03151379, 0.1770924, 0.005,
0.09663302, 0.2585279, -0.2144108, 0.005,
0.107769, 0.254357, -0.2121437, 0.005,
0.2269412, -0.4818051, -0.256795, 0.005,
0.02466204, 0.1449793, -0.2512235, 0.005,
0.1413791, 0.1104056, 0.08063722, 0.005,
0.1620984, 0.03440731, 0.045373, 0.005,
0.09817909, 0.1776701, -0.186195, 0.005,
0.1705859, 0.03861344, 0.1744282, 0.005,
0.215142, 0.03000751, 0.2216653, 0.005,
0.179477, 0.0559084, 0.3194889, 0.005,
0.1000817, 0.2193534, -0.2565003, 0.005,
0.1058397, -0.04383015, 0.1478094, 0.005,
0.1593608, 0.0241249, 0.2900822, 0.005,
0.09950665, 0.1953572, 0.008438553, 0.005,
-0.4360199, -0.04653849, 0.0009140288, 0.005,
0.1184653, -0.06203055, 0.1174636, 0.005,
0.08204045, -0.05068108, 0.09027346, 0.005,
0.1406396, 0.07756942, 0.1782628, 0.005,
0.1612462, -0.0128507, 0.240416, 0.005,
0.07441403, 0.2415291, -0.226539, 0.005,
0.1423575, -0.01375649, 0.2265176, 0.005,
-0.4456726, -0.001304573, -0.01191926, 0.005,
0.1887393, 0.03452845, 0.3098295, 0.005,
0.06916491, 0.1758049, 0.06875154, 0.005,
0.03620352, 0.1950191, -0.2535253, 0.005,
0.1048211, 0.2252992, -0.2481818, 0.005,
0.2215042, -0.5249488, -0.2761346, 0.005,
0.03562543, 0.2348728, -0.2834473, 0.005,
-0.3427945, 0.03200547, -0.02020698, 0.005,
0.2233785, -0.4013416, -0.1914707, 0.005,
0.1304344, 0.1489681, 0.06829953, 0.005,
0.157055, -0.06164595, -0.07096512, 0.005,
-0.05397905, 0.06990948, 0.05673898, 0.005,
0.01822749, 0.04478034, -0.1158222, 0.005,
0.1523536, -0.06991076, 0.08843495, 0.005,
0.1092516, -0.08527697, 0.1183885, 0.005,
0.05712347, 0.1198789, 0.06603935, 0.005
]);
var values15 = v;
var normLoc15 = gl.getAttribLocation(prog15, "aNorm");
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var normMatLoc15 = gl.getUniformLocation(prog15,"normMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testgl3vshader17" ));
gl.attachShader(prog17, getShader( gl, "testgl3fshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
""
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgl3textureCanvas"));
var v=new Float32Array([
-0.1641834, 0.398528, 0.4276108, 0, -0.5, 0.5, 0.5,
-0.1641834, 0.398528, 0.4276108, 1, -0.5, 0.5, 0.5,
-0.1641834, 0.398528, 0.4276108, 1, 1.5, 0.5, 0.5,
-0.1641834, 0.398528, 0.4276108, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** text object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testgl3vshader18" ));
gl.attachShader(prog18, getShader( gl, "testgl3fshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var texts = [
""
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX18 = texinfo.canvasX;
var canvasY18 = texinfo.canvasY;
var ofsLoc18 = gl.getAttribLocation(prog18, "aOfs");
var texture18 = gl.createTexture();
var texLoc18 = gl.getAttribLocation(prog18, "aTexcoord");
var sampler18 = gl.getUniformLocation(prog18,"uSampler");
handleLoadedTexture(texture18, document.getElementById("testgl3textureCanvas"));
var v=new Float32Array([
-0.1641834, -0.7263033, -0.441095, 0, -0.5, 0.5, 0.5,
-0.1641834, -0.7263033, -0.441095, 1, -0.5, 0.5, 0.5,
-0.1641834, -0.7263033, -0.441095, 1, 1.5, 0.5, 0.5,
-0.1641834, -0.7263033, -0.441095, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf18 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf18);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
var textScaleLoc18 = gl.getUniformLocation(prog18,"textScale");
// ****** text object 19 ******
var prog19  = gl.createProgram();
gl.attachShader(prog19, getShader( gl, "testgl3vshader19" ));
gl.attachShader(prog19, getShader( gl, "testgl3fshader19" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog19, 0, "aPos");
gl.bindAttribLocation(prog19, 1, "aCol");
gl.linkProgram(prog19);
var texts = [
""
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX19 = texinfo.canvasX;
var canvasY19 = texinfo.canvasY;
var ofsLoc19 = gl.getAttribLocation(prog19, "aOfs");
var texture19 = gl.createTexture();
var texLoc19 = gl.getAttribLocation(prog19, "aTexcoord");
var sampler19 = gl.getUniformLocation(prog19,"uSampler");
handleLoadedTexture(texture19, document.getElementById("testgl3textureCanvas"));
var v=new Float32Array([
-0.1641834, -0.6649489, -0.3937111, 0, -0.5, 0.5, 0.5,
-0.1641834, -0.6649489, -0.3937111, 1, -0.5, 0.5, 0.5,
-0.1641834, -0.6649489, -0.3937111, 1, 1.5, 0.5, 0.5,
-0.1641834, -0.6649489, -0.3937111, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf19 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf19);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf19 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf19);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc19 = gl.getUniformLocation(prog19,"mvMatrix");
var prMatLoc19 = gl.getUniformLocation(prog19,"prMatrix");
var textScaleLoc19 = gl.getUniformLocation(prog19,"textScale");
// ****** text object 20 ******
var prog20  = gl.createProgram();
gl.attachShader(prog20, getShader( gl, "testgl3vshader20" ));
gl.attachShader(prog20, getShader( gl, "testgl3fshader20" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog20, 0, "aPos");
gl.bindAttribLocation(prog20, 1, "aCol");
gl.linkProgram(prog20);
var texts = [
""
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX20 = texinfo.canvasX;
var canvasY20 = texinfo.canvasY;
var ofsLoc20 = gl.getAttribLocation(prog20, "aOfs");
var texture20 = gl.createTexture();
var texLoc20 = gl.getAttribLocation(prog20, "aTexcoord");
var sampler20 = gl.getUniformLocation(prog20,"uSampler");
handleLoadedTexture(texture20, document.getElementById("testgl3textureCanvas"));
var v=new Float32Array([
-0.6950888, -0.1332105, -0.3937111, 0, -0.5, 0.5, 0.5,
-0.6950888, -0.1332105, -0.3937111, 1, -0.5, 0.5, 0.5,
-0.6950888, -0.1332105, -0.3937111, 1, 1.5, 0.5, 0.5,
-0.6950888, -0.1332105, -0.3937111, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf20 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf20);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf20 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf20);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc20 = gl.getUniformLocation(prog20,"mvMatrix");
var prMatLoc20 = gl.getUniformLocation(prog20,"prMatrix");
var textScaleLoc20 = gl.getUniformLocation(prog20,"textScale");
// ****** text object 21 ******
var prog21  = gl.createProgram();
gl.attachShader(prog21, getShader( gl, "testgl3vshader21" ));
gl.attachShader(prog21, getShader( gl, "testgl3fshader21" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog21, 0, "aPos");
gl.bindAttribLocation(prog21, 1, "aCol");
gl.linkProgram(prog21);
var texts = [
""
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX21 = texinfo.canvasX;
var canvasY21 = texinfo.canvasY;
var ofsLoc21 = gl.getAttribLocation(prog21, "aOfs");
var texture21 = gl.createTexture();
var texLoc21 = gl.getAttribLocation(prog21, "aTexcoord");
var sampler21 = gl.getUniformLocation(prog21,"uSampler");
handleLoadedTexture(texture21, document.getElementById("testgl3textureCanvas"));
var v=new Float32Array([
-0.6950888, -0.6649489, 0.01694989, 0, -0.5, 0.5, 0.5,
-0.6950888, -0.6649489, 0.01694989, 1, -0.5, 0.5, 0.5,
-0.6950888, -0.6649489, 0.01694989, 1, 1.5, 0.5, 0.5,
-0.6950888, -0.6649489, 0.01694989, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf21 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf21);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf21 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf21);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc21 = gl.getUniformLocation(prog21,"mvMatrix");
var prMatLoc21 = gl.getUniformLocation(prog21,"prMatrix");
var textScaleLoc21 = gl.getUniformLocation(prog21,"textScale");
// ****** lines object 30 ******
var prog30  = gl.createProgram();
gl.attachShader(prog30, getShader( gl, "testgl3vshader30" ));
gl.attachShader(prog30, getShader( gl, "testgl3fshader30" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog30, 0, "aPos");
gl.bindAttribLocation(prog30, 1, "aCol");
gl.linkProgram(prog30);
var v=new Float32Array([
-0.4, -0.54224, -0.2989432,
0.2, -0.54224, -0.2989432,
-0.4, -0.54224, -0.2989432,
-0.4, -0.5626915, -0.3147378,
-0.2, -0.54224, -0.2989432,
-0.2, -0.5626915, -0.3147378,
0, -0.54224, -0.2989432,
0, -0.5626915, -0.3147378,
0.2, -0.54224, -0.2989432,
0.2, -0.5626915, -0.3147378
]);
var buf30 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf30);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc30 = gl.getUniformLocation(prog30,"mvMatrix");
var prMatLoc30 = gl.getUniformLocation(prog30,"prMatrix");
// ****** text object 31 ******
var prog31  = gl.createProgram();
gl.attachShader(prog31, getShader( gl, "testgl3vshader31" ));
gl.attachShader(prog31, getShader( gl, "testgl3fshader31" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog31, 0, "aPos");
gl.bindAttribLocation(prog31, 1, "aCol");
gl.linkProgram(prog31);
var texts = [
"-0.4",
"-0.2",
"0",
"0.2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX31 = texinfo.canvasX;
var canvasY31 = texinfo.canvasY;
var ofsLoc31 = gl.getAttribLocation(prog31, "aOfs");
var texture31 = gl.createTexture();
var texLoc31 = gl.getAttribLocation(prog31, "aTexcoord");
var sampler31 = gl.getUniformLocation(prog31,"uSampler");
handleLoadedTexture(texture31, document.getElementById("testgl3textureCanvas"));
var v=new Float32Array([
-0.4, -0.6035945, -0.3463271, 0, -0.5, 0.5, 0.5,
-0.4, -0.6035945, -0.3463271, 1, -0.5, 0.5, 0.5,
-0.4, -0.6035945, -0.3463271, 1, 1.5, 0.5, 0.5,
-0.4, -0.6035945, -0.3463271, 0, 1.5, 0.5, 0.5,
-0.2, -0.6035945, -0.3463271, 0, -0.5, 0.5, 0.5,
-0.2, -0.6035945, -0.3463271, 1, -0.5, 0.5, 0.5,
-0.2, -0.6035945, -0.3463271, 1, 1.5, 0.5, 0.5,
-0.2, -0.6035945, -0.3463271, 0, 1.5, 0.5, 0.5,
0, -0.6035945, -0.3463271, 0, -0.5, 0.5, 0.5,
0, -0.6035945, -0.3463271, 1, -0.5, 0.5, 0.5,
0, -0.6035945, -0.3463271, 1, 1.5, 0.5, 0.5,
0, -0.6035945, -0.3463271, 0, 1.5, 0.5, 0.5,
0.2, -0.6035945, -0.3463271, 0, -0.5, 0.5, 0.5,
0.2, -0.6035945, -0.3463271, 1, -0.5, 0.5, 0.5,
0.2, -0.6035945, -0.3463271, 1, 1.5, 0.5, 0.5,
0.2, -0.6035945, -0.3463271, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15
]);
var buf31 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf31);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf31 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf31);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc31 = gl.getUniformLocation(prog31,"mvMatrix");
var prMatLoc31 = gl.getUniformLocation(prog31,"prMatrix");
var textScaleLoc31 = gl.getUniformLocation(prog31,"textScale");
// ****** lines object 32 ******
var prog32  = gl.createProgram();
gl.attachShader(prog32, getShader( gl, "testgl3vshader32" ));
gl.attachShader(prog32, getShader( gl, "testgl3fshader32" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog32, 0, "aPos");
gl.bindAttribLocation(prog32, 1, "aCol");
gl.linkProgram(prog32);
var v=new Float32Array([
-0.5725722, -0.4, -0.2989432,
-0.5725722, 0.2, -0.2989432,
-0.5725722, -0.4, -0.2989432,
-0.5929916, -0.4, -0.3147378,
-0.5725722, -0.2, -0.2989432,
-0.5929916, -0.2, -0.3147378,
-0.5725722, 0, -0.2989432,
-0.5929916, 0, -0.3147378,
-0.5725722, 0.2, -0.2989432,
-0.5929916, 0.2, -0.3147378
]);
var buf32 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf32);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc32 = gl.getUniformLocation(prog32,"mvMatrix");
var prMatLoc32 = gl.getUniformLocation(prog32,"prMatrix");
// ****** text object 33 ******
var prog33  = gl.createProgram();
gl.attachShader(prog33, getShader( gl, "testgl3vshader33" ));
gl.attachShader(prog33, getShader( gl, "testgl3fshader33" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog33, 0, "aPos");
gl.bindAttribLocation(prog33, 1, "aCol");
gl.linkProgram(prog33);
var texts = [
"-0.4",
"-0.2",
"0",
"0.2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX33 = texinfo.canvasX;
var canvasY33 = texinfo.canvasY;
var ofsLoc33 = gl.getAttribLocation(prog33, "aOfs");
var texture33 = gl.createTexture();
var texLoc33 = gl.getAttribLocation(prog33, "aTexcoord");
var sampler33 = gl.getUniformLocation(prog33,"uSampler");
handleLoadedTexture(texture33, document.getElementById("testgl3textureCanvas"));
var v=new Float32Array([
-0.6338305, -0.4, -0.3463271, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.4, -0.3463271, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.4, -0.3463271, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.4, -0.3463271, 0, 1.5, 0.5, 0.5,
-0.6338305, -0.2, -0.3463271, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.2, -0.3463271, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.2, -0.3463271, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.2, -0.3463271, 0, 1.5, 0.5, 0.5,
-0.6338305, 0, -0.3463271, 0, -0.5, 0.5, 0.5,
-0.6338305, 0, -0.3463271, 1, -0.5, 0.5, 0.5,
-0.6338305, 0, -0.3463271, 1, 1.5, 0.5, 0.5,
-0.6338305, 0, -0.3463271, 0, 1.5, 0.5, 0.5,
-0.6338305, 0.2, -0.3463271, 0, -0.5, 0.5, 0.5,
-0.6338305, 0.2, -0.3463271, 1, -0.5, 0.5, 0.5,
-0.6338305, 0.2, -0.3463271, 1, 1.5, 0.5, 0.5,
-0.6338305, 0.2, -0.3463271, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15
]);
var buf33 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf33);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf33 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf33);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc33 = gl.getUniformLocation(prog33,"mvMatrix");
var prMatLoc33 = gl.getUniformLocation(prog33,"prMatrix");
var textScaleLoc33 = gl.getUniformLocation(prog33,"textScale");
// ****** lines object 34 ******
var prog34  = gl.createProgram();
gl.attachShader(prog34, getShader( gl, "testgl3vshader34" ));
gl.attachShader(prog34, getShader( gl, "testgl3fshader34" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog34, 0, "aPos");
gl.bindAttribLocation(prog34, 1, "aCol");
gl.linkProgram(prog34);
var v=new Float32Array([
-0.5725722, -0.54224, -0.2,
-0.5725722, -0.54224, 0.3,
-0.5725722, -0.54224, -0.2,
-0.5929916, -0.5626915, -0.2,
-0.5725722, -0.54224, -0.1,
-0.5929916, -0.5626915, -0.1,
-0.5725722, -0.54224, 0,
-0.5929916, -0.5626915, 0,
-0.5725722, -0.54224, 0.1,
-0.5929916, -0.5626915, 0.1,
-0.5725722, -0.54224, 0.2,
-0.5929916, -0.5626915, 0.2,
-0.5725722, -0.54224, 0.3,
-0.5929916, -0.5626915, 0.3
]);
var buf34 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf34);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc34 = gl.getUniformLocation(prog34,"mvMatrix");
var prMatLoc34 = gl.getUniformLocation(prog34,"prMatrix");
// ****** text object 35 ******
var prog35  = gl.createProgram();
gl.attachShader(prog35, getShader( gl, "testgl3vshader35" ));
gl.attachShader(prog35, getShader( gl, "testgl3fshader35" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog35, 0, "aPos");
gl.bindAttribLocation(prog35, 1, "aCol");
gl.linkProgram(prog35);
var texts = [
"-0.2",
"-0.1",
"0",
"0.1",
"0.2",
"0.3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX35 = texinfo.canvasX;
var canvasY35 = texinfo.canvasY;
var ofsLoc35 = gl.getAttribLocation(prog35, "aOfs");
var texture35 = gl.createTexture();
var texLoc35 = gl.getAttribLocation(prog35, "aTexcoord");
var sampler35 = gl.getUniformLocation(prog35,"uSampler");
handleLoadedTexture(texture35, document.getElementById("testgl3textureCanvas"));
var v=new Float32Array([
-0.6338305, -0.6035945, -0.2, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.2, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.2, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.2, 0, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.1, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.1, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.1, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, -0.1, 0, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0, 0, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.1, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.1, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.1, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.1, 0, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.2, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.2, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.2, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.2, 0, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.3, 0, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.3, 1, -0.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.3, 1, 1.5, 0.5, 0.5,
-0.6338305, -0.6035945, 0.3, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
var ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf35 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf35);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf35 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf35);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc35 = gl.getUniformLocation(prog35,"mvMatrix");
var prMatLoc35 = gl.getUniformLocation(prog35,"prMatrix");
var textScaleLoc35 = gl.getUniformLocation(prog35,"textScale");
// ****** lines object 36 ******
var prog36  = gl.createProgram();
gl.attachShader(prog36, getShader( gl, "testgl3vshader36" ));
gl.attachShader(prog36, getShader( gl, "testgl3fshader36" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog36, 0, "aPos");
gl.bindAttribLocation(prog36, 1, "aCol");
gl.linkProgram(prog36);
var v=new Float32Array([
-0.5725722, -0.54224, -0.2989432,
-0.5725722, 0.2758191, -0.2989432,
-0.5725722, -0.54224, 0.3328429,
-0.5725722, 0.2758191, 0.3328429,
-0.5725722, -0.54224, -0.2989432,
-0.5725722, -0.54224, 0.3328429,
-0.5725722, 0.2758191, -0.2989432,
-0.5725722, 0.2758191, 0.3328429,
-0.5725722, -0.54224, -0.2989432,
0.2442054, -0.54224, -0.2989432,
-0.5725722, -0.54224, 0.3328429,
0.2442054, -0.54224, 0.3328429,
-0.5725722, 0.2758191, -0.2989432,
0.2442054, 0.2758191, -0.2989432,
-0.5725722, 0.2758191, 0.3328429,
0.2442054, 0.2758191, 0.3328429,
0.2442054, -0.54224, -0.2989432,
0.2442054, 0.2758191, -0.2989432,
0.2442054, -0.54224, 0.3328429,
0.2442054, 0.2758191, 0.3328429,
0.2442054, -0.54224, -0.2989432,
0.2442054, -0.54224, 0.3328429,
0.2442054, 0.2758191, -0.2989432,
0.2442054, 0.2758191, 0.3328429
]);
var buf36 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf36);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc36 = gl.getUniformLocation(prog36,"mvMatrix");
var prMatLoc36 = gl.getUniformLocation(prog36,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = 0, yOffs = 0, drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 8 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 0.7034574;
var distance = 1.620084;
var t = tan(fov[8]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[8], hlen*aspect*zoom[8], 
-hlen*zoom[8], hlen*zoom[8], near, far);
else  
prMatrix.frustum(-hlen*zoom[8], hlen*zoom[8], 
-hlen*zoom[8]/aspect, hlen*zoom[8]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.1641834, 0.1332105, -0.01694989 );
mvMatrix.scale( 0.9312105, 0.9297517, 1.203876 );   
mvMatrix.multRight( userMatrix[8] );
mvMatrix.translate(-0, -0, -1.620084);
normMatrix.makeIdentity();
normMatrix.scale( 1.073871, 1.075556, 0.8306506 );   
normMatrix.multRight( userMatrix[8] );
// ****** spheres object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc15, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc15 );
gl.vertexAttribPointer(normLoc15,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(0.9312105, 0.9297517, 1.203876);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc15, false, new Float32Array(sphereNorm.getAsArray()) );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1);
for (var i = 0; i < 57; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*4
var ofs = baseofs + 3;	       
var scale = values15[ofs];
sphereMV.scale(1.073871*scale, 1.075556*scale, 0.8306506*scale);
sphereMV.translate(values15[baseofs], 
values15[baseofs+1], 
values15[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(sphereMV.getAsArray()) );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc18, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc18 );
gl.vertexAttribPointer(texLoc18, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture18);
gl.uniform1i( sampler18, 0);
gl.enableVertexAttribArray( ofsLoc18 );
gl.vertexAttribPointer(ofsLoc18, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 19 *******
gl.useProgram(prog19);
gl.bindBuffer(gl.ARRAY_BUFFER, buf19);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf19);
gl.uniformMatrix4fv( prMatLoc19, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc19, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc19, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc19 );
gl.vertexAttribPointer(texLoc19, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture19);
gl.uniform1i( sampler19, 0);
gl.enableVertexAttribArray( ofsLoc19 );
gl.vertexAttribPointer(ofsLoc19, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 20 *******
gl.useProgram(prog20);
gl.bindBuffer(gl.ARRAY_BUFFER, buf20);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf20);
gl.uniformMatrix4fv( prMatLoc20, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc20, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc20, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc20 );
gl.vertexAttribPointer(texLoc20, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture20);
gl.uniform1i( sampler20, 0);
gl.enableVertexAttribArray( ofsLoc20 );
gl.vertexAttribPointer(ofsLoc20, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 21 *******
gl.useProgram(prog21);
gl.bindBuffer(gl.ARRAY_BUFFER, buf21);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf21);
gl.uniformMatrix4fv( prMatLoc21, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc21, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc21, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc21 );
gl.vertexAttribPointer(texLoc21, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture21);
gl.uniform1i( sampler21, 0);
gl.enableVertexAttribArray( ofsLoc21 );
gl.vertexAttribPointer(ofsLoc21, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 30 *******
gl.useProgram(prog30);
gl.bindBuffer(gl.ARRAY_BUFFER, buf30);
gl.uniformMatrix4fv( prMatLoc30, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc30, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 10);
// ****** text object 31 *******
gl.useProgram(prog31);
gl.bindBuffer(gl.ARRAY_BUFFER, buf31);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf31);
gl.uniformMatrix4fv( prMatLoc31, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc31, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc31, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc31 );
gl.vertexAttribPointer(texLoc31, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture31);
gl.uniform1i( sampler31, 0);
gl.enableVertexAttribArray( ofsLoc31 );
gl.vertexAttribPointer(ofsLoc31, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
// ****** lines object 32 *******
gl.useProgram(prog32);
gl.bindBuffer(gl.ARRAY_BUFFER, buf32);
gl.uniformMatrix4fv( prMatLoc32, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc32, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 10);
// ****** text object 33 *******
gl.useProgram(prog33);
gl.bindBuffer(gl.ARRAY_BUFFER, buf33);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf33);
gl.uniformMatrix4fv( prMatLoc33, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc33, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc33, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc33 );
gl.vertexAttribPointer(texLoc33, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture33);
gl.uniform1i( sampler33, 0);
gl.enableVertexAttribArray( ofsLoc33 );
gl.vertexAttribPointer(ofsLoc33, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
// ****** lines object 34 *******
gl.useProgram(prog34);
gl.bindBuffer(gl.ARRAY_BUFFER, buf34);
gl.uniformMatrix4fv( prMatLoc34, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc34, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 35 *******
gl.useProgram(prog35);
gl.bindBuffer(gl.ARRAY_BUFFER, buf35);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf35);
gl.uniformMatrix4fv( prMatLoc35, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc35, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc35, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc35 );
gl.vertexAttribPointer(texLoc35, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture35);
gl.uniform1i( sampler35, 0);
gl.enableVertexAttribArray( ofsLoc35 );
gl.vertexAttribPointer(ofsLoc35, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 36 *******
gl.useProgram(prog36);
gl.bindBuffer(gl.ARRAY_BUFFER, buf36);
gl.uniformMatrix4fv( prMatLoc36, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc36, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
8: 0
};
var vpy0 = {
8: 0
};
var vpWidths = {
8: 504
};
var vpHeights = {
8: 504
};
var activeModel = {
8: 8
};
var activeProjection = {
8: 8
};
var listeners = {
8: [ 8 ]
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(8);
return(8);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
var l = listeners[activeModel[activeSubscene]];
saveMat = new Object();
for (var i = 0; i < l.length; i++) 
saveMat[l[i]] = new CanvasMatrix4(userMatrix[l[i]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
var l = listeners[activeModel[activeSubscene]];
for (i = 0; i < l.length; i++) {
userMatrix[l[i]].load(saveMat[l[i]]);
userMatrix[l[i]].rotate(angle, axis[0], axis[1], axis[2]);
}
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
fov0 = fov[l[i]];
}
var fovmove = function(x, y) {
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
fov[l[i]] = max(1, min(179, fov0[l[i]] + 180*(y-y0fov)/height));
drawScene();
}
var y0zoom = 0;
var zoom0 = 0;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = new Object();
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
zoom0[l[i]] = log(zoom[l[i]]);
}
var zoommove = function(x, y) {
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
zoom[l[i]] = exp(zoom0[l[i]] + (y-y0zoom)/height);
drawScene();
}
var mousedown = [trackballdown, fovdown, zoomdown];
var mousemove = [trackballmove, fovmove, zoommove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
currentElement = currentElement.offsetParent;
}
while(currentElement)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
l = listeners[activeProjection[activeSubscene]];
for (i = 0; i < l.length; i++)
zoom[l[i]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl3canvas" width="1" height="1"></canvas> 
<p id="testgl3debug">
You must enable Javascript to view this page properly.</p>
<script>testgl3webGLStart();</script>

		
