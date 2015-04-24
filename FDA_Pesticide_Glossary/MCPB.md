---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
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
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
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
<script id="testglfshader9" type="x-shader/x-fragment"> 
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
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
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
<script id="testglfshader10" type="x-shader/x-fragment"> 
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
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
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
<script id="testglfshader11" type="x-shader/x-fragment"> 
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
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
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
<script id="testglfshader12" type="x-shader/x-fragment"> 
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
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
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
<script id="testglfshader13" type="x-shader/x-fragment"> 
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
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
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
<script id="testglfshader14" type="x-shader/x-fragment"> 
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
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
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
<script id="testglfshader15" type="x-shader/x-fragment"> 
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
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
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
<script id="testglfshader16" type="x-shader/x-fragment"> 
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
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
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
<script id="testglfshader17" type="x-shader/x-fragment"> 
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
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
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
<script id="testglfshader18" type="x-shader/x-fragment"> 
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
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
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
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
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
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.34995, 0.2086673, -0.8408695, 1, 0, 0, 1,
-3.305727, -0.8407984, -1.239899, 1, 0.007843138, 0, 1,
-3.118083, 0.3588333, -2.644113, 1, 0.01176471, 0, 1,
-3.032138, 1.13518, -1.95841, 1, 0.01960784, 0, 1,
-2.973123, -1.012987, -1.839285, 1, 0.02352941, 0, 1,
-2.627686, 0.642517, -0.9628598, 1, 0.03137255, 0, 1,
-2.565013, -0.6636794, -1.391437, 1, 0.03529412, 0, 1,
-2.538369, 1.455629, -1.9267, 1, 0.04313726, 0, 1,
-2.537933, 1.396795, -0.2363076, 1, 0.04705882, 0, 1,
-2.319854, 0.2723181, -2.223968, 1, 0.05490196, 0, 1,
-2.295781, 1.740449, -0.5712014, 1, 0.05882353, 0, 1,
-2.26346, -1.212023, -0.3712511, 1, 0.06666667, 0, 1,
-2.215858, -0.05124819, -1.853641, 1, 0.07058824, 0, 1,
-2.187286, 0.533509, -0.3101589, 1, 0.07843138, 0, 1,
-2.137496, -0.865155, -2.207754, 1, 0.08235294, 0, 1,
-2.133696, -0.4048615, -2.91208, 1, 0.09019608, 0, 1,
-2.133034, -1.082713, -3.129375, 1, 0.09411765, 0, 1,
-2.003308, -1.218941, -2.238581, 1, 0.1019608, 0, 1,
-1.971971, 0.4305591, -1.336591, 1, 0.1098039, 0, 1,
-1.960019, 1.820054, -0.6518856, 1, 0.1137255, 0, 1,
-1.958272, -1.55294, -2.092009, 1, 0.1215686, 0, 1,
-1.933239, 0.121866, -4.599046, 1, 0.1254902, 0, 1,
-1.929593, -0.9483712, -1.737997, 1, 0.1333333, 0, 1,
-1.916131, -0.5315919, 0.8319149, 1, 0.1372549, 0, 1,
-1.91528, 1.247546, -1.981743, 1, 0.145098, 0, 1,
-1.906758, 0.7505059, 0.9576623, 1, 0.1490196, 0, 1,
-1.905317, -1.253919, -0.6201607, 1, 0.1568628, 0, 1,
-1.89865, 0.01147784, -1.041108, 1, 0.1607843, 0, 1,
-1.881544, -0.3877042, -3.881361, 1, 0.1686275, 0, 1,
-1.859358, -1.957446, -1.500348, 1, 0.172549, 0, 1,
-1.851725, -0.9825773, -2.766506, 1, 0.1803922, 0, 1,
-1.774909, 1.051635, -0.6747488, 1, 0.1843137, 0, 1,
-1.76432, 0.6621583, 0.5937924, 1, 0.1921569, 0, 1,
-1.737284, -0.2562577, -1.985162, 1, 0.1960784, 0, 1,
-1.73037, -0.6526586, -1.95395, 1, 0.2039216, 0, 1,
-1.72689, 1.409657, -1.243413, 1, 0.2117647, 0, 1,
-1.722258, 0.03684454, -2.997118, 1, 0.2156863, 0, 1,
-1.719901, 1.76832, 0.8776047, 1, 0.2235294, 0, 1,
-1.685117, 0.407412, 0.7264751, 1, 0.227451, 0, 1,
-1.675787, -0.6124381, -2.189841, 1, 0.2352941, 0, 1,
-1.672078, 0.2276089, -1.950961, 1, 0.2392157, 0, 1,
-1.66256, 0.1676233, 0.06176171, 1, 0.2470588, 0, 1,
-1.655319, 0.4662359, -1.296602, 1, 0.2509804, 0, 1,
-1.652382, 2.277151, -1.496193, 1, 0.2588235, 0, 1,
-1.651256, 0.3331828, -0.1286703, 1, 0.2627451, 0, 1,
-1.609094, -0.002912322, -3.500742, 1, 0.2705882, 0, 1,
-1.571929, -1.461144, -1.903461, 1, 0.2745098, 0, 1,
-1.57186, 1.408175, -0.820341, 1, 0.282353, 0, 1,
-1.559042, 0.7465083, -0.8091326, 1, 0.2862745, 0, 1,
-1.558096, 1.735468, -0.7312439, 1, 0.2941177, 0, 1,
-1.542161, 0.1053955, -2.766957, 1, 0.3019608, 0, 1,
-1.535407, -0.8019869, -0.7212418, 1, 0.3058824, 0, 1,
-1.528602, 1.600705, 1.886151, 1, 0.3137255, 0, 1,
-1.517713, -0.07151997, -2.264596, 1, 0.3176471, 0, 1,
-1.492726, -0.5888397, -2.134137, 1, 0.3254902, 0, 1,
-1.491743, 1.71396, -2.649745, 1, 0.3294118, 0, 1,
-1.476739, 0.1170471, -0.9838379, 1, 0.3372549, 0, 1,
-1.471451, 0.06535696, -2.994826, 1, 0.3411765, 0, 1,
-1.467703, 0.8063285, -2.14613, 1, 0.3490196, 0, 1,
-1.463699, 1.980411, -0.343607, 1, 0.3529412, 0, 1,
-1.4598, -0.6266516, -1.630788, 1, 0.3607843, 0, 1,
-1.438751, 0.6309875, -2.563568, 1, 0.3647059, 0, 1,
-1.436824, -0.5765774, -1.338776, 1, 0.372549, 0, 1,
-1.410066, -0.1988351, -2.346783, 1, 0.3764706, 0, 1,
-1.40283, 0.3975621, 0.2832794, 1, 0.3843137, 0, 1,
-1.401692, 0.6431375, -1.429769, 1, 0.3882353, 0, 1,
-1.390133, 0.1708321, -2.165961, 1, 0.3960784, 0, 1,
-1.3849, -0.3785697, -1.760701, 1, 0.4039216, 0, 1,
-1.368074, -0.5974668, -2.264745, 1, 0.4078431, 0, 1,
-1.365977, -1.563183, -2.207525, 1, 0.4156863, 0, 1,
-1.35913, -0.9786497, -1.48582, 1, 0.4196078, 0, 1,
-1.35876, 1.005587, 0.4021606, 1, 0.427451, 0, 1,
-1.356311, 1.588992, 0.03852959, 1, 0.4313726, 0, 1,
-1.356227, -0.3130696, -1.336117, 1, 0.4392157, 0, 1,
-1.347862, 0.6254174, 0.7447725, 1, 0.4431373, 0, 1,
-1.339768, 1.319873, -0.9809411, 1, 0.4509804, 0, 1,
-1.339624, -1.753847, -0.0944623, 1, 0.454902, 0, 1,
-1.33927, -0.9241263, -0.251372, 1, 0.4627451, 0, 1,
-1.335362, 0.222656, -2.212931, 1, 0.4666667, 0, 1,
-1.33438, 2.440621, -1.104081, 1, 0.4745098, 0, 1,
-1.332823, 1.997721, -1.051262, 1, 0.4784314, 0, 1,
-1.3328, -1.598871, -0.4107466, 1, 0.4862745, 0, 1,
-1.330444, 0.4869952, 0.1436257, 1, 0.4901961, 0, 1,
-1.328048, -1.424103, -2.725955, 1, 0.4980392, 0, 1,
-1.323764, 1.390524, 0.4235162, 1, 0.5058824, 0, 1,
-1.31571, 1.647474, -0.4502891, 1, 0.509804, 0, 1,
-1.314024, 0.9912757, -1.883654, 1, 0.5176471, 0, 1,
-1.313776, -1.392143, -2.196013, 1, 0.5215687, 0, 1,
-1.307405, -0.531225, -0.9508272, 1, 0.5294118, 0, 1,
-1.301682, 0.009134949, -2.881196, 1, 0.5333334, 0, 1,
-1.299891, -1.155556, -2.967824, 1, 0.5411765, 0, 1,
-1.290932, -1.243312, -2.619625, 1, 0.5450981, 0, 1,
-1.287574, -0.8932974, -3.078543, 1, 0.5529412, 0, 1,
-1.282453, -0.2077048, -1.187909, 1, 0.5568628, 0, 1,
-1.276626, -0.1608196, -2.215001, 1, 0.5647059, 0, 1,
-1.265051, 2.062102, 0.1003342, 1, 0.5686275, 0, 1,
-1.263864, 2.066883, -2.802838, 1, 0.5764706, 0, 1,
-1.263679, -0.1989133, -2.294762, 1, 0.5803922, 0, 1,
-1.259875, 0.8386576, -1.618683, 1, 0.5882353, 0, 1,
-1.255618, -0.4449147, -3.210249, 1, 0.5921569, 0, 1,
-1.238984, -0.5177795, -2.116812, 1, 0.6, 0, 1,
-1.222771, -0.6219435, -2.292128, 1, 0.6078432, 0, 1,
-1.221581, -0.9758604, -1.740439, 1, 0.6117647, 0, 1,
-1.213652, 0.3848329, -3.172647, 1, 0.6196079, 0, 1,
-1.212544, -1.722852, -3.338933, 1, 0.6235294, 0, 1,
-1.210658, 2.509492, -1.583325, 1, 0.6313726, 0, 1,
-1.209921, -0.4171484, -2.223661, 1, 0.6352941, 0, 1,
-1.207688, 0.11637, 1.114198, 1, 0.6431373, 0, 1,
-1.205534, -1.143532, -1.711646, 1, 0.6470588, 0, 1,
-1.200358, 0.2797343, -1.59615, 1, 0.654902, 0, 1,
-1.200137, 2.95861, -1.459537, 1, 0.6588235, 0, 1,
-1.188086, 0.1741788, -0.7068619, 1, 0.6666667, 0, 1,
-1.183408, 0.9373873, 1.880454, 1, 0.6705883, 0, 1,
-1.180003, -1.356127, -3.286147, 1, 0.6784314, 0, 1,
-1.17222, 1.632395, 1.119605, 1, 0.682353, 0, 1,
-1.169245, -1.263259, -0.927026, 1, 0.6901961, 0, 1,
-1.154176, 0.2776348, -2.407868, 1, 0.6941177, 0, 1,
-1.152434, 0.2967885, -2.800755, 1, 0.7019608, 0, 1,
-1.148186, -0.8109699, -0.4984853, 1, 0.7098039, 0, 1,
-1.140895, -0.4992721, -2.670314, 1, 0.7137255, 0, 1,
-1.139641, 1.318853, 0.135665, 1, 0.7215686, 0, 1,
-1.134202, 1.126953, 0.565271, 1, 0.7254902, 0, 1,
-1.131247, 1.446334, -1.76999, 1, 0.7333333, 0, 1,
-1.129076, 0.1069137, -1.564496, 1, 0.7372549, 0, 1,
-1.124509, -0.1283785, -0.8047992, 1, 0.7450981, 0, 1,
-1.113564, 1.119744, -0.7160953, 1, 0.7490196, 0, 1,
-1.112661, -0.5383573, -1.912069, 1, 0.7568628, 0, 1,
-1.111729, -0.09038465, -1.990781, 1, 0.7607843, 0, 1,
-1.110874, -0.9053815, -0.2189932, 1, 0.7686275, 0, 1,
-1.109527, 1.180379, -1.25974, 1, 0.772549, 0, 1,
-1.103855, -0.9252517, -1.844716, 1, 0.7803922, 0, 1,
-1.103823, -0.006590456, -1.771859, 1, 0.7843137, 0, 1,
-1.103526, -0.4080012, -2.362233, 1, 0.7921569, 0, 1,
-1.098591, -0.9280002, -3.363603, 1, 0.7960784, 0, 1,
-1.098302, -1.192966, -3.992746, 1, 0.8039216, 0, 1,
-1.097872, 0.4292779, -1.659969, 1, 0.8117647, 0, 1,
-1.093745, -1.69166, -4.341711, 1, 0.8156863, 0, 1,
-1.091995, 0.5136226, -1.987449, 1, 0.8235294, 0, 1,
-1.090795, -0.805132, -1.53212, 1, 0.827451, 0, 1,
-1.087667, 0.06396002, -0.8692409, 1, 0.8352941, 0, 1,
-1.081212, -1.087601, -2.928075, 1, 0.8392157, 0, 1,
-1.080524, -0.849094, -3.176543, 1, 0.8470588, 0, 1,
-1.075126, -1.120947, -3.763592, 1, 0.8509804, 0, 1,
-1.07212, 0.1566455, -1.81003, 1, 0.8588235, 0, 1,
-1.064265, 0.5327872, -1.207289, 1, 0.8627451, 0, 1,
-1.055147, 0.4216757, -0.4302117, 1, 0.8705882, 0, 1,
-1.049504, -1.126674, -1.389007, 1, 0.8745098, 0, 1,
-1.048953, -0.7264854, -1.201635, 1, 0.8823529, 0, 1,
-1.045816, -1.030398, -2.36859, 1, 0.8862745, 0, 1,
-1.04541, 0.3020205, -2.110111, 1, 0.8941177, 0, 1,
-1.038045, -0.08244482, -2.924514, 1, 0.8980392, 0, 1,
-1.033009, 1.76248, 0.6558174, 1, 0.9058824, 0, 1,
-1.03212, 1.224096, -1.860679, 1, 0.9137255, 0, 1,
-1.019046, -0.7900525, -4.365033, 1, 0.9176471, 0, 1,
-1.017392, -0.5207793, -2.842135, 1, 0.9254902, 0, 1,
-1.013585, 0.07932188, -1.111608, 1, 0.9294118, 0, 1,
-1.011901, 0.04551247, -2.985233, 1, 0.9372549, 0, 1,
-1.005319, 0.40034, -0.1836471, 1, 0.9411765, 0, 1,
-1.004345, -0.6060694, -0.2857961, 1, 0.9490196, 0, 1,
-0.9961213, -0.01136582, -3.31187, 1, 0.9529412, 0, 1,
-0.9960157, 1.249202, -0.6751734, 1, 0.9607843, 0, 1,
-0.9920388, 0.9899887, -0.784586, 1, 0.9647059, 0, 1,
-0.9831371, -0.9455776, -2.050408, 1, 0.972549, 0, 1,
-0.9768627, -1.388635, -2.624797, 1, 0.9764706, 0, 1,
-0.9618437, 0.3870106, 0.9184891, 1, 0.9843137, 0, 1,
-0.9570363, 0.09087984, -1.958815, 1, 0.9882353, 0, 1,
-0.9561096, -0.7802387, -3.400724, 1, 0.9960784, 0, 1,
-0.9550582, 0.07584648, -1.222231, 0.9960784, 1, 0, 1,
-0.9538884, 1.215055, -2.283192, 0.9921569, 1, 0, 1,
-0.9478936, -0.6465745, -0.5350955, 0.9843137, 1, 0, 1,
-0.9464729, 1.327164, -0.8567966, 0.9803922, 1, 0, 1,
-0.9458105, -0.163295, -1.963831, 0.972549, 1, 0, 1,
-0.9445534, -0.001319585, -2.005883, 0.9686275, 1, 0, 1,
-0.9419407, -1.747865, -3.13567, 0.9607843, 1, 0, 1,
-0.9410098, 0.5918255, -1.553917, 0.9568627, 1, 0, 1,
-0.9306717, 0.393127, 0.4649886, 0.9490196, 1, 0, 1,
-0.9304485, 0.3808748, -2.056695, 0.945098, 1, 0, 1,
-0.9251169, 0.2614796, -0.8142932, 0.9372549, 1, 0, 1,
-0.9223847, 1.382731, -2.140491, 0.9333333, 1, 0, 1,
-0.9205386, 1.759421, -1.755689, 0.9254902, 1, 0, 1,
-0.9199654, -0.06200776, -1.475232, 0.9215686, 1, 0, 1,
-0.9155374, 1.026794, -0.6627722, 0.9137255, 1, 0, 1,
-0.9149445, -0.03056535, -2.486681, 0.9098039, 1, 0, 1,
-0.9142983, -2.930931, -1.965482, 0.9019608, 1, 0, 1,
-0.9042735, 1.00086, 1.115741, 0.8941177, 1, 0, 1,
-0.9025297, 3.461058, 0.2059026, 0.8901961, 1, 0, 1,
-0.9002275, -1.706034, -2.922361, 0.8823529, 1, 0, 1,
-0.8980101, 0.5855935, -0.4282799, 0.8784314, 1, 0, 1,
-0.8965815, -2.71849, -1.761575, 0.8705882, 1, 0, 1,
-0.8962345, -0.2411279, -1.482197, 0.8666667, 1, 0, 1,
-0.8962013, -0.1613461, -2.622034, 0.8588235, 1, 0, 1,
-0.8849082, 1.371831, 0.3422511, 0.854902, 1, 0, 1,
-0.8845131, 2.184654, -2.268418, 0.8470588, 1, 0, 1,
-0.8696737, 1.267643, -1.500301, 0.8431373, 1, 0, 1,
-0.8655072, 0.341206, -0.9592558, 0.8352941, 1, 0, 1,
-0.8640721, 2.025208, 1.703129, 0.8313726, 1, 0, 1,
-0.8597127, 0.5507131, 0.3940663, 0.8235294, 1, 0, 1,
-0.8586191, -0.103878, -1.849011, 0.8196079, 1, 0, 1,
-0.8556464, -2.317071, -1.973149, 0.8117647, 1, 0, 1,
-0.8474652, 0.2870145, -0.4091064, 0.8078431, 1, 0, 1,
-0.8429329, 0.3867282, -2.121514, 0.8, 1, 0, 1,
-0.8428955, 0.0802334, -1.394615, 0.7921569, 1, 0, 1,
-0.8367946, -0.1738676, -1.902005, 0.7882353, 1, 0, 1,
-0.8234107, 1.474665, -0.9288223, 0.7803922, 1, 0, 1,
-0.8219758, 0.9042847, -2.734686, 0.7764706, 1, 0, 1,
-0.8211084, 0.6551876, -2.03653, 0.7686275, 1, 0, 1,
-0.8201634, -1.456454, -3.452737, 0.7647059, 1, 0, 1,
-0.81802, 0.381258, -2.711948, 0.7568628, 1, 0, 1,
-0.8171751, 0.6107331, -1.232396, 0.7529412, 1, 0, 1,
-0.8166014, -1.016048, -3.853669, 0.7450981, 1, 0, 1,
-0.8088838, 1.059483, -1.482093, 0.7411765, 1, 0, 1,
-0.8082968, 1.316331, -1.031187, 0.7333333, 1, 0, 1,
-0.804666, 0.1202591, -1.671209, 0.7294118, 1, 0, 1,
-0.8018366, 0.7772573, -0.9272068, 0.7215686, 1, 0, 1,
-0.7934959, 0.2849782, -0.8030387, 0.7176471, 1, 0, 1,
-0.7872142, 0.1675626, 0.2078094, 0.7098039, 1, 0, 1,
-0.7828189, 0.4055645, 0.07526423, 0.7058824, 1, 0, 1,
-0.7810327, -1.049943, -1.660272, 0.6980392, 1, 0, 1,
-0.7808272, -0.6661656, -2.145045, 0.6901961, 1, 0, 1,
-0.7789786, -0.7334167, -2.248415, 0.6862745, 1, 0, 1,
-0.7775959, 1.388975, -0.5453062, 0.6784314, 1, 0, 1,
-0.7696896, -1.503073, -2.846071, 0.6745098, 1, 0, 1,
-0.7663919, 0.1844409, -0.1938127, 0.6666667, 1, 0, 1,
-0.7638805, 0.9800682, -0.3818396, 0.6627451, 1, 0, 1,
-0.7635306, 1.860573, 1.046668, 0.654902, 1, 0, 1,
-0.7620397, 0.5702273, -0.6521389, 0.6509804, 1, 0, 1,
-0.7607229, -0.7201871, -1.997551, 0.6431373, 1, 0, 1,
-0.757094, -0.7120997, -2.406349, 0.6392157, 1, 0, 1,
-0.7563089, 1.613398, 0.1059012, 0.6313726, 1, 0, 1,
-0.7560768, 0.06503342, -0.652333, 0.627451, 1, 0, 1,
-0.7560727, 0.6534963, 0.509876, 0.6196079, 1, 0, 1,
-0.7536484, 0.9426656, 1.853755, 0.6156863, 1, 0, 1,
-0.7515241, 0.11303, -2.518329, 0.6078432, 1, 0, 1,
-0.7513682, 0.5360862, -1.596532, 0.6039216, 1, 0, 1,
-0.7474654, 0.9001305, 0.06671724, 0.5960785, 1, 0, 1,
-0.7457496, -1.1501, -1.240136, 0.5882353, 1, 0, 1,
-0.7445725, -0.3814216, -2.096261, 0.5843138, 1, 0, 1,
-0.7431278, 0.8661872, 0.1618216, 0.5764706, 1, 0, 1,
-0.7398955, -1.240997, -2.714206, 0.572549, 1, 0, 1,
-0.7363624, 0.9556792, -0.74712, 0.5647059, 1, 0, 1,
-0.7346989, 0.2984455, 0.09249166, 0.5607843, 1, 0, 1,
-0.722254, 1.594043, 0.1445365, 0.5529412, 1, 0, 1,
-0.7215144, 0.1242924, -2.490629, 0.5490196, 1, 0, 1,
-0.7215099, -0.6682152, -0.9435714, 0.5411765, 1, 0, 1,
-0.7194592, -0.9248204, -2.591604, 0.5372549, 1, 0, 1,
-0.7193953, -0.07619981, -1.424694, 0.5294118, 1, 0, 1,
-0.7184995, 0.05964692, -0.8855445, 0.5254902, 1, 0, 1,
-0.7162937, -1.733409, -2.919892, 0.5176471, 1, 0, 1,
-0.7079292, -0.6306774, -3.460059, 0.5137255, 1, 0, 1,
-0.7051712, 0.9032521, -0.5930235, 0.5058824, 1, 0, 1,
-0.7027532, 0.08921491, -3.539655, 0.5019608, 1, 0, 1,
-0.7020484, 2.481002, -0.252969, 0.4941176, 1, 0, 1,
-0.7014702, -0.7865956, -2.975459, 0.4862745, 1, 0, 1,
-0.6989497, 0.5851737, 0.1825475, 0.4823529, 1, 0, 1,
-0.6927474, -0.02347421, -1.656962, 0.4745098, 1, 0, 1,
-0.6881552, -1.335219, -4.06326, 0.4705882, 1, 0, 1,
-0.6865093, -1.244449, -3.107783, 0.4627451, 1, 0, 1,
-0.68328, -0.3646072, -1.970755, 0.4588235, 1, 0, 1,
-0.6815795, -1.334897, -2.984684, 0.4509804, 1, 0, 1,
-0.6807635, 0.3458153, -1.555926, 0.4470588, 1, 0, 1,
-0.6782324, 0.4031777, -1.536147, 0.4392157, 1, 0, 1,
-0.6762293, 0.4832047, -2.542299, 0.4352941, 1, 0, 1,
-0.6745076, -1.32342, -1.542017, 0.427451, 1, 0, 1,
-0.6727223, -1.586588, -0.5433949, 0.4235294, 1, 0, 1,
-0.6694322, 1.216289, 1.77462, 0.4156863, 1, 0, 1,
-0.6639952, -0.1287203, -1.741417, 0.4117647, 1, 0, 1,
-0.663295, -0.2852228, -2.212067, 0.4039216, 1, 0, 1,
-0.6627452, -1.006783, -2.400874, 0.3960784, 1, 0, 1,
-0.6597914, -2.156963, -3.384868, 0.3921569, 1, 0, 1,
-0.6585857, -0.5134039, -1.280192, 0.3843137, 1, 0, 1,
-0.657418, 0.2782791, -0.8793431, 0.3803922, 1, 0, 1,
-0.6531665, 0.9110799, 0.1861641, 0.372549, 1, 0, 1,
-0.631224, -0.712211, -3.481292, 0.3686275, 1, 0, 1,
-0.6294047, -0.9259177, -2.259511, 0.3607843, 1, 0, 1,
-0.6285192, -0.1966658, -2.613231, 0.3568628, 1, 0, 1,
-0.6230892, 0.119325, -1.196884, 0.3490196, 1, 0, 1,
-0.6156787, -0.4534142, -2.252677, 0.345098, 1, 0, 1,
-0.6150028, 0.938406, 0.8914659, 0.3372549, 1, 0, 1,
-0.613035, -1.163401, -1.974025, 0.3333333, 1, 0, 1,
-0.6092609, 0.6125298, -0.2074172, 0.3254902, 1, 0, 1,
-0.6064966, -0.5169042, -2.726395, 0.3215686, 1, 0, 1,
-0.6040081, 1.103278, -0.09051605, 0.3137255, 1, 0, 1,
-0.6036575, -0.2796458, -2.618812, 0.3098039, 1, 0, 1,
-0.6030415, 0.2718262, -1.201252, 0.3019608, 1, 0, 1,
-0.5974439, 0.4812458, -1.423038, 0.2941177, 1, 0, 1,
-0.5953102, -1.42984, -2.80628, 0.2901961, 1, 0, 1,
-0.5949079, -0.679347, -4.38435, 0.282353, 1, 0, 1,
-0.5940854, -0.3714643, -3.075887, 0.2784314, 1, 0, 1,
-0.5938054, 0.3283621, -0.4772952, 0.2705882, 1, 0, 1,
-0.5847784, 0.2321294, -1.243601, 0.2666667, 1, 0, 1,
-0.584152, 1.062567, 0.2697603, 0.2588235, 1, 0, 1,
-0.5809537, 0.9653577, -0.173594, 0.254902, 1, 0, 1,
-0.5783585, 0.7194355, -0.9944975, 0.2470588, 1, 0, 1,
-0.57544, -1.163715, -2.810975, 0.2431373, 1, 0, 1,
-0.5716103, -0.2808254, -2.087228, 0.2352941, 1, 0, 1,
-0.5700249, -0.6951523, -1.274659, 0.2313726, 1, 0, 1,
-0.5597554, -0.4411826, -4.649966, 0.2235294, 1, 0, 1,
-0.5580682, 0.7373737, -0.887592, 0.2196078, 1, 0, 1,
-0.5567957, 0.8190622, 1.034573, 0.2117647, 1, 0, 1,
-0.5566759, -0.5945001, -3.731157, 0.2078431, 1, 0, 1,
-0.5540897, 0.1704826, -0.2394292, 0.2, 1, 0, 1,
-0.5520798, 0.9526686, 0.3112525, 0.1921569, 1, 0, 1,
-0.5486227, -0.5922791, -2.336135, 0.1882353, 1, 0, 1,
-0.5469779, -0.640343, -2.623613, 0.1803922, 1, 0, 1,
-0.5453706, -0.6409581, -4.263553, 0.1764706, 1, 0, 1,
-0.543928, -1.664111, -3.931867, 0.1686275, 1, 0, 1,
-0.5266224, -1.014778, -3.019201, 0.1647059, 1, 0, 1,
-0.524944, 0.9723167, 0.06644628, 0.1568628, 1, 0, 1,
-0.5213658, 0.1712022, -0.7049394, 0.1529412, 1, 0, 1,
-0.5184568, -0.319148, -1.875862, 0.145098, 1, 0, 1,
-0.5145288, 0.4735844, -0.4179317, 0.1411765, 1, 0, 1,
-0.5142553, -1.150992, -1.940633, 0.1333333, 1, 0, 1,
-0.5141059, -1.496412, -2.782259, 0.1294118, 1, 0, 1,
-0.5117947, 0.1708922, -2.122687, 0.1215686, 1, 0, 1,
-0.5069181, 0.7645264, -0.504366, 0.1176471, 1, 0, 1,
-0.5068325, 0.3966035, 0.5376168, 0.1098039, 1, 0, 1,
-0.5068274, -0.231236, 0.1778476, 0.1058824, 1, 0, 1,
-0.5008057, -1.668501, -2.065458, 0.09803922, 1, 0, 1,
-0.4982663, -0.3298756, -1.882051, 0.09019608, 1, 0, 1,
-0.49809, -0.8134407, -5.224619, 0.08627451, 1, 0, 1,
-0.4967735, -2.019335, -4.426508, 0.07843138, 1, 0, 1,
-0.4887839, -2.082236, -2.597397, 0.07450981, 1, 0, 1,
-0.4869693, 0.2649914, -1.635969, 0.06666667, 1, 0, 1,
-0.4831693, -1.755046, -3.653021, 0.0627451, 1, 0, 1,
-0.4783084, -0.2614785, -1.443949, 0.05490196, 1, 0, 1,
-0.4775313, -0.4226258, -2.14476, 0.05098039, 1, 0, 1,
-0.4763006, -0.04022952, -0.7828264, 0.04313726, 1, 0, 1,
-0.4760449, 0.1287076, -0.7090077, 0.03921569, 1, 0, 1,
-0.4740612, 0.2812133, -0.04326382, 0.03137255, 1, 0, 1,
-0.4712853, -1.075644, -2.469658, 0.02745098, 1, 0, 1,
-0.4665774, -0.08452993, -3.764703, 0.01960784, 1, 0, 1,
-0.4567337, -1.658402, -4.03553, 0.01568628, 1, 0, 1,
-0.4509784, -1.562006, -1.690072, 0.007843138, 1, 0, 1,
-0.4494812, -0.9664268, -3.887653, 0.003921569, 1, 0, 1,
-0.446003, -0.3434795, -1.882984, 0, 1, 0.003921569, 1,
-0.4427848, 0.1635761, -1.083714, 0, 1, 0.01176471, 1,
-0.433362, -0.06966239, -2.344629, 0, 1, 0.01568628, 1,
-0.4316989, 1.028808, 1.147175, 0, 1, 0.02352941, 1,
-0.4314454, 0.2394076, 0.6018665, 0, 1, 0.02745098, 1,
-0.4314374, 0.02142666, -2.631057, 0, 1, 0.03529412, 1,
-0.4282876, 0.3601264, -1.22488, 0, 1, 0.03921569, 1,
-0.4211182, -1.084092, -2.001079, 0, 1, 0.04705882, 1,
-0.4205925, -2.072711, -2.146925, 0, 1, 0.05098039, 1,
-0.4173437, -1.241633, -3.614816, 0, 1, 0.05882353, 1,
-0.4160123, 0.9809976, -2.080935, 0, 1, 0.0627451, 1,
-0.4145561, 0.5611691, 0.2581607, 0, 1, 0.07058824, 1,
-0.4110398, 0.9816278, -0.4877647, 0, 1, 0.07450981, 1,
-0.4105383, 0.2742482, -2.305669, 0, 1, 0.08235294, 1,
-0.4102992, 0.8676628, 1.409577, 0, 1, 0.08627451, 1,
-0.406988, -0.7302495, -5.193373, 0, 1, 0.09411765, 1,
-0.4002846, -0.6630301, -2.216362, 0, 1, 0.1019608, 1,
-0.3953546, -0.3718956, -1.74431, 0, 1, 0.1058824, 1,
-0.3952864, 0.7740948, -0.7814826, 0, 1, 0.1137255, 1,
-0.3940032, 1.156943, -1.848163, 0, 1, 0.1176471, 1,
-0.3829983, -0.3169157, -1.657403, 0, 1, 0.1254902, 1,
-0.3775298, 0.728523, -0.4728242, 0, 1, 0.1294118, 1,
-0.3686349, 0.8910592, -0.936541, 0, 1, 0.1372549, 1,
-0.36857, -0.2604677, -2.643881, 0, 1, 0.1411765, 1,
-0.3578645, -1.235897, -1.816505, 0, 1, 0.1490196, 1,
-0.3523769, -0.3419242, -4.262742, 0, 1, 0.1529412, 1,
-0.3512146, -0.2657799, -2.148115, 0, 1, 0.1607843, 1,
-0.3431096, -0.8216027, -2.031106, 0, 1, 0.1647059, 1,
-0.3417437, -0.9235556, -5.381853, 0, 1, 0.172549, 1,
-0.336387, -2.20796, -2.980673, 0, 1, 0.1764706, 1,
-0.3352686, -0.01615287, -2.27197, 0, 1, 0.1843137, 1,
-0.3309618, 1.3532, -0.03262227, 0, 1, 0.1882353, 1,
-0.3301183, 0.07580795, 0.7516852, 0, 1, 0.1960784, 1,
-0.3255228, -0.5649121, -1.499297, 0, 1, 0.2039216, 1,
-0.3254339, -1.132001, -4.264357, 0, 1, 0.2078431, 1,
-0.3229638, 0.1176738, -0.6908888, 0, 1, 0.2156863, 1,
-0.3219877, 0.119609, -1.104803, 0, 1, 0.2196078, 1,
-0.3215227, 0.5904584, 1.479696, 0, 1, 0.227451, 1,
-0.3199508, 0.3135557, -0.1529902, 0, 1, 0.2313726, 1,
-0.3180839, 0.07769983, -2.373586, 0, 1, 0.2392157, 1,
-0.3130531, 0.436591, -0.04713508, 0, 1, 0.2431373, 1,
-0.3091798, 1.824401, -0.9599604, 0, 1, 0.2509804, 1,
-0.3076062, -0.8154978, -4.819538, 0, 1, 0.254902, 1,
-0.3069246, -0.6753794, -1.364886, 0, 1, 0.2627451, 1,
-0.3061908, 0.1869616, -0.3317515, 0, 1, 0.2666667, 1,
-0.3051508, -0.5640301, -3.847341, 0, 1, 0.2745098, 1,
-0.3038619, -1.004821, -2.312445, 0, 1, 0.2784314, 1,
-0.3029975, 0.5972987, 0.3582868, 0, 1, 0.2862745, 1,
-0.2982998, -0.1919624, -2.079122, 0, 1, 0.2901961, 1,
-0.2963307, 0.7502772, 0.08243284, 0, 1, 0.2980392, 1,
-0.2922531, 0.5828755, -0.12049, 0, 1, 0.3058824, 1,
-0.2919307, -1.771152, -2.715939, 0, 1, 0.3098039, 1,
-0.2900831, 0.0646698, -2.907628, 0, 1, 0.3176471, 1,
-0.2899282, -0.1603721, -1.612504, 0, 1, 0.3215686, 1,
-0.2852887, 0.04436346, -1.971231, 0, 1, 0.3294118, 1,
-0.2830651, -0.9584318, -2.462602, 0, 1, 0.3333333, 1,
-0.2824449, -1.369425, -2.396893, 0, 1, 0.3411765, 1,
-0.2771274, -0.4901994, -3.17713, 0, 1, 0.345098, 1,
-0.2753594, 0.6274427, 0.1750447, 0, 1, 0.3529412, 1,
-0.2750341, 1.244934, 0.1969759, 0, 1, 0.3568628, 1,
-0.2745853, 2.342206, -1.173806, 0, 1, 0.3647059, 1,
-0.2702439, -0.3649864, -4.002157, 0, 1, 0.3686275, 1,
-0.2623703, 0.8121663, 0.9962741, 0, 1, 0.3764706, 1,
-0.2590648, -0.1726152, -1.427976, 0, 1, 0.3803922, 1,
-0.2522057, 0.6669824, -0.3478711, 0, 1, 0.3882353, 1,
-0.2509953, 2.204208, 1.395457, 0, 1, 0.3921569, 1,
-0.247543, -0.5631909, -3.663098, 0, 1, 0.4, 1,
-0.2452987, 2.113297, 0.4507919, 0, 1, 0.4078431, 1,
-0.2451413, -0.6967282, -2.578941, 0, 1, 0.4117647, 1,
-0.2422167, -0.104542, -4.506344, 0, 1, 0.4196078, 1,
-0.2410304, -0.03984452, -1.718799, 0, 1, 0.4235294, 1,
-0.2383441, 0.03352172, -1.520552, 0, 1, 0.4313726, 1,
-0.2357041, -0.5923263, -2.199515, 0, 1, 0.4352941, 1,
-0.2351248, 0.6848695, 0.3380592, 0, 1, 0.4431373, 1,
-0.2348847, 0.05319382, -0.9442226, 0, 1, 0.4470588, 1,
-0.2340484, 0.5504368, -0.9284014, 0, 1, 0.454902, 1,
-0.2293746, 0.4266315, -0.7212678, 0, 1, 0.4588235, 1,
-0.2267364, 0.619945, 1.047772, 0, 1, 0.4666667, 1,
-0.2247424, 1.809751, -0.1477252, 0, 1, 0.4705882, 1,
-0.2218382, 0.4306435, -1.843368, 0, 1, 0.4784314, 1,
-0.2156723, -0.8202564, -2.09664, 0, 1, 0.4823529, 1,
-0.2113725, 0.2588795, -2.215665, 0, 1, 0.4901961, 1,
-0.2105286, 0.2230063, -1.303767, 0, 1, 0.4941176, 1,
-0.2086837, -0.1066269, -1.853889, 0, 1, 0.5019608, 1,
-0.2084019, 0.7070691, -0.4199743, 0, 1, 0.509804, 1,
-0.2077842, 0.3984774, 1.340881, 0, 1, 0.5137255, 1,
-0.2075615, 0.0562028, -0.1717441, 0, 1, 0.5215687, 1,
-0.207343, -0.2907167, -1.84483, 0, 1, 0.5254902, 1,
-0.2071955, 2.285697, -0.794651, 0, 1, 0.5333334, 1,
-0.2061478, 0.7350379, 0.2350553, 0, 1, 0.5372549, 1,
-0.2047588, -1.348349, -2.396816, 0, 1, 0.5450981, 1,
-0.2010307, 0.04026221, -0.7787262, 0, 1, 0.5490196, 1,
-0.1960313, -2.203342, -4.734521, 0, 1, 0.5568628, 1,
-0.1915508, 2.184826, 0.6051479, 0, 1, 0.5607843, 1,
-0.1908642, -1.083205, -3.272974, 0, 1, 0.5686275, 1,
-0.189412, 0.8117357, 0.3023318, 0, 1, 0.572549, 1,
-0.1890571, 0.9702687, 0.9451939, 0, 1, 0.5803922, 1,
-0.1880894, 1.875818, -0.008098914, 0, 1, 0.5843138, 1,
-0.1864141, -0.7133834, -4.123503, 0, 1, 0.5921569, 1,
-0.1860898, -0.3296315, -2.058804, 0, 1, 0.5960785, 1,
-0.1828271, 0.5719017, 0.6816558, 0, 1, 0.6039216, 1,
-0.1806773, -0.2079127, -1.110967, 0, 1, 0.6117647, 1,
-0.1784822, 0.8070712, -0.910809, 0, 1, 0.6156863, 1,
-0.170917, -0.05358579, -3.208679, 0, 1, 0.6235294, 1,
-0.169056, 1.081624, 0.3241924, 0, 1, 0.627451, 1,
-0.1653318, 0.2483457, -0.3973571, 0, 1, 0.6352941, 1,
-0.1635618, 0.3677575, -0.9283323, 0, 1, 0.6392157, 1,
-0.1604767, -0.6092283, -2.567617, 0, 1, 0.6470588, 1,
-0.1603246, 0.04407576, -3.468808, 0, 1, 0.6509804, 1,
-0.1596537, 0.6300889, 0.1537546, 0, 1, 0.6588235, 1,
-0.1506204, -1.227291, -3.736294, 0, 1, 0.6627451, 1,
-0.1505155, 0.8602887, -1.548902, 0, 1, 0.6705883, 1,
-0.1504309, -0.6153859, -2.781107, 0, 1, 0.6745098, 1,
-0.1464825, -1.221129, -3.066508, 0, 1, 0.682353, 1,
-0.1420607, 0.6235482, 0.7962316, 0, 1, 0.6862745, 1,
-0.1410432, 0.4666432, -0.1039061, 0, 1, 0.6941177, 1,
-0.1394673, -0.3458999, -2.40699, 0, 1, 0.7019608, 1,
-0.1350742, -0.8324081, -3.906962, 0, 1, 0.7058824, 1,
-0.1336563, -0.1689777, -2.348646, 0, 1, 0.7137255, 1,
-0.1333146, -0.7500309, -4.40883, 0, 1, 0.7176471, 1,
-0.1323071, -0.2522439, -2.364856, 0, 1, 0.7254902, 1,
-0.1290709, -0.03894719, -1.34322, 0, 1, 0.7294118, 1,
-0.1245692, 0.9397575, -1.569426, 0, 1, 0.7372549, 1,
-0.123292, -0.536752, -2.641093, 0, 1, 0.7411765, 1,
-0.1197387, 1.974517, -1.127645, 0, 1, 0.7490196, 1,
-0.1193025, -1.554532, -3.776141, 0, 1, 0.7529412, 1,
-0.1192768, 0.8430843, -0.2575036, 0, 1, 0.7607843, 1,
-0.1129814, -0.6303802, -3.844679, 0, 1, 0.7647059, 1,
-0.1113544, -0.761591, -1.529536, 0, 1, 0.772549, 1,
-0.111002, 0.2280154, -1.102964, 0, 1, 0.7764706, 1,
-0.10692, 1.6241, -0.3004515, 0, 1, 0.7843137, 1,
-0.1065738, 1.028875, 0.4556911, 0, 1, 0.7882353, 1,
-0.1059362, -0.4067445, -2.656844, 0, 1, 0.7960784, 1,
-0.09564546, -0.3403398, -3.400904, 0, 1, 0.8039216, 1,
-0.09510045, 0.4615519, 1.538335, 0, 1, 0.8078431, 1,
-0.09350719, -0.2978033, -3.948564, 0, 1, 0.8156863, 1,
-0.08440371, 0.7021763, -0.5701984, 0, 1, 0.8196079, 1,
-0.08316386, -0.316688, -5.137447, 0, 1, 0.827451, 1,
-0.0827043, 0.8709064, -0.2045227, 0, 1, 0.8313726, 1,
-0.07562514, 0.5147703, -0.359352, 0, 1, 0.8392157, 1,
-0.07474767, 0.4163231, -1.086783, 0, 1, 0.8431373, 1,
-0.07313497, -0.1064209, -1.391511, 0, 1, 0.8509804, 1,
-0.07103127, 0.1875262, -0.03252147, 0, 1, 0.854902, 1,
-0.07049383, -0.8389471, -3.264783, 0, 1, 0.8627451, 1,
-0.06974519, -1.149422, -2.667993, 0, 1, 0.8666667, 1,
-0.06951706, 0.318103, -2.402662, 0, 1, 0.8745098, 1,
-0.06894032, 0.4507909, 0.5484862, 0, 1, 0.8784314, 1,
-0.06284797, 0.3448115, -0.1197423, 0, 1, 0.8862745, 1,
-0.06050455, 1.255471, 0.8843811, 0, 1, 0.8901961, 1,
-0.05941888, -1.78929, -3.596863, 0, 1, 0.8980392, 1,
-0.05890639, -1.505104, -0.8063882, 0, 1, 0.9058824, 1,
-0.05529295, -0.9156546, -4.006984, 0, 1, 0.9098039, 1,
-0.05490424, 1.12993, -1.087542, 0, 1, 0.9176471, 1,
-0.05206937, 0.2140895, -0.3712992, 0, 1, 0.9215686, 1,
-0.04882254, 0.4371691, 0.675292, 0, 1, 0.9294118, 1,
-0.04853167, -1.802867, -1.291389, 0, 1, 0.9333333, 1,
-0.04200607, -2.063983, -3.846522, 0, 1, 0.9411765, 1,
-0.03886918, 0.8112947, -0.1440978, 0, 1, 0.945098, 1,
-0.03831891, -1.165799, -1.763228, 0, 1, 0.9529412, 1,
-0.03602871, 0.30759, 0.861773, 0, 1, 0.9568627, 1,
-0.03345566, 1.720352, 0.6382089, 0, 1, 0.9647059, 1,
-0.02865376, 0.578225, 0.2319469, 0, 1, 0.9686275, 1,
-0.02757813, 2.318746, -0.4900267, 0, 1, 0.9764706, 1,
-0.02520381, 0.2375643, 0.08838306, 0, 1, 0.9803922, 1,
-0.02223703, -0.9868066, -3.978718, 0, 1, 0.9882353, 1,
-0.01812096, -2.227629, -2.589147, 0, 1, 0.9921569, 1,
-0.01768091, 0.2475624, 0.2195337, 0, 1, 1, 1,
-0.01751844, 0.03616999, -0.7641624, 0, 0.9921569, 1, 1,
-0.01338081, 1.001381, 0.9245955, 0, 0.9882353, 1, 1,
-0.00945553, 1.8865, 0.4822698, 0, 0.9803922, 1, 1,
-0.007495727, -0.1257222, -2.18741, 0, 0.9764706, 1, 1,
-0.001497334, -0.7018949, -4.631803, 0, 0.9686275, 1, 1,
-0.0008406053, -0.321186, -4.721562, 0, 0.9647059, 1, 1,
0.002729122, -2.770117, 2.378545, 0, 0.9568627, 1, 1,
0.009649258, -2.731369, 3.883418, 0, 0.9529412, 1, 1,
0.01302857, -0.5020658, 4.121601, 0, 0.945098, 1, 1,
0.01418643, 0.657726, 0.2066168, 0, 0.9411765, 1, 1,
0.01839518, -0.07072826, 2.806363, 0, 0.9333333, 1, 1,
0.01874351, -1.067225, 2.43987, 0, 0.9294118, 1, 1,
0.02203634, -0.7455815, 3.438003, 0, 0.9215686, 1, 1,
0.02332983, 0.07122441, -0.6726539, 0, 0.9176471, 1, 1,
0.02542437, -0.5002241, 2.739354, 0, 0.9098039, 1, 1,
0.02781026, -0.2850668, 2.605898, 0, 0.9058824, 1, 1,
0.03038382, 0.2261031, -0.05241429, 0, 0.8980392, 1, 1,
0.03043146, -0.4728222, 0.8630599, 0, 0.8901961, 1, 1,
0.03439811, 0.3057051, -1.027126, 0, 0.8862745, 1, 1,
0.03894674, -1.028439, 2.163548, 0, 0.8784314, 1, 1,
0.04496329, 0.6212378, 0.1009472, 0, 0.8745098, 1, 1,
0.04702736, 0.5817614, -0.3078305, 0, 0.8666667, 1, 1,
0.05015709, -1.149919, 3.137046, 0, 0.8627451, 1, 1,
0.05358687, 0.8152198, 0.2713133, 0, 0.854902, 1, 1,
0.0561635, 0.6674409, -0.268196, 0, 0.8509804, 1, 1,
0.05684204, -0.748385, 3.163534, 0, 0.8431373, 1, 1,
0.05702387, 0.2020121, -0.2091465, 0, 0.8392157, 1, 1,
0.05995683, -0.2697048, 2.875315, 0, 0.8313726, 1, 1,
0.06095059, 1.046807, 0.03430617, 0, 0.827451, 1, 1,
0.06151808, -0.7648792, 3.411305, 0, 0.8196079, 1, 1,
0.06397749, 0.6556676, 1.341298, 0, 0.8156863, 1, 1,
0.06573326, 1.881439, -0.7739124, 0, 0.8078431, 1, 1,
0.06968983, 1.479659, 0.6596451, 0, 0.8039216, 1, 1,
0.0699001, -0.8344254, 2.553229, 0, 0.7960784, 1, 1,
0.07442984, 2.099229, -0.4148181, 0, 0.7882353, 1, 1,
0.07627627, -1.127122, 3.621099, 0, 0.7843137, 1, 1,
0.07725913, 1.040277, -0.5208178, 0, 0.7764706, 1, 1,
0.07769565, 1.691111, 0.1160597, 0, 0.772549, 1, 1,
0.0829904, 1.300876, -0.5313069, 0, 0.7647059, 1, 1,
0.08992834, -0.7976724, 0.7757565, 0, 0.7607843, 1, 1,
0.09576864, -2.545892, 4.862146, 0, 0.7529412, 1, 1,
0.09730639, 0.4883656, 0.4087152, 0, 0.7490196, 1, 1,
0.09963305, 0.2172926, -1.135292, 0, 0.7411765, 1, 1,
0.1037398, -0.5084022, 3.961594, 0, 0.7372549, 1, 1,
0.1041482, -0.4396316, 5.387689, 0, 0.7294118, 1, 1,
0.1043354, 0.4894149, 1.099141, 0, 0.7254902, 1, 1,
0.1052327, 1.203516, 1.351337, 0, 0.7176471, 1, 1,
0.1068005, 0.4861292, -1.184122, 0, 0.7137255, 1, 1,
0.1101252, 0.477428, -0.3937692, 0, 0.7058824, 1, 1,
0.1121304, -0.08299909, 3.083462, 0, 0.6980392, 1, 1,
0.1155433, -2.376878, 4.966608, 0, 0.6941177, 1, 1,
0.1162694, -1.6248, 2.396807, 0, 0.6862745, 1, 1,
0.1170626, -0.8103935, 2.59706, 0, 0.682353, 1, 1,
0.1207912, 0.8824605, -1.013849, 0, 0.6745098, 1, 1,
0.1253798, -0.1552852, 2.590402, 0, 0.6705883, 1, 1,
0.1277428, -0.578807, 3.716069, 0, 0.6627451, 1, 1,
0.1282658, -1.044494, 3.542539, 0, 0.6588235, 1, 1,
0.1307282, 0.3252133, 0.1503577, 0, 0.6509804, 1, 1,
0.1308628, -0.114701, 0.6134642, 0, 0.6470588, 1, 1,
0.1311647, 0.9688144, 0.6402708, 0, 0.6392157, 1, 1,
0.1358873, 0.6147448, 1.211089, 0, 0.6352941, 1, 1,
0.1464868, -2.120165, 4.239042, 0, 0.627451, 1, 1,
0.1477258, -0.8623909, 2.239368, 0, 0.6235294, 1, 1,
0.1480587, -0.01260395, 2.030495, 0, 0.6156863, 1, 1,
0.1481135, -0.2727973, 2.847109, 0, 0.6117647, 1, 1,
0.148674, -0.3925942, 1.651706, 0, 0.6039216, 1, 1,
0.1509488, 0.561853, 2.960984, 0, 0.5960785, 1, 1,
0.1512497, 1.595524, 1.293335, 0, 0.5921569, 1, 1,
0.1520804, -0.1969519, 1.749524, 0, 0.5843138, 1, 1,
0.1550683, -0.02111509, 0.2781231, 0, 0.5803922, 1, 1,
0.1558907, -0.3959756, 2.139606, 0, 0.572549, 1, 1,
0.1563901, 0.2022127, 1.819368, 0, 0.5686275, 1, 1,
0.1569171, 1.196527, -0.5828906, 0, 0.5607843, 1, 1,
0.1569641, -0.3016177, 3.976017, 0, 0.5568628, 1, 1,
0.1581956, 0.03628521, 2.32969, 0, 0.5490196, 1, 1,
0.1581988, 0.5970804, -0.7503489, 0, 0.5450981, 1, 1,
0.1584935, 0.6974936, 0.45756, 0, 0.5372549, 1, 1,
0.1601895, 0.2534315, 0.561986, 0, 0.5333334, 1, 1,
0.1682446, 0.9570891, 1.842171, 0, 0.5254902, 1, 1,
0.1722776, -0.4334279, 1.541026, 0, 0.5215687, 1, 1,
0.1803316, -0.2562208, 1.458272, 0, 0.5137255, 1, 1,
0.1850897, -1.014217, 3.190832, 0, 0.509804, 1, 1,
0.1897109, -0.1712654, 1.000158, 0, 0.5019608, 1, 1,
0.1948563, -0.5973618, 2.722303, 0, 0.4941176, 1, 1,
0.1963014, 1.197936, 0.9158934, 0, 0.4901961, 1, 1,
0.1978066, 0.4842111, -0.09032352, 0, 0.4823529, 1, 1,
0.2004929, 0.2188, -0.2012737, 0, 0.4784314, 1, 1,
0.2103438, -3.758541, 3.38644, 0, 0.4705882, 1, 1,
0.2136386, -1.078371, 5.083149, 0, 0.4666667, 1, 1,
0.2171774, 0.9167914, 0.8135471, 0, 0.4588235, 1, 1,
0.2185849, 0.01474794, 3.620979, 0, 0.454902, 1, 1,
0.2214421, 0.7676921, 2.251557, 0, 0.4470588, 1, 1,
0.2284521, 1.422257, -0.5785069, 0, 0.4431373, 1, 1,
0.2285683, 1.92263, -0.09004062, 0, 0.4352941, 1, 1,
0.2292858, 0.2491943, -0.7634881, 0, 0.4313726, 1, 1,
0.2335386, -1.055911, 3.657667, 0, 0.4235294, 1, 1,
0.2345475, 1.233737, 1.661957, 0, 0.4196078, 1, 1,
0.2352329, 0.2207867, 1.471462, 0, 0.4117647, 1, 1,
0.2354968, -0.1682507, 2.808495, 0, 0.4078431, 1, 1,
0.2366347, 0.3677951, 2.045275, 0, 0.4, 1, 1,
0.2372892, 0.4640737, 2.004168, 0, 0.3921569, 1, 1,
0.2384264, -0.3608283, 2.126657, 0, 0.3882353, 1, 1,
0.238711, 1.020183, -0.4524023, 0, 0.3803922, 1, 1,
0.2425295, 0.8745443, 0.5327215, 0, 0.3764706, 1, 1,
0.2456336, -0.03409973, 1.893577, 0, 0.3686275, 1, 1,
0.2482992, 1.678149, 0.2858897, 0, 0.3647059, 1, 1,
0.2514494, -0.5068684, 3.838631, 0, 0.3568628, 1, 1,
0.25182, -1.248677, 2.17675, 0, 0.3529412, 1, 1,
0.2523358, 0.004422431, 0.543093, 0, 0.345098, 1, 1,
0.2535551, 0.8416743, 1.192397, 0, 0.3411765, 1, 1,
0.2577509, -2.737615, 2.10655, 0, 0.3333333, 1, 1,
0.2580726, 1.834934, 0.7181699, 0, 0.3294118, 1, 1,
0.2594333, -0.9297856, 3.745229, 0, 0.3215686, 1, 1,
0.2595067, -1.129195, 3.213416, 0, 0.3176471, 1, 1,
0.2605806, -0.3493151, 1.828002, 0, 0.3098039, 1, 1,
0.2646596, 0.2340629, 0.2730303, 0, 0.3058824, 1, 1,
0.2657107, -0.09627267, 2.650343, 0, 0.2980392, 1, 1,
0.2685969, 0.2471769, 0.6842344, 0, 0.2901961, 1, 1,
0.2732079, 0.287023, 0.5113173, 0, 0.2862745, 1, 1,
0.273636, -0.1711047, 0.8178932, 0, 0.2784314, 1, 1,
0.2775218, -0.5484658, 1.927122, 0, 0.2745098, 1, 1,
0.2807027, 0.04925786, 0.9645862, 0, 0.2666667, 1, 1,
0.2839262, 0.3198425, -0.899156, 0, 0.2627451, 1, 1,
0.2919527, 1.342931, 0.6886476, 0, 0.254902, 1, 1,
0.2932462, -0.1456659, 2.226825, 0, 0.2509804, 1, 1,
0.2970436, 1.81866, 1.015853, 0, 0.2431373, 1, 1,
0.2973426, 0.4165669, 1.065719, 0, 0.2392157, 1, 1,
0.299357, 1.887255, -1.117207, 0, 0.2313726, 1, 1,
0.301398, 0.07624762, -0.02138332, 0, 0.227451, 1, 1,
0.30278, -0.3105651, 2.24669, 0, 0.2196078, 1, 1,
0.306647, 1.36542, 0.6191701, 0, 0.2156863, 1, 1,
0.3119374, 1.243413, 1.107393, 0, 0.2078431, 1, 1,
0.3147504, -0.6481014, 1.600785, 0, 0.2039216, 1, 1,
0.3147962, -2.987844, 3.171631, 0, 0.1960784, 1, 1,
0.3149161, 0.1778674, 0.3155123, 0, 0.1882353, 1, 1,
0.3185802, 1.808517, 1.401487, 0, 0.1843137, 1, 1,
0.3208656, 0.5129966, 0.1371138, 0, 0.1764706, 1, 1,
0.3211735, 0.4285446, -1.032276, 0, 0.172549, 1, 1,
0.3242007, -0.1136642, 2.642142, 0, 0.1647059, 1, 1,
0.3242231, 0.4655158, 0.8447964, 0, 0.1607843, 1, 1,
0.325004, -0.5277838, 3.492224, 0, 0.1529412, 1, 1,
0.3303915, 0.8233148, 1.278898, 0, 0.1490196, 1, 1,
0.3310789, -0.6295149, 1.44346, 0, 0.1411765, 1, 1,
0.3332992, 0.5679381, 1.209583, 0, 0.1372549, 1, 1,
0.3370423, 0.7470136, 0.8534553, 0, 0.1294118, 1, 1,
0.3381519, 0.1221024, 2.007318, 0, 0.1254902, 1, 1,
0.3392216, -0.02009403, 2.733149, 0, 0.1176471, 1, 1,
0.3399698, 0.2144245, -1.085487, 0, 0.1137255, 1, 1,
0.3400389, -0.9875209, 3.306974, 0, 0.1058824, 1, 1,
0.3432781, 0.199236, 1.164397, 0, 0.09803922, 1, 1,
0.344815, -1.372949, 2.757441, 0, 0.09411765, 1, 1,
0.355714, -0.07811692, 2.35092, 0, 0.08627451, 1, 1,
0.3615892, 0.2292085, 1.21278, 0, 0.08235294, 1, 1,
0.3652921, 0.2892638, 2.076371, 0, 0.07450981, 1, 1,
0.3653183, 0.4095549, 1.336648, 0, 0.07058824, 1, 1,
0.3666601, -0.3279749, 2.09206, 0, 0.0627451, 1, 1,
0.3694069, 1.424443, -1.701252, 0, 0.05882353, 1, 1,
0.3712353, -0.2778322, 1.107692, 0, 0.05098039, 1, 1,
0.3733502, -0.437005, 3.536888, 0, 0.04705882, 1, 1,
0.3753057, 0.3711829, -0.5747424, 0, 0.03921569, 1, 1,
0.3768484, -1.042537, 2.935575, 0, 0.03529412, 1, 1,
0.379056, -0.7039331, 2.735875, 0, 0.02745098, 1, 1,
0.3928725, -0.8997076, 2.142558, 0, 0.02352941, 1, 1,
0.394296, -0.5700422, 2.463764, 0, 0.01568628, 1, 1,
0.3977607, 0.2182721, 2.216028, 0, 0.01176471, 1, 1,
0.3981431, 0.1206399, 0.9387271, 0, 0.003921569, 1, 1,
0.3984646, 0.3617659, 2.102687, 0.003921569, 0, 1, 1,
0.4026071, -0.1030111, 1.056956, 0.007843138, 0, 1, 1,
0.4043123, 0.5530632, 0.2898044, 0.01568628, 0, 1, 1,
0.4045444, -1.130396, 5.636926, 0.01960784, 0, 1, 1,
0.4055107, 0.01763357, 0.6046159, 0.02745098, 0, 1, 1,
0.4055379, 0.1091183, 0.5855373, 0.03137255, 0, 1, 1,
0.4093952, -1.647563, 2.697272, 0.03921569, 0, 1, 1,
0.4095624, -1.011013, 3.141577, 0.04313726, 0, 1, 1,
0.4130072, -0.4636095, 1.073927, 0.05098039, 0, 1, 1,
0.4190615, 0.7177367, 0.1581048, 0.05490196, 0, 1, 1,
0.4319806, 1.140291, 0.3070823, 0.0627451, 0, 1, 1,
0.4385649, 0.4043869, 0.8900355, 0.06666667, 0, 1, 1,
0.4552009, -2.114933, 3.459897, 0.07450981, 0, 1, 1,
0.4581932, -1.196462, 4.025589, 0.07843138, 0, 1, 1,
0.4626978, -1.583758, 2.113864, 0.08627451, 0, 1, 1,
0.4631722, 1.518261, 2.007401, 0.09019608, 0, 1, 1,
0.467567, 0.1986427, 0.4175133, 0.09803922, 0, 1, 1,
0.4685105, 0.2202538, 1.996436, 0.1058824, 0, 1, 1,
0.4697084, -0.3527894, 2.306777, 0.1098039, 0, 1, 1,
0.4731149, -0.6957824, 2.714051, 0.1176471, 0, 1, 1,
0.4800915, -1.105502, 0.810679, 0.1215686, 0, 1, 1,
0.4810413, 0.9030614, 0.394412, 0.1294118, 0, 1, 1,
0.4841316, 0.6756632, 0.3993641, 0.1333333, 0, 1, 1,
0.4847079, 0.101985, 1.490774, 0.1411765, 0, 1, 1,
0.4899393, -0.4014494, 2.893959, 0.145098, 0, 1, 1,
0.4915329, 1.322135, -0.645616, 0.1529412, 0, 1, 1,
0.4956468, 0.5043695, 0.193535, 0.1568628, 0, 1, 1,
0.4974928, -0.7713221, 1.949099, 0.1647059, 0, 1, 1,
0.4976503, -0.3397927, 2.822958, 0.1686275, 0, 1, 1,
0.50115, -0.4644774, 2.52961, 0.1764706, 0, 1, 1,
0.503963, -0.5339705, 1.980591, 0.1803922, 0, 1, 1,
0.5045458, 0.123932, 0.0989092, 0.1882353, 0, 1, 1,
0.5051132, 1.424491, 2.416696, 0.1921569, 0, 1, 1,
0.5053849, 0.6890143, 0.4158376, 0.2, 0, 1, 1,
0.5086138, -0.6153206, 3.817781, 0.2078431, 0, 1, 1,
0.5130592, 1.275131, -0.09833013, 0.2117647, 0, 1, 1,
0.5167513, 0.6834679, 0.07221818, 0.2196078, 0, 1, 1,
0.5207844, 2.794821, -0.01706815, 0.2235294, 0, 1, 1,
0.521348, -0.3897511, -0.7421474, 0.2313726, 0, 1, 1,
0.52201, -0.2696346, 2.402995, 0.2352941, 0, 1, 1,
0.5236788, 0.7751064, -0.3002738, 0.2431373, 0, 1, 1,
0.5266757, 1.441727, -0.6010887, 0.2470588, 0, 1, 1,
0.5297348, -0.3457997, 2.368779, 0.254902, 0, 1, 1,
0.5328513, -2.056656, 1.927777, 0.2588235, 0, 1, 1,
0.5334379, -1.702596, 2.114844, 0.2666667, 0, 1, 1,
0.5337331, 0.9499055, -2.474853, 0.2705882, 0, 1, 1,
0.5375503, -0.177079, 3.274764, 0.2784314, 0, 1, 1,
0.5383467, 1.020519, 1.050568, 0.282353, 0, 1, 1,
0.5387643, 0.3173147, 1.794363, 0.2901961, 0, 1, 1,
0.541569, -0.7345215, 2.460062, 0.2941177, 0, 1, 1,
0.5443436, 0.947093, 1.778355, 0.3019608, 0, 1, 1,
0.5482571, -0.02557741, 1.250185, 0.3098039, 0, 1, 1,
0.551235, 1.586638, 0.5974235, 0.3137255, 0, 1, 1,
0.5619398, -2.877457, 2.354274, 0.3215686, 0, 1, 1,
0.5625254, 0.1995529, 2.363525, 0.3254902, 0, 1, 1,
0.5658939, -0.8523703, 2.888968, 0.3333333, 0, 1, 1,
0.5690097, 1.891584, 0.08101241, 0.3372549, 0, 1, 1,
0.5713241, 1.996371, 0.7997209, 0.345098, 0, 1, 1,
0.5728995, -0.7399975, 4.420421, 0.3490196, 0, 1, 1,
0.5777926, -0.1335577, 1.869689, 0.3568628, 0, 1, 1,
0.5782913, 1.680537, 0.1963915, 0.3607843, 0, 1, 1,
0.5786769, -0.3419176, 2.424083, 0.3686275, 0, 1, 1,
0.5791482, -0.4578598, 1.67914, 0.372549, 0, 1, 1,
0.5808017, 0.2079663, 0.6443941, 0.3803922, 0, 1, 1,
0.5820438, -0.2496319, 1.750593, 0.3843137, 0, 1, 1,
0.5838709, -0.3012204, 1.883476, 0.3921569, 0, 1, 1,
0.5880291, -1.634646, 1.90702, 0.3960784, 0, 1, 1,
0.5919805, 0.1351978, 1.068599, 0.4039216, 0, 1, 1,
0.5948934, -0.8095809, 3.159418, 0.4117647, 0, 1, 1,
0.5956849, -0.6501426, 2.746408, 0.4156863, 0, 1, 1,
0.6002193, -0.6601599, 1.769724, 0.4235294, 0, 1, 1,
0.6003428, 1.097778, 1.240164, 0.427451, 0, 1, 1,
0.6004121, -2.398581, 1.804691, 0.4352941, 0, 1, 1,
0.6022252, 0.3760595, 1.164173, 0.4392157, 0, 1, 1,
0.6031285, 0.2694297, 0.2654115, 0.4470588, 0, 1, 1,
0.6031759, 0.2009827, -0.5332826, 0.4509804, 0, 1, 1,
0.6044004, 0.1305995, 0.5562963, 0.4588235, 0, 1, 1,
0.6090974, -0.09256762, 2.183093, 0.4627451, 0, 1, 1,
0.6112417, -0.8126126, -0.2109638, 0.4705882, 0, 1, 1,
0.61141, -0.3632688, 1.679411, 0.4745098, 0, 1, 1,
0.6131596, 0.2166219, 1.694249, 0.4823529, 0, 1, 1,
0.6136461, -0.1951585, 1.988549, 0.4862745, 0, 1, 1,
0.6323681, -1.223161, 1.482874, 0.4941176, 0, 1, 1,
0.6329559, 0.2181423, 2.025592, 0.5019608, 0, 1, 1,
0.6396362, -0.5990317, 2.246121, 0.5058824, 0, 1, 1,
0.6440192, -0.7892696, 2.446205, 0.5137255, 0, 1, 1,
0.6533939, 0.5057341, 0.1817728, 0.5176471, 0, 1, 1,
0.6568436, -0.7587864, 1.448759, 0.5254902, 0, 1, 1,
0.657411, 0.9454007, -0.09102271, 0.5294118, 0, 1, 1,
0.6589102, 0.8186624, -0.08670318, 0.5372549, 0, 1, 1,
0.665872, -1.114158, 3.514332, 0.5411765, 0, 1, 1,
0.6675102, 0.09698927, 2.463087, 0.5490196, 0, 1, 1,
0.6718971, -1.539011, 2.559151, 0.5529412, 0, 1, 1,
0.6719154, -0.3071424, 2.631712, 0.5607843, 0, 1, 1,
0.6738975, -0.1209337, 2.724207, 0.5647059, 0, 1, 1,
0.6826547, 1.709512, -0.4734017, 0.572549, 0, 1, 1,
0.6930175, -1.444654, 3.870139, 0.5764706, 0, 1, 1,
0.6975148, 2.197554, -0.4325108, 0.5843138, 0, 1, 1,
0.6986527, -0.1784002, 2.403872, 0.5882353, 0, 1, 1,
0.7003493, 0.1075599, 1.996195, 0.5960785, 0, 1, 1,
0.7013235, 0.3808458, 0.7821087, 0.6039216, 0, 1, 1,
0.7037585, 0.9105296, 1.660474, 0.6078432, 0, 1, 1,
0.7103506, -1.545456, 3.653671, 0.6156863, 0, 1, 1,
0.7191197, 1.229531, 1.743183, 0.6196079, 0, 1, 1,
0.7235953, -0.06719892, 0.08476667, 0.627451, 0, 1, 1,
0.7281042, 1.643281, 1.632577, 0.6313726, 0, 1, 1,
0.7283823, -0.09809741, 1.450289, 0.6392157, 0, 1, 1,
0.7344159, -2.115052, 2.370517, 0.6431373, 0, 1, 1,
0.7394177, -0.7685365, 2.039487, 0.6509804, 0, 1, 1,
0.7420202, -0.6309506, 3.281319, 0.654902, 0, 1, 1,
0.7427916, -1.806327, 2.737085, 0.6627451, 0, 1, 1,
0.7508368, 0.5192724, 1.976356, 0.6666667, 0, 1, 1,
0.7520935, 0.02337269, 1.148208, 0.6745098, 0, 1, 1,
0.7537191, 2.333289, 0.8788163, 0.6784314, 0, 1, 1,
0.7541785, -0.6002368, 1.067003, 0.6862745, 0, 1, 1,
0.7582545, -0.8045627, -0.6053489, 0.6901961, 0, 1, 1,
0.7582821, 0.02486019, 1.659117, 0.6980392, 0, 1, 1,
0.7590783, 1.683373, 1.111548, 0.7058824, 0, 1, 1,
0.7614856, -0.09112464, 1.937303, 0.7098039, 0, 1, 1,
0.7652181, -0.4916289, 1.142288, 0.7176471, 0, 1, 1,
0.7669548, 1.690172, 1.497295, 0.7215686, 0, 1, 1,
0.775106, -0.9614149, 3.427235, 0.7294118, 0, 1, 1,
0.7773451, 1.377491, -0.5610743, 0.7333333, 0, 1, 1,
0.779698, 0.2203611, 1.155562, 0.7411765, 0, 1, 1,
0.780444, 0.4442709, 0.2038387, 0.7450981, 0, 1, 1,
0.7845836, 0.6268284, 0.4624555, 0.7529412, 0, 1, 1,
0.7913563, -0.7390531, 3.417126, 0.7568628, 0, 1, 1,
0.7952974, -0.6261526, 2.390379, 0.7647059, 0, 1, 1,
0.7984462, 0.8797508, 1.810153, 0.7686275, 0, 1, 1,
0.8133786, 2.251477, 0.8863927, 0.7764706, 0, 1, 1,
0.8157216, -0.6938435, 0.8469845, 0.7803922, 0, 1, 1,
0.8167767, -0.8941784, 1.662628, 0.7882353, 0, 1, 1,
0.8170947, -0.3219019, 1.348802, 0.7921569, 0, 1, 1,
0.8203822, 0.4951786, 1.157663, 0.8, 0, 1, 1,
0.8352703, 0.6297814, 0.4533226, 0.8078431, 0, 1, 1,
0.8384511, 0.9665066, 1.859163, 0.8117647, 0, 1, 1,
0.8412193, -0.4222191, 1.980949, 0.8196079, 0, 1, 1,
0.8462212, -0.01684659, 0.5033233, 0.8235294, 0, 1, 1,
0.8481834, 0.238936, 0.6713345, 0.8313726, 0, 1, 1,
0.8543123, -0.06164436, 1.814052, 0.8352941, 0, 1, 1,
0.8554781, 2.20998, 1.93834, 0.8431373, 0, 1, 1,
0.8555121, 0.3473479, 0.9483359, 0.8470588, 0, 1, 1,
0.8673924, -0.517691, 0.9746833, 0.854902, 0, 1, 1,
0.8711752, 0.8605601, 0.5411309, 0.8588235, 0, 1, 1,
0.8717839, -0.6348277, 0.2333011, 0.8666667, 0, 1, 1,
0.8738028, 0.3774943, 0.3493175, 0.8705882, 0, 1, 1,
0.8779095, -0.06585379, 2.328589, 0.8784314, 0, 1, 1,
0.88244, -0.6790016, 2.450115, 0.8823529, 0, 1, 1,
0.8909996, 1.600392, -0.6682008, 0.8901961, 0, 1, 1,
0.8964059, 1.838612, 0.7873669, 0.8941177, 0, 1, 1,
0.899993, -0.4022147, 0.8791637, 0.9019608, 0, 1, 1,
0.9094049, 0.6145926, -0.8839223, 0.9098039, 0, 1, 1,
0.913227, -0.8651776, 2.752383, 0.9137255, 0, 1, 1,
0.9150558, -0.1674895, 1.587545, 0.9215686, 0, 1, 1,
0.9218227, 0.4308461, -0.2258117, 0.9254902, 0, 1, 1,
0.9256025, -0.9826265, 2.555179, 0.9333333, 0, 1, 1,
0.9307864, 0.4816139, -0.6769428, 0.9372549, 0, 1, 1,
0.938158, 2.574631, -0.8647789, 0.945098, 0, 1, 1,
0.9477221, -0.6708432, 2.124511, 0.9490196, 0, 1, 1,
0.9499694, 0.3302959, 0.9297791, 0.9568627, 0, 1, 1,
0.9529522, -1.367672, 1.924136, 0.9607843, 0, 1, 1,
0.9541412, 0.5773687, 2.169494, 0.9686275, 0, 1, 1,
0.9591172, -1.617174, 1.523326, 0.972549, 0, 1, 1,
0.9633683, -0.6547686, 2.659446, 0.9803922, 0, 1, 1,
0.9637638, 0.844373, 1.60634, 0.9843137, 0, 1, 1,
0.9644899, 0.1884825, 1.562725, 0.9921569, 0, 1, 1,
0.9688884, -0.9744557, 3.480807, 0.9960784, 0, 1, 1,
0.9702619, -0.673115, 2.324105, 1, 0, 0.9960784, 1,
0.9733843, 0.2610593, 2.138806, 1, 0, 0.9882353, 1,
0.9916359, 1.609023, -1.351056, 1, 0, 0.9843137, 1,
0.9950448, -0.688266, 2.143788, 1, 0, 0.9764706, 1,
0.9952818, -0.5043353, 1.538962, 1, 0, 0.972549, 1,
0.9960931, 0.385709, -0.2963754, 1, 0, 0.9647059, 1,
0.998104, 1.272142, 0.08491393, 1, 0, 0.9607843, 1,
0.9988626, -0.4178867, 0.09983291, 1, 0, 0.9529412, 1,
1.004899, -1.05275, 3.145148, 1, 0, 0.9490196, 1,
1.006142, 0.127167, 0.9552162, 1, 0, 0.9411765, 1,
1.008007, 0.1224761, 1.175121, 1, 0, 0.9372549, 1,
1.010871, -0.9359303, 3.536136, 1, 0, 0.9294118, 1,
1.014782, 0.3323711, 1.933825, 1, 0, 0.9254902, 1,
1.015515, 0.3392032, 2.010419, 1, 0, 0.9176471, 1,
1.020154, -0.7056533, 2.419206, 1, 0, 0.9137255, 1,
1.024461, 0.4928671, 2.659001, 1, 0, 0.9058824, 1,
1.027742, -1.579952, 2.950637, 1, 0, 0.9019608, 1,
1.029911, 1.1014, 0.9398472, 1, 0, 0.8941177, 1,
1.030336, -1.643317, 0.9231371, 1, 0, 0.8862745, 1,
1.037936, -1.422595, 2.364311, 1, 0, 0.8823529, 1,
1.040304, 0.5292453, 0.54005, 1, 0, 0.8745098, 1,
1.043341, -1.635526, 1.208225, 1, 0, 0.8705882, 1,
1.04415, 0.9694637, 0.1712892, 1, 0, 0.8627451, 1,
1.045316, 0.2421591, 1.584988, 1, 0, 0.8588235, 1,
1.045366, -0.1007968, 1.969627, 1, 0, 0.8509804, 1,
1.045891, 1.261974, 1.36908, 1, 0, 0.8470588, 1,
1.048343, 0.006162928, 0.9918473, 1, 0, 0.8392157, 1,
1.058472, -0.4687104, 1.853484, 1, 0, 0.8352941, 1,
1.06087, 0.197747, 2.83563, 1, 0, 0.827451, 1,
1.067008, -1.595916, 3.290051, 1, 0, 0.8235294, 1,
1.071544, -0.1919958, 2.52062, 1, 0, 0.8156863, 1,
1.072485, -0.4733385, 0.3579248, 1, 0, 0.8117647, 1,
1.082204, 0.2160747, 1.285262, 1, 0, 0.8039216, 1,
1.092126, -0.29129, 2.016022, 1, 0, 0.7960784, 1,
1.098768, -0.8992358, 1.72747, 1, 0, 0.7921569, 1,
1.101028, -0.178643, 1.059048, 1, 0, 0.7843137, 1,
1.108372, 0.9175013, 1.445709, 1, 0, 0.7803922, 1,
1.109053, -0.2734416, 0.4386715, 1, 0, 0.772549, 1,
1.114597, 1.64842, 1.546127, 1, 0, 0.7686275, 1,
1.147651, 0.3719988, 2.02889, 1, 0, 0.7607843, 1,
1.152936, -0.3873845, 1.354089, 1, 0, 0.7568628, 1,
1.155716, -0.4422429, 2.949933, 1, 0, 0.7490196, 1,
1.158163, -0.5424992, 2.093484, 1, 0, 0.7450981, 1,
1.163828, -0.9433463, 1.555252, 1, 0, 0.7372549, 1,
1.167142, -1.470542, 2.95464, 1, 0, 0.7333333, 1,
1.168463, -1.176765, 1.713246, 1, 0, 0.7254902, 1,
1.179405, 1.00491, 1.043434, 1, 0, 0.7215686, 1,
1.180913, 0.5360155, 2.033327, 1, 0, 0.7137255, 1,
1.187396, 0.5753449, 0.8678583, 1, 0, 0.7098039, 1,
1.193554, 1.191277, 0.7220637, 1, 0, 0.7019608, 1,
1.193759, 2.17117, -0.8798385, 1, 0, 0.6941177, 1,
1.199266, 0.29839, 1.457932, 1, 0, 0.6901961, 1,
1.199782, -1.446367, 2.966192, 1, 0, 0.682353, 1,
1.20817, 0.8037408, 0.5042056, 1, 0, 0.6784314, 1,
1.225208, 0.6734162, 2.149549, 1, 0, 0.6705883, 1,
1.229652, -2.23015, 2.695393, 1, 0, 0.6666667, 1,
1.236596, -1.45397, 2.465445, 1, 0, 0.6588235, 1,
1.245107, 0.6958103, 1.625126, 1, 0, 0.654902, 1,
1.248953, -0.7016884, 1.429761, 1, 0, 0.6470588, 1,
1.255777, 2.285051, 2.511397, 1, 0, 0.6431373, 1,
1.25749, -0.678126, 3.401325, 1, 0, 0.6352941, 1,
1.266352, 0.005097003, 0.7190228, 1, 0, 0.6313726, 1,
1.281278, -2.012338, 3.374682, 1, 0, 0.6235294, 1,
1.297434, -0.2124683, 2.750285, 1, 0, 0.6196079, 1,
1.299908, -0.1073308, 1.042253, 1, 0, 0.6117647, 1,
1.302079, -0.704131, 1.113405, 1, 0, 0.6078432, 1,
1.302652, 1.391116, 0.8701167, 1, 0, 0.6, 1,
1.31373, -1.520522, 2.652248, 1, 0, 0.5921569, 1,
1.321907, 0.06601114, 2.555183, 1, 0, 0.5882353, 1,
1.324423, 0.6613773, 1.202165, 1, 0, 0.5803922, 1,
1.337278, -0.6859688, 1.668673, 1, 0, 0.5764706, 1,
1.343294, -3.013038, 1.675213, 1, 0, 0.5686275, 1,
1.381321, 1.996119, 0.4250839, 1, 0, 0.5647059, 1,
1.393973, 0.9355605, -0.1995712, 1, 0, 0.5568628, 1,
1.395061, -0.001286197, 1.345405, 1, 0, 0.5529412, 1,
1.40417, 1.695711, 0.2973887, 1, 0, 0.5450981, 1,
1.405704, 0.1263112, 0.8493538, 1, 0, 0.5411765, 1,
1.409058, -0.3331815, 3.829159, 1, 0, 0.5333334, 1,
1.412288, 0.3251392, 2.863826, 1, 0, 0.5294118, 1,
1.412332, 0.4979916, 2.223603, 1, 0, 0.5215687, 1,
1.417659, 0.234907, 1.667073, 1, 0, 0.5176471, 1,
1.421857, -0.6623827, 1.462428, 1, 0, 0.509804, 1,
1.436724, -1.914431, 2.936329, 1, 0, 0.5058824, 1,
1.439954, -0.1050605, 1.624606, 1, 0, 0.4980392, 1,
1.453512, 2.037782, 1.118556, 1, 0, 0.4901961, 1,
1.461907, -0.01425548, 2.403279, 1, 0, 0.4862745, 1,
1.471107, 1.450334, 1.373527, 1, 0, 0.4784314, 1,
1.471217, -1.603253, 2.198843, 1, 0, 0.4745098, 1,
1.472036, -0.2263676, 1.729614, 1, 0, 0.4666667, 1,
1.477932, 0.363727, 0.5438405, 1, 0, 0.4627451, 1,
1.479676, 1.41409, 1.304053, 1, 0, 0.454902, 1,
1.480271, -0.1762926, 1.598814, 1, 0, 0.4509804, 1,
1.483587, -0.7031032, 1.333975, 1, 0, 0.4431373, 1,
1.483702, 0.3568057, 0.5054752, 1, 0, 0.4392157, 1,
1.48453, -1.201863, 1.047138, 1, 0, 0.4313726, 1,
1.492594, -0.7521195, 4.261415, 1, 0, 0.427451, 1,
1.496462, -1.366558, 1.004847, 1, 0, 0.4196078, 1,
1.49663, 1.017845, 0.6124789, 1, 0, 0.4156863, 1,
1.498575, 2.501558, 1.594563, 1, 0, 0.4078431, 1,
1.524183, -1.242239, 1.571061, 1, 0, 0.4039216, 1,
1.541556, 0.1063888, 4.367659, 1, 0, 0.3960784, 1,
1.543014, -0.9974948, 2.853985, 1, 0, 0.3882353, 1,
1.569036, -1.236731, 1.894108, 1, 0, 0.3843137, 1,
1.57226, -0.7165319, 1.725096, 1, 0, 0.3764706, 1,
1.62266, -0.6173403, 2.290469, 1, 0, 0.372549, 1,
1.638432, -0.7684271, 4.763317, 1, 0, 0.3647059, 1,
1.646334, -0.2081652, 2.299193, 1, 0, 0.3607843, 1,
1.647702, 0.502471, 1.238825, 1, 0, 0.3529412, 1,
1.66408, -0.7772374, 2.95158, 1, 0, 0.3490196, 1,
1.676587, 0.3216942, 1.585397, 1, 0, 0.3411765, 1,
1.700672, -0.3080682, 0.949261, 1, 0, 0.3372549, 1,
1.712824, 0.5442501, 0.4347734, 1, 0, 0.3294118, 1,
1.721059, 0.126708, 1.950233, 1, 0, 0.3254902, 1,
1.725847, 0.6532375, 4.33187, 1, 0, 0.3176471, 1,
1.739636, 1.442446, -0.04432218, 1, 0, 0.3137255, 1,
1.740674, 0.4895051, 2.704446, 1, 0, 0.3058824, 1,
1.746861, 0.6818251, -0.1153904, 1, 0, 0.2980392, 1,
1.751931, 0.5529035, 1.109296, 1, 0, 0.2941177, 1,
1.76605, 0.03098667, 1.702395, 1, 0, 0.2862745, 1,
1.76716, -1.716221, 2.43892, 1, 0, 0.282353, 1,
1.775967, -0.321012, 0.4563294, 1, 0, 0.2745098, 1,
1.776292, -1.243582, 0.8584188, 1, 0, 0.2705882, 1,
1.822382, 0.7278727, 0.7781295, 1, 0, 0.2627451, 1,
1.824084, -0.08097414, 2.799965, 1, 0, 0.2588235, 1,
1.827744, 0.8285987, 1.705579, 1, 0, 0.2509804, 1,
1.829188, 0.1028344, 0.3886611, 1, 0, 0.2470588, 1,
1.830458, -0.7526053, 1.981494, 1, 0, 0.2392157, 1,
1.833436, 0.4536972, 2.049087, 1, 0, 0.2352941, 1,
1.849767, 1.34427, 0.2799717, 1, 0, 0.227451, 1,
1.850826, 0.0881377, 3.320477, 1, 0, 0.2235294, 1,
1.854439, -0.1412947, 2.484723, 1, 0, 0.2156863, 1,
1.856849, 1.029358, 2.47677, 1, 0, 0.2117647, 1,
1.86385, 0.4874884, 1.690023, 1, 0, 0.2039216, 1,
1.882851, -2.659026, 2.025925, 1, 0, 0.1960784, 1,
1.896522, -1.443756, 2.177313, 1, 0, 0.1921569, 1,
1.89904, 1.273566, 1.880785, 1, 0, 0.1843137, 1,
1.905986, -0.06241643, 2.150767, 1, 0, 0.1803922, 1,
1.907301, 0.7201935, 1.128955, 1, 0, 0.172549, 1,
1.927156, -0.3703586, 0.9195424, 1, 0, 0.1686275, 1,
2.007315, 1.064297, 0.5360943, 1, 0, 0.1607843, 1,
2.009502, -0.01577137, 1.602414, 1, 0, 0.1568628, 1,
2.014, 0.8584465, -0.2113272, 1, 0, 0.1490196, 1,
2.028785, -0.02198617, 1.077767, 1, 0, 0.145098, 1,
2.084345, -1.004772, 0.9901462, 1, 0, 0.1372549, 1,
2.087958, -1.142981, 2.683973, 1, 0, 0.1333333, 1,
2.089035, 0.6379967, 3.559287, 1, 0, 0.1254902, 1,
2.094701, 0.8261098, 2.684997, 1, 0, 0.1215686, 1,
2.118473, -1.498098, 2.488768, 1, 0, 0.1137255, 1,
2.142571, 0.6497619, 1.523846, 1, 0, 0.1098039, 1,
2.180421, 0.5001236, 2.61742, 1, 0, 0.1019608, 1,
2.209637, 1.090504, 1.783732, 1, 0, 0.09411765, 1,
2.223099, -0.5550122, 3.698298, 1, 0, 0.09019608, 1,
2.241421, 0.9681422, 1.02399, 1, 0, 0.08235294, 1,
2.245745, 1.347616, -0.7969607, 1, 0, 0.07843138, 1,
2.255649, 2.242625, 1.44049, 1, 0, 0.07058824, 1,
2.260611, 1.929924, 0.7094228, 1, 0, 0.06666667, 1,
2.326968, -0.4232315, 0.7409935, 1, 0, 0.05882353, 1,
2.403784, -0.4342515, 2.663364, 1, 0, 0.05490196, 1,
2.421448, 0.8978572, 0.1653806, 1, 0, 0.04705882, 1,
2.485826, 0.2408181, 1.775671, 1, 0, 0.04313726, 1,
2.58624, -0.5677387, 2.517045, 1, 0, 0.03529412, 1,
2.635769, 1.041172, -0.7627512, 1, 0, 0.03137255, 1,
2.726725, 0.2624778, 0.3531078, 1, 0, 0.02352941, 1,
2.745302, 0.8779535, 3.606498, 1, 0, 0.01960784, 1,
2.817962, 0.1418755, 0.5650643, 1, 0, 0.01176471, 1,
3.417576, 0.9429547, 0.06518689, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.03381336, -4.982263, -7.249536, 0, -0.5, 0.5, 0.5,
0.03381336, -4.982263, -7.249536, 1, -0.5, 0.5, 0.5,
0.03381336, -4.982263, -7.249536, 1, 1.5, 0.5, 0.5,
0.03381336, -4.982263, -7.249536, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.497045, -0.1487414, -7.249536, 0, -0.5, 0.5, 0.5,
-4.497045, -0.1487414, -7.249536, 1, -0.5, 0.5, 0.5,
-4.497045, -0.1487414, -7.249536, 1, 1.5, 0.5, 0.5,
-4.497045, -0.1487414, -7.249536, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.497045, -4.982263, 0.1275365, 0, -0.5, 0.5, 0.5,
-4.497045, -4.982263, 0.1275365, 1, -0.5, 0.5, 0.5,
-4.497045, -4.982263, 0.1275365, 1, 1.5, 0.5, 0.5,
-4.497045, -4.982263, 0.1275365, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.866835, -5.547135,
3, -3.866835, -5.547135,
-3, -3.866835, -5.547135,
-3, -4.05274, -5.830868,
-2, -3.866835, -5.547135,
-2, -4.05274, -5.830868,
-1, -3.866835, -5.547135,
-1, -4.05274, -5.830868,
0, -3.866835, -5.547135,
0, -4.05274, -5.830868,
1, -3.866835, -5.547135,
1, -4.05274, -5.830868,
2, -3.866835, -5.547135,
2, -4.05274, -5.830868,
3, -3.866835, -5.547135,
3, -4.05274, -5.830868
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -4.424549, -6.398335, 0, -0.5, 0.5, 0.5,
-3, -4.424549, -6.398335, 1, -0.5, 0.5, 0.5,
-3, -4.424549, -6.398335, 1, 1.5, 0.5, 0.5,
-3, -4.424549, -6.398335, 0, 1.5, 0.5, 0.5,
-2, -4.424549, -6.398335, 0, -0.5, 0.5, 0.5,
-2, -4.424549, -6.398335, 1, -0.5, 0.5, 0.5,
-2, -4.424549, -6.398335, 1, 1.5, 0.5, 0.5,
-2, -4.424549, -6.398335, 0, 1.5, 0.5, 0.5,
-1, -4.424549, -6.398335, 0, -0.5, 0.5, 0.5,
-1, -4.424549, -6.398335, 1, -0.5, 0.5, 0.5,
-1, -4.424549, -6.398335, 1, 1.5, 0.5, 0.5,
-1, -4.424549, -6.398335, 0, 1.5, 0.5, 0.5,
0, -4.424549, -6.398335, 0, -0.5, 0.5, 0.5,
0, -4.424549, -6.398335, 1, -0.5, 0.5, 0.5,
0, -4.424549, -6.398335, 1, 1.5, 0.5, 0.5,
0, -4.424549, -6.398335, 0, 1.5, 0.5, 0.5,
1, -4.424549, -6.398335, 0, -0.5, 0.5, 0.5,
1, -4.424549, -6.398335, 1, -0.5, 0.5, 0.5,
1, -4.424549, -6.398335, 1, 1.5, 0.5, 0.5,
1, -4.424549, -6.398335, 0, 1.5, 0.5, 0.5,
2, -4.424549, -6.398335, 0, -0.5, 0.5, 0.5,
2, -4.424549, -6.398335, 1, -0.5, 0.5, 0.5,
2, -4.424549, -6.398335, 1, 1.5, 0.5, 0.5,
2, -4.424549, -6.398335, 0, 1.5, 0.5, 0.5,
3, -4.424549, -6.398335, 0, -0.5, 0.5, 0.5,
3, -4.424549, -6.398335, 1, -0.5, 0.5, 0.5,
3, -4.424549, -6.398335, 1, 1.5, 0.5, 0.5,
3, -4.424549, -6.398335, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.451463, -2, -5.547135,
-3.451463, 2, -5.547135,
-3.451463, -2, -5.547135,
-3.625726, -2, -5.830868,
-3.451463, 0, -5.547135,
-3.625726, 0, -5.830868,
-3.451463, 2, -5.547135,
-3.625726, 2, -5.830868
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.974254, -2, -6.398335, 0, -0.5, 0.5, 0.5,
-3.974254, -2, -6.398335, 1, -0.5, 0.5, 0.5,
-3.974254, -2, -6.398335, 1, 1.5, 0.5, 0.5,
-3.974254, -2, -6.398335, 0, 1.5, 0.5, 0.5,
-3.974254, 0, -6.398335, 0, -0.5, 0.5, 0.5,
-3.974254, 0, -6.398335, 1, -0.5, 0.5, 0.5,
-3.974254, 0, -6.398335, 1, 1.5, 0.5, 0.5,
-3.974254, 0, -6.398335, 0, 1.5, 0.5, 0.5,
-3.974254, 2, -6.398335, 0, -0.5, 0.5, 0.5,
-3.974254, 2, -6.398335, 1, -0.5, 0.5, 0.5,
-3.974254, 2, -6.398335, 1, 1.5, 0.5, 0.5,
-3.974254, 2, -6.398335, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.451463, -3.866835, -4,
-3.451463, -3.866835, 4,
-3.451463, -3.866835, -4,
-3.625726, -4.05274, -4,
-3.451463, -3.866835, -2,
-3.625726, -4.05274, -2,
-3.451463, -3.866835, 0,
-3.625726, -4.05274, 0,
-3.451463, -3.866835, 2,
-3.625726, -4.05274, 2,
-3.451463, -3.866835, 4,
-3.625726, -4.05274, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.974254, -4.424549, -4, 0, -0.5, 0.5, 0.5,
-3.974254, -4.424549, -4, 1, -0.5, 0.5, 0.5,
-3.974254, -4.424549, -4, 1, 1.5, 0.5, 0.5,
-3.974254, -4.424549, -4, 0, 1.5, 0.5, 0.5,
-3.974254, -4.424549, -2, 0, -0.5, 0.5, 0.5,
-3.974254, -4.424549, -2, 1, -0.5, 0.5, 0.5,
-3.974254, -4.424549, -2, 1, 1.5, 0.5, 0.5,
-3.974254, -4.424549, -2, 0, 1.5, 0.5, 0.5,
-3.974254, -4.424549, 0, 0, -0.5, 0.5, 0.5,
-3.974254, -4.424549, 0, 1, -0.5, 0.5, 0.5,
-3.974254, -4.424549, 0, 1, 1.5, 0.5, 0.5,
-3.974254, -4.424549, 0, 0, 1.5, 0.5, 0.5,
-3.974254, -4.424549, 2, 0, -0.5, 0.5, 0.5,
-3.974254, -4.424549, 2, 1, -0.5, 0.5, 0.5,
-3.974254, -4.424549, 2, 1, 1.5, 0.5, 0.5,
-3.974254, -4.424549, 2, 0, 1.5, 0.5, 0.5,
-3.974254, -4.424549, 4, 0, -0.5, 0.5, 0.5,
-3.974254, -4.424549, 4, 1, -0.5, 0.5, 0.5,
-3.974254, -4.424549, 4, 1, 1.5, 0.5, 0.5,
-3.974254, -4.424549, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
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
16, 17, 18, 16, 18, 19
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
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.451463, -3.866835, -5.547135,
-3.451463, 3.569352, -5.547135,
-3.451463, -3.866835, 5.802208,
-3.451463, 3.569352, 5.802208,
-3.451463, -3.866835, -5.547135,
-3.451463, -3.866835, 5.802208,
-3.451463, 3.569352, -5.547135,
-3.451463, 3.569352, 5.802208,
-3.451463, -3.866835, -5.547135,
3.519089, -3.866835, -5.547135,
-3.451463, -3.866835, 5.802208,
3.519089, -3.866835, 5.802208,
-3.451463, 3.569352, -5.547135,
3.519089, 3.569352, -5.547135,
-3.451463, 3.569352, 5.802208,
3.519089, 3.569352, 5.802208,
3.519089, -3.866835, -5.547135,
3.519089, 3.569352, -5.547135,
3.519089, -3.866835, 5.802208,
3.519089, 3.569352, 5.802208,
3.519089, -3.866835, -5.547135,
3.519089, -3.866835, 5.802208,
3.519089, 3.569352, -5.547135,
3.519089, 3.569352, 5.802208
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
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
var radius = 8.145489;
var distance = 36.2402;
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
mvMatrix.translate( -0.03381336, 0.1487414, -0.1275365 );
mvMatrix.scale( 1.263467, 1.184352, 0.7759976 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.2402);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 8);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
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
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
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
}
while(currentElement = currentElement.offsetParent)
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
zoom[activeProjection[activeSubscene]] *= ds;
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

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
MCPB<-read.table("MCPB.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-MCPB$V2
```

```
## Error in eval(expr, envir, enclos): object 'MCPB' not found
```

```r
y<-MCPB$V3
```

```
## Error in eval(expr, envir, enclos): object 'MCPB' not found
```

```r
z<-MCPB$V4
```

```
## Error in eval(expr, envir, enclos): object 'MCPB' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
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
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
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
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
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
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.34995, 0.2086673, -0.8408695, 0, 0, 1, 1, 1,
-3.305727, -0.8407984, -1.239899, 1, 0, 0, 1, 1,
-3.118083, 0.3588333, -2.644113, 1, 0, 0, 1, 1,
-3.032138, 1.13518, -1.95841, 1, 0, 0, 1, 1,
-2.973123, -1.012987, -1.839285, 1, 0, 0, 1, 1,
-2.627686, 0.642517, -0.9628598, 1, 0, 0, 1, 1,
-2.565013, -0.6636794, -1.391437, 0, 0, 0, 1, 1,
-2.538369, 1.455629, -1.9267, 0, 0, 0, 1, 1,
-2.537933, 1.396795, -0.2363076, 0, 0, 0, 1, 1,
-2.319854, 0.2723181, -2.223968, 0, 0, 0, 1, 1,
-2.295781, 1.740449, -0.5712014, 0, 0, 0, 1, 1,
-2.26346, -1.212023, -0.3712511, 0, 0, 0, 1, 1,
-2.215858, -0.05124819, -1.853641, 0, 0, 0, 1, 1,
-2.187286, 0.533509, -0.3101589, 1, 1, 1, 1, 1,
-2.137496, -0.865155, -2.207754, 1, 1, 1, 1, 1,
-2.133696, -0.4048615, -2.91208, 1, 1, 1, 1, 1,
-2.133034, -1.082713, -3.129375, 1, 1, 1, 1, 1,
-2.003308, -1.218941, -2.238581, 1, 1, 1, 1, 1,
-1.971971, 0.4305591, -1.336591, 1, 1, 1, 1, 1,
-1.960019, 1.820054, -0.6518856, 1, 1, 1, 1, 1,
-1.958272, -1.55294, -2.092009, 1, 1, 1, 1, 1,
-1.933239, 0.121866, -4.599046, 1, 1, 1, 1, 1,
-1.929593, -0.9483712, -1.737997, 1, 1, 1, 1, 1,
-1.916131, -0.5315919, 0.8319149, 1, 1, 1, 1, 1,
-1.91528, 1.247546, -1.981743, 1, 1, 1, 1, 1,
-1.906758, 0.7505059, 0.9576623, 1, 1, 1, 1, 1,
-1.905317, -1.253919, -0.6201607, 1, 1, 1, 1, 1,
-1.89865, 0.01147784, -1.041108, 1, 1, 1, 1, 1,
-1.881544, -0.3877042, -3.881361, 0, 0, 1, 1, 1,
-1.859358, -1.957446, -1.500348, 1, 0, 0, 1, 1,
-1.851725, -0.9825773, -2.766506, 1, 0, 0, 1, 1,
-1.774909, 1.051635, -0.6747488, 1, 0, 0, 1, 1,
-1.76432, 0.6621583, 0.5937924, 1, 0, 0, 1, 1,
-1.737284, -0.2562577, -1.985162, 1, 0, 0, 1, 1,
-1.73037, -0.6526586, -1.95395, 0, 0, 0, 1, 1,
-1.72689, 1.409657, -1.243413, 0, 0, 0, 1, 1,
-1.722258, 0.03684454, -2.997118, 0, 0, 0, 1, 1,
-1.719901, 1.76832, 0.8776047, 0, 0, 0, 1, 1,
-1.685117, 0.407412, 0.7264751, 0, 0, 0, 1, 1,
-1.675787, -0.6124381, -2.189841, 0, 0, 0, 1, 1,
-1.672078, 0.2276089, -1.950961, 0, 0, 0, 1, 1,
-1.66256, 0.1676233, 0.06176171, 1, 1, 1, 1, 1,
-1.655319, 0.4662359, -1.296602, 1, 1, 1, 1, 1,
-1.652382, 2.277151, -1.496193, 1, 1, 1, 1, 1,
-1.651256, 0.3331828, -0.1286703, 1, 1, 1, 1, 1,
-1.609094, -0.002912322, -3.500742, 1, 1, 1, 1, 1,
-1.571929, -1.461144, -1.903461, 1, 1, 1, 1, 1,
-1.57186, 1.408175, -0.820341, 1, 1, 1, 1, 1,
-1.559042, 0.7465083, -0.8091326, 1, 1, 1, 1, 1,
-1.558096, 1.735468, -0.7312439, 1, 1, 1, 1, 1,
-1.542161, 0.1053955, -2.766957, 1, 1, 1, 1, 1,
-1.535407, -0.8019869, -0.7212418, 1, 1, 1, 1, 1,
-1.528602, 1.600705, 1.886151, 1, 1, 1, 1, 1,
-1.517713, -0.07151997, -2.264596, 1, 1, 1, 1, 1,
-1.492726, -0.5888397, -2.134137, 1, 1, 1, 1, 1,
-1.491743, 1.71396, -2.649745, 1, 1, 1, 1, 1,
-1.476739, 0.1170471, -0.9838379, 0, 0, 1, 1, 1,
-1.471451, 0.06535696, -2.994826, 1, 0, 0, 1, 1,
-1.467703, 0.8063285, -2.14613, 1, 0, 0, 1, 1,
-1.463699, 1.980411, -0.343607, 1, 0, 0, 1, 1,
-1.4598, -0.6266516, -1.630788, 1, 0, 0, 1, 1,
-1.438751, 0.6309875, -2.563568, 1, 0, 0, 1, 1,
-1.436824, -0.5765774, -1.338776, 0, 0, 0, 1, 1,
-1.410066, -0.1988351, -2.346783, 0, 0, 0, 1, 1,
-1.40283, 0.3975621, 0.2832794, 0, 0, 0, 1, 1,
-1.401692, 0.6431375, -1.429769, 0, 0, 0, 1, 1,
-1.390133, 0.1708321, -2.165961, 0, 0, 0, 1, 1,
-1.3849, -0.3785697, -1.760701, 0, 0, 0, 1, 1,
-1.368074, -0.5974668, -2.264745, 0, 0, 0, 1, 1,
-1.365977, -1.563183, -2.207525, 1, 1, 1, 1, 1,
-1.35913, -0.9786497, -1.48582, 1, 1, 1, 1, 1,
-1.35876, 1.005587, 0.4021606, 1, 1, 1, 1, 1,
-1.356311, 1.588992, 0.03852959, 1, 1, 1, 1, 1,
-1.356227, -0.3130696, -1.336117, 1, 1, 1, 1, 1,
-1.347862, 0.6254174, 0.7447725, 1, 1, 1, 1, 1,
-1.339768, 1.319873, -0.9809411, 1, 1, 1, 1, 1,
-1.339624, -1.753847, -0.0944623, 1, 1, 1, 1, 1,
-1.33927, -0.9241263, -0.251372, 1, 1, 1, 1, 1,
-1.335362, 0.222656, -2.212931, 1, 1, 1, 1, 1,
-1.33438, 2.440621, -1.104081, 1, 1, 1, 1, 1,
-1.332823, 1.997721, -1.051262, 1, 1, 1, 1, 1,
-1.3328, -1.598871, -0.4107466, 1, 1, 1, 1, 1,
-1.330444, 0.4869952, 0.1436257, 1, 1, 1, 1, 1,
-1.328048, -1.424103, -2.725955, 1, 1, 1, 1, 1,
-1.323764, 1.390524, 0.4235162, 0, 0, 1, 1, 1,
-1.31571, 1.647474, -0.4502891, 1, 0, 0, 1, 1,
-1.314024, 0.9912757, -1.883654, 1, 0, 0, 1, 1,
-1.313776, -1.392143, -2.196013, 1, 0, 0, 1, 1,
-1.307405, -0.531225, -0.9508272, 1, 0, 0, 1, 1,
-1.301682, 0.009134949, -2.881196, 1, 0, 0, 1, 1,
-1.299891, -1.155556, -2.967824, 0, 0, 0, 1, 1,
-1.290932, -1.243312, -2.619625, 0, 0, 0, 1, 1,
-1.287574, -0.8932974, -3.078543, 0, 0, 0, 1, 1,
-1.282453, -0.2077048, -1.187909, 0, 0, 0, 1, 1,
-1.276626, -0.1608196, -2.215001, 0, 0, 0, 1, 1,
-1.265051, 2.062102, 0.1003342, 0, 0, 0, 1, 1,
-1.263864, 2.066883, -2.802838, 0, 0, 0, 1, 1,
-1.263679, -0.1989133, -2.294762, 1, 1, 1, 1, 1,
-1.259875, 0.8386576, -1.618683, 1, 1, 1, 1, 1,
-1.255618, -0.4449147, -3.210249, 1, 1, 1, 1, 1,
-1.238984, -0.5177795, -2.116812, 1, 1, 1, 1, 1,
-1.222771, -0.6219435, -2.292128, 1, 1, 1, 1, 1,
-1.221581, -0.9758604, -1.740439, 1, 1, 1, 1, 1,
-1.213652, 0.3848329, -3.172647, 1, 1, 1, 1, 1,
-1.212544, -1.722852, -3.338933, 1, 1, 1, 1, 1,
-1.210658, 2.509492, -1.583325, 1, 1, 1, 1, 1,
-1.209921, -0.4171484, -2.223661, 1, 1, 1, 1, 1,
-1.207688, 0.11637, 1.114198, 1, 1, 1, 1, 1,
-1.205534, -1.143532, -1.711646, 1, 1, 1, 1, 1,
-1.200358, 0.2797343, -1.59615, 1, 1, 1, 1, 1,
-1.200137, 2.95861, -1.459537, 1, 1, 1, 1, 1,
-1.188086, 0.1741788, -0.7068619, 1, 1, 1, 1, 1,
-1.183408, 0.9373873, 1.880454, 0, 0, 1, 1, 1,
-1.180003, -1.356127, -3.286147, 1, 0, 0, 1, 1,
-1.17222, 1.632395, 1.119605, 1, 0, 0, 1, 1,
-1.169245, -1.263259, -0.927026, 1, 0, 0, 1, 1,
-1.154176, 0.2776348, -2.407868, 1, 0, 0, 1, 1,
-1.152434, 0.2967885, -2.800755, 1, 0, 0, 1, 1,
-1.148186, -0.8109699, -0.4984853, 0, 0, 0, 1, 1,
-1.140895, -0.4992721, -2.670314, 0, 0, 0, 1, 1,
-1.139641, 1.318853, 0.135665, 0, 0, 0, 1, 1,
-1.134202, 1.126953, 0.565271, 0, 0, 0, 1, 1,
-1.131247, 1.446334, -1.76999, 0, 0, 0, 1, 1,
-1.129076, 0.1069137, -1.564496, 0, 0, 0, 1, 1,
-1.124509, -0.1283785, -0.8047992, 0, 0, 0, 1, 1,
-1.113564, 1.119744, -0.7160953, 1, 1, 1, 1, 1,
-1.112661, -0.5383573, -1.912069, 1, 1, 1, 1, 1,
-1.111729, -0.09038465, -1.990781, 1, 1, 1, 1, 1,
-1.110874, -0.9053815, -0.2189932, 1, 1, 1, 1, 1,
-1.109527, 1.180379, -1.25974, 1, 1, 1, 1, 1,
-1.103855, -0.9252517, -1.844716, 1, 1, 1, 1, 1,
-1.103823, -0.006590456, -1.771859, 1, 1, 1, 1, 1,
-1.103526, -0.4080012, -2.362233, 1, 1, 1, 1, 1,
-1.098591, -0.9280002, -3.363603, 1, 1, 1, 1, 1,
-1.098302, -1.192966, -3.992746, 1, 1, 1, 1, 1,
-1.097872, 0.4292779, -1.659969, 1, 1, 1, 1, 1,
-1.093745, -1.69166, -4.341711, 1, 1, 1, 1, 1,
-1.091995, 0.5136226, -1.987449, 1, 1, 1, 1, 1,
-1.090795, -0.805132, -1.53212, 1, 1, 1, 1, 1,
-1.087667, 0.06396002, -0.8692409, 1, 1, 1, 1, 1,
-1.081212, -1.087601, -2.928075, 0, 0, 1, 1, 1,
-1.080524, -0.849094, -3.176543, 1, 0, 0, 1, 1,
-1.075126, -1.120947, -3.763592, 1, 0, 0, 1, 1,
-1.07212, 0.1566455, -1.81003, 1, 0, 0, 1, 1,
-1.064265, 0.5327872, -1.207289, 1, 0, 0, 1, 1,
-1.055147, 0.4216757, -0.4302117, 1, 0, 0, 1, 1,
-1.049504, -1.126674, -1.389007, 0, 0, 0, 1, 1,
-1.048953, -0.7264854, -1.201635, 0, 0, 0, 1, 1,
-1.045816, -1.030398, -2.36859, 0, 0, 0, 1, 1,
-1.04541, 0.3020205, -2.110111, 0, 0, 0, 1, 1,
-1.038045, -0.08244482, -2.924514, 0, 0, 0, 1, 1,
-1.033009, 1.76248, 0.6558174, 0, 0, 0, 1, 1,
-1.03212, 1.224096, -1.860679, 0, 0, 0, 1, 1,
-1.019046, -0.7900525, -4.365033, 1, 1, 1, 1, 1,
-1.017392, -0.5207793, -2.842135, 1, 1, 1, 1, 1,
-1.013585, 0.07932188, -1.111608, 1, 1, 1, 1, 1,
-1.011901, 0.04551247, -2.985233, 1, 1, 1, 1, 1,
-1.005319, 0.40034, -0.1836471, 1, 1, 1, 1, 1,
-1.004345, -0.6060694, -0.2857961, 1, 1, 1, 1, 1,
-0.9961213, -0.01136582, -3.31187, 1, 1, 1, 1, 1,
-0.9960157, 1.249202, -0.6751734, 1, 1, 1, 1, 1,
-0.9920388, 0.9899887, -0.784586, 1, 1, 1, 1, 1,
-0.9831371, -0.9455776, -2.050408, 1, 1, 1, 1, 1,
-0.9768627, -1.388635, -2.624797, 1, 1, 1, 1, 1,
-0.9618437, 0.3870106, 0.9184891, 1, 1, 1, 1, 1,
-0.9570363, 0.09087984, -1.958815, 1, 1, 1, 1, 1,
-0.9561096, -0.7802387, -3.400724, 1, 1, 1, 1, 1,
-0.9550582, 0.07584648, -1.222231, 1, 1, 1, 1, 1,
-0.9538884, 1.215055, -2.283192, 0, 0, 1, 1, 1,
-0.9478936, -0.6465745, -0.5350955, 1, 0, 0, 1, 1,
-0.9464729, 1.327164, -0.8567966, 1, 0, 0, 1, 1,
-0.9458105, -0.163295, -1.963831, 1, 0, 0, 1, 1,
-0.9445534, -0.001319585, -2.005883, 1, 0, 0, 1, 1,
-0.9419407, -1.747865, -3.13567, 1, 0, 0, 1, 1,
-0.9410098, 0.5918255, -1.553917, 0, 0, 0, 1, 1,
-0.9306717, 0.393127, 0.4649886, 0, 0, 0, 1, 1,
-0.9304485, 0.3808748, -2.056695, 0, 0, 0, 1, 1,
-0.9251169, 0.2614796, -0.8142932, 0, 0, 0, 1, 1,
-0.9223847, 1.382731, -2.140491, 0, 0, 0, 1, 1,
-0.9205386, 1.759421, -1.755689, 0, 0, 0, 1, 1,
-0.9199654, -0.06200776, -1.475232, 0, 0, 0, 1, 1,
-0.9155374, 1.026794, -0.6627722, 1, 1, 1, 1, 1,
-0.9149445, -0.03056535, -2.486681, 1, 1, 1, 1, 1,
-0.9142983, -2.930931, -1.965482, 1, 1, 1, 1, 1,
-0.9042735, 1.00086, 1.115741, 1, 1, 1, 1, 1,
-0.9025297, 3.461058, 0.2059026, 1, 1, 1, 1, 1,
-0.9002275, -1.706034, -2.922361, 1, 1, 1, 1, 1,
-0.8980101, 0.5855935, -0.4282799, 1, 1, 1, 1, 1,
-0.8965815, -2.71849, -1.761575, 1, 1, 1, 1, 1,
-0.8962345, -0.2411279, -1.482197, 1, 1, 1, 1, 1,
-0.8962013, -0.1613461, -2.622034, 1, 1, 1, 1, 1,
-0.8849082, 1.371831, 0.3422511, 1, 1, 1, 1, 1,
-0.8845131, 2.184654, -2.268418, 1, 1, 1, 1, 1,
-0.8696737, 1.267643, -1.500301, 1, 1, 1, 1, 1,
-0.8655072, 0.341206, -0.9592558, 1, 1, 1, 1, 1,
-0.8640721, 2.025208, 1.703129, 1, 1, 1, 1, 1,
-0.8597127, 0.5507131, 0.3940663, 0, 0, 1, 1, 1,
-0.8586191, -0.103878, -1.849011, 1, 0, 0, 1, 1,
-0.8556464, -2.317071, -1.973149, 1, 0, 0, 1, 1,
-0.8474652, 0.2870145, -0.4091064, 1, 0, 0, 1, 1,
-0.8429329, 0.3867282, -2.121514, 1, 0, 0, 1, 1,
-0.8428955, 0.0802334, -1.394615, 1, 0, 0, 1, 1,
-0.8367946, -0.1738676, -1.902005, 0, 0, 0, 1, 1,
-0.8234107, 1.474665, -0.9288223, 0, 0, 0, 1, 1,
-0.8219758, 0.9042847, -2.734686, 0, 0, 0, 1, 1,
-0.8211084, 0.6551876, -2.03653, 0, 0, 0, 1, 1,
-0.8201634, -1.456454, -3.452737, 0, 0, 0, 1, 1,
-0.81802, 0.381258, -2.711948, 0, 0, 0, 1, 1,
-0.8171751, 0.6107331, -1.232396, 0, 0, 0, 1, 1,
-0.8166014, -1.016048, -3.853669, 1, 1, 1, 1, 1,
-0.8088838, 1.059483, -1.482093, 1, 1, 1, 1, 1,
-0.8082968, 1.316331, -1.031187, 1, 1, 1, 1, 1,
-0.804666, 0.1202591, -1.671209, 1, 1, 1, 1, 1,
-0.8018366, 0.7772573, -0.9272068, 1, 1, 1, 1, 1,
-0.7934959, 0.2849782, -0.8030387, 1, 1, 1, 1, 1,
-0.7872142, 0.1675626, 0.2078094, 1, 1, 1, 1, 1,
-0.7828189, 0.4055645, 0.07526423, 1, 1, 1, 1, 1,
-0.7810327, -1.049943, -1.660272, 1, 1, 1, 1, 1,
-0.7808272, -0.6661656, -2.145045, 1, 1, 1, 1, 1,
-0.7789786, -0.7334167, -2.248415, 1, 1, 1, 1, 1,
-0.7775959, 1.388975, -0.5453062, 1, 1, 1, 1, 1,
-0.7696896, -1.503073, -2.846071, 1, 1, 1, 1, 1,
-0.7663919, 0.1844409, -0.1938127, 1, 1, 1, 1, 1,
-0.7638805, 0.9800682, -0.3818396, 1, 1, 1, 1, 1,
-0.7635306, 1.860573, 1.046668, 0, 0, 1, 1, 1,
-0.7620397, 0.5702273, -0.6521389, 1, 0, 0, 1, 1,
-0.7607229, -0.7201871, -1.997551, 1, 0, 0, 1, 1,
-0.757094, -0.7120997, -2.406349, 1, 0, 0, 1, 1,
-0.7563089, 1.613398, 0.1059012, 1, 0, 0, 1, 1,
-0.7560768, 0.06503342, -0.652333, 1, 0, 0, 1, 1,
-0.7560727, 0.6534963, 0.509876, 0, 0, 0, 1, 1,
-0.7536484, 0.9426656, 1.853755, 0, 0, 0, 1, 1,
-0.7515241, 0.11303, -2.518329, 0, 0, 0, 1, 1,
-0.7513682, 0.5360862, -1.596532, 0, 0, 0, 1, 1,
-0.7474654, 0.9001305, 0.06671724, 0, 0, 0, 1, 1,
-0.7457496, -1.1501, -1.240136, 0, 0, 0, 1, 1,
-0.7445725, -0.3814216, -2.096261, 0, 0, 0, 1, 1,
-0.7431278, 0.8661872, 0.1618216, 1, 1, 1, 1, 1,
-0.7398955, -1.240997, -2.714206, 1, 1, 1, 1, 1,
-0.7363624, 0.9556792, -0.74712, 1, 1, 1, 1, 1,
-0.7346989, 0.2984455, 0.09249166, 1, 1, 1, 1, 1,
-0.722254, 1.594043, 0.1445365, 1, 1, 1, 1, 1,
-0.7215144, 0.1242924, -2.490629, 1, 1, 1, 1, 1,
-0.7215099, -0.6682152, -0.9435714, 1, 1, 1, 1, 1,
-0.7194592, -0.9248204, -2.591604, 1, 1, 1, 1, 1,
-0.7193953, -0.07619981, -1.424694, 1, 1, 1, 1, 1,
-0.7184995, 0.05964692, -0.8855445, 1, 1, 1, 1, 1,
-0.7162937, -1.733409, -2.919892, 1, 1, 1, 1, 1,
-0.7079292, -0.6306774, -3.460059, 1, 1, 1, 1, 1,
-0.7051712, 0.9032521, -0.5930235, 1, 1, 1, 1, 1,
-0.7027532, 0.08921491, -3.539655, 1, 1, 1, 1, 1,
-0.7020484, 2.481002, -0.252969, 1, 1, 1, 1, 1,
-0.7014702, -0.7865956, -2.975459, 0, 0, 1, 1, 1,
-0.6989497, 0.5851737, 0.1825475, 1, 0, 0, 1, 1,
-0.6927474, -0.02347421, -1.656962, 1, 0, 0, 1, 1,
-0.6881552, -1.335219, -4.06326, 1, 0, 0, 1, 1,
-0.6865093, -1.244449, -3.107783, 1, 0, 0, 1, 1,
-0.68328, -0.3646072, -1.970755, 1, 0, 0, 1, 1,
-0.6815795, -1.334897, -2.984684, 0, 0, 0, 1, 1,
-0.6807635, 0.3458153, -1.555926, 0, 0, 0, 1, 1,
-0.6782324, 0.4031777, -1.536147, 0, 0, 0, 1, 1,
-0.6762293, 0.4832047, -2.542299, 0, 0, 0, 1, 1,
-0.6745076, -1.32342, -1.542017, 0, 0, 0, 1, 1,
-0.6727223, -1.586588, -0.5433949, 0, 0, 0, 1, 1,
-0.6694322, 1.216289, 1.77462, 0, 0, 0, 1, 1,
-0.6639952, -0.1287203, -1.741417, 1, 1, 1, 1, 1,
-0.663295, -0.2852228, -2.212067, 1, 1, 1, 1, 1,
-0.6627452, -1.006783, -2.400874, 1, 1, 1, 1, 1,
-0.6597914, -2.156963, -3.384868, 1, 1, 1, 1, 1,
-0.6585857, -0.5134039, -1.280192, 1, 1, 1, 1, 1,
-0.657418, 0.2782791, -0.8793431, 1, 1, 1, 1, 1,
-0.6531665, 0.9110799, 0.1861641, 1, 1, 1, 1, 1,
-0.631224, -0.712211, -3.481292, 1, 1, 1, 1, 1,
-0.6294047, -0.9259177, -2.259511, 1, 1, 1, 1, 1,
-0.6285192, -0.1966658, -2.613231, 1, 1, 1, 1, 1,
-0.6230892, 0.119325, -1.196884, 1, 1, 1, 1, 1,
-0.6156787, -0.4534142, -2.252677, 1, 1, 1, 1, 1,
-0.6150028, 0.938406, 0.8914659, 1, 1, 1, 1, 1,
-0.613035, -1.163401, -1.974025, 1, 1, 1, 1, 1,
-0.6092609, 0.6125298, -0.2074172, 1, 1, 1, 1, 1,
-0.6064966, -0.5169042, -2.726395, 0, 0, 1, 1, 1,
-0.6040081, 1.103278, -0.09051605, 1, 0, 0, 1, 1,
-0.6036575, -0.2796458, -2.618812, 1, 0, 0, 1, 1,
-0.6030415, 0.2718262, -1.201252, 1, 0, 0, 1, 1,
-0.5974439, 0.4812458, -1.423038, 1, 0, 0, 1, 1,
-0.5953102, -1.42984, -2.80628, 1, 0, 0, 1, 1,
-0.5949079, -0.679347, -4.38435, 0, 0, 0, 1, 1,
-0.5940854, -0.3714643, -3.075887, 0, 0, 0, 1, 1,
-0.5938054, 0.3283621, -0.4772952, 0, 0, 0, 1, 1,
-0.5847784, 0.2321294, -1.243601, 0, 0, 0, 1, 1,
-0.584152, 1.062567, 0.2697603, 0, 0, 0, 1, 1,
-0.5809537, 0.9653577, -0.173594, 0, 0, 0, 1, 1,
-0.5783585, 0.7194355, -0.9944975, 0, 0, 0, 1, 1,
-0.57544, -1.163715, -2.810975, 1, 1, 1, 1, 1,
-0.5716103, -0.2808254, -2.087228, 1, 1, 1, 1, 1,
-0.5700249, -0.6951523, -1.274659, 1, 1, 1, 1, 1,
-0.5597554, -0.4411826, -4.649966, 1, 1, 1, 1, 1,
-0.5580682, 0.7373737, -0.887592, 1, 1, 1, 1, 1,
-0.5567957, 0.8190622, 1.034573, 1, 1, 1, 1, 1,
-0.5566759, -0.5945001, -3.731157, 1, 1, 1, 1, 1,
-0.5540897, 0.1704826, -0.2394292, 1, 1, 1, 1, 1,
-0.5520798, 0.9526686, 0.3112525, 1, 1, 1, 1, 1,
-0.5486227, -0.5922791, -2.336135, 1, 1, 1, 1, 1,
-0.5469779, -0.640343, -2.623613, 1, 1, 1, 1, 1,
-0.5453706, -0.6409581, -4.263553, 1, 1, 1, 1, 1,
-0.543928, -1.664111, -3.931867, 1, 1, 1, 1, 1,
-0.5266224, -1.014778, -3.019201, 1, 1, 1, 1, 1,
-0.524944, 0.9723167, 0.06644628, 1, 1, 1, 1, 1,
-0.5213658, 0.1712022, -0.7049394, 0, 0, 1, 1, 1,
-0.5184568, -0.319148, -1.875862, 1, 0, 0, 1, 1,
-0.5145288, 0.4735844, -0.4179317, 1, 0, 0, 1, 1,
-0.5142553, -1.150992, -1.940633, 1, 0, 0, 1, 1,
-0.5141059, -1.496412, -2.782259, 1, 0, 0, 1, 1,
-0.5117947, 0.1708922, -2.122687, 1, 0, 0, 1, 1,
-0.5069181, 0.7645264, -0.504366, 0, 0, 0, 1, 1,
-0.5068325, 0.3966035, 0.5376168, 0, 0, 0, 1, 1,
-0.5068274, -0.231236, 0.1778476, 0, 0, 0, 1, 1,
-0.5008057, -1.668501, -2.065458, 0, 0, 0, 1, 1,
-0.4982663, -0.3298756, -1.882051, 0, 0, 0, 1, 1,
-0.49809, -0.8134407, -5.224619, 0, 0, 0, 1, 1,
-0.4967735, -2.019335, -4.426508, 0, 0, 0, 1, 1,
-0.4887839, -2.082236, -2.597397, 1, 1, 1, 1, 1,
-0.4869693, 0.2649914, -1.635969, 1, 1, 1, 1, 1,
-0.4831693, -1.755046, -3.653021, 1, 1, 1, 1, 1,
-0.4783084, -0.2614785, -1.443949, 1, 1, 1, 1, 1,
-0.4775313, -0.4226258, -2.14476, 1, 1, 1, 1, 1,
-0.4763006, -0.04022952, -0.7828264, 1, 1, 1, 1, 1,
-0.4760449, 0.1287076, -0.7090077, 1, 1, 1, 1, 1,
-0.4740612, 0.2812133, -0.04326382, 1, 1, 1, 1, 1,
-0.4712853, -1.075644, -2.469658, 1, 1, 1, 1, 1,
-0.4665774, -0.08452993, -3.764703, 1, 1, 1, 1, 1,
-0.4567337, -1.658402, -4.03553, 1, 1, 1, 1, 1,
-0.4509784, -1.562006, -1.690072, 1, 1, 1, 1, 1,
-0.4494812, -0.9664268, -3.887653, 1, 1, 1, 1, 1,
-0.446003, -0.3434795, -1.882984, 1, 1, 1, 1, 1,
-0.4427848, 0.1635761, -1.083714, 1, 1, 1, 1, 1,
-0.433362, -0.06966239, -2.344629, 0, 0, 1, 1, 1,
-0.4316989, 1.028808, 1.147175, 1, 0, 0, 1, 1,
-0.4314454, 0.2394076, 0.6018665, 1, 0, 0, 1, 1,
-0.4314374, 0.02142666, -2.631057, 1, 0, 0, 1, 1,
-0.4282876, 0.3601264, -1.22488, 1, 0, 0, 1, 1,
-0.4211182, -1.084092, -2.001079, 1, 0, 0, 1, 1,
-0.4205925, -2.072711, -2.146925, 0, 0, 0, 1, 1,
-0.4173437, -1.241633, -3.614816, 0, 0, 0, 1, 1,
-0.4160123, 0.9809976, -2.080935, 0, 0, 0, 1, 1,
-0.4145561, 0.5611691, 0.2581607, 0, 0, 0, 1, 1,
-0.4110398, 0.9816278, -0.4877647, 0, 0, 0, 1, 1,
-0.4105383, 0.2742482, -2.305669, 0, 0, 0, 1, 1,
-0.4102992, 0.8676628, 1.409577, 0, 0, 0, 1, 1,
-0.406988, -0.7302495, -5.193373, 1, 1, 1, 1, 1,
-0.4002846, -0.6630301, -2.216362, 1, 1, 1, 1, 1,
-0.3953546, -0.3718956, -1.74431, 1, 1, 1, 1, 1,
-0.3952864, 0.7740948, -0.7814826, 1, 1, 1, 1, 1,
-0.3940032, 1.156943, -1.848163, 1, 1, 1, 1, 1,
-0.3829983, -0.3169157, -1.657403, 1, 1, 1, 1, 1,
-0.3775298, 0.728523, -0.4728242, 1, 1, 1, 1, 1,
-0.3686349, 0.8910592, -0.936541, 1, 1, 1, 1, 1,
-0.36857, -0.2604677, -2.643881, 1, 1, 1, 1, 1,
-0.3578645, -1.235897, -1.816505, 1, 1, 1, 1, 1,
-0.3523769, -0.3419242, -4.262742, 1, 1, 1, 1, 1,
-0.3512146, -0.2657799, -2.148115, 1, 1, 1, 1, 1,
-0.3431096, -0.8216027, -2.031106, 1, 1, 1, 1, 1,
-0.3417437, -0.9235556, -5.381853, 1, 1, 1, 1, 1,
-0.336387, -2.20796, -2.980673, 1, 1, 1, 1, 1,
-0.3352686, -0.01615287, -2.27197, 0, 0, 1, 1, 1,
-0.3309618, 1.3532, -0.03262227, 1, 0, 0, 1, 1,
-0.3301183, 0.07580795, 0.7516852, 1, 0, 0, 1, 1,
-0.3255228, -0.5649121, -1.499297, 1, 0, 0, 1, 1,
-0.3254339, -1.132001, -4.264357, 1, 0, 0, 1, 1,
-0.3229638, 0.1176738, -0.6908888, 1, 0, 0, 1, 1,
-0.3219877, 0.119609, -1.104803, 0, 0, 0, 1, 1,
-0.3215227, 0.5904584, 1.479696, 0, 0, 0, 1, 1,
-0.3199508, 0.3135557, -0.1529902, 0, 0, 0, 1, 1,
-0.3180839, 0.07769983, -2.373586, 0, 0, 0, 1, 1,
-0.3130531, 0.436591, -0.04713508, 0, 0, 0, 1, 1,
-0.3091798, 1.824401, -0.9599604, 0, 0, 0, 1, 1,
-0.3076062, -0.8154978, -4.819538, 0, 0, 0, 1, 1,
-0.3069246, -0.6753794, -1.364886, 1, 1, 1, 1, 1,
-0.3061908, 0.1869616, -0.3317515, 1, 1, 1, 1, 1,
-0.3051508, -0.5640301, -3.847341, 1, 1, 1, 1, 1,
-0.3038619, -1.004821, -2.312445, 1, 1, 1, 1, 1,
-0.3029975, 0.5972987, 0.3582868, 1, 1, 1, 1, 1,
-0.2982998, -0.1919624, -2.079122, 1, 1, 1, 1, 1,
-0.2963307, 0.7502772, 0.08243284, 1, 1, 1, 1, 1,
-0.2922531, 0.5828755, -0.12049, 1, 1, 1, 1, 1,
-0.2919307, -1.771152, -2.715939, 1, 1, 1, 1, 1,
-0.2900831, 0.0646698, -2.907628, 1, 1, 1, 1, 1,
-0.2899282, -0.1603721, -1.612504, 1, 1, 1, 1, 1,
-0.2852887, 0.04436346, -1.971231, 1, 1, 1, 1, 1,
-0.2830651, -0.9584318, -2.462602, 1, 1, 1, 1, 1,
-0.2824449, -1.369425, -2.396893, 1, 1, 1, 1, 1,
-0.2771274, -0.4901994, -3.17713, 1, 1, 1, 1, 1,
-0.2753594, 0.6274427, 0.1750447, 0, 0, 1, 1, 1,
-0.2750341, 1.244934, 0.1969759, 1, 0, 0, 1, 1,
-0.2745853, 2.342206, -1.173806, 1, 0, 0, 1, 1,
-0.2702439, -0.3649864, -4.002157, 1, 0, 0, 1, 1,
-0.2623703, 0.8121663, 0.9962741, 1, 0, 0, 1, 1,
-0.2590648, -0.1726152, -1.427976, 1, 0, 0, 1, 1,
-0.2522057, 0.6669824, -0.3478711, 0, 0, 0, 1, 1,
-0.2509953, 2.204208, 1.395457, 0, 0, 0, 1, 1,
-0.247543, -0.5631909, -3.663098, 0, 0, 0, 1, 1,
-0.2452987, 2.113297, 0.4507919, 0, 0, 0, 1, 1,
-0.2451413, -0.6967282, -2.578941, 0, 0, 0, 1, 1,
-0.2422167, -0.104542, -4.506344, 0, 0, 0, 1, 1,
-0.2410304, -0.03984452, -1.718799, 0, 0, 0, 1, 1,
-0.2383441, 0.03352172, -1.520552, 1, 1, 1, 1, 1,
-0.2357041, -0.5923263, -2.199515, 1, 1, 1, 1, 1,
-0.2351248, 0.6848695, 0.3380592, 1, 1, 1, 1, 1,
-0.2348847, 0.05319382, -0.9442226, 1, 1, 1, 1, 1,
-0.2340484, 0.5504368, -0.9284014, 1, 1, 1, 1, 1,
-0.2293746, 0.4266315, -0.7212678, 1, 1, 1, 1, 1,
-0.2267364, 0.619945, 1.047772, 1, 1, 1, 1, 1,
-0.2247424, 1.809751, -0.1477252, 1, 1, 1, 1, 1,
-0.2218382, 0.4306435, -1.843368, 1, 1, 1, 1, 1,
-0.2156723, -0.8202564, -2.09664, 1, 1, 1, 1, 1,
-0.2113725, 0.2588795, -2.215665, 1, 1, 1, 1, 1,
-0.2105286, 0.2230063, -1.303767, 1, 1, 1, 1, 1,
-0.2086837, -0.1066269, -1.853889, 1, 1, 1, 1, 1,
-0.2084019, 0.7070691, -0.4199743, 1, 1, 1, 1, 1,
-0.2077842, 0.3984774, 1.340881, 1, 1, 1, 1, 1,
-0.2075615, 0.0562028, -0.1717441, 0, 0, 1, 1, 1,
-0.207343, -0.2907167, -1.84483, 1, 0, 0, 1, 1,
-0.2071955, 2.285697, -0.794651, 1, 0, 0, 1, 1,
-0.2061478, 0.7350379, 0.2350553, 1, 0, 0, 1, 1,
-0.2047588, -1.348349, -2.396816, 1, 0, 0, 1, 1,
-0.2010307, 0.04026221, -0.7787262, 1, 0, 0, 1, 1,
-0.1960313, -2.203342, -4.734521, 0, 0, 0, 1, 1,
-0.1915508, 2.184826, 0.6051479, 0, 0, 0, 1, 1,
-0.1908642, -1.083205, -3.272974, 0, 0, 0, 1, 1,
-0.189412, 0.8117357, 0.3023318, 0, 0, 0, 1, 1,
-0.1890571, 0.9702687, 0.9451939, 0, 0, 0, 1, 1,
-0.1880894, 1.875818, -0.008098914, 0, 0, 0, 1, 1,
-0.1864141, -0.7133834, -4.123503, 0, 0, 0, 1, 1,
-0.1860898, -0.3296315, -2.058804, 1, 1, 1, 1, 1,
-0.1828271, 0.5719017, 0.6816558, 1, 1, 1, 1, 1,
-0.1806773, -0.2079127, -1.110967, 1, 1, 1, 1, 1,
-0.1784822, 0.8070712, -0.910809, 1, 1, 1, 1, 1,
-0.170917, -0.05358579, -3.208679, 1, 1, 1, 1, 1,
-0.169056, 1.081624, 0.3241924, 1, 1, 1, 1, 1,
-0.1653318, 0.2483457, -0.3973571, 1, 1, 1, 1, 1,
-0.1635618, 0.3677575, -0.9283323, 1, 1, 1, 1, 1,
-0.1604767, -0.6092283, -2.567617, 1, 1, 1, 1, 1,
-0.1603246, 0.04407576, -3.468808, 1, 1, 1, 1, 1,
-0.1596537, 0.6300889, 0.1537546, 1, 1, 1, 1, 1,
-0.1506204, -1.227291, -3.736294, 1, 1, 1, 1, 1,
-0.1505155, 0.8602887, -1.548902, 1, 1, 1, 1, 1,
-0.1504309, -0.6153859, -2.781107, 1, 1, 1, 1, 1,
-0.1464825, -1.221129, -3.066508, 1, 1, 1, 1, 1,
-0.1420607, 0.6235482, 0.7962316, 0, 0, 1, 1, 1,
-0.1410432, 0.4666432, -0.1039061, 1, 0, 0, 1, 1,
-0.1394673, -0.3458999, -2.40699, 1, 0, 0, 1, 1,
-0.1350742, -0.8324081, -3.906962, 1, 0, 0, 1, 1,
-0.1336563, -0.1689777, -2.348646, 1, 0, 0, 1, 1,
-0.1333146, -0.7500309, -4.40883, 1, 0, 0, 1, 1,
-0.1323071, -0.2522439, -2.364856, 0, 0, 0, 1, 1,
-0.1290709, -0.03894719, -1.34322, 0, 0, 0, 1, 1,
-0.1245692, 0.9397575, -1.569426, 0, 0, 0, 1, 1,
-0.123292, -0.536752, -2.641093, 0, 0, 0, 1, 1,
-0.1197387, 1.974517, -1.127645, 0, 0, 0, 1, 1,
-0.1193025, -1.554532, -3.776141, 0, 0, 0, 1, 1,
-0.1192768, 0.8430843, -0.2575036, 0, 0, 0, 1, 1,
-0.1129814, -0.6303802, -3.844679, 1, 1, 1, 1, 1,
-0.1113544, -0.761591, -1.529536, 1, 1, 1, 1, 1,
-0.111002, 0.2280154, -1.102964, 1, 1, 1, 1, 1,
-0.10692, 1.6241, -0.3004515, 1, 1, 1, 1, 1,
-0.1065738, 1.028875, 0.4556911, 1, 1, 1, 1, 1,
-0.1059362, -0.4067445, -2.656844, 1, 1, 1, 1, 1,
-0.09564546, -0.3403398, -3.400904, 1, 1, 1, 1, 1,
-0.09510045, 0.4615519, 1.538335, 1, 1, 1, 1, 1,
-0.09350719, -0.2978033, -3.948564, 1, 1, 1, 1, 1,
-0.08440371, 0.7021763, -0.5701984, 1, 1, 1, 1, 1,
-0.08316386, -0.316688, -5.137447, 1, 1, 1, 1, 1,
-0.0827043, 0.8709064, -0.2045227, 1, 1, 1, 1, 1,
-0.07562514, 0.5147703, -0.359352, 1, 1, 1, 1, 1,
-0.07474767, 0.4163231, -1.086783, 1, 1, 1, 1, 1,
-0.07313497, -0.1064209, -1.391511, 1, 1, 1, 1, 1,
-0.07103127, 0.1875262, -0.03252147, 0, 0, 1, 1, 1,
-0.07049383, -0.8389471, -3.264783, 1, 0, 0, 1, 1,
-0.06974519, -1.149422, -2.667993, 1, 0, 0, 1, 1,
-0.06951706, 0.318103, -2.402662, 1, 0, 0, 1, 1,
-0.06894032, 0.4507909, 0.5484862, 1, 0, 0, 1, 1,
-0.06284797, 0.3448115, -0.1197423, 1, 0, 0, 1, 1,
-0.06050455, 1.255471, 0.8843811, 0, 0, 0, 1, 1,
-0.05941888, -1.78929, -3.596863, 0, 0, 0, 1, 1,
-0.05890639, -1.505104, -0.8063882, 0, 0, 0, 1, 1,
-0.05529295, -0.9156546, -4.006984, 0, 0, 0, 1, 1,
-0.05490424, 1.12993, -1.087542, 0, 0, 0, 1, 1,
-0.05206937, 0.2140895, -0.3712992, 0, 0, 0, 1, 1,
-0.04882254, 0.4371691, 0.675292, 0, 0, 0, 1, 1,
-0.04853167, -1.802867, -1.291389, 1, 1, 1, 1, 1,
-0.04200607, -2.063983, -3.846522, 1, 1, 1, 1, 1,
-0.03886918, 0.8112947, -0.1440978, 1, 1, 1, 1, 1,
-0.03831891, -1.165799, -1.763228, 1, 1, 1, 1, 1,
-0.03602871, 0.30759, 0.861773, 1, 1, 1, 1, 1,
-0.03345566, 1.720352, 0.6382089, 1, 1, 1, 1, 1,
-0.02865376, 0.578225, 0.2319469, 1, 1, 1, 1, 1,
-0.02757813, 2.318746, -0.4900267, 1, 1, 1, 1, 1,
-0.02520381, 0.2375643, 0.08838306, 1, 1, 1, 1, 1,
-0.02223703, -0.9868066, -3.978718, 1, 1, 1, 1, 1,
-0.01812096, -2.227629, -2.589147, 1, 1, 1, 1, 1,
-0.01768091, 0.2475624, 0.2195337, 1, 1, 1, 1, 1,
-0.01751844, 0.03616999, -0.7641624, 1, 1, 1, 1, 1,
-0.01338081, 1.001381, 0.9245955, 1, 1, 1, 1, 1,
-0.00945553, 1.8865, 0.4822698, 1, 1, 1, 1, 1,
-0.007495727, -0.1257222, -2.18741, 0, 0, 1, 1, 1,
-0.001497334, -0.7018949, -4.631803, 1, 0, 0, 1, 1,
-0.0008406053, -0.321186, -4.721562, 1, 0, 0, 1, 1,
0.002729122, -2.770117, 2.378545, 1, 0, 0, 1, 1,
0.009649258, -2.731369, 3.883418, 1, 0, 0, 1, 1,
0.01302857, -0.5020658, 4.121601, 1, 0, 0, 1, 1,
0.01418643, 0.657726, 0.2066168, 0, 0, 0, 1, 1,
0.01839518, -0.07072826, 2.806363, 0, 0, 0, 1, 1,
0.01874351, -1.067225, 2.43987, 0, 0, 0, 1, 1,
0.02203634, -0.7455815, 3.438003, 0, 0, 0, 1, 1,
0.02332983, 0.07122441, -0.6726539, 0, 0, 0, 1, 1,
0.02542437, -0.5002241, 2.739354, 0, 0, 0, 1, 1,
0.02781026, -0.2850668, 2.605898, 0, 0, 0, 1, 1,
0.03038382, 0.2261031, -0.05241429, 1, 1, 1, 1, 1,
0.03043146, -0.4728222, 0.8630599, 1, 1, 1, 1, 1,
0.03439811, 0.3057051, -1.027126, 1, 1, 1, 1, 1,
0.03894674, -1.028439, 2.163548, 1, 1, 1, 1, 1,
0.04496329, 0.6212378, 0.1009472, 1, 1, 1, 1, 1,
0.04702736, 0.5817614, -0.3078305, 1, 1, 1, 1, 1,
0.05015709, -1.149919, 3.137046, 1, 1, 1, 1, 1,
0.05358687, 0.8152198, 0.2713133, 1, 1, 1, 1, 1,
0.0561635, 0.6674409, -0.268196, 1, 1, 1, 1, 1,
0.05684204, -0.748385, 3.163534, 1, 1, 1, 1, 1,
0.05702387, 0.2020121, -0.2091465, 1, 1, 1, 1, 1,
0.05995683, -0.2697048, 2.875315, 1, 1, 1, 1, 1,
0.06095059, 1.046807, 0.03430617, 1, 1, 1, 1, 1,
0.06151808, -0.7648792, 3.411305, 1, 1, 1, 1, 1,
0.06397749, 0.6556676, 1.341298, 1, 1, 1, 1, 1,
0.06573326, 1.881439, -0.7739124, 0, 0, 1, 1, 1,
0.06968983, 1.479659, 0.6596451, 1, 0, 0, 1, 1,
0.0699001, -0.8344254, 2.553229, 1, 0, 0, 1, 1,
0.07442984, 2.099229, -0.4148181, 1, 0, 0, 1, 1,
0.07627627, -1.127122, 3.621099, 1, 0, 0, 1, 1,
0.07725913, 1.040277, -0.5208178, 1, 0, 0, 1, 1,
0.07769565, 1.691111, 0.1160597, 0, 0, 0, 1, 1,
0.0829904, 1.300876, -0.5313069, 0, 0, 0, 1, 1,
0.08992834, -0.7976724, 0.7757565, 0, 0, 0, 1, 1,
0.09576864, -2.545892, 4.862146, 0, 0, 0, 1, 1,
0.09730639, 0.4883656, 0.4087152, 0, 0, 0, 1, 1,
0.09963305, 0.2172926, -1.135292, 0, 0, 0, 1, 1,
0.1037398, -0.5084022, 3.961594, 0, 0, 0, 1, 1,
0.1041482, -0.4396316, 5.387689, 1, 1, 1, 1, 1,
0.1043354, 0.4894149, 1.099141, 1, 1, 1, 1, 1,
0.1052327, 1.203516, 1.351337, 1, 1, 1, 1, 1,
0.1068005, 0.4861292, -1.184122, 1, 1, 1, 1, 1,
0.1101252, 0.477428, -0.3937692, 1, 1, 1, 1, 1,
0.1121304, -0.08299909, 3.083462, 1, 1, 1, 1, 1,
0.1155433, -2.376878, 4.966608, 1, 1, 1, 1, 1,
0.1162694, -1.6248, 2.396807, 1, 1, 1, 1, 1,
0.1170626, -0.8103935, 2.59706, 1, 1, 1, 1, 1,
0.1207912, 0.8824605, -1.013849, 1, 1, 1, 1, 1,
0.1253798, -0.1552852, 2.590402, 1, 1, 1, 1, 1,
0.1277428, -0.578807, 3.716069, 1, 1, 1, 1, 1,
0.1282658, -1.044494, 3.542539, 1, 1, 1, 1, 1,
0.1307282, 0.3252133, 0.1503577, 1, 1, 1, 1, 1,
0.1308628, -0.114701, 0.6134642, 1, 1, 1, 1, 1,
0.1311647, 0.9688144, 0.6402708, 0, 0, 1, 1, 1,
0.1358873, 0.6147448, 1.211089, 1, 0, 0, 1, 1,
0.1464868, -2.120165, 4.239042, 1, 0, 0, 1, 1,
0.1477258, -0.8623909, 2.239368, 1, 0, 0, 1, 1,
0.1480587, -0.01260395, 2.030495, 1, 0, 0, 1, 1,
0.1481135, -0.2727973, 2.847109, 1, 0, 0, 1, 1,
0.148674, -0.3925942, 1.651706, 0, 0, 0, 1, 1,
0.1509488, 0.561853, 2.960984, 0, 0, 0, 1, 1,
0.1512497, 1.595524, 1.293335, 0, 0, 0, 1, 1,
0.1520804, -0.1969519, 1.749524, 0, 0, 0, 1, 1,
0.1550683, -0.02111509, 0.2781231, 0, 0, 0, 1, 1,
0.1558907, -0.3959756, 2.139606, 0, 0, 0, 1, 1,
0.1563901, 0.2022127, 1.819368, 0, 0, 0, 1, 1,
0.1569171, 1.196527, -0.5828906, 1, 1, 1, 1, 1,
0.1569641, -0.3016177, 3.976017, 1, 1, 1, 1, 1,
0.1581956, 0.03628521, 2.32969, 1, 1, 1, 1, 1,
0.1581988, 0.5970804, -0.7503489, 1, 1, 1, 1, 1,
0.1584935, 0.6974936, 0.45756, 1, 1, 1, 1, 1,
0.1601895, 0.2534315, 0.561986, 1, 1, 1, 1, 1,
0.1682446, 0.9570891, 1.842171, 1, 1, 1, 1, 1,
0.1722776, -0.4334279, 1.541026, 1, 1, 1, 1, 1,
0.1803316, -0.2562208, 1.458272, 1, 1, 1, 1, 1,
0.1850897, -1.014217, 3.190832, 1, 1, 1, 1, 1,
0.1897109, -0.1712654, 1.000158, 1, 1, 1, 1, 1,
0.1948563, -0.5973618, 2.722303, 1, 1, 1, 1, 1,
0.1963014, 1.197936, 0.9158934, 1, 1, 1, 1, 1,
0.1978066, 0.4842111, -0.09032352, 1, 1, 1, 1, 1,
0.2004929, 0.2188, -0.2012737, 1, 1, 1, 1, 1,
0.2103438, -3.758541, 3.38644, 0, 0, 1, 1, 1,
0.2136386, -1.078371, 5.083149, 1, 0, 0, 1, 1,
0.2171774, 0.9167914, 0.8135471, 1, 0, 0, 1, 1,
0.2185849, 0.01474794, 3.620979, 1, 0, 0, 1, 1,
0.2214421, 0.7676921, 2.251557, 1, 0, 0, 1, 1,
0.2284521, 1.422257, -0.5785069, 1, 0, 0, 1, 1,
0.2285683, 1.92263, -0.09004062, 0, 0, 0, 1, 1,
0.2292858, 0.2491943, -0.7634881, 0, 0, 0, 1, 1,
0.2335386, -1.055911, 3.657667, 0, 0, 0, 1, 1,
0.2345475, 1.233737, 1.661957, 0, 0, 0, 1, 1,
0.2352329, 0.2207867, 1.471462, 0, 0, 0, 1, 1,
0.2354968, -0.1682507, 2.808495, 0, 0, 0, 1, 1,
0.2366347, 0.3677951, 2.045275, 0, 0, 0, 1, 1,
0.2372892, 0.4640737, 2.004168, 1, 1, 1, 1, 1,
0.2384264, -0.3608283, 2.126657, 1, 1, 1, 1, 1,
0.238711, 1.020183, -0.4524023, 1, 1, 1, 1, 1,
0.2425295, 0.8745443, 0.5327215, 1, 1, 1, 1, 1,
0.2456336, -0.03409973, 1.893577, 1, 1, 1, 1, 1,
0.2482992, 1.678149, 0.2858897, 1, 1, 1, 1, 1,
0.2514494, -0.5068684, 3.838631, 1, 1, 1, 1, 1,
0.25182, -1.248677, 2.17675, 1, 1, 1, 1, 1,
0.2523358, 0.004422431, 0.543093, 1, 1, 1, 1, 1,
0.2535551, 0.8416743, 1.192397, 1, 1, 1, 1, 1,
0.2577509, -2.737615, 2.10655, 1, 1, 1, 1, 1,
0.2580726, 1.834934, 0.7181699, 1, 1, 1, 1, 1,
0.2594333, -0.9297856, 3.745229, 1, 1, 1, 1, 1,
0.2595067, -1.129195, 3.213416, 1, 1, 1, 1, 1,
0.2605806, -0.3493151, 1.828002, 1, 1, 1, 1, 1,
0.2646596, 0.2340629, 0.2730303, 0, 0, 1, 1, 1,
0.2657107, -0.09627267, 2.650343, 1, 0, 0, 1, 1,
0.2685969, 0.2471769, 0.6842344, 1, 0, 0, 1, 1,
0.2732079, 0.287023, 0.5113173, 1, 0, 0, 1, 1,
0.273636, -0.1711047, 0.8178932, 1, 0, 0, 1, 1,
0.2775218, -0.5484658, 1.927122, 1, 0, 0, 1, 1,
0.2807027, 0.04925786, 0.9645862, 0, 0, 0, 1, 1,
0.2839262, 0.3198425, -0.899156, 0, 0, 0, 1, 1,
0.2919527, 1.342931, 0.6886476, 0, 0, 0, 1, 1,
0.2932462, -0.1456659, 2.226825, 0, 0, 0, 1, 1,
0.2970436, 1.81866, 1.015853, 0, 0, 0, 1, 1,
0.2973426, 0.4165669, 1.065719, 0, 0, 0, 1, 1,
0.299357, 1.887255, -1.117207, 0, 0, 0, 1, 1,
0.301398, 0.07624762, -0.02138332, 1, 1, 1, 1, 1,
0.30278, -0.3105651, 2.24669, 1, 1, 1, 1, 1,
0.306647, 1.36542, 0.6191701, 1, 1, 1, 1, 1,
0.3119374, 1.243413, 1.107393, 1, 1, 1, 1, 1,
0.3147504, -0.6481014, 1.600785, 1, 1, 1, 1, 1,
0.3147962, -2.987844, 3.171631, 1, 1, 1, 1, 1,
0.3149161, 0.1778674, 0.3155123, 1, 1, 1, 1, 1,
0.3185802, 1.808517, 1.401487, 1, 1, 1, 1, 1,
0.3208656, 0.5129966, 0.1371138, 1, 1, 1, 1, 1,
0.3211735, 0.4285446, -1.032276, 1, 1, 1, 1, 1,
0.3242007, -0.1136642, 2.642142, 1, 1, 1, 1, 1,
0.3242231, 0.4655158, 0.8447964, 1, 1, 1, 1, 1,
0.325004, -0.5277838, 3.492224, 1, 1, 1, 1, 1,
0.3303915, 0.8233148, 1.278898, 1, 1, 1, 1, 1,
0.3310789, -0.6295149, 1.44346, 1, 1, 1, 1, 1,
0.3332992, 0.5679381, 1.209583, 0, 0, 1, 1, 1,
0.3370423, 0.7470136, 0.8534553, 1, 0, 0, 1, 1,
0.3381519, 0.1221024, 2.007318, 1, 0, 0, 1, 1,
0.3392216, -0.02009403, 2.733149, 1, 0, 0, 1, 1,
0.3399698, 0.2144245, -1.085487, 1, 0, 0, 1, 1,
0.3400389, -0.9875209, 3.306974, 1, 0, 0, 1, 1,
0.3432781, 0.199236, 1.164397, 0, 0, 0, 1, 1,
0.344815, -1.372949, 2.757441, 0, 0, 0, 1, 1,
0.355714, -0.07811692, 2.35092, 0, 0, 0, 1, 1,
0.3615892, 0.2292085, 1.21278, 0, 0, 0, 1, 1,
0.3652921, 0.2892638, 2.076371, 0, 0, 0, 1, 1,
0.3653183, 0.4095549, 1.336648, 0, 0, 0, 1, 1,
0.3666601, -0.3279749, 2.09206, 0, 0, 0, 1, 1,
0.3694069, 1.424443, -1.701252, 1, 1, 1, 1, 1,
0.3712353, -0.2778322, 1.107692, 1, 1, 1, 1, 1,
0.3733502, -0.437005, 3.536888, 1, 1, 1, 1, 1,
0.3753057, 0.3711829, -0.5747424, 1, 1, 1, 1, 1,
0.3768484, -1.042537, 2.935575, 1, 1, 1, 1, 1,
0.379056, -0.7039331, 2.735875, 1, 1, 1, 1, 1,
0.3928725, -0.8997076, 2.142558, 1, 1, 1, 1, 1,
0.394296, -0.5700422, 2.463764, 1, 1, 1, 1, 1,
0.3977607, 0.2182721, 2.216028, 1, 1, 1, 1, 1,
0.3981431, 0.1206399, 0.9387271, 1, 1, 1, 1, 1,
0.3984646, 0.3617659, 2.102687, 1, 1, 1, 1, 1,
0.4026071, -0.1030111, 1.056956, 1, 1, 1, 1, 1,
0.4043123, 0.5530632, 0.2898044, 1, 1, 1, 1, 1,
0.4045444, -1.130396, 5.636926, 1, 1, 1, 1, 1,
0.4055107, 0.01763357, 0.6046159, 1, 1, 1, 1, 1,
0.4055379, 0.1091183, 0.5855373, 0, 0, 1, 1, 1,
0.4093952, -1.647563, 2.697272, 1, 0, 0, 1, 1,
0.4095624, -1.011013, 3.141577, 1, 0, 0, 1, 1,
0.4130072, -0.4636095, 1.073927, 1, 0, 0, 1, 1,
0.4190615, 0.7177367, 0.1581048, 1, 0, 0, 1, 1,
0.4319806, 1.140291, 0.3070823, 1, 0, 0, 1, 1,
0.4385649, 0.4043869, 0.8900355, 0, 0, 0, 1, 1,
0.4552009, -2.114933, 3.459897, 0, 0, 0, 1, 1,
0.4581932, -1.196462, 4.025589, 0, 0, 0, 1, 1,
0.4626978, -1.583758, 2.113864, 0, 0, 0, 1, 1,
0.4631722, 1.518261, 2.007401, 0, 0, 0, 1, 1,
0.467567, 0.1986427, 0.4175133, 0, 0, 0, 1, 1,
0.4685105, 0.2202538, 1.996436, 0, 0, 0, 1, 1,
0.4697084, -0.3527894, 2.306777, 1, 1, 1, 1, 1,
0.4731149, -0.6957824, 2.714051, 1, 1, 1, 1, 1,
0.4800915, -1.105502, 0.810679, 1, 1, 1, 1, 1,
0.4810413, 0.9030614, 0.394412, 1, 1, 1, 1, 1,
0.4841316, 0.6756632, 0.3993641, 1, 1, 1, 1, 1,
0.4847079, 0.101985, 1.490774, 1, 1, 1, 1, 1,
0.4899393, -0.4014494, 2.893959, 1, 1, 1, 1, 1,
0.4915329, 1.322135, -0.645616, 1, 1, 1, 1, 1,
0.4956468, 0.5043695, 0.193535, 1, 1, 1, 1, 1,
0.4974928, -0.7713221, 1.949099, 1, 1, 1, 1, 1,
0.4976503, -0.3397927, 2.822958, 1, 1, 1, 1, 1,
0.50115, -0.4644774, 2.52961, 1, 1, 1, 1, 1,
0.503963, -0.5339705, 1.980591, 1, 1, 1, 1, 1,
0.5045458, 0.123932, 0.0989092, 1, 1, 1, 1, 1,
0.5051132, 1.424491, 2.416696, 1, 1, 1, 1, 1,
0.5053849, 0.6890143, 0.4158376, 0, 0, 1, 1, 1,
0.5086138, -0.6153206, 3.817781, 1, 0, 0, 1, 1,
0.5130592, 1.275131, -0.09833013, 1, 0, 0, 1, 1,
0.5167513, 0.6834679, 0.07221818, 1, 0, 0, 1, 1,
0.5207844, 2.794821, -0.01706815, 1, 0, 0, 1, 1,
0.521348, -0.3897511, -0.7421474, 1, 0, 0, 1, 1,
0.52201, -0.2696346, 2.402995, 0, 0, 0, 1, 1,
0.5236788, 0.7751064, -0.3002738, 0, 0, 0, 1, 1,
0.5266757, 1.441727, -0.6010887, 0, 0, 0, 1, 1,
0.5297348, -0.3457997, 2.368779, 0, 0, 0, 1, 1,
0.5328513, -2.056656, 1.927777, 0, 0, 0, 1, 1,
0.5334379, -1.702596, 2.114844, 0, 0, 0, 1, 1,
0.5337331, 0.9499055, -2.474853, 0, 0, 0, 1, 1,
0.5375503, -0.177079, 3.274764, 1, 1, 1, 1, 1,
0.5383467, 1.020519, 1.050568, 1, 1, 1, 1, 1,
0.5387643, 0.3173147, 1.794363, 1, 1, 1, 1, 1,
0.541569, -0.7345215, 2.460062, 1, 1, 1, 1, 1,
0.5443436, 0.947093, 1.778355, 1, 1, 1, 1, 1,
0.5482571, -0.02557741, 1.250185, 1, 1, 1, 1, 1,
0.551235, 1.586638, 0.5974235, 1, 1, 1, 1, 1,
0.5619398, -2.877457, 2.354274, 1, 1, 1, 1, 1,
0.5625254, 0.1995529, 2.363525, 1, 1, 1, 1, 1,
0.5658939, -0.8523703, 2.888968, 1, 1, 1, 1, 1,
0.5690097, 1.891584, 0.08101241, 1, 1, 1, 1, 1,
0.5713241, 1.996371, 0.7997209, 1, 1, 1, 1, 1,
0.5728995, -0.7399975, 4.420421, 1, 1, 1, 1, 1,
0.5777926, -0.1335577, 1.869689, 1, 1, 1, 1, 1,
0.5782913, 1.680537, 0.1963915, 1, 1, 1, 1, 1,
0.5786769, -0.3419176, 2.424083, 0, 0, 1, 1, 1,
0.5791482, -0.4578598, 1.67914, 1, 0, 0, 1, 1,
0.5808017, 0.2079663, 0.6443941, 1, 0, 0, 1, 1,
0.5820438, -0.2496319, 1.750593, 1, 0, 0, 1, 1,
0.5838709, -0.3012204, 1.883476, 1, 0, 0, 1, 1,
0.5880291, -1.634646, 1.90702, 1, 0, 0, 1, 1,
0.5919805, 0.1351978, 1.068599, 0, 0, 0, 1, 1,
0.5948934, -0.8095809, 3.159418, 0, 0, 0, 1, 1,
0.5956849, -0.6501426, 2.746408, 0, 0, 0, 1, 1,
0.6002193, -0.6601599, 1.769724, 0, 0, 0, 1, 1,
0.6003428, 1.097778, 1.240164, 0, 0, 0, 1, 1,
0.6004121, -2.398581, 1.804691, 0, 0, 0, 1, 1,
0.6022252, 0.3760595, 1.164173, 0, 0, 0, 1, 1,
0.6031285, 0.2694297, 0.2654115, 1, 1, 1, 1, 1,
0.6031759, 0.2009827, -0.5332826, 1, 1, 1, 1, 1,
0.6044004, 0.1305995, 0.5562963, 1, 1, 1, 1, 1,
0.6090974, -0.09256762, 2.183093, 1, 1, 1, 1, 1,
0.6112417, -0.8126126, -0.2109638, 1, 1, 1, 1, 1,
0.61141, -0.3632688, 1.679411, 1, 1, 1, 1, 1,
0.6131596, 0.2166219, 1.694249, 1, 1, 1, 1, 1,
0.6136461, -0.1951585, 1.988549, 1, 1, 1, 1, 1,
0.6323681, -1.223161, 1.482874, 1, 1, 1, 1, 1,
0.6329559, 0.2181423, 2.025592, 1, 1, 1, 1, 1,
0.6396362, -0.5990317, 2.246121, 1, 1, 1, 1, 1,
0.6440192, -0.7892696, 2.446205, 1, 1, 1, 1, 1,
0.6533939, 0.5057341, 0.1817728, 1, 1, 1, 1, 1,
0.6568436, -0.7587864, 1.448759, 1, 1, 1, 1, 1,
0.657411, 0.9454007, -0.09102271, 1, 1, 1, 1, 1,
0.6589102, 0.8186624, -0.08670318, 0, 0, 1, 1, 1,
0.665872, -1.114158, 3.514332, 1, 0, 0, 1, 1,
0.6675102, 0.09698927, 2.463087, 1, 0, 0, 1, 1,
0.6718971, -1.539011, 2.559151, 1, 0, 0, 1, 1,
0.6719154, -0.3071424, 2.631712, 1, 0, 0, 1, 1,
0.6738975, -0.1209337, 2.724207, 1, 0, 0, 1, 1,
0.6826547, 1.709512, -0.4734017, 0, 0, 0, 1, 1,
0.6930175, -1.444654, 3.870139, 0, 0, 0, 1, 1,
0.6975148, 2.197554, -0.4325108, 0, 0, 0, 1, 1,
0.6986527, -0.1784002, 2.403872, 0, 0, 0, 1, 1,
0.7003493, 0.1075599, 1.996195, 0, 0, 0, 1, 1,
0.7013235, 0.3808458, 0.7821087, 0, 0, 0, 1, 1,
0.7037585, 0.9105296, 1.660474, 0, 0, 0, 1, 1,
0.7103506, -1.545456, 3.653671, 1, 1, 1, 1, 1,
0.7191197, 1.229531, 1.743183, 1, 1, 1, 1, 1,
0.7235953, -0.06719892, 0.08476667, 1, 1, 1, 1, 1,
0.7281042, 1.643281, 1.632577, 1, 1, 1, 1, 1,
0.7283823, -0.09809741, 1.450289, 1, 1, 1, 1, 1,
0.7344159, -2.115052, 2.370517, 1, 1, 1, 1, 1,
0.7394177, -0.7685365, 2.039487, 1, 1, 1, 1, 1,
0.7420202, -0.6309506, 3.281319, 1, 1, 1, 1, 1,
0.7427916, -1.806327, 2.737085, 1, 1, 1, 1, 1,
0.7508368, 0.5192724, 1.976356, 1, 1, 1, 1, 1,
0.7520935, 0.02337269, 1.148208, 1, 1, 1, 1, 1,
0.7537191, 2.333289, 0.8788163, 1, 1, 1, 1, 1,
0.7541785, -0.6002368, 1.067003, 1, 1, 1, 1, 1,
0.7582545, -0.8045627, -0.6053489, 1, 1, 1, 1, 1,
0.7582821, 0.02486019, 1.659117, 1, 1, 1, 1, 1,
0.7590783, 1.683373, 1.111548, 0, 0, 1, 1, 1,
0.7614856, -0.09112464, 1.937303, 1, 0, 0, 1, 1,
0.7652181, -0.4916289, 1.142288, 1, 0, 0, 1, 1,
0.7669548, 1.690172, 1.497295, 1, 0, 0, 1, 1,
0.775106, -0.9614149, 3.427235, 1, 0, 0, 1, 1,
0.7773451, 1.377491, -0.5610743, 1, 0, 0, 1, 1,
0.779698, 0.2203611, 1.155562, 0, 0, 0, 1, 1,
0.780444, 0.4442709, 0.2038387, 0, 0, 0, 1, 1,
0.7845836, 0.6268284, 0.4624555, 0, 0, 0, 1, 1,
0.7913563, -0.7390531, 3.417126, 0, 0, 0, 1, 1,
0.7952974, -0.6261526, 2.390379, 0, 0, 0, 1, 1,
0.7984462, 0.8797508, 1.810153, 0, 0, 0, 1, 1,
0.8133786, 2.251477, 0.8863927, 0, 0, 0, 1, 1,
0.8157216, -0.6938435, 0.8469845, 1, 1, 1, 1, 1,
0.8167767, -0.8941784, 1.662628, 1, 1, 1, 1, 1,
0.8170947, -0.3219019, 1.348802, 1, 1, 1, 1, 1,
0.8203822, 0.4951786, 1.157663, 1, 1, 1, 1, 1,
0.8352703, 0.6297814, 0.4533226, 1, 1, 1, 1, 1,
0.8384511, 0.9665066, 1.859163, 1, 1, 1, 1, 1,
0.8412193, -0.4222191, 1.980949, 1, 1, 1, 1, 1,
0.8462212, -0.01684659, 0.5033233, 1, 1, 1, 1, 1,
0.8481834, 0.238936, 0.6713345, 1, 1, 1, 1, 1,
0.8543123, -0.06164436, 1.814052, 1, 1, 1, 1, 1,
0.8554781, 2.20998, 1.93834, 1, 1, 1, 1, 1,
0.8555121, 0.3473479, 0.9483359, 1, 1, 1, 1, 1,
0.8673924, -0.517691, 0.9746833, 1, 1, 1, 1, 1,
0.8711752, 0.8605601, 0.5411309, 1, 1, 1, 1, 1,
0.8717839, -0.6348277, 0.2333011, 1, 1, 1, 1, 1,
0.8738028, 0.3774943, 0.3493175, 0, 0, 1, 1, 1,
0.8779095, -0.06585379, 2.328589, 1, 0, 0, 1, 1,
0.88244, -0.6790016, 2.450115, 1, 0, 0, 1, 1,
0.8909996, 1.600392, -0.6682008, 1, 0, 0, 1, 1,
0.8964059, 1.838612, 0.7873669, 1, 0, 0, 1, 1,
0.899993, -0.4022147, 0.8791637, 1, 0, 0, 1, 1,
0.9094049, 0.6145926, -0.8839223, 0, 0, 0, 1, 1,
0.913227, -0.8651776, 2.752383, 0, 0, 0, 1, 1,
0.9150558, -0.1674895, 1.587545, 0, 0, 0, 1, 1,
0.9218227, 0.4308461, -0.2258117, 0, 0, 0, 1, 1,
0.9256025, -0.9826265, 2.555179, 0, 0, 0, 1, 1,
0.9307864, 0.4816139, -0.6769428, 0, 0, 0, 1, 1,
0.938158, 2.574631, -0.8647789, 0, 0, 0, 1, 1,
0.9477221, -0.6708432, 2.124511, 1, 1, 1, 1, 1,
0.9499694, 0.3302959, 0.9297791, 1, 1, 1, 1, 1,
0.9529522, -1.367672, 1.924136, 1, 1, 1, 1, 1,
0.9541412, 0.5773687, 2.169494, 1, 1, 1, 1, 1,
0.9591172, -1.617174, 1.523326, 1, 1, 1, 1, 1,
0.9633683, -0.6547686, 2.659446, 1, 1, 1, 1, 1,
0.9637638, 0.844373, 1.60634, 1, 1, 1, 1, 1,
0.9644899, 0.1884825, 1.562725, 1, 1, 1, 1, 1,
0.9688884, -0.9744557, 3.480807, 1, 1, 1, 1, 1,
0.9702619, -0.673115, 2.324105, 1, 1, 1, 1, 1,
0.9733843, 0.2610593, 2.138806, 1, 1, 1, 1, 1,
0.9916359, 1.609023, -1.351056, 1, 1, 1, 1, 1,
0.9950448, -0.688266, 2.143788, 1, 1, 1, 1, 1,
0.9952818, -0.5043353, 1.538962, 1, 1, 1, 1, 1,
0.9960931, 0.385709, -0.2963754, 1, 1, 1, 1, 1,
0.998104, 1.272142, 0.08491393, 0, 0, 1, 1, 1,
0.9988626, -0.4178867, 0.09983291, 1, 0, 0, 1, 1,
1.004899, -1.05275, 3.145148, 1, 0, 0, 1, 1,
1.006142, 0.127167, 0.9552162, 1, 0, 0, 1, 1,
1.008007, 0.1224761, 1.175121, 1, 0, 0, 1, 1,
1.010871, -0.9359303, 3.536136, 1, 0, 0, 1, 1,
1.014782, 0.3323711, 1.933825, 0, 0, 0, 1, 1,
1.015515, 0.3392032, 2.010419, 0, 0, 0, 1, 1,
1.020154, -0.7056533, 2.419206, 0, 0, 0, 1, 1,
1.024461, 0.4928671, 2.659001, 0, 0, 0, 1, 1,
1.027742, -1.579952, 2.950637, 0, 0, 0, 1, 1,
1.029911, 1.1014, 0.9398472, 0, 0, 0, 1, 1,
1.030336, -1.643317, 0.9231371, 0, 0, 0, 1, 1,
1.037936, -1.422595, 2.364311, 1, 1, 1, 1, 1,
1.040304, 0.5292453, 0.54005, 1, 1, 1, 1, 1,
1.043341, -1.635526, 1.208225, 1, 1, 1, 1, 1,
1.04415, 0.9694637, 0.1712892, 1, 1, 1, 1, 1,
1.045316, 0.2421591, 1.584988, 1, 1, 1, 1, 1,
1.045366, -0.1007968, 1.969627, 1, 1, 1, 1, 1,
1.045891, 1.261974, 1.36908, 1, 1, 1, 1, 1,
1.048343, 0.006162928, 0.9918473, 1, 1, 1, 1, 1,
1.058472, -0.4687104, 1.853484, 1, 1, 1, 1, 1,
1.06087, 0.197747, 2.83563, 1, 1, 1, 1, 1,
1.067008, -1.595916, 3.290051, 1, 1, 1, 1, 1,
1.071544, -0.1919958, 2.52062, 1, 1, 1, 1, 1,
1.072485, -0.4733385, 0.3579248, 1, 1, 1, 1, 1,
1.082204, 0.2160747, 1.285262, 1, 1, 1, 1, 1,
1.092126, -0.29129, 2.016022, 1, 1, 1, 1, 1,
1.098768, -0.8992358, 1.72747, 0, 0, 1, 1, 1,
1.101028, -0.178643, 1.059048, 1, 0, 0, 1, 1,
1.108372, 0.9175013, 1.445709, 1, 0, 0, 1, 1,
1.109053, -0.2734416, 0.4386715, 1, 0, 0, 1, 1,
1.114597, 1.64842, 1.546127, 1, 0, 0, 1, 1,
1.147651, 0.3719988, 2.02889, 1, 0, 0, 1, 1,
1.152936, -0.3873845, 1.354089, 0, 0, 0, 1, 1,
1.155716, -0.4422429, 2.949933, 0, 0, 0, 1, 1,
1.158163, -0.5424992, 2.093484, 0, 0, 0, 1, 1,
1.163828, -0.9433463, 1.555252, 0, 0, 0, 1, 1,
1.167142, -1.470542, 2.95464, 0, 0, 0, 1, 1,
1.168463, -1.176765, 1.713246, 0, 0, 0, 1, 1,
1.179405, 1.00491, 1.043434, 0, 0, 0, 1, 1,
1.180913, 0.5360155, 2.033327, 1, 1, 1, 1, 1,
1.187396, 0.5753449, 0.8678583, 1, 1, 1, 1, 1,
1.193554, 1.191277, 0.7220637, 1, 1, 1, 1, 1,
1.193759, 2.17117, -0.8798385, 1, 1, 1, 1, 1,
1.199266, 0.29839, 1.457932, 1, 1, 1, 1, 1,
1.199782, -1.446367, 2.966192, 1, 1, 1, 1, 1,
1.20817, 0.8037408, 0.5042056, 1, 1, 1, 1, 1,
1.225208, 0.6734162, 2.149549, 1, 1, 1, 1, 1,
1.229652, -2.23015, 2.695393, 1, 1, 1, 1, 1,
1.236596, -1.45397, 2.465445, 1, 1, 1, 1, 1,
1.245107, 0.6958103, 1.625126, 1, 1, 1, 1, 1,
1.248953, -0.7016884, 1.429761, 1, 1, 1, 1, 1,
1.255777, 2.285051, 2.511397, 1, 1, 1, 1, 1,
1.25749, -0.678126, 3.401325, 1, 1, 1, 1, 1,
1.266352, 0.005097003, 0.7190228, 1, 1, 1, 1, 1,
1.281278, -2.012338, 3.374682, 0, 0, 1, 1, 1,
1.297434, -0.2124683, 2.750285, 1, 0, 0, 1, 1,
1.299908, -0.1073308, 1.042253, 1, 0, 0, 1, 1,
1.302079, -0.704131, 1.113405, 1, 0, 0, 1, 1,
1.302652, 1.391116, 0.8701167, 1, 0, 0, 1, 1,
1.31373, -1.520522, 2.652248, 1, 0, 0, 1, 1,
1.321907, 0.06601114, 2.555183, 0, 0, 0, 1, 1,
1.324423, 0.6613773, 1.202165, 0, 0, 0, 1, 1,
1.337278, -0.6859688, 1.668673, 0, 0, 0, 1, 1,
1.343294, -3.013038, 1.675213, 0, 0, 0, 1, 1,
1.381321, 1.996119, 0.4250839, 0, 0, 0, 1, 1,
1.393973, 0.9355605, -0.1995712, 0, 0, 0, 1, 1,
1.395061, -0.001286197, 1.345405, 0, 0, 0, 1, 1,
1.40417, 1.695711, 0.2973887, 1, 1, 1, 1, 1,
1.405704, 0.1263112, 0.8493538, 1, 1, 1, 1, 1,
1.409058, -0.3331815, 3.829159, 1, 1, 1, 1, 1,
1.412288, 0.3251392, 2.863826, 1, 1, 1, 1, 1,
1.412332, 0.4979916, 2.223603, 1, 1, 1, 1, 1,
1.417659, 0.234907, 1.667073, 1, 1, 1, 1, 1,
1.421857, -0.6623827, 1.462428, 1, 1, 1, 1, 1,
1.436724, -1.914431, 2.936329, 1, 1, 1, 1, 1,
1.439954, -0.1050605, 1.624606, 1, 1, 1, 1, 1,
1.453512, 2.037782, 1.118556, 1, 1, 1, 1, 1,
1.461907, -0.01425548, 2.403279, 1, 1, 1, 1, 1,
1.471107, 1.450334, 1.373527, 1, 1, 1, 1, 1,
1.471217, -1.603253, 2.198843, 1, 1, 1, 1, 1,
1.472036, -0.2263676, 1.729614, 1, 1, 1, 1, 1,
1.477932, 0.363727, 0.5438405, 1, 1, 1, 1, 1,
1.479676, 1.41409, 1.304053, 0, 0, 1, 1, 1,
1.480271, -0.1762926, 1.598814, 1, 0, 0, 1, 1,
1.483587, -0.7031032, 1.333975, 1, 0, 0, 1, 1,
1.483702, 0.3568057, 0.5054752, 1, 0, 0, 1, 1,
1.48453, -1.201863, 1.047138, 1, 0, 0, 1, 1,
1.492594, -0.7521195, 4.261415, 1, 0, 0, 1, 1,
1.496462, -1.366558, 1.004847, 0, 0, 0, 1, 1,
1.49663, 1.017845, 0.6124789, 0, 0, 0, 1, 1,
1.498575, 2.501558, 1.594563, 0, 0, 0, 1, 1,
1.524183, -1.242239, 1.571061, 0, 0, 0, 1, 1,
1.541556, 0.1063888, 4.367659, 0, 0, 0, 1, 1,
1.543014, -0.9974948, 2.853985, 0, 0, 0, 1, 1,
1.569036, -1.236731, 1.894108, 0, 0, 0, 1, 1,
1.57226, -0.7165319, 1.725096, 1, 1, 1, 1, 1,
1.62266, -0.6173403, 2.290469, 1, 1, 1, 1, 1,
1.638432, -0.7684271, 4.763317, 1, 1, 1, 1, 1,
1.646334, -0.2081652, 2.299193, 1, 1, 1, 1, 1,
1.647702, 0.502471, 1.238825, 1, 1, 1, 1, 1,
1.66408, -0.7772374, 2.95158, 1, 1, 1, 1, 1,
1.676587, 0.3216942, 1.585397, 1, 1, 1, 1, 1,
1.700672, -0.3080682, 0.949261, 1, 1, 1, 1, 1,
1.712824, 0.5442501, 0.4347734, 1, 1, 1, 1, 1,
1.721059, 0.126708, 1.950233, 1, 1, 1, 1, 1,
1.725847, 0.6532375, 4.33187, 1, 1, 1, 1, 1,
1.739636, 1.442446, -0.04432218, 1, 1, 1, 1, 1,
1.740674, 0.4895051, 2.704446, 1, 1, 1, 1, 1,
1.746861, 0.6818251, -0.1153904, 1, 1, 1, 1, 1,
1.751931, 0.5529035, 1.109296, 1, 1, 1, 1, 1,
1.76605, 0.03098667, 1.702395, 0, 0, 1, 1, 1,
1.76716, -1.716221, 2.43892, 1, 0, 0, 1, 1,
1.775967, -0.321012, 0.4563294, 1, 0, 0, 1, 1,
1.776292, -1.243582, 0.8584188, 1, 0, 0, 1, 1,
1.822382, 0.7278727, 0.7781295, 1, 0, 0, 1, 1,
1.824084, -0.08097414, 2.799965, 1, 0, 0, 1, 1,
1.827744, 0.8285987, 1.705579, 0, 0, 0, 1, 1,
1.829188, 0.1028344, 0.3886611, 0, 0, 0, 1, 1,
1.830458, -0.7526053, 1.981494, 0, 0, 0, 1, 1,
1.833436, 0.4536972, 2.049087, 0, 0, 0, 1, 1,
1.849767, 1.34427, 0.2799717, 0, 0, 0, 1, 1,
1.850826, 0.0881377, 3.320477, 0, 0, 0, 1, 1,
1.854439, -0.1412947, 2.484723, 0, 0, 0, 1, 1,
1.856849, 1.029358, 2.47677, 1, 1, 1, 1, 1,
1.86385, 0.4874884, 1.690023, 1, 1, 1, 1, 1,
1.882851, -2.659026, 2.025925, 1, 1, 1, 1, 1,
1.896522, -1.443756, 2.177313, 1, 1, 1, 1, 1,
1.89904, 1.273566, 1.880785, 1, 1, 1, 1, 1,
1.905986, -0.06241643, 2.150767, 1, 1, 1, 1, 1,
1.907301, 0.7201935, 1.128955, 1, 1, 1, 1, 1,
1.927156, -0.3703586, 0.9195424, 1, 1, 1, 1, 1,
2.007315, 1.064297, 0.5360943, 1, 1, 1, 1, 1,
2.009502, -0.01577137, 1.602414, 1, 1, 1, 1, 1,
2.014, 0.8584465, -0.2113272, 1, 1, 1, 1, 1,
2.028785, -0.02198617, 1.077767, 1, 1, 1, 1, 1,
2.084345, -1.004772, 0.9901462, 1, 1, 1, 1, 1,
2.087958, -1.142981, 2.683973, 1, 1, 1, 1, 1,
2.089035, 0.6379967, 3.559287, 1, 1, 1, 1, 1,
2.094701, 0.8261098, 2.684997, 0, 0, 1, 1, 1,
2.118473, -1.498098, 2.488768, 1, 0, 0, 1, 1,
2.142571, 0.6497619, 1.523846, 1, 0, 0, 1, 1,
2.180421, 0.5001236, 2.61742, 1, 0, 0, 1, 1,
2.209637, 1.090504, 1.783732, 1, 0, 0, 1, 1,
2.223099, -0.5550122, 3.698298, 1, 0, 0, 1, 1,
2.241421, 0.9681422, 1.02399, 0, 0, 0, 1, 1,
2.245745, 1.347616, -0.7969607, 0, 0, 0, 1, 1,
2.255649, 2.242625, 1.44049, 0, 0, 0, 1, 1,
2.260611, 1.929924, 0.7094228, 0, 0, 0, 1, 1,
2.326968, -0.4232315, 0.7409935, 0, 0, 0, 1, 1,
2.403784, -0.4342515, 2.663364, 0, 0, 0, 1, 1,
2.421448, 0.8978572, 0.1653806, 0, 0, 0, 1, 1,
2.485826, 0.2408181, 1.775671, 1, 1, 1, 1, 1,
2.58624, -0.5677387, 2.517045, 1, 1, 1, 1, 1,
2.635769, 1.041172, -0.7627512, 1, 1, 1, 1, 1,
2.726725, 0.2624778, 0.3531078, 1, 1, 1, 1, 1,
2.745302, 0.8779535, 3.606498, 1, 1, 1, 1, 1,
2.817962, 0.1418755, 0.5650643, 1, 1, 1, 1, 1,
3.417576, 0.9429547, 0.06518689, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
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
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 10.0118;
var distance = 35.16602;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.03381324, 0.1487415, -0.1275365 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.16602);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
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
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
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
}
while(currentElement = currentElement.offsetParent)
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
zoom[activeProjection[activeSubscene]] *= ds;
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