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
-3.011344, 0.9713819, -0.05628065, 1, 0, 0, 1,
-2.782264, -0.4150596, -1.87723, 1, 0.007843138, 0, 1,
-2.564381, -0.3341171, -1.126616, 1, 0.01176471, 0, 1,
-2.553873, 0.9805621, -1.773061, 1, 0.01960784, 0, 1,
-2.516074, 1.537439, -1.241321, 1, 0.02352941, 0, 1,
-2.426571, -0.8063729, -0.6892629, 1, 0.03137255, 0, 1,
-2.320438, 0.3700882, -1.147928, 1, 0.03529412, 0, 1,
-2.298912, 0.7241619, -0.5992739, 1, 0.04313726, 0, 1,
-2.294297, -1.997148, -1.444378, 1, 0.04705882, 0, 1,
-2.259669, 1.021702, -0.3439975, 1, 0.05490196, 0, 1,
-2.194288, -1.2623, -3.074385, 1, 0.05882353, 0, 1,
-2.185144, -0.2935377, -1.127398, 1, 0.06666667, 0, 1,
-2.164274, -0.4087131, -2.502862, 1, 0.07058824, 0, 1,
-2.147474, -0.9102821, -0.638693, 1, 0.07843138, 0, 1,
-2.089354, 0.8244713, 0.299609, 1, 0.08235294, 0, 1,
-2.089108, -0.6468543, -0.7012296, 1, 0.09019608, 0, 1,
-2.02581, 1.016958, 0.1770044, 1, 0.09411765, 0, 1,
-1.99436, 0.794029, 0.4928194, 1, 0.1019608, 0, 1,
-1.990202, -0.5117406, -2.407836, 1, 0.1098039, 0, 1,
-1.945081, -1.480494, -1.769829, 1, 0.1137255, 0, 1,
-1.915647, 0.5336914, -1.802099, 1, 0.1215686, 0, 1,
-1.913031, -1.432544, -2.875788, 1, 0.1254902, 0, 1,
-1.887539, 0.0983334, -0.5369395, 1, 0.1333333, 0, 1,
-1.877862, -0.06931584, -2.954482, 1, 0.1372549, 0, 1,
-1.87728, -1.417208, -2.820717, 1, 0.145098, 0, 1,
-1.848872, 0.3522449, -1.235751, 1, 0.1490196, 0, 1,
-1.83416, -0.2649812, -2.29983, 1, 0.1568628, 0, 1,
-1.827297, -1.452175, -1.916726, 1, 0.1607843, 0, 1,
-1.827295, -0.5436385, -3.138264, 1, 0.1686275, 0, 1,
-1.817785, 0.8738757, -0.5680256, 1, 0.172549, 0, 1,
-1.813034, -2.230885, -2.432715, 1, 0.1803922, 0, 1,
-1.802559, 1.731155, -2.499155, 1, 0.1843137, 0, 1,
-1.785698, -0.2713619, -2.233183, 1, 0.1921569, 0, 1,
-1.774207, -0.4170241, -1.788282, 1, 0.1960784, 0, 1,
-1.764099, -0.3882404, -2.114346, 1, 0.2039216, 0, 1,
-1.755979, -0.7820193, -2.333542, 1, 0.2117647, 0, 1,
-1.745587, -0.5123389, 1.100832, 1, 0.2156863, 0, 1,
-1.744919, -0.2499842, -1.967351, 1, 0.2235294, 0, 1,
-1.736691, 0.1447947, -0.9518627, 1, 0.227451, 0, 1,
-1.734524, 0.89307, -1.315427, 1, 0.2352941, 0, 1,
-1.729227, -0.3779838, -0.8101989, 1, 0.2392157, 0, 1,
-1.70572, 2.406486, 0.262575, 1, 0.2470588, 0, 1,
-1.702003, -0.5973992, -2.357231, 1, 0.2509804, 0, 1,
-1.700069, 0.9588088, -2.064311, 1, 0.2588235, 0, 1,
-1.697839, -0.122975, -0.1476238, 1, 0.2627451, 0, 1,
-1.690159, -1.674813, -2.988014, 1, 0.2705882, 0, 1,
-1.687046, -1.03122, -2.257308, 1, 0.2745098, 0, 1,
-1.671991, -1.882107, -2.344004, 1, 0.282353, 0, 1,
-1.655748, -0.8154336, -2.895376, 1, 0.2862745, 0, 1,
-1.636057, -0.1962691, 0.0291895, 1, 0.2941177, 0, 1,
-1.63341, -1.095399, -1.877853, 1, 0.3019608, 0, 1,
-1.632959, 1.552528, -0.6410881, 1, 0.3058824, 0, 1,
-1.623288, -1.202054, -1.982639, 1, 0.3137255, 0, 1,
-1.595637, -0.2548791, -2.2396, 1, 0.3176471, 0, 1,
-1.594769, 0.1305831, -0.7181, 1, 0.3254902, 0, 1,
-1.592117, 1.38248, -0.5785525, 1, 0.3294118, 0, 1,
-1.580848, -1.142495, -0.7875178, 1, 0.3372549, 0, 1,
-1.569264, 1.758754, -1.987595, 1, 0.3411765, 0, 1,
-1.549477, 0.7859865, -0.9875038, 1, 0.3490196, 0, 1,
-1.549123, 0.3353794, -0.9542971, 1, 0.3529412, 0, 1,
-1.546921, -1.39728, -1.774493, 1, 0.3607843, 0, 1,
-1.540988, 1.483515, 0.4153507, 1, 0.3647059, 0, 1,
-1.533645, -0.02948788, -1.006364, 1, 0.372549, 0, 1,
-1.525005, 0.2371657, -2.478844, 1, 0.3764706, 0, 1,
-1.52436, 1.239897, 1.1836, 1, 0.3843137, 0, 1,
-1.517046, 0.5950064, -1.767418, 1, 0.3882353, 0, 1,
-1.511978, -1.129218, -0.8213821, 1, 0.3960784, 0, 1,
-1.499477, 0.8330981, -0.4261193, 1, 0.4039216, 0, 1,
-1.49623, -1.197334, -1.774777, 1, 0.4078431, 0, 1,
-1.482646, 0.1324676, 0.6246113, 1, 0.4156863, 0, 1,
-1.46823, 0.2130544, -3.327193, 1, 0.4196078, 0, 1,
-1.466779, 1.141279, -1.583397, 1, 0.427451, 0, 1,
-1.461483, 1.796847, -1.757963, 1, 0.4313726, 0, 1,
-1.458204, 1.872633, -1.138383, 1, 0.4392157, 0, 1,
-1.443413, -0.6610005, -1.996012, 1, 0.4431373, 0, 1,
-1.437929, 0.6498687, -2.075437, 1, 0.4509804, 0, 1,
-1.436015, 0.4713776, -3.037136, 1, 0.454902, 0, 1,
-1.432735, -0.1978488, -3.445668, 1, 0.4627451, 0, 1,
-1.424985, 0.1386749, 0.7362629, 1, 0.4666667, 0, 1,
-1.419786, 1.008084, -0.009410084, 1, 0.4745098, 0, 1,
-1.419686, 0.9829691, -0.6135707, 1, 0.4784314, 0, 1,
-1.404093, 1.700192, -3.149441, 1, 0.4862745, 0, 1,
-1.402551, 1.612708, -0.1271227, 1, 0.4901961, 0, 1,
-1.388065, 1.028431, -2.772073, 1, 0.4980392, 0, 1,
-1.387847, 0.7271318, -0.2685673, 1, 0.5058824, 0, 1,
-1.381272, -1.888523, -0.3603728, 1, 0.509804, 0, 1,
-1.358812, -0.3839627, -1.451541, 1, 0.5176471, 0, 1,
-1.358045, -0.532501, -2.001002, 1, 0.5215687, 0, 1,
-1.355998, -0.1545729, -2.863886, 1, 0.5294118, 0, 1,
-1.344906, -1.828704, -1.98436, 1, 0.5333334, 0, 1,
-1.329711, 0.3763041, -3.912831, 1, 0.5411765, 0, 1,
-1.329689, -0.2039067, 0.4046315, 1, 0.5450981, 0, 1,
-1.329448, 0.6329933, -4.207611, 1, 0.5529412, 0, 1,
-1.320455, 0.7652438, -0.8411785, 1, 0.5568628, 0, 1,
-1.304297, 0.2103481, -1.684321, 1, 0.5647059, 0, 1,
-1.297017, 1.831462, -1.034427, 1, 0.5686275, 0, 1,
-1.296635, -1.573745, -1.036192, 1, 0.5764706, 0, 1,
-1.292152, 0.9308562, -0.8333867, 1, 0.5803922, 0, 1,
-1.282015, 2.740912, -1.602636, 1, 0.5882353, 0, 1,
-1.280123, 0.1225616, -0.8850037, 1, 0.5921569, 0, 1,
-1.279011, 0.5475888, -1.018594, 1, 0.6, 0, 1,
-1.272631, 1.43051, 0.839397, 1, 0.6078432, 0, 1,
-1.271309, -0.3769052, -2.046389, 1, 0.6117647, 0, 1,
-1.269427, 0.7685611, -0.7086436, 1, 0.6196079, 0, 1,
-1.260772, 0.1749002, 0.2374603, 1, 0.6235294, 0, 1,
-1.260424, 2.316666, -0.7254583, 1, 0.6313726, 0, 1,
-1.25841, -0.6525194, -0.9505787, 1, 0.6352941, 0, 1,
-1.2523, 2.253043, -1.988246, 1, 0.6431373, 0, 1,
-1.250027, 0.6098911, -1.446136, 1, 0.6470588, 0, 1,
-1.23556, 2.173114, 0.1190575, 1, 0.654902, 0, 1,
-1.235022, 0.4882389, -2.093926, 1, 0.6588235, 0, 1,
-1.232496, -0.05023968, 0.03610485, 1, 0.6666667, 0, 1,
-1.225598, 0.6651747, -1.075689, 1, 0.6705883, 0, 1,
-1.225206, -0.2567023, -3.175122, 1, 0.6784314, 0, 1,
-1.22508, -1.418195, -2.579629, 1, 0.682353, 0, 1,
-1.216462, 0.4399232, -2.027221, 1, 0.6901961, 0, 1,
-1.216418, 1.429478, -0.474304, 1, 0.6941177, 0, 1,
-1.211928, 1.42961, -0.7834231, 1, 0.7019608, 0, 1,
-1.207823, -1.036025, -2.246883, 1, 0.7098039, 0, 1,
-1.206419, 0.3844956, -0.3477435, 1, 0.7137255, 0, 1,
-1.203693, 1.818022, -0.2901933, 1, 0.7215686, 0, 1,
-1.196302, -1.537314, -3.853471, 1, 0.7254902, 0, 1,
-1.195351, 0.2742002, -2.360619, 1, 0.7333333, 0, 1,
-1.182045, -0.2093673, -2.304766, 1, 0.7372549, 0, 1,
-1.181671, 0.4897332, -1.130358, 1, 0.7450981, 0, 1,
-1.180219, 0.7026199, 1.176361, 1, 0.7490196, 0, 1,
-1.17839, -0.3454196, -2.437279, 1, 0.7568628, 0, 1,
-1.169526, -0.4802447, -1.31785, 1, 0.7607843, 0, 1,
-1.167781, -0.665257, -2.756841, 1, 0.7686275, 0, 1,
-1.165148, -2.913064, -2.223806, 1, 0.772549, 0, 1,
-1.153343, 0.8453419, -0.539414, 1, 0.7803922, 0, 1,
-1.148471, 0.03893399, -0.7747542, 1, 0.7843137, 0, 1,
-1.140827, -0.2466233, -1.04617, 1, 0.7921569, 0, 1,
-1.130669, -1.546384, -3.507145, 1, 0.7960784, 0, 1,
-1.130326, 1.411371, -0.2885321, 1, 0.8039216, 0, 1,
-1.129163, 0.07110223, -1.177484, 1, 0.8117647, 0, 1,
-1.128117, -1.002643, -3.177058, 1, 0.8156863, 0, 1,
-1.124003, -0.5392982, -1.912686, 1, 0.8235294, 0, 1,
-1.120391, -0.05881791, -1.948101, 1, 0.827451, 0, 1,
-1.107596, -2.028615, -2.326884, 1, 0.8352941, 0, 1,
-1.103504, -0.09621261, -1.876093, 1, 0.8392157, 0, 1,
-1.102244, -0.3882187, -2.847463, 1, 0.8470588, 0, 1,
-1.099865, -0.5285493, -1.610953, 1, 0.8509804, 0, 1,
-1.096049, 1.33825, -0.8430822, 1, 0.8588235, 0, 1,
-1.091812, -0.3142619, -1.671343, 1, 0.8627451, 0, 1,
-1.089861, -1.19368, -2.287457, 1, 0.8705882, 0, 1,
-1.087556, -0.3938732, -1.035306, 1, 0.8745098, 0, 1,
-1.075909, -0.4223933, -1.903677, 1, 0.8823529, 0, 1,
-1.075493, 0.933127, -2.636846, 1, 0.8862745, 0, 1,
-1.070562, -0.2632171, -2.262234, 1, 0.8941177, 0, 1,
-1.070313, 1.29409, -2.410383, 1, 0.8980392, 0, 1,
-1.068841, 0.7932491, -2.088242, 1, 0.9058824, 0, 1,
-1.065712, -0.118611, -2.343125, 1, 0.9137255, 0, 1,
-1.065543, 0.6995433, -2.262109, 1, 0.9176471, 0, 1,
-1.06465, 2.265196, -0.343704, 1, 0.9254902, 0, 1,
-1.061886, -1.247628, -0.9077746, 1, 0.9294118, 0, 1,
-1.058552, -1.491798, -2.655084, 1, 0.9372549, 0, 1,
-1.057092, 1.639126, -1.014304, 1, 0.9411765, 0, 1,
-1.054718, 0.0699227, -1.308918, 1, 0.9490196, 0, 1,
-1.047088, 1.148024, 1.465556, 1, 0.9529412, 0, 1,
-1.035693, -1.452376, -1.300982, 1, 0.9607843, 0, 1,
-1.033826, -0.1346605, -3.730438, 1, 0.9647059, 0, 1,
-1.023118, -0.3291845, -3.376292, 1, 0.972549, 0, 1,
-1.020665, -0.110334, -0.9391852, 1, 0.9764706, 0, 1,
-1.017569, 0.3255748, -2.37687, 1, 0.9843137, 0, 1,
-1.017347, -0.9566615, -2.711177, 1, 0.9882353, 0, 1,
-1.016355, 0.175462, -2.086091, 1, 0.9960784, 0, 1,
-1.006755, 0.5487358, -1.365818, 0.9960784, 1, 0, 1,
-1.003288, 0.3923053, -1.825197, 0.9921569, 1, 0, 1,
-0.9989887, -0.1576153, -0.9747499, 0.9843137, 1, 0, 1,
-0.9974233, -0.7158427, -0.7780166, 0.9803922, 1, 0, 1,
-0.9937054, -0.2048354, -2.754685, 0.972549, 1, 0, 1,
-0.9873995, -0.2488441, -1.66587, 0.9686275, 1, 0, 1,
-0.9870311, -0.4192391, -2.469683, 0.9607843, 1, 0, 1,
-0.9838994, 0.04229539, -2.653626, 0.9568627, 1, 0, 1,
-0.9759823, 0.1872623, -2.307095, 0.9490196, 1, 0, 1,
-0.972665, 0.9476851, 2.032798, 0.945098, 1, 0, 1,
-0.9694383, -0.1800432, -3.162624, 0.9372549, 1, 0, 1,
-0.9668717, -0.9183633, -2.59219, 0.9333333, 1, 0, 1,
-0.9648589, -0.1139198, -1.588517, 0.9254902, 1, 0, 1,
-0.9631287, -1.254315, -1.302369, 0.9215686, 1, 0, 1,
-0.9588391, 2.474544, 1.952876, 0.9137255, 1, 0, 1,
-0.9491943, 0.3811387, -0.1726068, 0.9098039, 1, 0, 1,
-0.9413697, -0.911195, -1.051669, 0.9019608, 1, 0, 1,
-0.9353726, -0.1139282, -2.700091, 0.8941177, 1, 0, 1,
-0.9301355, -0.8147163, -2.801067, 0.8901961, 1, 0, 1,
-0.9238732, -0.5873375, -3.751635, 0.8823529, 1, 0, 1,
-0.9228889, -0.478844, -0.94875, 0.8784314, 1, 0, 1,
-0.9227006, -0.2368949, -2.967666, 0.8705882, 1, 0, 1,
-0.9220401, 0.5532212, -1.774594, 0.8666667, 1, 0, 1,
-0.9193497, 0.3440486, -0.3273871, 0.8588235, 1, 0, 1,
-0.9147002, -0.1429498, -2.417093, 0.854902, 1, 0, 1,
-0.9111958, 0.2788564, -1.62765, 0.8470588, 1, 0, 1,
-0.9104452, -0.580569, -2.764118, 0.8431373, 1, 0, 1,
-0.8977846, 0.9821714, -1.969915, 0.8352941, 1, 0, 1,
-0.8938497, 0.3772173, 0.4731443, 0.8313726, 1, 0, 1,
-0.8884008, 0.3736315, -2.275436, 0.8235294, 1, 0, 1,
-0.8858309, 0.3536026, -1.066606, 0.8196079, 1, 0, 1,
-0.8854001, -0.08898807, -2.892043, 0.8117647, 1, 0, 1,
-0.8797778, 0.119554, -1.442115, 0.8078431, 1, 0, 1,
-0.879279, -0.2659239, -2.976839, 0.8, 1, 0, 1,
-0.8729978, -0.0076147, -2.776689, 0.7921569, 1, 0, 1,
-0.8698247, -0.2303698, -1.766445, 0.7882353, 1, 0, 1,
-0.8657349, -0.2656828, -4.247749, 0.7803922, 1, 0, 1,
-0.8656046, 0.3703023, 0.3915077, 0.7764706, 1, 0, 1,
-0.8641269, 0.0758854, 0.4056161, 0.7686275, 1, 0, 1,
-0.862596, -0.2665399, -0.8503311, 0.7647059, 1, 0, 1,
-0.8512725, -0.3333072, -1.467562, 0.7568628, 1, 0, 1,
-0.846941, 0.4032854, -2.091484, 0.7529412, 1, 0, 1,
-0.8468894, 0.5391144, -1.933522, 0.7450981, 1, 0, 1,
-0.8434436, 0.3398284, -0.838729, 0.7411765, 1, 0, 1,
-0.8419076, 0.6988826, -1.767333, 0.7333333, 1, 0, 1,
-0.8397872, -0.1758288, -1.733678, 0.7294118, 1, 0, 1,
-0.8303769, 1.973362, -0.2201573, 0.7215686, 1, 0, 1,
-0.8259147, -1.100839, -3.038399, 0.7176471, 1, 0, 1,
-0.8200821, 2.249739, -1.706343, 0.7098039, 1, 0, 1,
-0.8161471, -1.720047, -3.003485, 0.7058824, 1, 0, 1,
-0.8098392, -0.0705784, -2.219908, 0.6980392, 1, 0, 1,
-0.8096656, 1.30516, -0.5769491, 0.6901961, 1, 0, 1,
-0.7992268, 0.3213804, -0.4435885, 0.6862745, 1, 0, 1,
-0.7976323, 0.7439637, -0.4404952, 0.6784314, 1, 0, 1,
-0.7941806, -2.256439, -5.036366, 0.6745098, 1, 0, 1,
-0.7875997, -1.558465, -0.4507034, 0.6666667, 1, 0, 1,
-0.7803771, 0.8224398, -0.3647386, 0.6627451, 1, 0, 1,
-0.777393, -1.711894, -3.072859, 0.654902, 1, 0, 1,
-0.7687699, 0.1830682, 0.5828467, 0.6509804, 1, 0, 1,
-0.7626657, -1.328421, -0.9612852, 0.6431373, 1, 0, 1,
-0.7603573, 0.7160171, -1.670072, 0.6392157, 1, 0, 1,
-0.7591913, -1.120644, -2.860487, 0.6313726, 1, 0, 1,
-0.758967, 0.2626254, -0.8047975, 0.627451, 1, 0, 1,
-0.7450995, -0.5027038, -0.4926492, 0.6196079, 1, 0, 1,
-0.7429273, 0.5411419, -1.85639, 0.6156863, 1, 0, 1,
-0.7422239, 0.5028259, -1.089531, 0.6078432, 1, 0, 1,
-0.7418293, 0.3615865, -1.417417, 0.6039216, 1, 0, 1,
-0.7381912, -0.1385359, -2.767561, 0.5960785, 1, 0, 1,
-0.7365728, -0.1073368, -0.9858244, 0.5882353, 1, 0, 1,
-0.7349792, -0.8204486, -2.202885, 0.5843138, 1, 0, 1,
-0.7340981, 0.1396966, -2.156187, 0.5764706, 1, 0, 1,
-0.7304438, -0.5825859, -2.468665, 0.572549, 1, 0, 1,
-0.7286587, -0.6401353, -2.963365, 0.5647059, 1, 0, 1,
-0.7259315, -1.102291, -2.792603, 0.5607843, 1, 0, 1,
-0.7248504, 0.4543525, -1.26261, 0.5529412, 1, 0, 1,
-0.7245287, -1.606719, -3.036215, 0.5490196, 1, 0, 1,
-0.7228587, -1.212546, -2.214118, 0.5411765, 1, 0, 1,
-0.7226067, -0.3429016, -4.446208, 0.5372549, 1, 0, 1,
-0.7211901, 0.573064, 0.5944844, 0.5294118, 1, 0, 1,
-0.7176462, -0.726071, -3.166661, 0.5254902, 1, 0, 1,
-0.7172999, -0.8938463, -3.973766, 0.5176471, 1, 0, 1,
-0.7107365, -0.8687788, -4.170456, 0.5137255, 1, 0, 1,
-0.7080966, 0.6811287, -1.019173, 0.5058824, 1, 0, 1,
-0.7022532, 1.019345, -1.536722, 0.5019608, 1, 0, 1,
-0.6985484, -2.289222, -3.075689, 0.4941176, 1, 0, 1,
-0.6934783, -2.141588, -3.167782, 0.4862745, 1, 0, 1,
-0.6923652, -0.7201706, -1.464343, 0.4823529, 1, 0, 1,
-0.6885987, 0.3079466, -2.112489, 0.4745098, 1, 0, 1,
-0.688277, -1.43204, -2.207091, 0.4705882, 1, 0, 1,
-0.6882545, 1.720983, 1.066355, 0.4627451, 1, 0, 1,
-0.6805556, 1.757991, 0.9714715, 0.4588235, 1, 0, 1,
-0.6782232, -1.438242, -1.471019, 0.4509804, 1, 0, 1,
-0.6754254, -1.615131, -2.524048, 0.4470588, 1, 0, 1,
-0.673483, -2.422969, -4.168185, 0.4392157, 1, 0, 1,
-0.6702796, 1.345474, -2.349732, 0.4352941, 1, 0, 1,
-0.6644713, -0.08200639, -2.342605, 0.427451, 1, 0, 1,
-0.6636884, -0.149783, -2.323193, 0.4235294, 1, 0, 1,
-0.6554132, 0.2075832, 0.5811126, 0.4156863, 1, 0, 1,
-0.6483257, -0.4005243, -2.166297, 0.4117647, 1, 0, 1,
-0.647429, -0.5861499, -1.073853, 0.4039216, 1, 0, 1,
-0.6405045, 0.3475534, 0.7889716, 0.3960784, 1, 0, 1,
-0.6249835, -0.1454207, -1.290778, 0.3921569, 1, 0, 1,
-0.6241824, -1.505147, -2.055949, 0.3843137, 1, 0, 1,
-0.6223781, 1.661139, 0.2316385, 0.3803922, 1, 0, 1,
-0.6208032, 0.509473, -0.3737572, 0.372549, 1, 0, 1,
-0.6134242, -1.988925, -2.881496, 0.3686275, 1, 0, 1,
-0.6115118, 0.2135027, -2.221262, 0.3607843, 1, 0, 1,
-0.6109767, 0.07500134, -1.805229, 0.3568628, 1, 0, 1,
-0.6038635, -0.7802296, -1.002139, 0.3490196, 1, 0, 1,
-0.6034577, 1.214949, -1.742326, 0.345098, 1, 0, 1,
-0.6013567, -1.899759, -2.902328, 0.3372549, 1, 0, 1,
-0.6001342, 1.38237, 0.09317566, 0.3333333, 1, 0, 1,
-0.5946461, 1.243399, -0.5871217, 0.3254902, 1, 0, 1,
-0.5935867, -0.6013798, -4.306421, 0.3215686, 1, 0, 1,
-0.5914754, 0.7966228, -0.4370528, 0.3137255, 1, 0, 1,
-0.5802886, 1.452217, 0.4928443, 0.3098039, 1, 0, 1,
-0.5786982, 0.1851613, -0.9572223, 0.3019608, 1, 0, 1,
-0.5751101, 0.8673502, -2.034533, 0.2941177, 1, 0, 1,
-0.5726071, -0.6109752, -2.270914, 0.2901961, 1, 0, 1,
-0.5671893, -0.06261002, -1.206571, 0.282353, 1, 0, 1,
-0.5667595, -0.9056331, -3.45351, 0.2784314, 1, 0, 1,
-0.5649183, -0.3629399, -2.340711, 0.2705882, 1, 0, 1,
-0.563192, 0.7768967, -2.246431, 0.2666667, 1, 0, 1,
-0.563121, 1.62115, 0.2365496, 0.2588235, 1, 0, 1,
-0.5588683, -0.3960184, -1.564136, 0.254902, 1, 0, 1,
-0.5541427, -1.406816, -2.246482, 0.2470588, 1, 0, 1,
-0.5535223, 0.2268316, -0.4627348, 0.2431373, 1, 0, 1,
-0.5512104, -0.2377458, -2.340831, 0.2352941, 1, 0, 1,
-0.5476506, -0.7585778, -3.854272, 0.2313726, 1, 0, 1,
-0.5447742, 0.1613562, -1.333763, 0.2235294, 1, 0, 1,
-0.5425805, 0.3486948, -2.217773, 0.2196078, 1, 0, 1,
-0.5386402, -1.844849, -3.099306, 0.2117647, 1, 0, 1,
-0.5311111, 1.528324, -0.09426768, 0.2078431, 1, 0, 1,
-0.5305693, 0.5593367, 0.2187437, 0.2, 1, 0, 1,
-0.5301414, -0.7376859, -0.9505798, 0.1921569, 1, 0, 1,
-0.5238192, 2.762232, -1.509305, 0.1882353, 1, 0, 1,
-0.5196587, -1.184103, -4.960636, 0.1803922, 1, 0, 1,
-0.5191166, -0.1615224, -1.954267, 0.1764706, 1, 0, 1,
-0.5181183, -0.6694538, -2.980524, 0.1686275, 1, 0, 1,
-0.5176379, -0.4292221, -2.197872, 0.1647059, 1, 0, 1,
-0.5175543, -0.4320564, -2.737777, 0.1568628, 1, 0, 1,
-0.5141497, 0.2529412, -1.427896, 0.1529412, 1, 0, 1,
-0.5131541, 0.1962449, -1.776997, 0.145098, 1, 0, 1,
-0.510941, 0.628525, -2.446794, 0.1411765, 1, 0, 1,
-0.5072553, 1.033004, 0.1554926, 0.1333333, 1, 0, 1,
-0.5066879, -0.7457929, -3.144977, 0.1294118, 1, 0, 1,
-0.5056583, 0.9753551, -0.03161486, 0.1215686, 1, 0, 1,
-0.5032998, 0.3043506, 0.009591599, 0.1176471, 1, 0, 1,
-0.5019467, -0.03949761, -1.274738, 0.1098039, 1, 0, 1,
-0.4996435, 0.4153656, -0.3701869, 0.1058824, 1, 0, 1,
-0.496601, 0.130617, -0.3040904, 0.09803922, 1, 0, 1,
-0.4963951, 1.353109, -1.053854, 0.09019608, 1, 0, 1,
-0.4941944, -0.7425643, -2.958835, 0.08627451, 1, 0, 1,
-0.4884913, -0.9364166, -1.441502, 0.07843138, 1, 0, 1,
-0.4804474, 1.401618, -0.1238622, 0.07450981, 1, 0, 1,
-0.4767713, -1.488349, -2.308924, 0.06666667, 1, 0, 1,
-0.4712639, -0.7383122, -2.291953, 0.0627451, 1, 0, 1,
-0.469176, -0.2525709, -1.960175, 0.05490196, 1, 0, 1,
-0.455619, -0.3475839, -2.727081, 0.05098039, 1, 0, 1,
-0.4545495, 1.673925, -2.647405, 0.04313726, 1, 0, 1,
-0.4535172, -0.4642875, -3.100247, 0.03921569, 1, 0, 1,
-0.4515997, -1.651206, -3.240909, 0.03137255, 1, 0, 1,
-0.4498054, 0.1645117, -1.726962, 0.02745098, 1, 0, 1,
-0.4432072, 0.4156519, -1.250618, 0.01960784, 1, 0, 1,
-0.4412556, -0.8765535, -2.833238, 0.01568628, 1, 0, 1,
-0.4366228, 0.09629279, 0.370205, 0.007843138, 1, 0, 1,
-0.4361427, -2.000528, -3.36137, 0.003921569, 1, 0, 1,
-0.426712, -1.262561, -3.410023, 0, 1, 0.003921569, 1,
-0.4261438, 0.7263153, -1.694497, 0, 1, 0.01176471, 1,
-0.420296, -0.3986691, -0.9335327, 0, 1, 0.01568628, 1,
-0.4198636, 0.0536042, -3.298325, 0, 1, 0.02352941, 1,
-0.4152576, 0.6309288, -0.3042169, 0, 1, 0.02745098, 1,
-0.4140483, 0.2806734, -1.069295, 0, 1, 0.03529412, 1,
-0.4092094, -2.180228, -2.469909, 0, 1, 0.03921569, 1,
-0.4087903, 0.682077, -1.058801, 0, 1, 0.04705882, 1,
-0.4066867, 0.5094082, 0.3797855, 0, 1, 0.05098039, 1,
-0.4035974, 0.8523265, 0.5869856, 0, 1, 0.05882353, 1,
-0.4032608, 0.2819641, -3.681364, 0, 1, 0.0627451, 1,
-0.4008671, 0.4103514, -1.885387, 0, 1, 0.07058824, 1,
-0.3967321, 0.2488353, -3.445514, 0, 1, 0.07450981, 1,
-0.3887854, 1.152606, -1.934311, 0, 1, 0.08235294, 1,
-0.3874554, 0.003209974, 0.6597773, 0, 1, 0.08627451, 1,
-0.3866429, -0.8225218, -1.740854, 0, 1, 0.09411765, 1,
-0.3863287, -0.8050038, -3.692079, 0, 1, 0.1019608, 1,
-0.3814465, -1.20097, -2.820433, 0, 1, 0.1058824, 1,
-0.38128, -0.2851481, -2.248468, 0, 1, 0.1137255, 1,
-0.3736327, 0.4829275, -1.297572, 0, 1, 0.1176471, 1,
-0.3609828, 1.21641, -1.638029, 0, 1, 0.1254902, 1,
-0.3605642, -2.076704, -4.606624, 0, 1, 0.1294118, 1,
-0.3580803, -1.241405, -4.009253, 0, 1, 0.1372549, 1,
-0.3569009, 0.5308204, -0.3992818, 0, 1, 0.1411765, 1,
-0.3562589, 0.6107368, 0.2590406, 0, 1, 0.1490196, 1,
-0.3549452, 0.1106719, -1.19541, 0, 1, 0.1529412, 1,
-0.3516953, 1.039585, -1.624081, 0, 1, 0.1607843, 1,
-0.3512217, 0.0301211, -0.7357732, 0, 1, 0.1647059, 1,
-0.3495016, 0.07942566, -0.3517603, 0, 1, 0.172549, 1,
-0.3446162, -1.91036, -1.458036, 0, 1, 0.1764706, 1,
-0.3416456, -0.5253162, -2.427265, 0, 1, 0.1843137, 1,
-0.3402445, -0.1620486, -0.7785955, 0, 1, 0.1882353, 1,
-0.338759, 2.1255, -2.042438, 0, 1, 0.1960784, 1,
-0.3328327, 0.5966995, -0.9814506, 0, 1, 0.2039216, 1,
-0.3272695, -0.6223595, -3.506005, 0, 1, 0.2078431, 1,
-0.3249443, 0.8471192, -0.6411566, 0, 1, 0.2156863, 1,
-0.3221822, -0.1736163, -1.136209, 0, 1, 0.2196078, 1,
-0.3171066, -0.4060628, -3.776349, 0, 1, 0.227451, 1,
-0.3170501, -0.0934645, -1.651745, 0, 1, 0.2313726, 1,
-0.3166602, 0.4995068, -0.6517171, 0, 1, 0.2392157, 1,
-0.3157978, 1.317083, 1.468852, 0, 1, 0.2431373, 1,
-0.3135412, -0.2318816, -1.700559, 0, 1, 0.2509804, 1,
-0.3119732, -0.9513595, -3.42785, 0, 1, 0.254902, 1,
-0.307043, -1.259064, -3.473699, 0, 1, 0.2627451, 1,
-0.3068042, 0.4802988, 0.1325964, 0, 1, 0.2666667, 1,
-0.3037413, 0.05742731, -2.147159, 0, 1, 0.2745098, 1,
-0.3011743, 1.391432, 0.5169743, 0, 1, 0.2784314, 1,
-0.3010112, -1.066344, -3.25775, 0, 1, 0.2862745, 1,
-0.2989254, -0.4920199, -2.335414, 0, 1, 0.2901961, 1,
-0.2988223, -1.505405, -3.756989, 0, 1, 0.2980392, 1,
-0.2967128, 0.03727639, -0.6467368, 0, 1, 0.3058824, 1,
-0.2965927, -0.08343235, -2.1056, 0, 1, 0.3098039, 1,
-0.2936224, 0.6187176, 0.05983394, 0, 1, 0.3176471, 1,
-0.2926463, 1.367183, 0.1854861, 0, 1, 0.3215686, 1,
-0.2907289, -0.6778247, -2.149023, 0, 1, 0.3294118, 1,
-0.2894391, 0.8867064, 0.4045078, 0, 1, 0.3333333, 1,
-0.2877959, -0.9274217, -2.099965, 0, 1, 0.3411765, 1,
-0.2871128, -1.643044, -2.17155, 0, 1, 0.345098, 1,
-0.2863467, 0.1197539, -2.401451, 0, 1, 0.3529412, 1,
-0.2766432, 0.0217506, -0.7480953, 0, 1, 0.3568628, 1,
-0.2756236, 0.9333777, -1.330075, 0, 1, 0.3647059, 1,
-0.2745037, 0.5342287, 1.522081, 0, 1, 0.3686275, 1,
-0.2737755, 0.9952984, -0.8322498, 0, 1, 0.3764706, 1,
-0.2722093, -2.313383, -1.783656, 0, 1, 0.3803922, 1,
-0.2722033, -0.03715069, -0.9163837, 0, 1, 0.3882353, 1,
-0.2699781, -0.8478625, -3.608558, 0, 1, 0.3921569, 1,
-0.2676737, -0.583059, -3.399968, 0, 1, 0.4, 1,
-0.2666337, -0.1822402, -2.826577, 0, 1, 0.4078431, 1,
-0.264488, -1.39315, -1.363658, 0, 1, 0.4117647, 1,
-0.2598463, -1.032764, -3.410321, 0, 1, 0.4196078, 1,
-0.2578709, -0.8188503, -1.661634, 0, 1, 0.4235294, 1,
-0.2569226, 0.8043281, 0.3320269, 0, 1, 0.4313726, 1,
-0.2550422, 1.650916, -0.8147635, 0, 1, 0.4352941, 1,
-0.2532805, -0.5124087, -3.163536, 0, 1, 0.4431373, 1,
-0.2532523, -0.340167, -2.880202, 0, 1, 0.4470588, 1,
-0.2522025, 1.258815, 1.614915, 0, 1, 0.454902, 1,
-0.2498409, 1.349003, 1.733134, 0, 1, 0.4588235, 1,
-0.2460968, -1.583176, -1.474524, 0, 1, 0.4666667, 1,
-0.2433055, -0.1461757, -1.960122, 0, 1, 0.4705882, 1,
-0.2406388, -0.1820452, -4.690996, 0, 1, 0.4784314, 1,
-0.2404122, 0.3485287, -0.9539049, 0, 1, 0.4823529, 1,
-0.2383853, 0.4754038, -1.181102, 0, 1, 0.4901961, 1,
-0.2364821, -0.5491641, -2.443191, 0, 1, 0.4941176, 1,
-0.2326714, 1.223394, 0.1195079, 0, 1, 0.5019608, 1,
-0.2315808, -1.579287, -4.878094, 0, 1, 0.509804, 1,
-0.227954, -1.254211, -3.1516, 0, 1, 0.5137255, 1,
-0.2242006, 0.4147462, -0.7142449, 0, 1, 0.5215687, 1,
-0.2231014, 1.703006, -0.6369317, 0, 1, 0.5254902, 1,
-0.2216277, 2.381313, 0.742511, 0, 1, 0.5333334, 1,
-0.2211067, -0.2036697, -1.504739, 0, 1, 0.5372549, 1,
-0.216618, -0.1508411, -1.300856, 0, 1, 0.5450981, 1,
-0.2146809, -0.5278034, -2.523627, 0, 1, 0.5490196, 1,
-0.2124196, 1.11052, -0.6746128, 0, 1, 0.5568628, 1,
-0.2109151, -1.541763, -2.47946, 0, 1, 0.5607843, 1,
-0.2055637, 0.6108311, -0.7619147, 0, 1, 0.5686275, 1,
-0.2046277, 2.072121, 0.3068258, 0, 1, 0.572549, 1,
-0.202141, 2.200547, 0.3535411, 0, 1, 0.5803922, 1,
-0.2003379, -0.8558629, -4.186554, 0, 1, 0.5843138, 1,
-0.2003005, -0.7617415, -2.193501, 0, 1, 0.5921569, 1,
-0.1993174, -1.926527, -2.49735, 0, 1, 0.5960785, 1,
-0.1988156, 0.7157964, -1.610509, 0, 1, 0.6039216, 1,
-0.1979194, 0.4571889, -0.1779854, 0, 1, 0.6117647, 1,
-0.1972895, 0.7136878, -1.316304, 0, 1, 0.6156863, 1,
-0.1967207, 1.927204, 0.831206, 0, 1, 0.6235294, 1,
-0.1906614, 0.1126586, -1.527555, 0, 1, 0.627451, 1,
-0.1900011, 1.187295, -0.9549241, 0, 1, 0.6352941, 1,
-0.1828323, 0.8076255, -0.09895737, 0, 1, 0.6392157, 1,
-0.1778211, -1.18527, -3.362914, 0, 1, 0.6470588, 1,
-0.1774493, -0.8019717, -3.608842, 0, 1, 0.6509804, 1,
-0.1751288, 0.1525491, 0.9738096, 0, 1, 0.6588235, 1,
-0.1721544, 0.3826544, -2.095056, 0, 1, 0.6627451, 1,
-0.1676583, -0.1932404, -2.246504, 0, 1, 0.6705883, 1,
-0.1628839, -0.7119592, -3.59536, 0, 1, 0.6745098, 1,
-0.1578084, -0.7716352, -3.663059, 0, 1, 0.682353, 1,
-0.1521083, -1.928826, -4.456924, 0, 1, 0.6862745, 1,
-0.1519937, -0.6670777, -3.187761, 0, 1, 0.6941177, 1,
-0.1441405, -0.2772984, -0.4680838, 0, 1, 0.7019608, 1,
-0.1372895, -0.5303817, -2.599347, 0, 1, 0.7058824, 1,
-0.136293, 0.04514319, -2.188685, 0, 1, 0.7137255, 1,
-0.132965, 0.8054718, 0.4583928, 0, 1, 0.7176471, 1,
-0.1315053, 0.3079991, 0.4755925, 0, 1, 0.7254902, 1,
-0.1312324, -1.339702, -1.822086, 0, 1, 0.7294118, 1,
-0.125069, 1.165694, -0.4257078, 0, 1, 0.7372549, 1,
-0.1204851, 0.06370121, -1.66314, 0, 1, 0.7411765, 1,
-0.1172448, 0.1251776, 0.2043059, 0, 1, 0.7490196, 1,
-0.1154756, 0.03977568, -2.314003, 0, 1, 0.7529412, 1,
-0.1134333, -0.8365959, -2.056021, 0, 1, 0.7607843, 1,
-0.1119291, -1.488792, -0.8384215, 0, 1, 0.7647059, 1,
-0.1108096, 0.7754523, 1.573175, 0, 1, 0.772549, 1,
-0.1104781, -0.2549794, -3.505961, 0, 1, 0.7764706, 1,
-0.1064631, -0.9829656, -3.198145, 0, 1, 0.7843137, 1,
-0.1047432, 1.251956, -0.4910868, 0, 1, 0.7882353, 1,
-0.1046956, 0.752075, 1.101634, 0, 1, 0.7960784, 1,
-0.1037851, 0.6002082, -0.6739004, 0, 1, 0.8039216, 1,
-0.1033969, -0.3719058, -5.617129, 0, 1, 0.8078431, 1,
-0.09884835, -1.142136, -3.562517, 0, 1, 0.8156863, 1,
-0.09870166, -1.727412, -2.304356, 0, 1, 0.8196079, 1,
-0.09367327, 0.5725646, -0.07063147, 0, 1, 0.827451, 1,
-0.09239567, -2.379435, -3.125119, 0, 1, 0.8313726, 1,
-0.09130637, -0.4884494, -1.361224, 0, 1, 0.8392157, 1,
-0.08990492, 1.911879, -1.364415, 0, 1, 0.8431373, 1,
-0.08338664, -0.4005702, -1.590573, 0, 1, 0.8509804, 1,
-0.08183156, 2.522512, -1.037728, 0, 1, 0.854902, 1,
-0.08052327, 0.07257164, -0.7583179, 0, 1, 0.8627451, 1,
-0.07804085, -1.590891, -2.171954, 0, 1, 0.8666667, 1,
-0.06377842, -0.1166874, -2.276751, 0, 1, 0.8745098, 1,
-0.05979187, -1.657642, -4.349806, 0, 1, 0.8784314, 1,
-0.05707927, 0.5485173, -2.281118, 0, 1, 0.8862745, 1,
-0.05572807, 1.132474, 0.7891682, 0, 1, 0.8901961, 1,
-0.05503627, -1.102616, -3.164097, 0, 1, 0.8980392, 1,
-0.0537719, 1.032234, 1.058043, 0, 1, 0.9058824, 1,
-0.04618476, -0.412651, -2.281974, 0, 1, 0.9098039, 1,
-0.04402081, 1.16002, 0.8200362, 0, 1, 0.9176471, 1,
-0.04357359, -0.1195904, -2.33248, 0, 1, 0.9215686, 1,
-0.03517519, -0.196713, -1.88892, 0, 1, 0.9294118, 1,
-0.03330861, -1.084966, -4.058285, 0, 1, 0.9333333, 1,
-0.03273529, 2.98365, 1.767076, 0, 1, 0.9411765, 1,
-0.02819031, -0.1297989, -1.998434, 0, 1, 0.945098, 1,
-0.02536115, -3.067109, -3.420148, 0, 1, 0.9529412, 1,
-0.02434663, 1.689301, -1.301756, 0, 1, 0.9568627, 1,
-0.01837393, 0.2814819, -0.7160512, 0, 1, 0.9647059, 1,
-0.0128971, 1.676699, -0.1529451, 0, 1, 0.9686275, 1,
-0.009460085, 1.159027, -1.560793, 0, 1, 0.9764706, 1,
-0.008238129, 0.7039977, -1.188405, 0, 1, 0.9803922, 1,
-0.003292538, -0.05098228, -4.784486, 0, 1, 0.9882353, 1,
-0.002493771, 0.1987511, -0.3587984, 0, 1, 0.9921569, 1,
-0.001208238, -0.8093451, -2.582445, 0, 1, 1, 1,
0.001380879, 0.08272937, 1.178849, 0, 0.9921569, 1, 1,
0.003650952, 1.630303, 0.3937034, 0, 0.9882353, 1, 1,
0.004023976, -1.139209, 4.910133, 0, 0.9803922, 1, 1,
0.004552125, 0.7463886, 0.7121218, 0, 0.9764706, 1, 1,
0.005543221, 0.8365413, -0.5465018, 0, 0.9686275, 1, 1,
0.01071019, -0.3259765, 3.655721, 0, 0.9647059, 1, 1,
0.01263457, -0.490717, 3.119081, 0, 0.9568627, 1, 1,
0.0137893, -0.4335389, 2.822381, 0, 0.9529412, 1, 1,
0.01484923, -1.122123, 2.558848, 0, 0.945098, 1, 1,
0.02049596, -0.6974364, 2.803838, 0, 0.9411765, 1, 1,
0.02225927, 1.065638, -1.175207, 0, 0.9333333, 1, 1,
0.02733721, -0.4614097, 3.305536, 0, 0.9294118, 1, 1,
0.02807565, -0.3049776, 3.937845, 0, 0.9215686, 1, 1,
0.03118679, 0.9809652, 0.7419076, 0, 0.9176471, 1, 1,
0.03352134, 0.1570113, -0.8084458, 0, 0.9098039, 1, 1,
0.03358822, 1.56531, -0.2454358, 0, 0.9058824, 1, 1,
0.0382289, -1.923569, 4.535143, 0, 0.8980392, 1, 1,
0.0484736, 0.5334606, -0.4672227, 0, 0.8901961, 1, 1,
0.0511533, -0.2087021, 3.74799, 0, 0.8862745, 1, 1,
0.05325696, -0.2175468, 4.187752, 0, 0.8784314, 1, 1,
0.05684745, 0.1131036, 0.3481229, 0, 0.8745098, 1, 1,
0.05714562, 1.302503, 0.1386293, 0, 0.8666667, 1, 1,
0.06251755, 0.2707053, 0.8481483, 0, 0.8627451, 1, 1,
0.06315375, 0.6929108, -0.246686, 0, 0.854902, 1, 1,
0.06407312, -1.03331, 2.902012, 0, 0.8509804, 1, 1,
0.06595442, 0.4184502, 1.230605, 0, 0.8431373, 1, 1,
0.06715113, -0.4176086, 1.959176, 0, 0.8392157, 1, 1,
0.06749287, 1.079193, 0.7635186, 0, 0.8313726, 1, 1,
0.06776427, 0.7613953, 0.3648556, 0, 0.827451, 1, 1,
0.0679464, -0.2314737, 1.934157, 0, 0.8196079, 1, 1,
0.06875726, -0.9331279, 2.625253, 0, 0.8156863, 1, 1,
0.06876741, 0.2965023, 0.5240946, 0, 0.8078431, 1, 1,
0.07120404, 1.130525, -0.5405715, 0, 0.8039216, 1, 1,
0.07389366, 0.2107512, 0.7458904, 0, 0.7960784, 1, 1,
0.07456994, -1.895779, 1.873842, 0, 0.7882353, 1, 1,
0.07664286, 0.03708229, 1.448859, 0, 0.7843137, 1, 1,
0.08162486, -0.2615601, 2.803777, 0, 0.7764706, 1, 1,
0.08382222, 0.2702906, 1.453279, 0, 0.772549, 1, 1,
0.08625071, -0.5868745, 3.136827, 0, 0.7647059, 1, 1,
0.08628783, 0.3772117, 2.356325, 0, 0.7607843, 1, 1,
0.0902919, 0.07105771, 4.459483, 0, 0.7529412, 1, 1,
0.09621745, 0.07434254, 3.217916, 0, 0.7490196, 1, 1,
0.1082369, 0.1909689, -1.788921, 0, 0.7411765, 1, 1,
0.1126778, -0.2942359, 2.281762, 0, 0.7372549, 1, 1,
0.1129613, -0.8302823, 3.195151, 0, 0.7294118, 1, 1,
0.1140074, 1.318487, -1.792236, 0, 0.7254902, 1, 1,
0.114686, -0.1962147, 1.126725, 0, 0.7176471, 1, 1,
0.1149702, -0.5313392, 2.904768, 0, 0.7137255, 1, 1,
0.1192071, -0.04675718, 2.612257, 0, 0.7058824, 1, 1,
0.1198542, -0.9695661, 3.268798, 0, 0.6980392, 1, 1,
0.120371, 0.570511, -0.6310724, 0, 0.6941177, 1, 1,
0.1229276, 0.7734195, -1.825482, 0, 0.6862745, 1, 1,
0.1263748, -0.5020944, 1.981577, 0, 0.682353, 1, 1,
0.1268649, 1.322972, -0.2604243, 0, 0.6745098, 1, 1,
0.127228, 0.755464, 0.01221344, 0, 0.6705883, 1, 1,
0.1289194, 0.7875698, 2.114196, 0, 0.6627451, 1, 1,
0.1307239, 1.232928, 1.040353, 0, 0.6588235, 1, 1,
0.1342011, 0.1788013, 0.9309161, 0, 0.6509804, 1, 1,
0.1358853, 0.2117271, 0.69289, 0, 0.6470588, 1, 1,
0.1366073, 1.7484, -0.06118743, 0, 0.6392157, 1, 1,
0.137918, -1.917106, 3.077122, 0, 0.6352941, 1, 1,
0.1381993, -1.007436, 4.132017, 0, 0.627451, 1, 1,
0.1397683, -3.220591, 2.521395, 0, 0.6235294, 1, 1,
0.1413462, 0.3862878, 2.994174, 0, 0.6156863, 1, 1,
0.14297, 0.1156254, 1.782565, 0, 0.6117647, 1, 1,
0.1433108, -0.4781106, 1.658526, 0, 0.6039216, 1, 1,
0.1501255, 0.4826551, 1.592322, 0, 0.5960785, 1, 1,
0.1530242, -0.5232686, 1.699381, 0, 0.5921569, 1, 1,
0.1555786, 0.2392301, -1.460832, 0, 0.5843138, 1, 1,
0.1556899, -1.481791, 3.801082, 0, 0.5803922, 1, 1,
0.1597264, -0.1721921, 2.594516, 0, 0.572549, 1, 1,
0.1656063, 1.129088, -0.7172159, 0, 0.5686275, 1, 1,
0.1660733, -0.4545087, 3.312659, 0, 0.5607843, 1, 1,
0.171079, -1.389222, 3.808483, 0, 0.5568628, 1, 1,
0.1719774, 1.125771, -0.3545554, 0, 0.5490196, 1, 1,
0.176602, -0.9951452, 2.690701, 0, 0.5450981, 1, 1,
0.1774009, -0.404093, 0.9541275, 0, 0.5372549, 1, 1,
0.1819344, -0.06531325, 0.7239848, 0, 0.5333334, 1, 1,
0.1819549, 1.855041, 0.4853539, 0, 0.5254902, 1, 1,
0.1834697, -0.8451563, 1.75495, 0, 0.5215687, 1, 1,
0.1834902, 0.08640471, 2.002613, 0, 0.5137255, 1, 1,
0.1848703, 1.208968, -0.2610284, 0, 0.509804, 1, 1,
0.1852343, -0.04483874, 2.050922, 0, 0.5019608, 1, 1,
0.1863807, 1.239493, 0.5077049, 0, 0.4941176, 1, 1,
0.1905133, -0.03395572, 2.196502, 0, 0.4901961, 1, 1,
0.1923541, 0.8089288, 1.916263, 0, 0.4823529, 1, 1,
0.1935788, 0.2367218, 1.365475, 0, 0.4784314, 1, 1,
0.1942954, 0.5591725, 1.479922, 0, 0.4705882, 1, 1,
0.1943325, -3.252979, 1.756638, 0, 0.4666667, 1, 1,
0.2003786, -1.38916, 3.208287, 0, 0.4588235, 1, 1,
0.2015235, 0.325283, 0.137422, 0, 0.454902, 1, 1,
0.2022127, 0.403606, -0.2533202, 0, 0.4470588, 1, 1,
0.2063732, -0.4109119, 3.799377, 0, 0.4431373, 1, 1,
0.209983, -1.7429, 3.664657, 0, 0.4352941, 1, 1,
0.2101502, -1.550457, 3.013847, 0, 0.4313726, 1, 1,
0.2111615, 0.2745097, 1.63727, 0, 0.4235294, 1, 1,
0.2148957, -1.907829, 2.228797, 0, 0.4196078, 1, 1,
0.215397, 1.179255, -0.6491492, 0, 0.4117647, 1, 1,
0.2168397, 0.9053086, -1.212646, 0, 0.4078431, 1, 1,
0.2188445, -0.6473172, 3.118733, 0, 0.4, 1, 1,
0.2189875, -0.2283675, 2.349223, 0, 0.3921569, 1, 1,
0.2192244, 2.022094, 0.6900471, 0, 0.3882353, 1, 1,
0.2205886, 1.785589, 0.9006982, 0, 0.3803922, 1, 1,
0.2208108, -0.6350349, 2.854952, 0, 0.3764706, 1, 1,
0.221678, 1.549721, -0.3356062, 0, 0.3686275, 1, 1,
0.2219643, 0.054399, 1.198352, 0, 0.3647059, 1, 1,
0.2320704, -1.085762, 4.483394, 0, 0.3568628, 1, 1,
0.2340075, 0.4020111, -0.2937631, 0, 0.3529412, 1, 1,
0.2371831, 0.4826654, -2.156983, 0, 0.345098, 1, 1,
0.2389839, -0.4509735, 3.797991, 0, 0.3411765, 1, 1,
0.2432666, 0.05126927, 1.262844, 0, 0.3333333, 1, 1,
0.2448733, -0.7341549, 1.984658, 0, 0.3294118, 1, 1,
0.2474081, -3.07187, 4.536732, 0, 0.3215686, 1, 1,
0.247635, -0.6838477, 2.921036, 0, 0.3176471, 1, 1,
0.2484953, -0.1725338, 3.58703, 0, 0.3098039, 1, 1,
0.2491356, -1.081063, 2.552559, 0, 0.3058824, 1, 1,
0.2604963, -0.5211977, 1.958274, 0, 0.2980392, 1, 1,
0.261292, -0.4340357, 2.19349, 0, 0.2901961, 1, 1,
0.265143, -0.4190837, 1.752524, 0, 0.2862745, 1, 1,
0.2667377, 0.2757961, 1.622421, 0, 0.2784314, 1, 1,
0.2680264, -0.8753975, 1.895012, 0, 0.2745098, 1, 1,
0.2687533, 0.3781214, -0.2490288, 0, 0.2666667, 1, 1,
0.270032, -1.771027, 2.368509, 0, 0.2627451, 1, 1,
0.2706833, 1.594199, 0.5675646, 0, 0.254902, 1, 1,
0.2707396, 1.149778, -0.5003964, 0, 0.2509804, 1, 1,
0.2785931, 0.7231112, 1.290693, 0, 0.2431373, 1, 1,
0.2788214, -0.6594796, 1.501548, 0, 0.2392157, 1, 1,
0.2879167, 0.06321798, 3.083808, 0, 0.2313726, 1, 1,
0.289711, 1.289672, 0.4646517, 0, 0.227451, 1, 1,
0.2901567, 2.043456, 0.5363911, 0, 0.2196078, 1, 1,
0.297338, -0.7932846, 2.38326, 0, 0.2156863, 1, 1,
0.2985519, -0.860113, 3.207904, 0, 0.2078431, 1, 1,
0.3010534, 0.1993039, 1.572626, 0, 0.2039216, 1, 1,
0.3065288, 1.790798, 0.5739553, 0, 0.1960784, 1, 1,
0.3083354, -1.176581, 2.446347, 0, 0.1882353, 1, 1,
0.3116883, 0.02851145, 0.9986638, 0, 0.1843137, 1, 1,
0.3190461, 0.9161594, 2.327776, 0, 0.1764706, 1, 1,
0.3214433, -0.06220616, 2.10881, 0, 0.172549, 1, 1,
0.3296319, -0.07810393, 2.549153, 0, 0.1647059, 1, 1,
0.3335229, -0.7241654, 2.970828, 0, 0.1607843, 1, 1,
0.335647, 1.13096, 1.794965, 0, 0.1529412, 1, 1,
0.3396703, -0.9032443, 3.047543, 0, 0.1490196, 1, 1,
0.3404727, 0.7534282, 0.1385288, 0, 0.1411765, 1, 1,
0.3412158, 0.1537141, 1.443407, 0, 0.1372549, 1, 1,
0.3437389, 0.1033771, 1.072408, 0, 0.1294118, 1, 1,
0.3492788, 0.49394, 0.8288572, 0, 0.1254902, 1, 1,
0.355137, -1.054486, 1.004873, 0, 0.1176471, 1, 1,
0.3558403, -1.302796, 2.123263, 0, 0.1137255, 1, 1,
0.3562129, 1.251715, -0.7026448, 0, 0.1058824, 1, 1,
0.3567151, -0.1337283, -0.3170352, 0, 0.09803922, 1, 1,
0.3625408, -0.4943519, 2.436781, 0, 0.09411765, 1, 1,
0.366111, -0.2248891, 1.745779, 0, 0.08627451, 1, 1,
0.3676969, -0.3667364, 3.524757, 0, 0.08235294, 1, 1,
0.3677747, 0.4285915, 0.00272545, 0, 0.07450981, 1, 1,
0.3688789, 0.5007628, -1.38998, 0, 0.07058824, 1, 1,
0.3694174, 1.378589, 1.85318, 0, 0.0627451, 1, 1,
0.3696381, 0.5888342, -0.6359959, 0, 0.05882353, 1, 1,
0.3789967, -1.336094, 1.867918, 0, 0.05098039, 1, 1,
0.3841372, -0.02497156, 2.714345, 0, 0.04705882, 1, 1,
0.3852712, 1.669504, 1.581177, 0, 0.03921569, 1, 1,
0.3891529, -0.09244283, 3.608004, 0, 0.03529412, 1, 1,
0.3943554, 0.02116544, 0.5794409, 0, 0.02745098, 1, 1,
0.3998892, 0.4689954, -0.46691, 0, 0.02352941, 1, 1,
0.4029927, -0.7800217, 1.698725, 0, 0.01568628, 1, 1,
0.4042123, -1.306744, 2.701734, 0, 0.01176471, 1, 1,
0.4045326, -0.8405898, 2.907529, 0, 0.003921569, 1, 1,
0.4066109, 1.622282, 0.3934404, 0.003921569, 0, 1, 1,
0.4070799, 1.286898, 1.184752, 0.007843138, 0, 1, 1,
0.4094683, 0.4841003, 0.2892639, 0.01568628, 0, 1, 1,
0.4149229, -0.8203573, 5.166694, 0.01960784, 0, 1, 1,
0.4176953, -2.381721, 1.905358, 0.02745098, 0, 1, 1,
0.4201871, -1.337412, 5.184558, 0.03137255, 0, 1, 1,
0.4231834, 0.554663, 0.5991452, 0.03921569, 0, 1, 1,
0.4233637, -0.07210244, 1.684378, 0.04313726, 0, 1, 1,
0.426982, 0.07648362, 0.8834966, 0.05098039, 0, 1, 1,
0.43161, -0.1262649, 1.945213, 0.05490196, 0, 1, 1,
0.4344327, -1.597252, 1.817248, 0.0627451, 0, 1, 1,
0.4351874, 0.05517401, 1.328167, 0.06666667, 0, 1, 1,
0.4367458, 0.1274081, 1.641725, 0.07450981, 0, 1, 1,
0.4392529, 2.579142, 1.179021, 0.07843138, 0, 1, 1,
0.4396383, -0.1222862, 3.555203, 0.08627451, 0, 1, 1,
0.4412578, -0.9979244, 3.738571, 0.09019608, 0, 1, 1,
0.4461884, 1.365439, 1.407476, 0.09803922, 0, 1, 1,
0.44658, -0.2716638, 4.411898, 0.1058824, 0, 1, 1,
0.4474031, 0.02138631, 2.00697, 0.1098039, 0, 1, 1,
0.4474451, -0.1398946, 0.140594, 0.1176471, 0, 1, 1,
0.4504229, -2.064696, 1.947151, 0.1215686, 0, 1, 1,
0.4507462, -0.6934237, 3.174644, 0.1294118, 0, 1, 1,
0.4512666, -0.8255416, 3.212337, 0.1333333, 0, 1, 1,
0.4517869, -0.1030823, 0.7981271, 0.1411765, 0, 1, 1,
0.452561, 1.037834, 1.442951, 0.145098, 0, 1, 1,
0.4538534, 0.746134, 1.439412, 0.1529412, 0, 1, 1,
0.4614035, 1.2442, -1.405565, 0.1568628, 0, 1, 1,
0.4623775, -0.8277268, 2.636093, 0.1647059, 0, 1, 1,
0.4692843, 0.670956, 0.8783977, 0.1686275, 0, 1, 1,
0.4695073, 0.02561528, 0.005649992, 0.1764706, 0, 1, 1,
0.4696288, 0.2402904, 1.621222, 0.1803922, 0, 1, 1,
0.472088, 1.063376, -1.29153, 0.1882353, 0, 1, 1,
0.4761269, 1.304764, -2.681187, 0.1921569, 0, 1, 1,
0.4783556, 1.175649, 0.9438367, 0.2, 0, 1, 1,
0.4875622, -0.3359454, 2.096625, 0.2078431, 0, 1, 1,
0.4944447, 1.024876, -0.3624749, 0.2117647, 0, 1, 1,
0.4989513, 1.193974, -0.75447, 0.2196078, 0, 1, 1,
0.5000948, 0.8019469, 0.4795314, 0.2235294, 0, 1, 1,
0.5032903, 0.29672, 1.923468, 0.2313726, 0, 1, 1,
0.5061586, -0.4359753, 2.509265, 0.2352941, 0, 1, 1,
0.5094863, -0.3551286, 1.710055, 0.2431373, 0, 1, 1,
0.5124336, 0.932602, -0.1432605, 0.2470588, 0, 1, 1,
0.5156104, 0.3114219, 2.319002, 0.254902, 0, 1, 1,
0.5164551, -0.2616941, 2.022043, 0.2588235, 0, 1, 1,
0.5170282, 0.08374391, 2.055507, 0.2666667, 0, 1, 1,
0.5187515, 1.648217, 0.5062437, 0.2705882, 0, 1, 1,
0.5192823, -0.8237494, 1.504131, 0.2784314, 0, 1, 1,
0.528837, -0.3790162, 3.395976, 0.282353, 0, 1, 1,
0.5298354, 2.023404, 1.038297, 0.2901961, 0, 1, 1,
0.530456, -0.05952792, 0.7563189, 0.2941177, 0, 1, 1,
0.5344483, -0.2487051, 2.686168, 0.3019608, 0, 1, 1,
0.5358723, -0.9973592, 3.253114, 0.3098039, 0, 1, 1,
0.5381409, 2.457954, 1.403402, 0.3137255, 0, 1, 1,
0.5477649, 0.6757752, 2.518955, 0.3215686, 0, 1, 1,
0.5530975, 1.050125, -0.4602791, 0.3254902, 0, 1, 1,
0.5552391, -2.079826, 2.123646, 0.3333333, 0, 1, 1,
0.5554251, 0.5903379, 1.981122, 0.3372549, 0, 1, 1,
0.5558339, 0.2465632, 1.056984, 0.345098, 0, 1, 1,
0.5560526, 0.7881522, -0.6879351, 0.3490196, 0, 1, 1,
0.5602688, 3.517383, 0.9006397, 0.3568628, 0, 1, 1,
0.5659506, 1.575821, 2.360836, 0.3607843, 0, 1, 1,
0.5665667, -0.1338165, 2.69747, 0.3686275, 0, 1, 1,
0.5690467, -0.008760511, 0.9030609, 0.372549, 0, 1, 1,
0.5738936, 0.9824509, -1.147144, 0.3803922, 0, 1, 1,
0.581343, 1.281569, 0.8371242, 0.3843137, 0, 1, 1,
0.5847966, -0.2760797, 0.9734624, 0.3921569, 0, 1, 1,
0.5852804, 0.9742427, -0.3104175, 0.3960784, 0, 1, 1,
0.5855447, 1.031192, -1.025938, 0.4039216, 0, 1, 1,
0.5890507, 0.6479357, 0.9939902, 0.4117647, 0, 1, 1,
0.5922132, -0.7727711, 1.585468, 0.4156863, 0, 1, 1,
0.5929708, -0.04616797, 1.511143, 0.4235294, 0, 1, 1,
0.594811, 0.4915095, -0.01846338, 0.427451, 0, 1, 1,
0.5990549, 0.6695624, 0.7431119, 0.4352941, 0, 1, 1,
0.6017048, 0.1648777, 1.080095, 0.4392157, 0, 1, 1,
0.602879, -0.4650044, 2.302314, 0.4470588, 0, 1, 1,
0.6030405, 0.1341012, 1.575217, 0.4509804, 0, 1, 1,
0.6047499, 0.08305165, 1.889474, 0.4588235, 0, 1, 1,
0.6054243, -1.37594, 2.060922, 0.4627451, 0, 1, 1,
0.6080167, -0.1638572, 1.412934, 0.4705882, 0, 1, 1,
0.6171901, 0.5233659, -0.4908096, 0.4745098, 0, 1, 1,
0.6187384, -0.2624952, 1.580966, 0.4823529, 0, 1, 1,
0.6217702, 0.6598211, 0.3799984, 0.4862745, 0, 1, 1,
0.6224818, -0.4728546, 1.838217, 0.4941176, 0, 1, 1,
0.6226165, -1.707173, 1.470167, 0.5019608, 0, 1, 1,
0.6237063, -0.3901801, 1.416788, 0.5058824, 0, 1, 1,
0.6427618, 0.01418335, 2.513995, 0.5137255, 0, 1, 1,
0.6479808, 1.443269, 0.995083, 0.5176471, 0, 1, 1,
0.6479859, 0.5890455, 0.2447346, 0.5254902, 0, 1, 1,
0.6549439, 0.04000721, 0.7686611, 0.5294118, 0, 1, 1,
0.656693, -0.96193, 2.398809, 0.5372549, 0, 1, 1,
0.6630477, -2.405504, 3.725624, 0.5411765, 0, 1, 1,
0.6708198, -0.5503638, 0.4283829, 0.5490196, 0, 1, 1,
0.6711712, 1.41533, 1.449782, 0.5529412, 0, 1, 1,
0.6726274, 1.554463, 0.2565924, 0.5607843, 0, 1, 1,
0.6784377, 0.4958044, 2.979245, 0.5647059, 0, 1, 1,
0.6825345, 1.170402, 0.9434734, 0.572549, 0, 1, 1,
0.6841577, -1.886868, 2.018977, 0.5764706, 0, 1, 1,
0.6855886, -0.4519423, 1.699102, 0.5843138, 0, 1, 1,
0.6894242, 0.9749833, 1.230541, 0.5882353, 0, 1, 1,
0.6896866, 0.1577404, 0.5926205, 0.5960785, 0, 1, 1,
0.6898247, 0.7434247, -0.4408282, 0.6039216, 0, 1, 1,
0.6930535, -1.228272, 4.200176, 0.6078432, 0, 1, 1,
0.7128704, 1.979076, -0.6174915, 0.6156863, 0, 1, 1,
0.717743, 0.5166244, 1.742272, 0.6196079, 0, 1, 1,
0.7181602, 0.8228099, 0.2787563, 0.627451, 0, 1, 1,
0.7261373, -0.2194856, 3.143215, 0.6313726, 0, 1, 1,
0.7324067, 0.9668635, 0.613107, 0.6392157, 0, 1, 1,
0.7333165, -1.053349, 5.03428, 0.6431373, 0, 1, 1,
0.7344051, -0.9553508, 3.280221, 0.6509804, 0, 1, 1,
0.7346072, 0.2382666, 0.2101501, 0.654902, 0, 1, 1,
0.7362112, -1.697971, 3.089975, 0.6627451, 0, 1, 1,
0.7439504, -1.534882, 1.332939, 0.6666667, 0, 1, 1,
0.7452272, -1.194674, 1.684702, 0.6745098, 0, 1, 1,
0.751458, 0.4832619, 0.6913303, 0.6784314, 0, 1, 1,
0.7616082, 1.697314, -0.6990217, 0.6862745, 0, 1, 1,
0.7624202, -0.6465169, 1.556394, 0.6901961, 0, 1, 1,
0.7648728, 2.541356, 0.06171354, 0.6980392, 0, 1, 1,
0.7649006, 2.427253, 1.14332, 0.7058824, 0, 1, 1,
0.7662941, -0.08172164, 1.965499, 0.7098039, 0, 1, 1,
0.7671666, -0.1337617, 1.60032, 0.7176471, 0, 1, 1,
0.7705861, -1.257023, 4.277988, 0.7215686, 0, 1, 1,
0.7790729, -0.6405437, 1.686762, 0.7294118, 0, 1, 1,
0.7827221, 0.7149419, 1.40391, 0.7333333, 0, 1, 1,
0.784891, -0.0403366, 0.5110618, 0.7411765, 0, 1, 1,
0.7926937, 0.5351344, 1.558687, 0.7450981, 0, 1, 1,
0.7965176, -0.2593531, 2.558958, 0.7529412, 0, 1, 1,
0.7990159, -0.8063469, 2.930562, 0.7568628, 0, 1, 1,
0.8007202, -0.7178533, 3.014742, 0.7647059, 0, 1, 1,
0.8085701, -0.8443998, 3.911513, 0.7686275, 0, 1, 1,
0.8132374, 0.8632349, 0.429384, 0.7764706, 0, 1, 1,
0.8135414, -1.305069, 2.210354, 0.7803922, 0, 1, 1,
0.8166708, 0.9122222, 3.212153, 0.7882353, 0, 1, 1,
0.8209445, -0.8336155, 2.255282, 0.7921569, 0, 1, 1,
0.824178, -1.527256, 2.836621, 0.8, 0, 1, 1,
0.8253055, -1.264728, 2.872061, 0.8078431, 0, 1, 1,
0.8318207, 1.088032, 2.217797, 0.8117647, 0, 1, 1,
0.841577, -1.271852, 1.994932, 0.8196079, 0, 1, 1,
0.8428105, -0.6791672, 1.810606, 0.8235294, 0, 1, 1,
0.848315, 1.73639, 0.9862779, 0.8313726, 0, 1, 1,
0.8511615, 0.9683666, 0.93333, 0.8352941, 0, 1, 1,
0.8531316, -0.4800966, 0.2213182, 0.8431373, 0, 1, 1,
0.8607188, 0.262687, -0.3146976, 0.8470588, 0, 1, 1,
0.8619511, -0.2439472, 2.841307, 0.854902, 0, 1, 1,
0.8758702, -3.003333, 2.406717, 0.8588235, 0, 1, 1,
0.8795396, 0.7474425, -0.696352, 0.8666667, 0, 1, 1,
0.8808774, -0.2787923, 2.486992, 0.8705882, 0, 1, 1,
0.8817672, -0.09510302, 0.8378162, 0.8784314, 0, 1, 1,
0.8865668, 0.8830786, -0.4099879, 0.8823529, 0, 1, 1,
0.8878929, 0.852762, -0.04147046, 0.8901961, 0, 1, 1,
0.8896636, 2.1057, 2.566839, 0.8941177, 0, 1, 1,
0.8965804, 0.4696358, 1.537047, 0.9019608, 0, 1, 1,
0.899787, 0.7678761, 0.3118424, 0.9098039, 0, 1, 1,
0.9011632, -0.7731678, 2.319467, 0.9137255, 0, 1, 1,
0.9046507, 0.7533513, 0.2689995, 0.9215686, 0, 1, 1,
0.9051738, -1.479469, 0.6547933, 0.9254902, 0, 1, 1,
0.9145054, -2.581081, 3.224254, 0.9333333, 0, 1, 1,
0.916103, 0.8009256, 0.8818846, 0.9372549, 0, 1, 1,
0.9177178, 1.810938, 0.343401, 0.945098, 0, 1, 1,
0.924991, -0.5256453, 0.9097868, 0.9490196, 0, 1, 1,
0.9271275, -1.751507, 2.34309, 0.9568627, 0, 1, 1,
0.9313953, -1.103675, -0.5778975, 0.9607843, 0, 1, 1,
0.9353276, -0.4956289, 0.04371975, 0.9686275, 0, 1, 1,
0.9455878, 0.8920003, 3.311226, 0.972549, 0, 1, 1,
0.946844, 0.8894826, 2.206419, 0.9803922, 0, 1, 1,
0.9485096, -0.3482749, 2.792053, 0.9843137, 0, 1, 1,
0.9497867, -0.876016, 3.14851, 0.9921569, 0, 1, 1,
0.9513963, 0.04722293, 2.584525, 0.9960784, 0, 1, 1,
0.9573112, 2.063363, 1.322337, 1, 0, 0.9960784, 1,
0.9580532, -1.289585, 2.506208, 1, 0, 0.9882353, 1,
0.9588107, -0.888837, 4.33963, 1, 0, 0.9843137, 1,
0.9609905, -0.5582435, 0.2174901, 1, 0, 0.9764706, 1,
0.9661784, -1.403036, 3.819534, 1, 0, 0.972549, 1,
0.9664292, 1.572679, 0.55953, 1, 0, 0.9647059, 1,
0.9681578, 0.4252936, 1.212288, 1, 0, 0.9607843, 1,
0.9802107, 1.604601, -1.071608, 1, 0, 0.9529412, 1,
0.9822366, -0.437506, 2.915372, 1, 0, 0.9490196, 1,
0.9842331, -1.792184, 3.613931, 1, 0, 0.9411765, 1,
0.9916412, -0.183491, 0.1205688, 1, 0, 0.9372549, 1,
0.9965822, 0.72313, 0.1310325, 1, 0, 0.9294118, 1,
0.9981523, 0.7477241, 0.9837204, 1, 0, 0.9254902, 1,
1.001271, -1.554746, 3.487405, 1, 0, 0.9176471, 1,
1.009318, -1.688539, 2.863236, 1, 0, 0.9137255, 1,
1.011107, 0.2411009, 2.356978, 1, 0, 0.9058824, 1,
1.013168, 1.315034, 1.337334, 1, 0, 0.9019608, 1,
1.039984, -0.4655352, 1.611805, 1, 0, 0.8941177, 1,
1.040911, 1.977971, 1.573541, 1, 0, 0.8862745, 1,
1.050838, 1.046804, -0.6116393, 1, 0, 0.8823529, 1,
1.05135, 0.5477515, 2.209907, 1, 0, 0.8745098, 1,
1.055409, -1.273674, 3.510633, 1, 0, 0.8705882, 1,
1.076317, 0.7697372, 0.07553568, 1, 0, 0.8627451, 1,
1.07658, 0.7572364, 1.202371, 1, 0, 0.8588235, 1,
1.094156, -0.9430814, 3.410365, 1, 0, 0.8509804, 1,
1.110884, 1.434792, 1.891027, 1, 0, 0.8470588, 1,
1.113127, -0.8767847, 1.328828, 1, 0, 0.8392157, 1,
1.126899, -0.3767675, 1.470675, 1, 0, 0.8352941, 1,
1.139938, -0.28285, 2.90256, 1, 0, 0.827451, 1,
1.140832, -1.432294, 3.036618, 1, 0, 0.8235294, 1,
1.14422, 0.4555558, 0.2279338, 1, 0, 0.8156863, 1,
1.146377, 0.7681368, 2.079701, 1, 0, 0.8117647, 1,
1.147701, 0.3377553, 0.3813644, 1, 0, 0.8039216, 1,
1.155114, -0.4522756, 1.071576, 1, 0, 0.7960784, 1,
1.16194, 0.6030738, 2.031168, 1, 0, 0.7921569, 1,
1.171728, -0.9006231, 0.867961, 1, 0, 0.7843137, 1,
1.176702, -0.6406864, 1.415867, 1, 0, 0.7803922, 1,
1.180591, 1.634872, -0.7448972, 1, 0, 0.772549, 1,
1.190287, 0.4360253, 1.172481, 1, 0, 0.7686275, 1,
1.191217, 0.2167917, 0.124165, 1, 0, 0.7607843, 1,
1.193674, -1.137321, 2.772164, 1, 0, 0.7568628, 1,
1.195424, -0.3392576, 2.442469, 1, 0, 0.7490196, 1,
1.197217, 2.008739, -0.4308802, 1, 0, 0.7450981, 1,
1.1998, 0.1826047, 0.7665164, 1, 0, 0.7372549, 1,
1.201383, 1.735471, -1.009402, 1, 0, 0.7333333, 1,
1.203807, 0.2080035, 4.113706, 1, 0, 0.7254902, 1,
1.206708, 0.5899808, 1.132771, 1, 0, 0.7215686, 1,
1.21158, -0.8047941, 2.951188, 1, 0, 0.7137255, 1,
1.223981, -0.824462, 3.598691, 1, 0, 0.7098039, 1,
1.226948, 1.506254, -0.2248079, 1, 0, 0.7019608, 1,
1.227169, 0.5588447, 0.009160852, 1, 0, 0.6941177, 1,
1.232857, -0.07238013, 3.160162, 1, 0, 0.6901961, 1,
1.236865, 1.235005, 1.912463, 1, 0, 0.682353, 1,
1.241437, 0.5940943, 2.428062, 1, 0, 0.6784314, 1,
1.242913, 0.2424296, 2.270472, 1, 0, 0.6705883, 1,
1.244644, 1.889078, 1.487192, 1, 0, 0.6666667, 1,
1.250641, -0.7938083, 2.791395, 1, 0, 0.6588235, 1,
1.255429, 0.2235846, 1.538907, 1, 0, 0.654902, 1,
1.256975, -0.01243145, 0.3503262, 1, 0, 0.6470588, 1,
1.265467, -0.2767248, 2.586788, 1, 0, 0.6431373, 1,
1.269675, 0.1763514, -0.1032031, 1, 0, 0.6352941, 1,
1.278396, -1.143051, 4.578926, 1, 0, 0.6313726, 1,
1.282567, 0.4476856, -0.2809604, 1, 0, 0.6235294, 1,
1.282574, 1.018573, -0.2521987, 1, 0, 0.6196079, 1,
1.28355, -1.951027, 0.983018, 1, 0, 0.6117647, 1,
1.287705, -0.7818394, 3.04275, 1, 0, 0.6078432, 1,
1.298334, -0.2317567, 1.98927, 1, 0, 0.6, 1,
1.302765, -0.6968132, 1.741033, 1, 0, 0.5921569, 1,
1.318492, -1.156589, 4.09353, 1, 0, 0.5882353, 1,
1.318707, 1.343389, -0.4507959, 1, 0, 0.5803922, 1,
1.319962, -1.992289, 2.817688, 1, 0, 0.5764706, 1,
1.321819, 0.1844505, 3.344847, 1, 0, 0.5686275, 1,
1.32258, -0.720028, 2.282484, 1, 0, 0.5647059, 1,
1.324417, -0.03834375, 0.8529916, 1, 0, 0.5568628, 1,
1.335958, -0.03677636, 1.075703, 1, 0, 0.5529412, 1,
1.348346, -1.280704, 2.360752, 1, 0, 0.5450981, 1,
1.349039, -1.626248, 3.343855, 1, 0, 0.5411765, 1,
1.350415, 1.661096, 0.5069073, 1, 0, 0.5333334, 1,
1.350625, 1.032185, 0.5075742, 1, 0, 0.5294118, 1,
1.352387, 0.1353931, 0.7572725, 1, 0, 0.5215687, 1,
1.357029, 0.6161794, -0.4269524, 1, 0, 0.5176471, 1,
1.36252, 0.8683491, 2.595471, 1, 0, 0.509804, 1,
1.373339, -0.1290174, 2.984282, 1, 0, 0.5058824, 1,
1.373621, 0.9316099, 0.8519144, 1, 0, 0.4980392, 1,
1.379806, 0.3000434, 0.7327051, 1, 0, 0.4901961, 1,
1.390637, 0.4327159, 1.199851, 1, 0, 0.4862745, 1,
1.390998, 1.37319, 1.251951, 1, 0, 0.4784314, 1,
1.402695, -2.270387, 3.487354, 1, 0, 0.4745098, 1,
1.409935, -0.718056, 1.946963, 1, 0, 0.4666667, 1,
1.412365, -0.07508589, 0.8429573, 1, 0, 0.4627451, 1,
1.422656, -0.3190511, 0.9511548, 1, 0, 0.454902, 1,
1.422922, -1.647002, 2.313642, 1, 0, 0.4509804, 1,
1.440454, -0.4297723, 0.2723663, 1, 0, 0.4431373, 1,
1.440824, -0.5535961, 3.425485, 1, 0, 0.4392157, 1,
1.455696, 2.389735, 1.199674, 1, 0, 0.4313726, 1,
1.459804, -1.635829, 3.132473, 1, 0, 0.427451, 1,
1.460314, -0.1866922, 1.118083, 1, 0, 0.4196078, 1,
1.464335, 0.2242323, 1.338026, 1, 0, 0.4156863, 1,
1.478962, -0.1262167, 3.242392, 1, 0, 0.4078431, 1,
1.483266, 0.1752699, 1.290345, 1, 0, 0.4039216, 1,
1.507559, 0.6777844, 1.940083, 1, 0, 0.3960784, 1,
1.511838, -0.4544119, 2.659668, 1, 0, 0.3882353, 1,
1.513088, 0.2268724, -1.824405, 1, 0, 0.3843137, 1,
1.535497, -0.6119542, 1.425231, 1, 0, 0.3764706, 1,
1.545104, 0.4553622, 0.439734, 1, 0, 0.372549, 1,
1.546574, -0.2590285, 3.192831, 1, 0, 0.3647059, 1,
1.548916, -0.7567043, 1.656986, 1, 0, 0.3607843, 1,
1.559481, -0.2401102, 2.205065, 1, 0, 0.3529412, 1,
1.565675, 0.09330299, 1.014818, 1, 0, 0.3490196, 1,
1.585217, -0.4257349, 1.403962, 1, 0, 0.3411765, 1,
1.587353, -0.1976448, 2.228098, 1, 0, 0.3372549, 1,
1.591605, 0.4452019, 2.53676, 1, 0, 0.3294118, 1,
1.614642, -0.1191497, 1.971145, 1, 0, 0.3254902, 1,
1.615927, -0.5241417, 1.570069, 1, 0, 0.3176471, 1,
1.623084, -1.280761, 2.62152, 1, 0, 0.3137255, 1,
1.623231, 0.9912987, 2.183277, 1, 0, 0.3058824, 1,
1.641343, 0.1308395, 1.028933, 1, 0, 0.2980392, 1,
1.653352, -0.002081317, 1.549929, 1, 0, 0.2941177, 1,
1.665202, -1.183785, 2.508435, 1, 0, 0.2862745, 1,
1.673124, -0.3301485, 2.415135, 1, 0, 0.282353, 1,
1.674189, 0.2640746, 1.537772, 1, 0, 0.2745098, 1,
1.69606, -0.7885935, 1.488653, 1, 0, 0.2705882, 1,
1.699163, 0.4985302, 0.6064842, 1, 0, 0.2627451, 1,
1.703455, -0.3563178, 1.327449, 1, 0, 0.2588235, 1,
1.708034, 0.1284763, 2.515699, 1, 0, 0.2509804, 1,
1.710678, -0.9242643, 2.570014, 1, 0, 0.2470588, 1,
1.751397, -1.628695, 1.214563, 1, 0, 0.2392157, 1,
1.769036, 0.4177981, 1.009544, 1, 0, 0.2352941, 1,
1.770572, -0.539262, 3.046732, 1, 0, 0.227451, 1,
1.780822, 0.371429, 0.9424862, 1, 0, 0.2235294, 1,
1.831238, 0.6177258, -0.2028923, 1, 0, 0.2156863, 1,
1.842893, 0.4257745, -1.443274, 1, 0, 0.2117647, 1,
1.855539, -0.5362433, 0.8921794, 1, 0, 0.2039216, 1,
1.858942, -0.4917116, 2.664209, 1, 0, 0.1960784, 1,
1.867259, 0.2119049, 1.652784, 1, 0, 0.1921569, 1,
1.883368, -1.717207, 2.546779, 1, 0, 0.1843137, 1,
1.901586, -0.6026749, 2.709008, 1, 0, 0.1803922, 1,
1.932199, 0.03244054, 2.952899, 1, 0, 0.172549, 1,
2.019968, -0.3244563, -0.3666761, 1, 0, 0.1686275, 1,
2.027359, 0.5914941, 0.1714668, 1, 0, 0.1607843, 1,
2.030888, -1.245407, 1.762552, 1, 0, 0.1568628, 1,
2.03212, -0.3129902, 2.002219, 1, 0, 0.1490196, 1,
2.053697, -1.052871, 2.031499, 1, 0, 0.145098, 1,
2.068651, -0.405424, 2.349848, 1, 0, 0.1372549, 1,
2.073323, 0.677285, 1.762939, 1, 0, 0.1333333, 1,
2.092605, 1.573611, 1.369354, 1, 0, 0.1254902, 1,
2.130543, 0.6196209, 1.343753, 1, 0, 0.1215686, 1,
2.132099, 1.248308, 1.195012, 1, 0, 0.1137255, 1,
2.133989, 0.03658482, 2.163455, 1, 0, 0.1098039, 1,
2.152526, -0.8413647, 2.941161, 1, 0, 0.1019608, 1,
2.168185, 0.8502383, 0.5516609, 1, 0, 0.09411765, 1,
2.216076, 1.027058, 0.8670835, 1, 0, 0.09019608, 1,
2.220885, -0.09335292, 2.511276, 1, 0, 0.08235294, 1,
2.297192, 1.563375, 0.1807576, 1, 0, 0.07843138, 1,
2.312217, -0.4451049, 0.2865117, 1, 0, 0.07058824, 1,
2.461437, 1.024757, 0.2773322, 1, 0, 0.06666667, 1,
2.503125, -1.276304, 2.254647, 1, 0, 0.05882353, 1,
2.529132, -0.580944, 1.520157, 1, 0, 0.05490196, 1,
2.573876, 0.3520282, 1.258312, 1, 0, 0.04705882, 1,
2.574811, -0.8306463, 1.589618, 1, 0, 0.04313726, 1,
2.581945, -2.498591, 2.403379, 1, 0, 0.03529412, 1,
2.631795, 0.4995108, 0.5409185, 1, 0, 0.03137255, 1,
2.71616, -0.6873494, 0.8697606, 1, 0, 0.02352941, 1,
2.765522, -0.8906403, 3.099493, 1, 0, 0.01960784, 1,
2.812716, -1.663781, 1.043043, 1, 0, 0.01176471, 1,
2.91466, 1.174443, 1.140809, 1, 0, 0.007843138, 1
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
-0.04834187, -4.400555, -7.448015, 0, -0.5, 0.5, 0.5,
-0.04834187, -4.400555, -7.448015, 1, -0.5, 0.5, 0.5,
-0.04834187, -4.400555, -7.448015, 1, 1.5, 0.5, 0.5,
-0.04834187, -4.400555, -7.448015, 0, 1.5, 0.5, 0.5
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
-4.015801, 0.1322023, -7.448015, 0, -0.5, 0.5, 0.5,
-4.015801, 0.1322023, -7.448015, 1, -0.5, 0.5, 0.5,
-4.015801, 0.1322023, -7.448015, 1, 1.5, 0.5, 0.5,
-4.015801, 0.1322023, -7.448015, 0, 1.5, 0.5, 0.5
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
-4.015801, -4.400555, -0.2162857, 0, -0.5, 0.5, 0.5,
-4.015801, -4.400555, -0.2162857, 1, -0.5, 0.5, 0.5,
-4.015801, -4.400555, -0.2162857, 1, 1.5, 0.5, 0.5,
-4.015801, -4.400555, -0.2162857, 0, 1.5, 0.5, 0.5
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
-3, -3.354534, -5.779155,
2, -3.354534, -5.779155,
-3, -3.354534, -5.779155,
-3, -3.528871, -6.057298,
-2, -3.354534, -5.779155,
-2, -3.528871, -6.057298,
-1, -3.354534, -5.779155,
-1, -3.528871, -6.057298,
0, -3.354534, -5.779155,
0, -3.528871, -6.057298,
1, -3.354534, -5.779155,
1, -3.528871, -6.057298,
2, -3.354534, -5.779155,
2, -3.528871, -6.057298
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
"2"
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
-3, -3.877545, -6.613585, 0, -0.5, 0.5, 0.5,
-3, -3.877545, -6.613585, 1, -0.5, 0.5, 0.5,
-3, -3.877545, -6.613585, 1, 1.5, 0.5, 0.5,
-3, -3.877545, -6.613585, 0, 1.5, 0.5, 0.5,
-2, -3.877545, -6.613585, 0, -0.5, 0.5, 0.5,
-2, -3.877545, -6.613585, 1, -0.5, 0.5, 0.5,
-2, -3.877545, -6.613585, 1, 1.5, 0.5, 0.5,
-2, -3.877545, -6.613585, 0, 1.5, 0.5, 0.5,
-1, -3.877545, -6.613585, 0, -0.5, 0.5, 0.5,
-1, -3.877545, -6.613585, 1, -0.5, 0.5, 0.5,
-1, -3.877545, -6.613585, 1, 1.5, 0.5, 0.5,
-1, -3.877545, -6.613585, 0, 1.5, 0.5, 0.5,
0, -3.877545, -6.613585, 0, -0.5, 0.5, 0.5,
0, -3.877545, -6.613585, 1, -0.5, 0.5, 0.5,
0, -3.877545, -6.613585, 1, 1.5, 0.5, 0.5,
0, -3.877545, -6.613585, 0, 1.5, 0.5, 0.5,
1, -3.877545, -6.613585, 0, -0.5, 0.5, 0.5,
1, -3.877545, -6.613585, 1, -0.5, 0.5, 0.5,
1, -3.877545, -6.613585, 1, 1.5, 0.5, 0.5,
1, -3.877545, -6.613585, 0, 1.5, 0.5, 0.5,
2, -3.877545, -6.613585, 0, -0.5, 0.5, 0.5,
2, -3.877545, -6.613585, 1, -0.5, 0.5, 0.5,
2, -3.877545, -6.613585, 1, 1.5, 0.5, 0.5,
2, -3.877545, -6.613585, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.100234, -3, -5.779155,
-3.100234, 3, -5.779155,
-3.100234, -3, -5.779155,
-3.252828, -3, -6.057298,
-3.100234, -2, -5.779155,
-3.252828, -2, -6.057298,
-3.100234, -1, -5.779155,
-3.252828, -1, -6.057298,
-3.100234, 0, -5.779155,
-3.252828, 0, -6.057298,
-3.100234, 1, -5.779155,
-3.252828, 1, -6.057298,
-3.100234, 2, -5.779155,
-3.252828, 2, -6.057298,
-3.100234, 3, -5.779155,
-3.252828, 3, -6.057298
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3.558017, -3, -6.613585, 0, -0.5, 0.5, 0.5,
-3.558017, -3, -6.613585, 1, -0.5, 0.5, 0.5,
-3.558017, -3, -6.613585, 1, 1.5, 0.5, 0.5,
-3.558017, -3, -6.613585, 0, 1.5, 0.5, 0.5,
-3.558017, -2, -6.613585, 0, -0.5, 0.5, 0.5,
-3.558017, -2, -6.613585, 1, -0.5, 0.5, 0.5,
-3.558017, -2, -6.613585, 1, 1.5, 0.5, 0.5,
-3.558017, -2, -6.613585, 0, 1.5, 0.5, 0.5,
-3.558017, -1, -6.613585, 0, -0.5, 0.5, 0.5,
-3.558017, -1, -6.613585, 1, -0.5, 0.5, 0.5,
-3.558017, -1, -6.613585, 1, 1.5, 0.5, 0.5,
-3.558017, -1, -6.613585, 0, 1.5, 0.5, 0.5,
-3.558017, 0, -6.613585, 0, -0.5, 0.5, 0.5,
-3.558017, 0, -6.613585, 1, -0.5, 0.5, 0.5,
-3.558017, 0, -6.613585, 1, 1.5, 0.5, 0.5,
-3.558017, 0, -6.613585, 0, 1.5, 0.5, 0.5,
-3.558017, 1, -6.613585, 0, -0.5, 0.5, 0.5,
-3.558017, 1, -6.613585, 1, -0.5, 0.5, 0.5,
-3.558017, 1, -6.613585, 1, 1.5, 0.5, 0.5,
-3.558017, 1, -6.613585, 0, 1.5, 0.5, 0.5,
-3.558017, 2, -6.613585, 0, -0.5, 0.5, 0.5,
-3.558017, 2, -6.613585, 1, -0.5, 0.5, 0.5,
-3.558017, 2, -6.613585, 1, 1.5, 0.5, 0.5,
-3.558017, 2, -6.613585, 0, 1.5, 0.5, 0.5,
-3.558017, 3, -6.613585, 0, -0.5, 0.5, 0.5,
-3.558017, 3, -6.613585, 1, -0.5, 0.5, 0.5,
-3.558017, 3, -6.613585, 1, 1.5, 0.5, 0.5,
-3.558017, 3, -6.613585, 0, 1.5, 0.5, 0.5
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
-3.100234, -3.354534, -4,
-3.100234, -3.354534, 4,
-3.100234, -3.354534, -4,
-3.252828, -3.528871, -4,
-3.100234, -3.354534, -2,
-3.252828, -3.528871, -2,
-3.100234, -3.354534, 0,
-3.252828, -3.528871, 0,
-3.100234, -3.354534, 2,
-3.252828, -3.528871, 2,
-3.100234, -3.354534, 4,
-3.252828, -3.528871, 4
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
-3.558017, -3.877545, -4, 0, -0.5, 0.5, 0.5,
-3.558017, -3.877545, -4, 1, -0.5, 0.5, 0.5,
-3.558017, -3.877545, -4, 1, 1.5, 0.5, 0.5,
-3.558017, -3.877545, -4, 0, 1.5, 0.5, 0.5,
-3.558017, -3.877545, -2, 0, -0.5, 0.5, 0.5,
-3.558017, -3.877545, -2, 1, -0.5, 0.5, 0.5,
-3.558017, -3.877545, -2, 1, 1.5, 0.5, 0.5,
-3.558017, -3.877545, -2, 0, 1.5, 0.5, 0.5,
-3.558017, -3.877545, 0, 0, -0.5, 0.5, 0.5,
-3.558017, -3.877545, 0, 1, -0.5, 0.5, 0.5,
-3.558017, -3.877545, 0, 1, 1.5, 0.5, 0.5,
-3.558017, -3.877545, 0, 0, 1.5, 0.5, 0.5,
-3.558017, -3.877545, 2, 0, -0.5, 0.5, 0.5,
-3.558017, -3.877545, 2, 1, -0.5, 0.5, 0.5,
-3.558017, -3.877545, 2, 1, 1.5, 0.5, 0.5,
-3.558017, -3.877545, 2, 0, 1.5, 0.5, 0.5,
-3.558017, -3.877545, 4, 0, -0.5, 0.5, 0.5,
-3.558017, -3.877545, 4, 1, -0.5, 0.5, 0.5,
-3.558017, -3.877545, 4, 1, 1.5, 0.5, 0.5,
-3.558017, -3.877545, 4, 0, 1.5, 0.5, 0.5
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
-3.100234, -3.354534, -5.779155,
-3.100234, 3.618939, -5.779155,
-3.100234, -3.354534, 5.346583,
-3.100234, 3.618939, 5.346583,
-3.100234, -3.354534, -5.779155,
-3.100234, -3.354534, 5.346583,
-3.100234, 3.618939, -5.779155,
-3.100234, 3.618939, 5.346583,
-3.100234, -3.354534, -5.779155,
3.00355, -3.354534, -5.779155,
-3.100234, -3.354534, 5.346583,
3.00355, -3.354534, 5.346583,
-3.100234, 3.618939, -5.779155,
3.00355, 3.618939, -5.779155,
-3.100234, 3.618939, 5.346583,
3.00355, 3.618939, 5.346583,
3.00355, -3.354534, -5.779155,
3.00355, 3.618939, -5.779155,
3.00355, -3.354534, 5.346583,
3.00355, 3.618939, 5.346583,
3.00355, -3.354534, -5.779155,
3.00355, -3.354534, 5.346583,
3.00355, 3.618939, -5.779155,
3.00355, 3.618939, 5.346583
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
var radius = 7.731986;
var distance = 34.40048;
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
mvMatrix.translate( 0.04834187, -0.1322023, 0.2162857 );
mvMatrix.scale( 1.369638, 1.198825, 0.7514086 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.40048);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
MSMA<-read.table("MSMA.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-MSMA$V2
```

```
## Error in eval(expr, envir, enclos): object 'MSMA' not found
```

```r
y<-MSMA$V3
```

```
## Error in eval(expr, envir, enclos): object 'MSMA' not found
```

```r
z<-MSMA$V4
```

```
## Error in eval(expr, envir, enclos): object 'MSMA' not found
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
-3.011344, 0.9713819, -0.05628065, 0, 0, 1, 1, 1,
-2.782264, -0.4150596, -1.87723, 1, 0, 0, 1, 1,
-2.564381, -0.3341171, -1.126616, 1, 0, 0, 1, 1,
-2.553873, 0.9805621, -1.773061, 1, 0, 0, 1, 1,
-2.516074, 1.537439, -1.241321, 1, 0, 0, 1, 1,
-2.426571, -0.8063729, -0.6892629, 1, 0, 0, 1, 1,
-2.320438, 0.3700882, -1.147928, 0, 0, 0, 1, 1,
-2.298912, 0.7241619, -0.5992739, 0, 0, 0, 1, 1,
-2.294297, -1.997148, -1.444378, 0, 0, 0, 1, 1,
-2.259669, 1.021702, -0.3439975, 0, 0, 0, 1, 1,
-2.194288, -1.2623, -3.074385, 0, 0, 0, 1, 1,
-2.185144, -0.2935377, -1.127398, 0, 0, 0, 1, 1,
-2.164274, -0.4087131, -2.502862, 0, 0, 0, 1, 1,
-2.147474, -0.9102821, -0.638693, 1, 1, 1, 1, 1,
-2.089354, 0.8244713, 0.299609, 1, 1, 1, 1, 1,
-2.089108, -0.6468543, -0.7012296, 1, 1, 1, 1, 1,
-2.02581, 1.016958, 0.1770044, 1, 1, 1, 1, 1,
-1.99436, 0.794029, 0.4928194, 1, 1, 1, 1, 1,
-1.990202, -0.5117406, -2.407836, 1, 1, 1, 1, 1,
-1.945081, -1.480494, -1.769829, 1, 1, 1, 1, 1,
-1.915647, 0.5336914, -1.802099, 1, 1, 1, 1, 1,
-1.913031, -1.432544, -2.875788, 1, 1, 1, 1, 1,
-1.887539, 0.0983334, -0.5369395, 1, 1, 1, 1, 1,
-1.877862, -0.06931584, -2.954482, 1, 1, 1, 1, 1,
-1.87728, -1.417208, -2.820717, 1, 1, 1, 1, 1,
-1.848872, 0.3522449, -1.235751, 1, 1, 1, 1, 1,
-1.83416, -0.2649812, -2.29983, 1, 1, 1, 1, 1,
-1.827297, -1.452175, -1.916726, 1, 1, 1, 1, 1,
-1.827295, -0.5436385, -3.138264, 0, 0, 1, 1, 1,
-1.817785, 0.8738757, -0.5680256, 1, 0, 0, 1, 1,
-1.813034, -2.230885, -2.432715, 1, 0, 0, 1, 1,
-1.802559, 1.731155, -2.499155, 1, 0, 0, 1, 1,
-1.785698, -0.2713619, -2.233183, 1, 0, 0, 1, 1,
-1.774207, -0.4170241, -1.788282, 1, 0, 0, 1, 1,
-1.764099, -0.3882404, -2.114346, 0, 0, 0, 1, 1,
-1.755979, -0.7820193, -2.333542, 0, 0, 0, 1, 1,
-1.745587, -0.5123389, 1.100832, 0, 0, 0, 1, 1,
-1.744919, -0.2499842, -1.967351, 0, 0, 0, 1, 1,
-1.736691, 0.1447947, -0.9518627, 0, 0, 0, 1, 1,
-1.734524, 0.89307, -1.315427, 0, 0, 0, 1, 1,
-1.729227, -0.3779838, -0.8101989, 0, 0, 0, 1, 1,
-1.70572, 2.406486, 0.262575, 1, 1, 1, 1, 1,
-1.702003, -0.5973992, -2.357231, 1, 1, 1, 1, 1,
-1.700069, 0.9588088, -2.064311, 1, 1, 1, 1, 1,
-1.697839, -0.122975, -0.1476238, 1, 1, 1, 1, 1,
-1.690159, -1.674813, -2.988014, 1, 1, 1, 1, 1,
-1.687046, -1.03122, -2.257308, 1, 1, 1, 1, 1,
-1.671991, -1.882107, -2.344004, 1, 1, 1, 1, 1,
-1.655748, -0.8154336, -2.895376, 1, 1, 1, 1, 1,
-1.636057, -0.1962691, 0.0291895, 1, 1, 1, 1, 1,
-1.63341, -1.095399, -1.877853, 1, 1, 1, 1, 1,
-1.632959, 1.552528, -0.6410881, 1, 1, 1, 1, 1,
-1.623288, -1.202054, -1.982639, 1, 1, 1, 1, 1,
-1.595637, -0.2548791, -2.2396, 1, 1, 1, 1, 1,
-1.594769, 0.1305831, -0.7181, 1, 1, 1, 1, 1,
-1.592117, 1.38248, -0.5785525, 1, 1, 1, 1, 1,
-1.580848, -1.142495, -0.7875178, 0, 0, 1, 1, 1,
-1.569264, 1.758754, -1.987595, 1, 0, 0, 1, 1,
-1.549477, 0.7859865, -0.9875038, 1, 0, 0, 1, 1,
-1.549123, 0.3353794, -0.9542971, 1, 0, 0, 1, 1,
-1.546921, -1.39728, -1.774493, 1, 0, 0, 1, 1,
-1.540988, 1.483515, 0.4153507, 1, 0, 0, 1, 1,
-1.533645, -0.02948788, -1.006364, 0, 0, 0, 1, 1,
-1.525005, 0.2371657, -2.478844, 0, 0, 0, 1, 1,
-1.52436, 1.239897, 1.1836, 0, 0, 0, 1, 1,
-1.517046, 0.5950064, -1.767418, 0, 0, 0, 1, 1,
-1.511978, -1.129218, -0.8213821, 0, 0, 0, 1, 1,
-1.499477, 0.8330981, -0.4261193, 0, 0, 0, 1, 1,
-1.49623, -1.197334, -1.774777, 0, 0, 0, 1, 1,
-1.482646, 0.1324676, 0.6246113, 1, 1, 1, 1, 1,
-1.46823, 0.2130544, -3.327193, 1, 1, 1, 1, 1,
-1.466779, 1.141279, -1.583397, 1, 1, 1, 1, 1,
-1.461483, 1.796847, -1.757963, 1, 1, 1, 1, 1,
-1.458204, 1.872633, -1.138383, 1, 1, 1, 1, 1,
-1.443413, -0.6610005, -1.996012, 1, 1, 1, 1, 1,
-1.437929, 0.6498687, -2.075437, 1, 1, 1, 1, 1,
-1.436015, 0.4713776, -3.037136, 1, 1, 1, 1, 1,
-1.432735, -0.1978488, -3.445668, 1, 1, 1, 1, 1,
-1.424985, 0.1386749, 0.7362629, 1, 1, 1, 1, 1,
-1.419786, 1.008084, -0.009410084, 1, 1, 1, 1, 1,
-1.419686, 0.9829691, -0.6135707, 1, 1, 1, 1, 1,
-1.404093, 1.700192, -3.149441, 1, 1, 1, 1, 1,
-1.402551, 1.612708, -0.1271227, 1, 1, 1, 1, 1,
-1.388065, 1.028431, -2.772073, 1, 1, 1, 1, 1,
-1.387847, 0.7271318, -0.2685673, 0, 0, 1, 1, 1,
-1.381272, -1.888523, -0.3603728, 1, 0, 0, 1, 1,
-1.358812, -0.3839627, -1.451541, 1, 0, 0, 1, 1,
-1.358045, -0.532501, -2.001002, 1, 0, 0, 1, 1,
-1.355998, -0.1545729, -2.863886, 1, 0, 0, 1, 1,
-1.344906, -1.828704, -1.98436, 1, 0, 0, 1, 1,
-1.329711, 0.3763041, -3.912831, 0, 0, 0, 1, 1,
-1.329689, -0.2039067, 0.4046315, 0, 0, 0, 1, 1,
-1.329448, 0.6329933, -4.207611, 0, 0, 0, 1, 1,
-1.320455, 0.7652438, -0.8411785, 0, 0, 0, 1, 1,
-1.304297, 0.2103481, -1.684321, 0, 0, 0, 1, 1,
-1.297017, 1.831462, -1.034427, 0, 0, 0, 1, 1,
-1.296635, -1.573745, -1.036192, 0, 0, 0, 1, 1,
-1.292152, 0.9308562, -0.8333867, 1, 1, 1, 1, 1,
-1.282015, 2.740912, -1.602636, 1, 1, 1, 1, 1,
-1.280123, 0.1225616, -0.8850037, 1, 1, 1, 1, 1,
-1.279011, 0.5475888, -1.018594, 1, 1, 1, 1, 1,
-1.272631, 1.43051, 0.839397, 1, 1, 1, 1, 1,
-1.271309, -0.3769052, -2.046389, 1, 1, 1, 1, 1,
-1.269427, 0.7685611, -0.7086436, 1, 1, 1, 1, 1,
-1.260772, 0.1749002, 0.2374603, 1, 1, 1, 1, 1,
-1.260424, 2.316666, -0.7254583, 1, 1, 1, 1, 1,
-1.25841, -0.6525194, -0.9505787, 1, 1, 1, 1, 1,
-1.2523, 2.253043, -1.988246, 1, 1, 1, 1, 1,
-1.250027, 0.6098911, -1.446136, 1, 1, 1, 1, 1,
-1.23556, 2.173114, 0.1190575, 1, 1, 1, 1, 1,
-1.235022, 0.4882389, -2.093926, 1, 1, 1, 1, 1,
-1.232496, -0.05023968, 0.03610485, 1, 1, 1, 1, 1,
-1.225598, 0.6651747, -1.075689, 0, 0, 1, 1, 1,
-1.225206, -0.2567023, -3.175122, 1, 0, 0, 1, 1,
-1.22508, -1.418195, -2.579629, 1, 0, 0, 1, 1,
-1.216462, 0.4399232, -2.027221, 1, 0, 0, 1, 1,
-1.216418, 1.429478, -0.474304, 1, 0, 0, 1, 1,
-1.211928, 1.42961, -0.7834231, 1, 0, 0, 1, 1,
-1.207823, -1.036025, -2.246883, 0, 0, 0, 1, 1,
-1.206419, 0.3844956, -0.3477435, 0, 0, 0, 1, 1,
-1.203693, 1.818022, -0.2901933, 0, 0, 0, 1, 1,
-1.196302, -1.537314, -3.853471, 0, 0, 0, 1, 1,
-1.195351, 0.2742002, -2.360619, 0, 0, 0, 1, 1,
-1.182045, -0.2093673, -2.304766, 0, 0, 0, 1, 1,
-1.181671, 0.4897332, -1.130358, 0, 0, 0, 1, 1,
-1.180219, 0.7026199, 1.176361, 1, 1, 1, 1, 1,
-1.17839, -0.3454196, -2.437279, 1, 1, 1, 1, 1,
-1.169526, -0.4802447, -1.31785, 1, 1, 1, 1, 1,
-1.167781, -0.665257, -2.756841, 1, 1, 1, 1, 1,
-1.165148, -2.913064, -2.223806, 1, 1, 1, 1, 1,
-1.153343, 0.8453419, -0.539414, 1, 1, 1, 1, 1,
-1.148471, 0.03893399, -0.7747542, 1, 1, 1, 1, 1,
-1.140827, -0.2466233, -1.04617, 1, 1, 1, 1, 1,
-1.130669, -1.546384, -3.507145, 1, 1, 1, 1, 1,
-1.130326, 1.411371, -0.2885321, 1, 1, 1, 1, 1,
-1.129163, 0.07110223, -1.177484, 1, 1, 1, 1, 1,
-1.128117, -1.002643, -3.177058, 1, 1, 1, 1, 1,
-1.124003, -0.5392982, -1.912686, 1, 1, 1, 1, 1,
-1.120391, -0.05881791, -1.948101, 1, 1, 1, 1, 1,
-1.107596, -2.028615, -2.326884, 1, 1, 1, 1, 1,
-1.103504, -0.09621261, -1.876093, 0, 0, 1, 1, 1,
-1.102244, -0.3882187, -2.847463, 1, 0, 0, 1, 1,
-1.099865, -0.5285493, -1.610953, 1, 0, 0, 1, 1,
-1.096049, 1.33825, -0.8430822, 1, 0, 0, 1, 1,
-1.091812, -0.3142619, -1.671343, 1, 0, 0, 1, 1,
-1.089861, -1.19368, -2.287457, 1, 0, 0, 1, 1,
-1.087556, -0.3938732, -1.035306, 0, 0, 0, 1, 1,
-1.075909, -0.4223933, -1.903677, 0, 0, 0, 1, 1,
-1.075493, 0.933127, -2.636846, 0, 0, 0, 1, 1,
-1.070562, -0.2632171, -2.262234, 0, 0, 0, 1, 1,
-1.070313, 1.29409, -2.410383, 0, 0, 0, 1, 1,
-1.068841, 0.7932491, -2.088242, 0, 0, 0, 1, 1,
-1.065712, -0.118611, -2.343125, 0, 0, 0, 1, 1,
-1.065543, 0.6995433, -2.262109, 1, 1, 1, 1, 1,
-1.06465, 2.265196, -0.343704, 1, 1, 1, 1, 1,
-1.061886, -1.247628, -0.9077746, 1, 1, 1, 1, 1,
-1.058552, -1.491798, -2.655084, 1, 1, 1, 1, 1,
-1.057092, 1.639126, -1.014304, 1, 1, 1, 1, 1,
-1.054718, 0.0699227, -1.308918, 1, 1, 1, 1, 1,
-1.047088, 1.148024, 1.465556, 1, 1, 1, 1, 1,
-1.035693, -1.452376, -1.300982, 1, 1, 1, 1, 1,
-1.033826, -0.1346605, -3.730438, 1, 1, 1, 1, 1,
-1.023118, -0.3291845, -3.376292, 1, 1, 1, 1, 1,
-1.020665, -0.110334, -0.9391852, 1, 1, 1, 1, 1,
-1.017569, 0.3255748, -2.37687, 1, 1, 1, 1, 1,
-1.017347, -0.9566615, -2.711177, 1, 1, 1, 1, 1,
-1.016355, 0.175462, -2.086091, 1, 1, 1, 1, 1,
-1.006755, 0.5487358, -1.365818, 1, 1, 1, 1, 1,
-1.003288, 0.3923053, -1.825197, 0, 0, 1, 1, 1,
-0.9989887, -0.1576153, -0.9747499, 1, 0, 0, 1, 1,
-0.9974233, -0.7158427, -0.7780166, 1, 0, 0, 1, 1,
-0.9937054, -0.2048354, -2.754685, 1, 0, 0, 1, 1,
-0.9873995, -0.2488441, -1.66587, 1, 0, 0, 1, 1,
-0.9870311, -0.4192391, -2.469683, 1, 0, 0, 1, 1,
-0.9838994, 0.04229539, -2.653626, 0, 0, 0, 1, 1,
-0.9759823, 0.1872623, -2.307095, 0, 0, 0, 1, 1,
-0.972665, 0.9476851, 2.032798, 0, 0, 0, 1, 1,
-0.9694383, -0.1800432, -3.162624, 0, 0, 0, 1, 1,
-0.9668717, -0.9183633, -2.59219, 0, 0, 0, 1, 1,
-0.9648589, -0.1139198, -1.588517, 0, 0, 0, 1, 1,
-0.9631287, -1.254315, -1.302369, 0, 0, 0, 1, 1,
-0.9588391, 2.474544, 1.952876, 1, 1, 1, 1, 1,
-0.9491943, 0.3811387, -0.1726068, 1, 1, 1, 1, 1,
-0.9413697, -0.911195, -1.051669, 1, 1, 1, 1, 1,
-0.9353726, -0.1139282, -2.700091, 1, 1, 1, 1, 1,
-0.9301355, -0.8147163, -2.801067, 1, 1, 1, 1, 1,
-0.9238732, -0.5873375, -3.751635, 1, 1, 1, 1, 1,
-0.9228889, -0.478844, -0.94875, 1, 1, 1, 1, 1,
-0.9227006, -0.2368949, -2.967666, 1, 1, 1, 1, 1,
-0.9220401, 0.5532212, -1.774594, 1, 1, 1, 1, 1,
-0.9193497, 0.3440486, -0.3273871, 1, 1, 1, 1, 1,
-0.9147002, -0.1429498, -2.417093, 1, 1, 1, 1, 1,
-0.9111958, 0.2788564, -1.62765, 1, 1, 1, 1, 1,
-0.9104452, -0.580569, -2.764118, 1, 1, 1, 1, 1,
-0.8977846, 0.9821714, -1.969915, 1, 1, 1, 1, 1,
-0.8938497, 0.3772173, 0.4731443, 1, 1, 1, 1, 1,
-0.8884008, 0.3736315, -2.275436, 0, 0, 1, 1, 1,
-0.8858309, 0.3536026, -1.066606, 1, 0, 0, 1, 1,
-0.8854001, -0.08898807, -2.892043, 1, 0, 0, 1, 1,
-0.8797778, 0.119554, -1.442115, 1, 0, 0, 1, 1,
-0.879279, -0.2659239, -2.976839, 1, 0, 0, 1, 1,
-0.8729978, -0.0076147, -2.776689, 1, 0, 0, 1, 1,
-0.8698247, -0.2303698, -1.766445, 0, 0, 0, 1, 1,
-0.8657349, -0.2656828, -4.247749, 0, 0, 0, 1, 1,
-0.8656046, 0.3703023, 0.3915077, 0, 0, 0, 1, 1,
-0.8641269, 0.0758854, 0.4056161, 0, 0, 0, 1, 1,
-0.862596, -0.2665399, -0.8503311, 0, 0, 0, 1, 1,
-0.8512725, -0.3333072, -1.467562, 0, 0, 0, 1, 1,
-0.846941, 0.4032854, -2.091484, 0, 0, 0, 1, 1,
-0.8468894, 0.5391144, -1.933522, 1, 1, 1, 1, 1,
-0.8434436, 0.3398284, -0.838729, 1, 1, 1, 1, 1,
-0.8419076, 0.6988826, -1.767333, 1, 1, 1, 1, 1,
-0.8397872, -0.1758288, -1.733678, 1, 1, 1, 1, 1,
-0.8303769, 1.973362, -0.2201573, 1, 1, 1, 1, 1,
-0.8259147, -1.100839, -3.038399, 1, 1, 1, 1, 1,
-0.8200821, 2.249739, -1.706343, 1, 1, 1, 1, 1,
-0.8161471, -1.720047, -3.003485, 1, 1, 1, 1, 1,
-0.8098392, -0.0705784, -2.219908, 1, 1, 1, 1, 1,
-0.8096656, 1.30516, -0.5769491, 1, 1, 1, 1, 1,
-0.7992268, 0.3213804, -0.4435885, 1, 1, 1, 1, 1,
-0.7976323, 0.7439637, -0.4404952, 1, 1, 1, 1, 1,
-0.7941806, -2.256439, -5.036366, 1, 1, 1, 1, 1,
-0.7875997, -1.558465, -0.4507034, 1, 1, 1, 1, 1,
-0.7803771, 0.8224398, -0.3647386, 1, 1, 1, 1, 1,
-0.777393, -1.711894, -3.072859, 0, 0, 1, 1, 1,
-0.7687699, 0.1830682, 0.5828467, 1, 0, 0, 1, 1,
-0.7626657, -1.328421, -0.9612852, 1, 0, 0, 1, 1,
-0.7603573, 0.7160171, -1.670072, 1, 0, 0, 1, 1,
-0.7591913, -1.120644, -2.860487, 1, 0, 0, 1, 1,
-0.758967, 0.2626254, -0.8047975, 1, 0, 0, 1, 1,
-0.7450995, -0.5027038, -0.4926492, 0, 0, 0, 1, 1,
-0.7429273, 0.5411419, -1.85639, 0, 0, 0, 1, 1,
-0.7422239, 0.5028259, -1.089531, 0, 0, 0, 1, 1,
-0.7418293, 0.3615865, -1.417417, 0, 0, 0, 1, 1,
-0.7381912, -0.1385359, -2.767561, 0, 0, 0, 1, 1,
-0.7365728, -0.1073368, -0.9858244, 0, 0, 0, 1, 1,
-0.7349792, -0.8204486, -2.202885, 0, 0, 0, 1, 1,
-0.7340981, 0.1396966, -2.156187, 1, 1, 1, 1, 1,
-0.7304438, -0.5825859, -2.468665, 1, 1, 1, 1, 1,
-0.7286587, -0.6401353, -2.963365, 1, 1, 1, 1, 1,
-0.7259315, -1.102291, -2.792603, 1, 1, 1, 1, 1,
-0.7248504, 0.4543525, -1.26261, 1, 1, 1, 1, 1,
-0.7245287, -1.606719, -3.036215, 1, 1, 1, 1, 1,
-0.7228587, -1.212546, -2.214118, 1, 1, 1, 1, 1,
-0.7226067, -0.3429016, -4.446208, 1, 1, 1, 1, 1,
-0.7211901, 0.573064, 0.5944844, 1, 1, 1, 1, 1,
-0.7176462, -0.726071, -3.166661, 1, 1, 1, 1, 1,
-0.7172999, -0.8938463, -3.973766, 1, 1, 1, 1, 1,
-0.7107365, -0.8687788, -4.170456, 1, 1, 1, 1, 1,
-0.7080966, 0.6811287, -1.019173, 1, 1, 1, 1, 1,
-0.7022532, 1.019345, -1.536722, 1, 1, 1, 1, 1,
-0.6985484, -2.289222, -3.075689, 1, 1, 1, 1, 1,
-0.6934783, -2.141588, -3.167782, 0, 0, 1, 1, 1,
-0.6923652, -0.7201706, -1.464343, 1, 0, 0, 1, 1,
-0.6885987, 0.3079466, -2.112489, 1, 0, 0, 1, 1,
-0.688277, -1.43204, -2.207091, 1, 0, 0, 1, 1,
-0.6882545, 1.720983, 1.066355, 1, 0, 0, 1, 1,
-0.6805556, 1.757991, 0.9714715, 1, 0, 0, 1, 1,
-0.6782232, -1.438242, -1.471019, 0, 0, 0, 1, 1,
-0.6754254, -1.615131, -2.524048, 0, 0, 0, 1, 1,
-0.673483, -2.422969, -4.168185, 0, 0, 0, 1, 1,
-0.6702796, 1.345474, -2.349732, 0, 0, 0, 1, 1,
-0.6644713, -0.08200639, -2.342605, 0, 0, 0, 1, 1,
-0.6636884, -0.149783, -2.323193, 0, 0, 0, 1, 1,
-0.6554132, 0.2075832, 0.5811126, 0, 0, 0, 1, 1,
-0.6483257, -0.4005243, -2.166297, 1, 1, 1, 1, 1,
-0.647429, -0.5861499, -1.073853, 1, 1, 1, 1, 1,
-0.6405045, 0.3475534, 0.7889716, 1, 1, 1, 1, 1,
-0.6249835, -0.1454207, -1.290778, 1, 1, 1, 1, 1,
-0.6241824, -1.505147, -2.055949, 1, 1, 1, 1, 1,
-0.6223781, 1.661139, 0.2316385, 1, 1, 1, 1, 1,
-0.6208032, 0.509473, -0.3737572, 1, 1, 1, 1, 1,
-0.6134242, -1.988925, -2.881496, 1, 1, 1, 1, 1,
-0.6115118, 0.2135027, -2.221262, 1, 1, 1, 1, 1,
-0.6109767, 0.07500134, -1.805229, 1, 1, 1, 1, 1,
-0.6038635, -0.7802296, -1.002139, 1, 1, 1, 1, 1,
-0.6034577, 1.214949, -1.742326, 1, 1, 1, 1, 1,
-0.6013567, -1.899759, -2.902328, 1, 1, 1, 1, 1,
-0.6001342, 1.38237, 0.09317566, 1, 1, 1, 1, 1,
-0.5946461, 1.243399, -0.5871217, 1, 1, 1, 1, 1,
-0.5935867, -0.6013798, -4.306421, 0, 0, 1, 1, 1,
-0.5914754, 0.7966228, -0.4370528, 1, 0, 0, 1, 1,
-0.5802886, 1.452217, 0.4928443, 1, 0, 0, 1, 1,
-0.5786982, 0.1851613, -0.9572223, 1, 0, 0, 1, 1,
-0.5751101, 0.8673502, -2.034533, 1, 0, 0, 1, 1,
-0.5726071, -0.6109752, -2.270914, 1, 0, 0, 1, 1,
-0.5671893, -0.06261002, -1.206571, 0, 0, 0, 1, 1,
-0.5667595, -0.9056331, -3.45351, 0, 0, 0, 1, 1,
-0.5649183, -0.3629399, -2.340711, 0, 0, 0, 1, 1,
-0.563192, 0.7768967, -2.246431, 0, 0, 0, 1, 1,
-0.563121, 1.62115, 0.2365496, 0, 0, 0, 1, 1,
-0.5588683, -0.3960184, -1.564136, 0, 0, 0, 1, 1,
-0.5541427, -1.406816, -2.246482, 0, 0, 0, 1, 1,
-0.5535223, 0.2268316, -0.4627348, 1, 1, 1, 1, 1,
-0.5512104, -0.2377458, -2.340831, 1, 1, 1, 1, 1,
-0.5476506, -0.7585778, -3.854272, 1, 1, 1, 1, 1,
-0.5447742, 0.1613562, -1.333763, 1, 1, 1, 1, 1,
-0.5425805, 0.3486948, -2.217773, 1, 1, 1, 1, 1,
-0.5386402, -1.844849, -3.099306, 1, 1, 1, 1, 1,
-0.5311111, 1.528324, -0.09426768, 1, 1, 1, 1, 1,
-0.5305693, 0.5593367, 0.2187437, 1, 1, 1, 1, 1,
-0.5301414, -0.7376859, -0.9505798, 1, 1, 1, 1, 1,
-0.5238192, 2.762232, -1.509305, 1, 1, 1, 1, 1,
-0.5196587, -1.184103, -4.960636, 1, 1, 1, 1, 1,
-0.5191166, -0.1615224, -1.954267, 1, 1, 1, 1, 1,
-0.5181183, -0.6694538, -2.980524, 1, 1, 1, 1, 1,
-0.5176379, -0.4292221, -2.197872, 1, 1, 1, 1, 1,
-0.5175543, -0.4320564, -2.737777, 1, 1, 1, 1, 1,
-0.5141497, 0.2529412, -1.427896, 0, 0, 1, 1, 1,
-0.5131541, 0.1962449, -1.776997, 1, 0, 0, 1, 1,
-0.510941, 0.628525, -2.446794, 1, 0, 0, 1, 1,
-0.5072553, 1.033004, 0.1554926, 1, 0, 0, 1, 1,
-0.5066879, -0.7457929, -3.144977, 1, 0, 0, 1, 1,
-0.5056583, 0.9753551, -0.03161486, 1, 0, 0, 1, 1,
-0.5032998, 0.3043506, 0.009591599, 0, 0, 0, 1, 1,
-0.5019467, -0.03949761, -1.274738, 0, 0, 0, 1, 1,
-0.4996435, 0.4153656, -0.3701869, 0, 0, 0, 1, 1,
-0.496601, 0.130617, -0.3040904, 0, 0, 0, 1, 1,
-0.4963951, 1.353109, -1.053854, 0, 0, 0, 1, 1,
-0.4941944, -0.7425643, -2.958835, 0, 0, 0, 1, 1,
-0.4884913, -0.9364166, -1.441502, 0, 0, 0, 1, 1,
-0.4804474, 1.401618, -0.1238622, 1, 1, 1, 1, 1,
-0.4767713, -1.488349, -2.308924, 1, 1, 1, 1, 1,
-0.4712639, -0.7383122, -2.291953, 1, 1, 1, 1, 1,
-0.469176, -0.2525709, -1.960175, 1, 1, 1, 1, 1,
-0.455619, -0.3475839, -2.727081, 1, 1, 1, 1, 1,
-0.4545495, 1.673925, -2.647405, 1, 1, 1, 1, 1,
-0.4535172, -0.4642875, -3.100247, 1, 1, 1, 1, 1,
-0.4515997, -1.651206, -3.240909, 1, 1, 1, 1, 1,
-0.4498054, 0.1645117, -1.726962, 1, 1, 1, 1, 1,
-0.4432072, 0.4156519, -1.250618, 1, 1, 1, 1, 1,
-0.4412556, -0.8765535, -2.833238, 1, 1, 1, 1, 1,
-0.4366228, 0.09629279, 0.370205, 1, 1, 1, 1, 1,
-0.4361427, -2.000528, -3.36137, 1, 1, 1, 1, 1,
-0.426712, -1.262561, -3.410023, 1, 1, 1, 1, 1,
-0.4261438, 0.7263153, -1.694497, 1, 1, 1, 1, 1,
-0.420296, -0.3986691, -0.9335327, 0, 0, 1, 1, 1,
-0.4198636, 0.0536042, -3.298325, 1, 0, 0, 1, 1,
-0.4152576, 0.6309288, -0.3042169, 1, 0, 0, 1, 1,
-0.4140483, 0.2806734, -1.069295, 1, 0, 0, 1, 1,
-0.4092094, -2.180228, -2.469909, 1, 0, 0, 1, 1,
-0.4087903, 0.682077, -1.058801, 1, 0, 0, 1, 1,
-0.4066867, 0.5094082, 0.3797855, 0, 0, 0, 1, 1,
-0.4035974, 0.8523265, 0.5869856, 0, 0, 0, 1, 1,
-0.4032608, 0.2819641, -3.681364, 0, 0, 0, 1, 1,
-0.4008671, 0.4103514, -1.885387, 0, 0, 0, 1, 1,
-0.3967321, 0.2488353, -3.445514, 0, 0, 0, 1, 1,
-0.3887854, 1.152606, -1.934311, 0, 0, 0, 1, 1,
-0.3874554, 0.003209974, 0.6597773, 0, 0, 0, 1, 1,
-0.3866429, -0.8225218, -1.740854, 1, 1, 1, 1, 1,
-0.3863287, -0.8050038, -3.692079, 1, 1, 1, 1, 1,
-0.3814465, -1.20097, -2.820433, 1, 1, 1, 1, 1,
-0.38128, -0.2851481, -2.248468, 1, 1, 1, 1, 1,
-0.3736327, 0.4829275, -1.297572, 1, 1, 1, 1, 1,
-0.3609828, 1.21641, -1.638029, 1, 1, 1, 1, 1,
-0.3605642, -2.076704, -4.606624, 1, 1, 1, 1, 1,
-0.3580803, -1.241405, -4.009253, 1, 1, 1, 1, 1,
-0.3569009, 0.5308204, -0.3992818, 1, 1, 1, 1, 1,
-0.3562589, 0.6107368, 0.2590406, 1, 1, 1, 1, 1,
-0.3549452, 0.1106719, -1.19541, 1, 1, 1, 1, 1,
-0.3516953, 1.039585, -1.624081, 1, 1, 1, 1, 1,
-0.3512217, 0.0301211, -0.7357732, 1, 1, 1, 1, 1,
-0.3495016, 0.07942566, -0.3517603, 1, 1, 1, 1, 1,
-0.3446162, -1.91036, -1.458036, 1, 1, 1, 1, 1,
-0.3416456, -0.5253162, -2.427265, 0, 0, 1, 1, 1,
-0.3402445, -0.1620486, -0.7785955, 1, 0, 0, 1, 1,
-0.338759, 2.1255, -2.042438, 1, 0, 0, 1, 1,
-0.3328327, 0.5966995, -0.9814506, 1, 0, 0, 1, 1,
-0.3272695, -0.6223595, -3.506005, 1, 0, 0, 1, 1,
-0.3249443, 0.8471192, -0.6411566, 1, 0, 0, 1, 1,
-0.3221822, -0.1736163, -1.136209, 0, 0, 0, 1, 1,
-0.3171066, -0.4060628, -3.776349, 0, 0, 0, 1, 1,
-0.3170501, -0.0934645, -1.651745, 0, 0, 0, 1, 1,
-0.3166602, 0.4995068, -0.6517171, 0, 0, 0, 1, 1,
-0.3157978, 1.317083, 1.468852, 0, 0, 0, 1, 1,
-0.3135412, -0.2318816, -1.700559, 0, 0, 0, 1, 1,
-0.3119732, -0.9513595, -3.42785, 0, 0, 0, 1, 1,
-0.307043, -1.259064, -3.473699, 1, 1, 1, 1, 1,
-0.3068042, 0.4802988, 0.1325964, 1, 1, 1, 1, 1,
-0.3037413, 0.05742731, -2.147159, 1, 1, 1, 1, 1,
-0.3011743, 1.391432, 0.5169743, 1, 1, 1, 1, 1,
-0.3010112, -1.066344, -3.25775, 1, 1, 1, 1, 1,
-0.2989254, -0.4920199, -2.335414, 1, 1, 1, 1, 1,
-0.2988223, -1.505405, -3.756989, 1, 1, 1, 1, 1,
-0.2967128, 0.03727639, -0.6467368, 1, 1, 1, 1, 1,
-0.2965927, -0.08343235, -2.1056, 1, 1, 1, 1, 1,
-0.2936224, 0.6187176, 0.05983394, 1, 1, 1, 1, 1,
-0.2926463, 1.367183, 0.1854861, 1, 1, 1, 1, 1,
-0.2907289, -0.6778247, -2.149023, 1, 1, 1, 1, 1,
-0.2894391, 0.8867064, 0.4045078, 1, 1, 1, 1, 1,
-0.2877959, -0.9274217, -2.099965, 1, 1, 1, 1, 1,
-0.2871128, -1.643044, -2.17155, 1, 1, 1, 1, 1,
-0.2863467, 0.1197539, -2.401451, 0, 0, 1, 1, 1,
-0.2766432, 0.0217506, -0.7480953, 1, 0, 0, 1, 1,
-0.2756236, 0.9333777, -1.330075, 1, 0, 0, 1, 1,
-0.2745037, 0.5342287, 1.522081, 1, 0, 0, 1, 1,
-0.2737755, 0.9952984, -0.8322498, 1, 0, 0, 1, 1,
-0.2722093, -2.313383, -1.783656, 1, 0, 0, 1, 1,
-0.2722033, -0.03715069, -0.9163837, 0, 0, 0, 1, 1,
-0.2699781, -0.8478625, -3.608558, 0, 0, 0, 1, 1,
-0.2676737, -0.583059, -3.399968, 0, 0, 0, 1, 1,
-0.2666337, -0.1822402, -2.826577, 0, 0, 0, 1, 1,
-0.264488, -1.39315, -1.363658, 0, 0, 0, 1, 1,
-0.2598463, -1.032764, -3.410321, 0, 0, 0, 1, 1,
-0.2578709, -0.8188503, -1.661634, 0, 0, 0, 1, 1,
-0.2569226, 0.8043281, 0.3320269, 1, 1, 1, 1, 1,
-0.2550422, 1.650916, -0.8147635, 1, 1, 1, 1, 1,
-0.2532805, -0.5124087, -3.163536, 1, 1, 1, 1, 1,
-0.2532523, -0.340167, -2.880202, 1, 1, 1, 1, 1,
-0.2522025, 1.258815, 1.614915, 1, 1, 1, 1, 1,
-0.2498409, 1.349003, 1.733134, 1, 1, 1, 1, 1,
-0.2460968, -1.583176, -1.474524, 1, 1, 1, 1, 1,
-0.2433055, -0.1461757, -1.960122, 1, 1, 1, 1, 1,
-0.2406388, -0.1820452, -4.690996, 1, 1, 1, 1, 1,
-0.2404122, 0.3485287, -0.9539049, 1, 1, 1, 1, 1,
-0.2383853, 0.4754038, -1.181102, 1, 1, 1, 1, 1,
-0.2364821, -0.5491641, -2.443191, 1, 1, 1, 1, 1,
-0.2326714, 1.223394, 0.1195079, 1, 1, 1, 1, 1,
-0.2315808, -1.579287, -4.878094, 1, 1, 1, 1, 1,
-0.227954, -1.254211, -3.1516, 1, 1, 1, 1, 1,
-0.2242006, 0.4147462, -0.7142449, 0, 0, 1, 1, 1,
-0.2231014, 1.703006, -0.6369317, 1, 0, 0, 1, 1,
-0.2216277, 2.381313, 0.742511, 1, 0, 0, 1, 1,
-0.2211067, -0.2036697, -1.504739, 1, 0, 0, 1, 1,
-0.216618, -0.1508411, -1.300856, 1, 0, 0, 1, 1,
-0.2146809, -0.5278034, -2.523627, 1, 0, 0, 1, 1,
-0.2124196, 1.11052, -0.6746128, 0, 0, 0, 1, 1,
-0.2109151, -1.541763, -2.47946, 0, 0, 0, 1, 1,
-0.2055637, 0.6108311, -0.7619147, 0, 0, 0, 1, 1,
-0.2046277, 2.072121, 0.3068258, 0, 0, 0, 1, 1,
-0.202141, 2.200547, 0.3535411, 0, 0, 0, 1, 1,
-0.2003379, -0.8558629, -4.186554, 0, 0, 0, 1, 1,
-0.2003005, -0.7617415, -2.193501, 0, 0, 0, 1, 1,
-0.1993174, -1.926527, -2.49735, 1, 1, 1, 1, 1,
-0.1988156, 0.7157964, -1.610509, 1, 1, 1, 1, 1,
-0.1979194, 0.4571889, -0.1779854, 1, 1, 1, 1, 1,
-0.1972895, 0.7136878, -1.316304, 1, 1, 1, 1, 1,
-0.1967207, 1.927204, 0.831206, 1, 1, 1, 1, 1,
-0.1906614, 0.1126586, -1.527555, 1, 1, 1, 1, 1,
-0.1900011, 1.187295, -0.9549241, 1, 1, 1, 1, 1,
-0.1828323, 0.8076255, -0.09895737, 1, 1, 1, 1, 1,
-0.1778211, -1.18527, -3.362914, 1, 1, 1, 1, 1,
-0.1774493, -0.8019717, -3.608842, 1, 1, 1, 1, 1,
-0.1751288, 0.1525491, 0.9738096, 1, 1, 1, 1, 1,
-0.1721544, 0.3826544, -2.095056, 1, 1, 1, 1, 1,
-0.1676583, -0.1932404, -2.246504, 1, 1, 1, 1, 1,
-0.1628839, -0.7119592, -3.59536, 1, 1, 1, 1, 1,
-0.1578084, -0.7716352, -3.663059, 1, 1, 1, 1, 1,
-0.1521083, -1.928826, -4.456924, 0, 0, 1, 1, 1,
-0.1519937, -0.6670777, -3.187761, 1, 0, 0, 1, 1,
-0.1441405, -0.2772984, -0.4680838, 1, 0, 0, 1, 1,
-0.1372895, -0.5303817, -2.599347, 1, 0, 0, 1, 1,
-0.136293, 0.04514319, -2.188685, 1, 0, 0, 1, 1,
-0.132965, 0.8054718, 0.4583928, 1, 0, 0, 1, 1,
-0.1315053, 0.3079991, 0.4755925, 0, 0, 0, 1, 1,
-0.1312324, -1.339702, -1.822086, 0, 0, 0, 1, 1,
-0.125069, 1.165694, -0.4257078, 0, 0, 0, 1, 1,
-0.1204851, 0.06370121, -1.66314, 0, 0, 0, 1, 1,
-0.1172448, 0.1251776, 0.2043059, 0, 0, 0, 1, 1,
-0.1154756, 0.03977568, -2.314003, 0, 0, 0, 1, 1,
-0.1134333, -0.8365959, -2.056021, 0, 0, 0, 1, 1,
-0.1119291, -1.488792, -0.8384215, 1, 1, 1, 1, 1,
-0.1108096, 0.7754523, 1.573175, 1, 1, 1, 1, 1,
-0.1104781, -0.2549794, -3.505961, 1, 1, 1, 1, 1,
-0.1064631, -0.9829656, -3.198145, 1, 1, 1, 1, 1,
-0.1047432, 1.251956, -0.4910868, 1, 1, 1, 1, 1,
-0.1046956, 0.752075, 1.101634, 1, 1, 1, 1, 1,
-0.1037851, 0.6002082, -0.6739004, 1, 1, 1, 1, 1,
-0.1033969, -0.3719058, -5.617129, 1, 1, 1, 1, 1,
-0.09884835, -1.142136, -3.562517, 1, 1, 1, 1, 1,
-0.09870166, -1.727412, -2.304356, 1, 1, 1, 1, 1,
-0.09367327, 0.5725646, -0.07063147, 1, 1, 1, 1, 1,
-0.09239567, -2.379435, -3.125119, 1, 1, 1, 1, 1,
-0.09130637, -0.4884494, -1.361224, 1, 1, 1, 1, 1,
-0.08990492, 1.911879, -1.364415, 1, 1, 1, 1, 1,
-0.08338664, -0.4005702, -1.590573, 1, 1, 1, 1, 1,
-0.08183156, 2.522512, -1.037728, 0, 0, 1, 1, 1,
-0.08052327, 0.07257164, -0.7583179, 1, 0, 0, 1, 1,
-0.07804085, -1.590891, -2.171954, 1, 0, 0, 1, 1,
-0.06377842, -0.1166874, -2.276751, 1, 0, 0, 1, 1,
-0.05979187, -1.657642, -4.349806, 1, 0, 0, 1, 1,
-0.05707927, 0.5485173, -2.281118, 1, 0, 0, 1, 1,
-0.05572807, 1.132474, 0.7891682, 0, 0, 0, 1, 1,
-0.05503627, -1.102616, -3.164097, 0, 0, 0, 1, 1,
-0.0537719, 1.032234, 1.058043, 0, 0, 0, 1, 1,
-0.04618476, -0.412651, -2.281974, 0, 0, 0, 1, 1,
-0.04402081, 1.16002, 0.8200362, 0, 0, 0, 1, 1,
-0.04357359, -0.1195904, -2.33248, 0, 0, 0, 1, 1,
-0.03517519, -0.196713, -1.88892, 0, 0, 0, 1, 1,
-0.03330861, -1.084966, -4.058285, 1, 1, 1, 1, 1,
-0.03273529, 2.98365, 1.767076, 1, 1, 1, 1, 1,
-0.02819031, -0.1297989, -1.998434, 1, 1, 1, 1, 1,
-0.02536115, -3.067109, -3.420148, 1, 1, 1, 1, 1,
-0.02434663, 1.689301, -1.301756, 1, 1, 1, 1, 1,
-0.01837393, 0.2814819, -0.7160512, 1, 1, 1, 1, 1,
-0.0128971, 1.676699, -0.1529451, 1, 1, 1, 1, 1,
-0.009460085, 1.159027, -1.560793, 1, 1, 1, 1, 1,
-0.008238129, 0.7039977, -1.188405, 1, 1, 1, 1, 1,
-0.003292538, -0.05098228, -4.784486, 1, 1, 1, 1, 1,
-0.002493771, 0.1987511, -0.3587984, 1, 1, 1, 1, 1,
-0.001208238, -0.8093451, -2.582445, 1, 1, 1, 1, 1,
0.001380879, 0.08272937, 1.178849, 1, 1, 1, 1, 1,
0.003650952, 1.630303, 0.3937034, 1, 1, 1, 1, 1,
0.004023976, -1.139209, 4.910133, 1, 1, 1, 1, 1,
0.004552125, 0.7463886, 0.7121218, 0, 0, 1, 1, 1,
0.005543221, 0.8365413, -0.5465018, 1, 0, 0, 1, 1,
0.01071019, -0.3259765, 3.655721, 1, 0, 0, 1, 1,
0.01263457, -0.490717, 3.119081, 1, 0, 0, 1, 1,
0.0137893, -0.4335389, 2.822381, 1, 0, 0, 1, 1,
0.01484923, -1.122123, 2.558848, 1, 0, 0, 1, 1,
0.02049596, -0.6974364, 2.803838, 0, 0, 0, 1, 1,
0.02225927, 1.065638, -1.175207, 0, 0, 0, 1, 1,
0.02733721, -0.4614097, 3.305536, 0, 0, 0, 1, 1,
0.02807565, -0.3049776, 3.937845, 0, 0, 0, 1, 1,
0.03118679, 0.9809652, 0.7419076, 0, 0, 0, 1, 1,
0.03352134, 0.1570113, -0.8084458, 0, 0, 0, 1, 1,
0.03358822, 1.56531, -0.2454358, 0, 0, 0, 1, 1,
0.0382289, -1.923569, 4.535143, 1, 1, 1, 1, 1,
0.0484736, 0.5334606, -0.4672227, 1, 1, 1, 1, 1,
0.0511533, -0.2087021, 3.74799, 1, 1, 1, 1, 1,
0.05325696, -0.2175468, 4.187752, 1, 1, 1, 1, 1,
0.05684745, 0.1131036, 0.3481229, 1, 1, 1, 1, 1,
0.05714562, 1.302503, 0.1386293, 1, 1, 1, 1, 1,
0.06251755, 0.2707053, 0.8481483, 1, 1, 1, 1, 1,
0.06315375, 0.6929108, -0.246686, 1, 1, 1, 1, 1,
0.06407312, -1.03331, 2.902012, 1, 1, 1, 1, 1,
0.06595442, 0.4184502, 1.230605, 1, 1, 1, 1, 1,
0.06715113, -0.4176086, 1.959176, 1, 1, 1, 1, 1,
0.06749287, 1.079193, 0.7635186, 1, 1, 1, 1, 1,
0.06776427, 0.7613953, 0.3648556, 1, 1, 1, 1, 1,
0.0679464, -0.2314737, 1.934157, 1, 1, 1, 1, 1,
0.06875726, -0.9331279, 2.625253, 1, 1, 1, 1, 1,
0.06876741, 0.2965023, 0.5240946, 0, 0, 1, 1, 1,
0.07120404, 1.130525, -0.5405715, 1, 0, 0, 1, 1,
0.07389366, 0.2107512, 0.7458904, 1, 0, 0, 1, 1,
0.07456994, -1.895779, 1.873842, 1, 0, 0, 1, 1,
0.07664286, 0.03708229, 1.448859, 1, 0, 0, 1, 1,
0.08162486, -0.2615601, 2.803777, 1, 0, 0, 1, 1,
0.08382222, 0.2702906, 1.453279, 0, 0, 0, 1, 1,
0.08625071, -0.5868745, 3.136827, 0, 0, 0, 1, 1,
0.08628783, 0.3772117, 2.356325, 0, 0, 0, 1, 1,
0.0902919, 0.07105771, 4.459483, 0, 0, 0, 1, 1,
0.09621745, 0.07434254, 3.217916, 0, 0, 0, 1, 1,
0.1082369, 0.1909689, -1.788921, 0, 0, 0, 1, 1,
0.1126778, -0.2942359, 2.281762, 0, 0, 0, 1, 1,
0.1129613, -0.8302823, 3.195151, 1, 1, 1, 1, 1,
0.1140074, 1.318487, -1.792236, 1, 1, 1, 1, 1,
0.114686, -0.1962147, 1.126725, 1, 1, 1, 1, 1,
0.1149702, -0.5313392, 2.904768, 1, 1, 1, 1, 1,
0.1192071, -0.04675718, 2.612257, 1, 1, 1, 1, 1,
0.1198542, -0.9695661, 3.268798, 1, 1, 1, 1, 1,
0.120371, 0.570511, -0.6310724, 1, 1, 1, 1, 1,
0.1229276, 0.7734195, -1.825482, 1, 1, 1, 1, 1,
0.1263748, -0.5020944, 1.981577, 1, 1, 1, 1, 1,
0.1268649, 1.322972, -0.2604243, 1, 1, 1, 1, 1,
0.127228, 0.755464, 0.01221344, 1, 1, 1, 1, 1,
0.1289194, 0.7875698, 2.114196, 1, 1, 1, 1, 1,
0.1307239, 1.232928, 1.040353, 1, 1, 1, 1, 1,
0.1342011, 0.1788013, 0.9309161, 1, 1, 1, 1, 1,
0.1358853, 0.2117271, 0.69289, 1, 1, 1, 1, 1,
0.1366073, 1.7484, -0.06118743, 0, 0, 1, 1, 1,
0.137918, -1.917106, 3.077122, 1, 0, 0, 1, 1,
0.1381993, -1.007436, 4.132017, 1, 0, 0, 1, 1,
0.1397683, -3.220591, 2.521395, 1, 0, 0, 1, 1,
0.1413462, 0.3862878, 2.994174, 1, 0, 0, 1, 1,
0.14297, 0.1156254, 1.782565, 1, 0, 0, 1, 1,
0.1433108, -0.4781106, 1.658526, 0, 0, 0, 1, 1,
0.1501255, 0.4826551, 1.592322, 0, 0, 0, 1, 1,
0.1530242, -0.5232686, 1.699381, 0, 0, 0, 1, 1,
0.1555786, 0.2392301, -1.460832, 0, 0, 0, 1, 1,
0.1556899, -1.481791, 3.801082, 0, 0, 0, 1, 1,
0.1597264, -0.1721921, 2.594516, 0, 0, 0, 1, 1,
0.1656063, 1.129088, -0.7172159, 0, 0, 0, 1, 1,
0.1660733, -0.4545087, 3.312659, 1, 1, 1, 1, 1,
0.171079, -1.389222, 3.808483, 1, 1, 1, 1, 1,
0.1719774, 1.125771, -0.3545554, 1, 1, 1, 1, 1,
0.176602, -0.9951452, 2.690701, 1, 1, 1, 1, 1,
0.1774009, -0.404093, 0.9541275, 1, 1, 1, 1, 1,
0.1819344, -0.06531325, 0.7239848, 1, 1, 1, 1, 1,
0.1819549, 1.855041, 0.4853539, 1, 1, 1, 1, 1,
0.1834697, -0.8451563, 1.75495, 1, 1, 1, 1, 1,
0.1834902, 0.08640471, 2.002613, 1, 1, 1, 1, 1,
0.1848703, 1.208968, -0.2610284, 1, 1, 1, 1, 1,
0.1852343, -0.04483874, 2.050922, 1, 1, 1, 1, 1,
0.1863807, 1.239493, 0.5077049, 1, 1, 1, 1, 1,
0.1905133, -0.03395572, 2.196502, 1, 1, 1, 1, 1,
0.1923541, 0.8089288, 1.916263, 1, 1, 1, 1, 1,
0.1935788, 0.2367218, 1.365475, 1, 1, 1, 1, 1,
0.1942954, 0.5591725, 1.479922, 0, 0, 1, 1, 1,
0.1943325, -3.252979, 1.756638, 1, 0, 0, 1, 1,
0.2003786, -1.38916, 3.208287, 1, 0, 0, 1, 1,
0.2015235, 0.325283, 0.137422, 1, 0, 0, 1, 1,
0.2022127, 0.403606, -0.2533202, 1, 0, 0, 1, 1,
0.2063732, -0.4109119, 3.799377, 1, 0, 0, 1, 1,
0.209983, -1.7429, 3.664657, 0, 0, 0, 1, 1,
0.2101502, -1.550457, 3.013847, 0, 0, 0, 1, 1,
0.2111615, 0.2745097, 1.63727, 0, 0, 0, 1, 1,
0.2148957, -1.907829, 2.228797, 0, 0, 0, 1, 1,
0.215397, 1.179255, -0.6491492, 0, 0, 0, 1, 1,
0.2168397, 0.9053086, -1.212646, 0, 0, 0, 1, 1,
0.2188445, -0.6473172, 3.118733, 0, 0, 0, 1, 1,
0.2189875, -0.2283675, 2.349223, 1, 1, 1, 1, 1,
0.2192244, 2.022094, 0.6900471, 1, 1, 1, 1, 1,
0.2205886, 1.785589, 0.9006982, 1, 1, 1, 1, 1,
0.2208108, -0.6350349, 2.854952, 1, 1, 1, 1, 1,
0.221678, 1.549721, -0.3356062, 1, 1, 1, 1, 1,
0.2219643, 0.054399, 1.198352, 1, 1, 1, 1, 1,
0.2320704, -1.085762, 4.483394, 1, 1, 1, 1, 1,
0.2340075, 0.4020111, -0.2937631, 1, 1, 1, 1, 1,
0.2371831, 0.4826654, -2.156983, 1, 1, 1, 1, 1,
0.2389839, -0.4509735, 3.797991, 1, 1, 1, 1, 1,
0.2432666, 0.05126927, 1.262844, 1, 1, 1, 1, 1,
0.2448733, -0.7341549, 1.984658, 1, 1, 1, 1, 1,
0.2474081, -3.07187, 4.536732, 1, 1, 1, 1, 1,
0.247635, -0.6838477, 2.921036, 1, 1, 1, 1, 1,
0.2484953, -0.1725338, 3.58703, 1, 1, 1, 1, 1,
0.2491356, -1.081063, 2.552559, 0, 0, 1, 1, 1,
0.2604963, -0.5211977, 1.958274, 1, 0, 0, 1, 1,
0.261292, -0.4340357, 2.19349, 1, 0, 0, 1, 1,
0.265143, -0.4190837, 1.752524, 1, 0, 0, 1, 1,
0.2667377, 0.2757961, 1.622421, 1, 0, 0, 1, 1,
0.2680264, -0.8753975, 1.895012, 1, 0, 0, 1, 1,
0.2687533, 0.3781214, -0.2490288, 0, 0, 0, 1, 1,
0.270032, -1.771027, 2.368509, 0, 0, 0, 1, 1,
0.2706833, 1.594199, 0.5675646, 0, 0, 0, 1, 1,
0.2707396, 1.149778, -0.5003964, 0, 0, 0, 1, 1,
0.2785931, 0.7231112, 1.290693, 0, 0, 0, 1, 1,
0.2788214, -0.6594796, 1.501548, 0, 0, 0, 1, 1,
0.2879167, 0.06321798, 3.083808, 0, 0, 0, 1, 1,
0.289711, 1.289672, 0.4646517, 1, 1, 1, 1, 1,
0.2901567, 2.043456, 0.5363911, 1, 1, 1, 1, 1,
0.297338, -0.7932846, 2.38326, 1, 1, 1, 1, 1,
0.2985519, -0.860113, 3.207904, 1, 1, 1, 1, 1,
0.3010534, 0.1993039, 1.572626, 1, 1, 1, 1, 1,
0.3065288, 1.790798, 0.5739553, 1, 1, 1, 1, 1,
0.3083354, -1.176581, 2.446347, 1, 1, 1, 1, 1,
0.3116883, 0.02851145, 0.9986638, 1, 1, 1, 1, 1,
0.3190461, 0.9161594, 2.327776, 1, 1, 1, 1, 1,
0.3214433, -0.06220616, 2.10881, 1, 1, 1, 1, 1,
0.3296319, -0.07810393, 2.549153, 1, 1, 1, 1, 1,
0.3335229, -0.7241654, 2.970828, 1, 1, 1, 1, 1,
0.335647, 1.13096, 1.794965, 1, 1, 1, 1, 1,
0.3396703, -0.9032443, 3.047543, 1, 1, 1, 1, 1,
0.3404727, 0.7534282, 0.1385288, 1, 1, 1, 1, 1,
0.3412158, 0.1537141, 1.443407, 0, 0, 1, 1, 1,
0.3437389, 0.1033771, 1.072408, 1, 0, 0, 1, 1,
0.3492788, 0.49394, 0.8288572, 1, 0, 0, 1, 1,
0.355137, -1.054486, 1.004873, 1, 0, 0, 1, 1,
0.3558403, -1.302796, 2.123263, 1, 0, 0, 1, 1,
0.3562129, 1.251715, -0.7026448, 1, 0, 0, 1, 1,
0.3567151, -0.1337283, -0.3170352, 0, 0, 0, 1, 1,
0.3625408, -0.4943519, 2.436781, 0, 0, 0, 1, 1,
0.366111, -0.2248891, 1.745779, 0, 0, 0, 1, 1,
0.3676969, -0.3667364, 3.524757, 0, 0, 0, 1, 1,
0.3677747, 0.4285915, 0.00272545, 0, 0, 0, 1, 1,
0.3688789, 0.5007628, -1.38998, 0, 0, 0, 1, 1,
0.3694174, 1.378589, 1.85318, 0, 0, 0, 1, 1,
0.3696381, 0.5888342, -0.6359959, 1, 1, 1, 1, 1,
0.3789967, -1.336094, 1.867918, 1, 1, 1, 1, 1,
0.3841372, -0.02497156, 2.714345, 1, 1, 1, 1, 1,
0.3852712, 1.669504, 1.581177, 1, 1, 1, 1, 1,
0.3891529, -0.09244283, 3.608004, 1, 1, 1, 1, 1,
0.3943554, 0.02116544, 0.5794409, 1, 1, 1, 1, 1,
0.3998892, 0.4689954, -0.46691, 1, 1, 1, 1, 1,
0.4029927, -0.7800217, 1.698725, 1, 1, 1, 1, 1,
0.4042123, -1.306744, 2.701734, 1, 1, 1, 1, 1,
0.4045326, -0.8405898, 2.907529, 1, 1, 1, 1, 1,
0.4066109, 1.622282, 0.3934404, 1, 1, 1, 1, 1,
0.4070799, 1.286898, 1.184752, 1, 1, 1, 1, 1,
0.4094683, 0.4841003, 0.2892639, 1, 1, 1, 1, 1,
0.4149229, -0.8203573, 5.166694, 1, 1, 1, 1, 1,
0.4176953, -2.381721, 1.905358, 1, 1, 1, 1, 1,
0.4201871, -1.337412, 5.184558, 0, 0, 1, 1, 1,
0.4231834, 0.554663, 0.5991452, 1, 0, 0, 1, 1,
0.4233637, -0.07210244, 1.684378, 1, 0, 0, 1, 1,
0.426982, 0.07648362, 0.8834966, 1, 0, 0, 1, 1,
0.43161, -0.1262649, 1.945213, 1, 0, 0, 1, 1,
0.4344327, -1.597252, 1.817248, 1, 0, 0, 1, 1,
0.4351874, 0.05517401, 1.328167, 0, 0, 0, 1, 1,
0.4367458, 0.1274081, 1.641725, 0, 0, 0, 1, 1,
0.4392529, 2.579142, 1.179021, 0, 0, 0, 1, 1,
0.4396383, -0.1222862, 3.555203, 0, 0, 0, 1, 1,
0.4412578, -0.9979244, 3.738571, 0, 0, 0, 1, 1,
0.4461884, 1.365439, 1.407476, 0, 0, 0, 1, 1,
0.44658, -0.2716638, 4.411898, 0, 0, 0, 1, 1,
0.4474031, 0.02138631, 2.00697, 1, 1, 1, 1, 1,
0.4474451, -0.1398946, 0.140594, 1, 1, 1, 1, 1,
0.4504229, -2.064696, 1.947151, 1, 1, 1, 1, 1,
0.4507462, -0.6934237, 3.174644, 1, 1, 1, 1, 1,
0.4512666, -0.8255416, 3.212337, 1, 1, 1, 1, 1,
0.4517869, -0.1030823, 0.7981271, 1, 1, 1, 1, 1,
0.452561, 1.037834, 1.442951, 1, 1, 1, 1, 1,
0.4538534, 0.746134, 1.439412, 1, 1, 1, 1, 1,
0.4614035, 1.2442, -1.405565, 1, 1, 1, 1, 1,
0.4623775, -0.8277268, 2.636093, 1, 1, 1, 1, 1,
0.4692843, 0.670956, 0.8783977, 1, 1, 1, 1, 1,
0.4695073, 0.02561528, 0.005649992, 1, 1, 1, 1, 1,
0.4696288, 0.2402904, 1.621222, 1, 1, 1, 1, 1,
0.472088, 1.063376, -1.29153, 1, 1, 1, 1, 1,
0.4761269, 1.304764, -2.681187, 1, 1, 1, 1, 1,
0.4783556, 1.175649, 0.9438367, 0, 0, 1, 1, 1,
0.4875622, -0.3359454, 2.096625, 1, 0, 0, 1, 1,
0.4944447, 1.024876, -0.3624749, 1, 0, 0, 1, 1,
0.4989513, 1.193974, -0.75447, 1, 0, 0, 1, 1,
0.5000948, 0.8019469, 0.4795314, 1, 0, 0, 1, 1,
0.5032903, 0.29672, 1.923468, 1, 0, 0, 1, 1,
0.5061586, -0.4359753, 2.509265, 0, 0, 0, 1, 1,
0.5094863, -0.3551286, 1.710055, 0, 0, 0, 1, 1,
0.5124336, 0.932602, -0.1432605, 0, 0, 0, 1, 1,
0.5156104, 0.3114219, 2.319002, 0, 0, 0, 1, 1,
0.5164551, -0.2616941, 2.022043, 0, 0, 0, 1, 1,
0.5170282, 0.08374391, 2.055507, 0, 0, 0, 1, 1,
0.5187515, 1.648217, 0.5062437, 0, 0, 0, 1, 1,
0.5192823, -0.8237494, 1.504131, 1, 1, 1, 1, 1,
0.528837, -0.3790162, 3.395976, 1, 1, 1, 1, 1,
0.5298354, 2.023404, 1.038297, 1, 1, 1, 1, 1,
0.530456, -0.05952792, 0.7563189, 1, 1, 1, 1, 1,
0.5344483, -0.2487051, 2.686168, 1, 1, 1, 1, 1,
0.5358723, -0.9973592, 3.253114, 1, 1, 1, 1, 1,
0.5381409, 2.457954, 1.403402, 1, 1, 1, 1, 1,
0.5477649, 0.6757752, 2.518955, 1, 1, 1, 1, 1,
0.5530975, 1.050125, -0.4602791, 1, 1, 1, 1, 1,
0.5552391, -2.079826, 2.123646, 1, 1, 1, 1, 1,
0.5554251, 0.5903379, 1.981122, 1, 1, 1, 1, 1,
0.5558339, 0.2465632, 1.056984, 1, 1, 1, 1, 1,
0.5560526, 0.7881522, -0.6879351, 1, 1, 1, 1, 1,
0.5602688, 3.517383, 0.9006397, 1, 1, 1, 1, 1,
0.5659506, 1.575821, 2.360836, 1, 1, 1, 1, 1,
0.5665667, -0.1338165, 2.69747, 0, 0, 1, 1, 1,
0.5690467, -0.008760511, 0.9030609, 1, 0, 0, 1, 1,
0.5738936, 0.9824509, -1.147144, 1, 0, 0, 1, 1,
0.581343, 1.281569, 0.8371242, 1, 0, 0, 1, 1,
0.5847966, -0.2760797, 0.9734624, 1, 0, 0, 1, 1,
0.5852804, 0.9742427, -0.3104175, 1, 0, 0, 1, 1,
0.5855447, 1.031192, -1.025938, 0, 0, 0, 1, 1,
0.5890507, 0.6479357, 0.9939902, 0, 0, 0, 1, 1,
0.5922132, -0.7727711, 1.585468, 0, 0, 0, 1, 1,
0.5929708, -0.04616797, 1.511143, 0, 0, 0, 1, 1,
0.594811, 0.4915095, -0.01846338, 0, 0, 0, 1, 1,
0.5990549, 0.6695624, 0.7431119, 0, 0, 0, 1, 1,
0.6017048, 0.1648777, 1.080095, 0, 0, 0, 1, 1,
0.602879, -0.4650044, 2.302314, 1, 1, 1, 1, 1,
0.6030405, 0.1341012, 1.575217, 1, 1, 1, 1, 1,
0.6047499, 0.08305165, 1.889474, 1, 1, 1, 1, 1,
0.6054243, -1.37594, 2.060922, 1, 1, 1, 1, 1,
0.6080167, -0.1638572, 1.412934, 1, 1, 1, 1, 1,
0.6171901, 0.5233659, -0.4908096, 1, 1, 1, 1, 1,
0.6187384, -0.2624952, 1.580966, 1, 1, 1, 1, 1,
0.6217702, 0.6598211, 0.3799984, 1, 1, 1, 1, 1,
0.6224818, -0.4728546, 1.838217, 1, 1, 1, 1, 1,
0.6226165, -1.707173, 1.470167, 1, 1, 1, 1, 1,
0.6237063, -0.3901801, 1.416788, 1, 1, 1, 1, 1,
0.6427618, 0.01418335, 2.513995, 1, 1, 1, 1, 1,
0.6479808, 1.443269, 0.995083, 1, 1, 1, 1, 1,
0.6479859, 0.5890455, 0.2447346, 1, 1, 1, 1, 1,
0.6549439, 0.04000721, 0.7686611, 1, 1, 1, 1, 1,
0.656693, -0.96193, 2.398809, 0, 0, 1, 1, 1,
0.6630477, -2.405504, 3.725624, 1, 0, 0, 1, 1,
0.6708198, -0.5503638, 0.4283829, 1, 0, 0, 1, 1,
0.6711712, 1.41533, 1.449782, 1, 0, 0, 1, 1,
0.6726274, 1.554463, 0.2565924, 1, 0, 0, 1, 1,
0.6784377, 0.4958044, 2.979245, 1, 0, 0, 1, 1,
0.6825345, 1.170402, 0.9434734, 0, 0, 0, 1, 1,
0.6841577, -1.886868, 2.018977, 0, 0, 0, 1, 1,
0.6855886, -0.4519423, 1.699102, 0, 0, 0, 1, 1,
0.6894242, 0.9749833, 1.230541, 0, 0, 0, 1, 1,
0.6896866, 0.1577404, 0.5926205, 0, 0, 0, 1, 1,
0.6898247, 0.7434247, -0.4408282, 0, 0, 0, 1, 1,
0.6930535, -1.228272, 4.200176, 0, 0, 0, 1, 1,
0.7128704, 1.979076, -0.6174915, 1, 1, 1, 1, 1,
0.717743, 0.5166244, 1.742272, 1, 1, 1, 1, 1,
0.7181602, 0.8228099, 0.2787563, 1, 1, 1, 1, 1,
0.7261373, -0.2194856, 3.143215, 1, 1, 1, 1, 1,
0.7324067, 0.9668635, 0.613107, 1, 1, 1, 1, 1,
0.7333165, -1.053349, 5.03428, 1, 1, 1, 1, 1,
0.7344051, -0.9553508, 3.280221, 1, 1, 1, 1, 1,
0.7346072, 0.2382666, 0.2101501, 1, 1, 1, 1, 1,
0.7362112, -1.697971, 3.089975, 1, 1, 1, 1, 1,
0.7439504, -1.534882, 1.332939, 1, 1, 1, 1, 1,
0.7452272, -1.194674, 1.684702, 1, 1, 1, 1, 1,
0.751458, 0.4832619, 0.6913303, 1, 1, 1, 1, 1,
0.7616082, 1.697314, -0.6990217, 1, 1, 1, 1, 1,
0.7624202, -0.6465169, 1.556394, 1, 1, 1, 1, 1,
0.7648728, 2.541356, 0.06171354, 1, 1, 1, 1, 1,
0.7649006, 2.427253, 1.14332, 0, 0, 1, 1, 1,
0.7662941, -0.08172164, 1.965499, 1, 0, 0, 1, 1,
0.7671666, -0.1337617, 1.60032, 1, 0, 0, 1, 1,
0.7705861, -1.257023, 4.277988, 1, 0, 0, 1, 1,
0.7790729, -0.6405437, 1.686762, 1, 0, 0, 1, 1,
0.7827221, 0.7149419, 1.40391, 1, 0, 0, 1, 1,
0.784891, -0.0403366, 0.5110618, 0, 0, 0, 1, 1,
0.7926937, 0.5351344, 1.558687, 0, 0, 0, 1, 1,
0.7965176, -0.2593531, 2.558958, 0, 0, 0, 1, 1,
0.7990159, -0.8063469, 2.930562, 0, 0, 0, 1, 1,
0.8007202, -0.7178533, 3.014742, 0, 0, 0, 1, 1,
0.8085701, -0.8443998, 3.911513, 0, 0, 0, 1, 1,
0.8132374, 0.8632349, 0.429384, 0, 0, 0, 1, 1,
0.8135414, -1.305069, 2.210354, 1, 1, 1, 1, 1,
0.8166708, 0.9122222, 3.212153, 1, 1, 1, 1, 1,
0.8209445, -0.8336155, 2.255282, 1, 1, 1, 1, 1,
0.824178, -1.527256, 2.836621, 1, 1, 1, 1, 1,
0.8253055, -1.264728, 2.872061, 1, 1, 1, 1, 1,
0.8318207, 1.088032, 2.217797, 1, 1, 1, 1, 1,
0.841577, -1.271852, 1.994932, 1, 1, 1, 1, 1,
0.8428105, -0.6791672, 1.810606, 1, 1, 1, 1, 1,
0.848315, 1.73639, 0.9862779, 1, 1, 1, 1, 1,
0.8511615, 0.9683666, 0.93333, 1, 1, 1, 1, 1,
0.8531316, -0.4800966, 0.2213182, 1, 1, 1, 1, 1,
0.8607188, 0.262687, -0.3146976, 1, 1, 1, 1, 1,
0.8619511, -0.2439472, 2.841307, 1, 1, 1, 1, 1,
0.8758702, -3.003333, 2.406717, 1, 1, 1, 1, 1,
0.8795396, 0.7474425, -0.696352, 1, 1, 1, 1, 1,
0.8808774, -0.2787923, 2.486992, 0, 0, 1, 1, 1,
0.8817672, -0.09510302, 0.8378162, 1, 0, 0, 1, 1,
0.8865668, 0.8830786, -0.4099879, 1, 0, 0, 1, 1,
0.8878929, 0.852762, -0.04147046, 1, 0, 0, 1, 1,
0.8896636, 2.1057, 2.566839, 1, 0, 0, 1, 1,
0.8965804, 0.4696358, 1.537047, 1, 0, 0, 1, 1,
0.899787, 0.7678761, 0.3118424, 0, 0, 0, 1, 1,
0.9011632, -0.7731678, 2.319467, 0, 0, 0, 1, 1,
0.9046507, 0.7533513, 0.2689995, 0, 0, 0, 1, 1,
0.9051738, -1.479469, 0.6547933, 0, 0, 0, 1, 1,
0.9145054, -2.581081, 3.224254, 0, 0, 0, 1, 1,
0.916103, 0.8009256, 0.8818846, 0, 0, 0, 1, 1,
0.9177178, 1.810938, 0.343401, 0, 0, 0, 1, 1,
0.924991, -0.5256453, 0.9097868, 1, 1, 1, 1, 1,
0.9271275, -1.751507, 2.34309, 1, 1, 1, 1, 1,
0.9313953, -1.103675, -0.5778975, 1, 1, 1, 1, 1,
0.9353276, -0.4956289, 0.04371975, 1, 1, 1, 1, 1,
0.9455878, 0.8920003, 3.311226, 1, 1, 1, 1, 1,
0.946844, 0.8894826, 2.206419, 1, 1, 1, 1, 1,
0.9485096, -0.3482749, 2.792053, 1, 1, 1, 1, 1,
0.9497867, -0.876016, 3.14851, 1, 1, 1, 1, 1,
0.9513963, 0.04722293, 2.584525, 1, 1, 1, 1, 1,
0.9573112, 2.063363, 1.322337, 1, 1, 1, 1, 1,
0.9580532, -1.289585, 2.506208, 1, 1, 1, 1, 1,
0.9588107, -0.888837, 4.33963, 1, 1, 1, 1, 1,
0.9609905, -0.5582435, 0.2174901, 1, 1, 1, 1, 1,
0.9661784, -1.403036, 3.819534, 1, 1, 1, 1, 1,
0.9664292, 1.572679, 0.55953, 1, 1, 1, 1, 1,
0.9681578, 0.4252936, 1.212288, 0, 0, 1, 1, 1,
0.9802107, 1.604601, -1.071608, 1, 0, 0, 1, 1,
0.9822366, -0.437506, 2.915372, 1, 0, 0, 1, 1,
0.9842331, -1.792184, 3.613931, 1, 0, 0, 1, 1,
0.9916412, -0.183491, 0.1205688, 1, 0, 0, 1, 1,
0.9965822, 0.72313, 0.1310325, 1, 0, 0, 1, 1,
0.9981523, 0.7477241, 0.9837204, 0, 0, 0, 1, 1,
1.001271, -1.554746, 3.487405, 0, 0, 0, 1, 1,
1.009318, -1.688539, 2.863236, 0, 0, 0, 1, 1,
1.011107, 0.2411009, 2.356978, 0, 0, 0, 1, 1,
1.013168, 1.315034, 1.337334, 0, 0, 0, 1, 1,
1.039984, -0.4655352, 1.611805, 0, 0, 0, 1, 1,
1.040911, 1.977971, 1.573541, 0, 0, 0, 1, 1,
1.050838, 1.046804, -0.6116393, 1, 1, 1, 1, 1,
1.05135, 0.5477515, 2.209907, 1, 1, 1, 1, 1,
1.055409, -1.273674, 3.510633, 1, 1, 1, 1, 1,
1.076317, 0.7697372, 0.07553568, 1, 1, 1, 1, 1,
1.07658, 0.7572364, 1.202371, 1, 1, 1, 1, 1,
1.094156, -0.9430814, 3.410365, 1, 1, 1, 1, 1,
1.110884, 1.434792, 1.891027, 1, 1, 1, 1, 1,
1.113127, -0.8767847, 1.328828, 1, 1, 1, 1, 1,
1.126899, -0.3767675, 1.470675, 1, 1, 1, 1, 1,
1.139938, -0.28285, 2.90256, 1, 1, 1, 1, 1,
1.140832, -1.432294, 3.036618, 1, 1, 1, 1, 1,
1.14422, 0.4555558, 0.2279338, 1, 1, 1, 1, 1,
1.146377, 0.7681368, 2.079701, 1, 1, 1, 1, 1,
1.147701, 0.3377553, 0.3813644, 1, 1, 1, 1, 1,
1.155114, -0.4522756, 1.071576, 1, 1, 1, 1, 1,
1.16194, 0.6030738, 2.031168, 0, 0, 1, 1, 1,
1.171728, -0.9006231, 0.867961, 1, 0, 0, 1, 1,
1.176702, -0.6406864, 1.415867, 1, 0, 0, 1, 1,
1.180591, 1.634872, -0.7448972, 1, 0, 0, 1, 1,
1.190287, 0.4360253, 1.172481, 1, 0, 0, 1, 1,
1.191217, 0.2167917, 0.124165, 1, 0, 0, 1, 1,
1.193674, -1.137321, 2.772164, 0, 0, 0, 1, 1,
1.195424, -0.3392576, 2.442469, 0, 0, 0, 1, 1,
1.197217, 2.008739, -0.4308802, 0, 0, 0, 1, 1,
1.1998, 0.1826047, 0.7665164, 0, 0, 0, 1, 1,
1.201383, 1.735471, -1.009402, 0, 0, 0, 1, 1,
1.203807, 0.2080035, 4.113706, 0, 0, 0, 1, 1,
1.206708, 0.5899808, 1.132771, 0, 0, 0, 1, 1,
1.21158, -0.8047941, 2.951188, 1, 1, 1, 1, 1,
1.223981, -0.824462, 3.598691, 1, 1, 1, 1, 1,
1.226948, 1.506254, -0.2248079, 1, 1, 1, 1, 1,
1.227169, 0.5588447, 0.009160852, 1, 1, 1, 1, 1,
1.232857, -0.07238013, 3.160162, 1, 1, 1, 1, 1,
1.236865, 1.235005, 1.912463, 1, 1, 1, 1, 1,
1.241437, 0.5940943, 2.428062, 1, 1, 1, 1, 1,
1.242913, 0.2424296, 2.270472, 1, 1, 1, 1, 1,
1.244644, 1.889078, 1.487192, 1, 1, 1, 1, 1,
1.250641, -0.7938083, 2.791395, 1, 1, 1, 1, 1,
1.255429, 0.2235846, 1.538907, 1, 1, 1, 1, 1,
1.256975, -0.01243145, 0.3503262, 1, 1, 1, 1, 1,
1.265467, -0.2767248, 2.586788, 1, 1, 1, 1, 1,
1.269675, 0.1763514, -0.1032031, 1, 1, 1, 1, 1,
1.278396, -1.143051, 4.578926, 1, 1, 1, 1, 1,
1.282567, 0.4476856, -0.2809604, 0, 0, 1, 1, 1,
1.282574, 1.018573, -0.2521987, 1, 0, 0, 1, 1,
1.28355, -1.951027, 0.983018, 1, 0, 0, 1, 1,
1.287705, -0.7818394, 3.04275, 1, 0, 0, 1, 1,
1.298334, -0.2317567, 1.98927, 1, 0, 0, 1, 1,
1.302765, -0.6968132, 1.741033, 1, 0, 0, 1, 1,
1.318492, -1.156589, 4.09353, 0, 0, 0, 1, 1,
1.318707, 1.343389, -0.4507959, 0, 0, 0, 1, 1,
1.319962, -1.992289, 2.817688, 0, 0, 0, 1, 1,
1.321819, 0.1844505, 3.344847, 0, 0, 0, 1, 1,
1.32258, -0.720028, 2.282484, 0, 0, 0, 1, 1,
1.324417, -0.03834375, 0.8529916, 0, 0, 0, 1, 1,
1.335958, -0.03677636, 1.075703, 0, 0, 0, 1, 1,
1.348346, -1.280704, 2.360752, 1, 1, 1, 1, 1,
1.349039, -1.626248, 3.343855, 1, 1, 1, 1, 1,
1.350415, 1.661096, 0.5069073, 1, 1, 1, 1, 1,
1.350625, 1.032185, 0.5075742, 1, 1, 1, 1, 1,
1.352387, 0.1353931, 0.7572725, 1, 1, 1, 1, 1,
1.357029, 0.6161794, -0.4269524, 1, 1, 1, 1, 1,
1.36252, 0.8683491, 2.595471, 1, 1, 1, 1, 1,
1.373339, -0.1290174, 2.984282, 1, 1, 1, 1, 1,
1.373621, 0.9316099, 0.8519144, 1, 1, 1, 1, 1,
1.379806, 0.3000434, 0.7327051, 1, 1, 1, 1, 1,
1.390637, 0.4327159, 1.199851, 1, 1, 1, 1, 1,
1.390998, 1.37319, 1.251951, 1, 1, 1, 1, 1,
1.402695, -2.270387, 3.487354, 1, 1, 1, 1, 1,
1.409935, -0.718056, 1.946963, 1, 1, 1, 1, 1,
1.412365, -0.07508589, 0.8429573, 1, 1, 1, 1, 1,
1.422656, -0.3190511, 0.9511548, 0, 0, 1, 1, 1,
1.422922, -1.647002, 2.313642, 1, 0, 0, 1, 1,
1.440454, -0.4297723, 0.2723663, 1, 0, 0, 1, 1,
1.440824, -0.5535961, 3.425485, 1, 0, 0, 1, 1,
1.455696, 2.389735, 1.199674, 1, 0, 0, 1, 1,
1.459804, -1.635829, 3.132473, 1, 0, 0, 1, 1,
1.460314, -0.1866922, 1.118083, 0, 0, 0, 1, 1,
1.464335, 0.2242323, 1.338026, 0, 0, 0, 1, 1,
1.478962, -0.1262167, 3.242392, 0, 0, 0, 1, 1,
1.483266, 0.1752699, 1.290345, 0, 0, 0, 1, 1,
1.507559, 0.6777844, 1.940083, 0, 0, 0, 1, 1,
1.511838, -0.4544119, 2.659668, 0, 0, 0, 1, 1,
1.513088, 0.2268724, -1.824405, 0, 0, 0, 1, 1,
1.535497, -0.6119542, 1.425231, 1, 1, 1, 1, 1,
1.545104, 0.4553622, 0.439734, 1, 1, 1, 1, 1,
1.546574, -0.2590285, 3.192831, 1, 1, 1, 1, 1,
1.548916, -0.7567043, 1.656986, 1, 1, 1, 1, 1,
1.559481, -0.2401102, 2.205065, 1, 1, 1, 1, 1,
1.565675, 0.09330299, 1.014818, 1, 1, 1, 1, 1,
1.585217, -0.4257349, 1.403962, 1, 1, 1, 1, 1,
1.587353, -0.1976448, 2.228098, 1, 1, 1, 1, 1,
1.591605, 0.4452019, 2.53676, 1, 1, 1, 1, 1,
1.614642, -0.1191497, 1.971145, 1, 1, 1, 1, 1,
1.615927, -0.5241417, 1.570069, 1, 1, 1, 1, 1,
1.623084, -1.280761, 2.62152, 1, 1, 1, 1, 1,
1.623231, 0.9912987, 2.183277, 1, 1, 1, 1, 1,
1.641343, 0.1308395, 1.028933, 1, 1, 1, 1, 1,
1.653352, -0.002081317, 1.549929, 1, 1, 1, 1, 1,
1.665202, -1.183785, 2.508435, 0, 0, 1, 1, 1,
1.673124, -0.3301485, 2.415135, 1, 0, 0, 1, 1,
1.674189, 0.2640746, 1.537772, 1, 0, 0, 1, 1,
1.69606, -0.7885935, 1.488653, 1, 0, 0, 1, 1,
1.699163, 0.4985302, 0.6064842, 1, 0, 0, 1, 1,
1.703455, -0.3563178, 1.327449, 1, 0, 0, 1, 1,
1.708034, 0.1284763, 2.515699, 0, 0, 0, 1, 1,
1.710678, -0.9242643, 2.570014, 0, 0, 0, 1, 1,
1.751397, -1.628695, 1.214563, 0, 0, 0, 1, 1,
1.769036, 0.4177981, 1.009544, 0, 0, 0, 1, 1,
1.770572, -0.539262, 3.046732, 0, 0, 0, 1, 1,
1.780822, 0.371429, 0.9424862, 0, 0, 0, 1, 1,
1.831238, 0.6177258, -0.2028923, 0, 0, 0, 1, 1,
1.842893, 0.4257745, -1.443274, 1, 1, 1, 1, 1,
1.855539, -0.5362433, 0.8921794, 1, 1, 1, 1, 1,
1.858942, -0.4917116, 2.664209, 1, 1, 1, 1, 1,
1.867259, 0.2119049, 1.652784, 1, 1, 1, 1, 1,
1.883368, -1.717207, 2.546779, 1, 1, 1, 1, 1,
1.901586, -0.6026749, 2.709008, 1, 1, 1, 1, 1,
1.932199, 0.03244054, 2.952899, 1, 1, 1, 1, 1,
2.019968, -0.3244563, -0.3666761, 1, 1, 1, 1, 1,
2.027359, 0.5914941, 0.1714668, 1, 1, 1, 1, 1,
2.030888, -1.245407, 1.762552, 1, 1, 1, 1, 1,
2.03212, -0.3129902, 2.002219, 1, 1, 1, 1, 1,
2.053697, -1.052871, 2.031499, 1, 1, 1, 1, 1,
2.068651, -0.405424, 2.349848, 1, 1, 1, 1, 1,
2.073323, 0.677285, 1.762939, 1, 1, 1, 1, 1,
2.092605, 1.573611, 1.369354, 1, 1, 1, 1, 1,
2.130543, 0.6196209, 1.343753, 0, 0, 1, 1, 1,
2.132099, 1.248308, 1.195012, 1, 0, 0, 1, 1,
2.133989, 0.03658482, 2.163455, 1, 0, 0, 1, 1,
2.152526, -0.8413647, 2.941161, 1, 0, 0, 1, 1,
2.168185, 0.8502383, 0.5516609, 1, 0, 0, 1, 1,
2.216076, 1.027058, 0.8670835, 1, 0, 0, 1, 1,
2.220885, -0.09335292, 2.511276, 0, 0, 0, 1, 1,
2.297192, 1.563375, 0.1807576, 0, 0, 0, 1, 1,
2.312217, -0.4451049, 0.2865117, 0, 0, 0, 1, 1,
2.461437, 1.024757, 0.2773322, 0, 0, 0, 1, 1,
2.503125, -1.276304, 2.254647, 0, 0, 0, 1, 1,
2.529132, -0.580944, 1.520157, 0, 0, 0, 1, 1,
2.573876, 0.3520282, 1.258312, 0, 0, 0, 1, 1,
2.574811, -0.8306463, 1.589618, 1, 1, 1, 1, 1,
2.581945, -2.498591, 2.403379, 1, 1, 1, 1, 1,
2.631795, 0.4995108, 0.5409185, 1, 1, 1, 1, 1,
2.71616, -0.6873494, 0.8697606, 1, 1, 1, 1, 1,
2.765522, -0.8906403, 3.099493, 1, 1, 1, 1, 1,
2.812716, -1.663781, 1.043043, 1, 1, 1, 1, 1,
2.91466, 1.174443, 1.140809, 1, 1, 1, 1, 1
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
var radius = 9.583645;
var distance = 33.66215;
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
mvMatrix.translate( 0.04834199, -0.1322024, 0.2162857 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.66215);
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