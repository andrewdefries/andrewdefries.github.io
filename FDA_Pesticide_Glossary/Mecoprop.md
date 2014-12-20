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
-3.851088, 0.5630093, -0.8170131, 1, 0, 0, 1,
-3.092441, 0.7373976, -1.975296, 1, 0.007843138, 0, 1,
-2.953688, -0.8022863, -1.969799, 1, 0.01176471, 0, 1,
-2.590163, 0.571154, -1.278519, 1, 0.01960784, 0, 1,
-2.523279, -0.5449219, -1.73787, 1, 0.02352941, 0, 1,
-2.434453, 2.168636, -1.607457, 1, 0.03137255, 0, 1,
-2.423087, 1.116439, -0.1236522, 1, 0.03529412, 0, 1,
-2.390394, -0.1731969, -1.459053, 1, 0.04313726, 0, 1,
-2.378137, -0.9356849, -0.8224046, 1, 0.04705882, 0, 1,
-2.332045, 0.9352185, -1.328184, 1, 0.05490196, 0, 1,
-2.117432, -1.109827, -2.812721, 1, 0.05882353, 0, 1,
-2.113617, -0.8955659, -0.334171, 1, 0.06666667, 0, 1,
-2.099571, 0.6709073, -1.967912, 1, 0.07058824, 0, 1,
-2.075427, 1.341888, -0.1151988, 1, 0.07843138, 0, 1,
-2.033488, 0.2493397, -3.097945, 1, 0.08235294, 0, 1,
-2.017005, 1.558995, 0.3787963, 1, 0.09019608, 0, 1,
-2.000375, 1.072731, -3.117564, 1, 0.09411765, 0, 1,
-1.986874, 0.8739755, -1.756216, 1, 0.1019608, 0, 1,
-1.97073, -0.2921057, -0.7040825, 1, 0.1098039, 0, 1,
-1.961794, 0.445277, -1.945914, 1, 0.1137255, 0, 1,
-1.942476, -1.484025, -3.628464, 1, 0.1215686, 0, 1,
-1.939146, 2.080383, -1.421219, 1, 0.1254902, 0, 1,
-1.901197, 1.299333, -0.3024932, 1, 0.1333333, 0, 1,
-1.898644, 0.8636233, -1.496775, 1, 0.1372549, 0, 1,
-1.839125, -1.273949, -2.146353, 1, 0.145098, 0, 1,
-1.826233, 2.413915, 1.113763, 1, 0.1490196, 0, 1,
-1.820651, -1.358724, -1.826002, 1, 0.1568628, 0, 1,
-1.766721, -1.002413, -2.21052, 1, 0.1607843, 0, 1,
-1.740162, -0.7925261, -1.864879, 1, 0.1686275, 0, 1,
-1.729851, 0.04966791, 0.3079435, 1, 0.172549, 0, 1,
-1.719095, -0.3816782, -1.339261, 1, 0.1803922, 0, 1,
-1.715851, -1.384402, -0.07163686, 1, 0.1843137, 0, 1,
-1.705331, -1.110509, -4.227733, 1, 0.1921569, 0, 1,
-1.701904, 0.6745975, -1.263823, 1, 0.1960784, 0, 1,
-1.699417, -1.080253, -2.020523, 1, 0.2039216, 0, 1,
-1.697434, -0.2591244, -2.638514, 1, 0.2117647, 0, 1,
-1.675288, -0.5535808, -2.542533, 1, 0.2156863, 0, 1,
-1.666466, 0.8524446, -2.517517, 1, 0.2235294, 0, 1,
-1.660052, 0.9983748, 0.3120321, 1, 0.227451, 0, 1,
-1.652248, -0.08429003, -1.338002, 1, 0.2352941, 0, 1,
-1.651505, 0.8004304, -1.796047, 1, 0.2392157, 0, 1,
-1.649667, 0.3550247, 0.1633126, 1, 0.2470588, 0, 1,
-1.646676, 0.6281491, -1.199774, 1, 0.2509804, 0, 1,
-1.62023, -0.4633284, -2.584948, 1, 0.2588235, 0, 1,
-1.616495, -0.1327853, -0.0807695, 1, 0.2627451, 0, 1,
-1.613443, -0.1655508, -0.5603863, 1, 0.2705882, 0, 1,
-1.610521, -0.7751387, -1.877722, 1, 0.2745098, 0, 1,
-1.605135, 0.5189437, -0.9531279, 1, 0.282353, 0, 1,
-1.601246, 0.03921026, -0.6524178, 1, 0.2862745, 0, 1,
-1.599822, -1.384998, -2.941258, 1, 0.2941177, 0, 1,
-1.594687, 0.6902429, -1.640667, 1, 0.3019608, 0, 1,
-1.586531, -1.2765, -5.027371, 1, 0.3058824, 0, 1,
-1.584424, 0.03289428, -1.67739, 1, 0.3137255, 0, 1,
-1.580992, 0.8643849, -1.564981, 1, 0.3176471, 0, 1,
-1.57811, 1.350527, 0.3556772, 1, 0.3254902, 0, 1,
-1.578048, -0.2889398, -2.429525, 1, 0.3294118, 0, 1,
-1.576948, -0.1490174, -2.904287, 1, 0.3372549, 0, 1,
-1.573454, 0.7549021, -1.422871, 1, 0.3411765, 0, 1,
-1.564448, -0.3623627, -1.276996, 1, 0.3490196, 0, 1,
-1.562252, -2.07906, -2.019025, 1, 0.3529412, 0, 1,
-1.559727, 0.1406432, -3.181072, 1, 0.3607843, 0, 1,
-1.537354, -0.2098879, -0.9009645, 1, 0.3647059, 0, 1,
-1.534942, 1.388266, -2.554945, 1, 0.372549, 0, 1,
-1.531258, -0.3917116, -1.558693, 1, 0.3764706, 0, 1,
-1.519047, -0.4497023, -0.1059549, 1, 0.3843137, 0, 1,
-1.518162, 1.028345, -1.207298, 1, 0.3882353, 0, 1,
-1.509696, -0.2293594, -3.664563, 1, 0.3960784, 0, 1,
-1.49082, 1.542161, -0.09135586, 1, 0.4039216, 0, 1,
-1.488729, -0.8829849, -3.291014, 1, 0.4078431, 0, 1,
-1.488147, 0.4842379, -2.126873, 1, 0.4156863, 0, 1,
-1.481357, -0.5527759, -2.586123, 1, 0.4196078, 0, 1,
-1.47978, 0.9202765, -1.723039, 1, 0.427451, 0, 1,
-1.464649, 0.6420519, -0.8534107, 1, 0.4313726, 0, 1,
-1.446592, 0.4631747, -1.987146, 1, 0.4392157, 0, 1,
-1.437296, -1.590759, -4.143215, 1, 0.4431373, 0, 1,
-1.436628, 0.4182217, 0.6778584, 1, 0.4509804, 0, 1,
-1.420516, -1.255888, -1.724102, 1, 0.454902, 0, 1,
-1.418913, 0.5279879, -1.387107, 1, 0.4627451, 0, 1,
-1.417674, 1.087156, 1.661473, 1, 0.4666667, 0, 1,
-1.408706, 1.278023, -1.527153, 1, 0.4745098, 0, 1,
-1.397255, 1.636837, -1.952482, 1, 0.4784314, 0, 1,
-1.39055, 1.058102, -1.000142, 1, 0.4862745, 0, 1,
-1.38127, 0.06512468, -2.323733, 1, 0.4901961, 0, 1,
-1.363733, 0.2468987, -2.699702, 1, 0.4980392, 0, 1,
-1.35588, 0.5128664, -1.077469, 1, 0.5058824, 0, 1,
-1.34075, -0.5471068, -2.740649, 1, 0.509804, 0, 1,
-1.335302, 0.2313231, -1.226154, 1, 0.5176471, 0, 1,
-1.333881, 0.7740941, -1.699357, 1, 0.5215687, 0, 1,
-1.324828, 0.3327127, -1.987543, 1, 0.5294118, 0, 1,
-1.321031, 1.866335, -0.7467576, 1, 0.5333334, 0, 1,
-1.318169, 1.43586, -0.7721158, 1, 0.5411765, 0, 1,
-1.315634, -0.07626056, -1.547701, 1, 0.5450981, 0, 1,
-1.307249, 1.13277, -2.101432, 1, 0.5529412, 0, 1,
-1.302219, 0.1316484, -1.403636, 1, 0.5568628, 0, 1,
-1.299603, 0.3095044, -2.326369, 1, 0.5647059, 0, 1,
-1.290982, -0.240325, -0.9700586, 1, 0.5686275, 0, 1,
-1.288977, 0.8657228, -0.4999739, 1, 0.5764706, 0, 1,
-1.28815, -0.2353588, -0.3184423, 1, 0.5803922, 0, 1,
-1.284178, 1.337518, -1.726431, 1, 0.5882353, 0, 1,
-1.283099, -0.04814297, -1.987106, 1, 0.5921569, 0, 1,
-1.261925, -0.1541518, -0.6842682, 1, 0.6, 0, 1,
-1.25816, -0.2966174, -3.166785, 1, 0.6078432, 0, 1,
-1.256929, 1.779834, 0.07824131, 1, 0.6117647, 0, 1,
-1.252504, 1.486274, -0.7425835, 1, 0.6196079, 0, 1,
-1.242226, -0.5546303, -4.072191, 1, 0.6235294, 0, 1,
-1.231957, 1.119703, -1.821882, 1, 0.6313726, 0, 1,
-1.228755, 0.1107009, -1.637535, 1, 0.6352941, 0, 1,
-1.227171, -2.738515, -1.973041, 1, 0.6431373, 0, 1,
-1.226573, -0.4386124, -1.76043, 1, 0.6470588, 0, 1,
-1.222051, 1.079709, -2.194267, 1, 0.654902, 0, 1,
-1.218348, 0.6184468, -0.8999179, 1, 0.6588235, 0, 1,
-1.214922, -0.7968547, -2.497138, 1, 0.6666667, 0, 1,
-1.209407, -2.172599, -2.14397, 1, 0.6705883, 0, 1,
-1.204326, -1.011839, -2.171246, 1, 0.6784314, 0, 1,
-1.199819, -1.040759, -3.392856, 1, 0.682353, 0, 1,
-1.191998, 1.071814, -0.4280097, 1, 0.6901961, 0, 1,
-1.191068, -0.2703315, -1.379035, 1, 0.6941177, 0, 1,
-1.190427, 0.1876793, -1.573267, 1, 0.7019608, 0, 1,
-1.189671, 0.2535229, -0.7447041, 1, 0.7098039, 0, 1,
-1.186585, 0.6600426, 1.434561, 1, 0.7137255, 0, 1,
-1.184264, 2.400671, 1.742337, 1, 0.7215686, 0, 1,
-1.180776, 1.113657, -0.5132348, 1, 0.7254902, 0, 1,
-1.169968, -1.237796, -3.923211, 1, 0.7333333, 0, 1,
-1.159807, 2.441113, -1.97128, 1, 0.7372549, 0, 1,
-1.155656, -0.2065801, -1.521303, 1, 0.7450981, 0, 1,
-1.149491, -0.6125825, -2.222586, 1, 0.7490196, 0, 1,
-1.143998, 0.149982, -1.255211, 1, 0.7568628, 0, 1,
-1.120121, -0.8272709, -1.907529, 1, 0.7607843, 0, 1,
-1.118495, 0.3563682, -1.235917, 1, 0.7686275, 0, 1,
-1.117822, -1.126407, -1.790129, 1, 0.772549, 0, 1,
-1.116836, -1.457867, -2.801036, 1, 0.7803922, 0, 1,
-1.108327, -0.1707963, -1.990975, 1, 0.7843137, 0, 1,
-1.092365, -0.8115736, -0.7894987, 1, 0.7921569, 0, 1,
-1.086814, -0.8682301, -4.742498, 1, 0.7960784, 0, 1,
-1.079787, 0.8580899, -1.179957, 1, 0.8039216, 0, 1,
-1.074041, 1.848169, -0.03929062, 1, 0.8117647, 0, 1,
-1.066541, -1.038915, -2.992955, 1, 0.8156863, 0, 1,
-1.061821, 0.3173541, -0.3065716, 1, 0.8235294, 0, 1,
-1.058743, 0.322447, 0.136079, 1, 0.827451, 0, 1,
-1.058237, -1.873467, -4.413561, 1, 0.8352941, 0, 1,
-1.053075, 0.1846609, -0.4706384, 1, 0.8392157, 0, 1,
-1.05173, 1.035256, 0.2430483, 1, 0.8470588, 0, 1,
-1.048577, 0.5660245, -1.402067, 1, 0.8509804, 0, 1,
-1.047313, -0.7389652, -2.470178, 1, 0.8588235, 0, 1,
-1.04679, -0.565641, -1.205315, 1, 0.8627451, 0, 1,
-1.043662, -0.02989343, -1.065553, 1, 0.8705882, 0, 1,
-1.040819, -0.8638268, -3.896585, 1, 0.8745098, 0, 1,
-1.038112, -1.799687, -1.656425, 1, 0.8823529, 0, 1,
-1.037495, 1.270219, -0.6850677, 1, 0.8862745, 0, 1,
-1.034892, 0.02764357, -3.13439, 1, 0.8941177, 0, 1,
-1.015873, -0.935065, -2.802607, 1, 0.8980392, 0, 1,
-1.010257, -0.4616208, -3.358512, 1, 0.9058824, 0, 1,
-1.008745, 0.4803522, -0.9862205, 1, 0.9137255, 0, 1,
-1.008152, 0.549974, -1.202079, 1, 0.9176471, 0, 1,
-1.000132, 1.527392, -0.182565, 1, 0.9254902, 0, 1,
-0.9920335, -0.5403351, -0.2440604, 1, 0.9294118, 0, 1,
-0.9898325, 0.3789222, -1.5723, 1, 0.9372549, 0, 1,
-0.9861294, -2.388601, -2.984564, 1, 0.9411765, 0, 1,
-0.9850305, -2.044308, -2.643719, 1, 0.9490196, 0, 1,
-0.9795451, 0.6937471, -1.168355, 1, 0.9529412, 0, 1,
-0.9765576, 0.3710045, 0.006724713, 1, 0.9607843, 0, 1,
-0.969775, -0.8287187, -3.195423, 1, 0.9647059, 0, 1,
-0.9648696, -0.6334974, -2.439159, 1, 0.972549, 0, 1,
-0.9606377, -1.005674, -1.927125, 1, 0.9764706, 0, 1,
-0.9593969, 3.65327, -0.3794064, 1, 0.9843137, 0, 1,
-0.9503202, -0.5093186, -1.629183, 1, 0.9882353, 0, 1,
-0.9494998, 0.2767627, -0.09611613, 1, 0.9960784, 0, 1,
-0.9450145, 0.5403184, -0.5102122, 0.9960784, 1, 0, 1,
-0.9429109, -0.143284, -2.429789, 0.9921569, 1, 0, 1,
-0.9387202, -0.5462393, -2.72687, 0.9843137, 1, 0, 1,
-0.9363725, -0.6026713, -2.841264, 0.9803922, 1, 0, 1,
-0.9313365, -2.399101, -3.742854, 0.972549, 1, 0, 1,
-0.9293306, -0.6320864, -3.559857, 0.9686275, 1, 0, 1,
-0.9252409, 1.300934, -0.9050866, 0.9607843, 1, 0, 1,
-0.9191203, -0.7757802, -1.577652, 0.9568627, 1, 0, 1,
-0.9159749, -1.243668, -0.8609945, 0.9490196, 1, 0, 1,
-0.9154213, 0.4717525, -0.3802227, 0.945098, 1, 0, 1,
-0.9145638, -0.3323894, -1.884174, 0.9372549, 1, 0, 1,
-0.9072877, -0.09330328, -1.330872, 0.9333333, 1, 0, 1,
-0.8771287, 0.06808437, -2.670484, 0.9254902, 1, 0, 1,
-0.8708912, 0.9889279, 0.6259445, 0.9215686, 1, 0, 1,
-0.8704637, 0.8873558, -0.3613373, 0.9137255, 1, 0, 1,
-0.8683518, -0.198366, -2.995751, 0.9098039, 1, 0, 1,
-0.8680811, 0.03048985, -2.900363, 0.9019608, 1, 0, 1,
-0.8641558, -0.4959706, -3.484952, 0.8941177, 1, 0, 1,
-0.8640913, 0.562354, -1.39531, 0.8901961, 1, 0, 1,
-0.8613471, -1.135926, -4.119246, 0.8823529, 1, 0, 1,
-0.8521737, -0.3020163, -0.7070639, 0.8784314, 1, 0, 1,
-0.8492188, -1.741234, -2.350907, 0.8705882, 1, 0, 1,
-0.8469144, -0.07066116, -2.68081, 0.8666667, 1, 0, 1,
-0.8284874, -0.2841501, -1.62848, 0.8588235, 1, 0, 1,
-0.8283931, -0.3535926, -3.198998, 0.854902, 1, 0, 1,
-0.827799, -0.4216209, -3.060027, 0.8470588, 1, 0, 1,
-0.8181587, -0.03696256, 0.06154083, 0.8431373, 1, 0, 1,
-0.8181303, 0.5247998, -1.073101, 0.8352941, 1, 0, 1,
-0.8095144, -1.22136, -3.261192, 0.8313726, 1, 0, 1,
-0.799216, -2.075676, -2.28221, 0.8235294, 1, 0, 1,
-0.7988274, -0.08856591, -1.90432, 0.8196079, 1, 0, 1,
-0.7965972, -0.1973346, -0.270679, 0.8117647, 1, 0, 1,
-0.7930942, 0.8892208, 0.1806616, 0.8078431, 1, 0, 1,
-0.7904312, 0.2519789, -2.090696, 0.8, 1, 0, 1,
-0.7830432, 0.2798271, -0.927404, 0.7921569, 1, 0, 1,
-0.781441, -0.4339623, -0.1988529, 0.7882353, 1, 0, 1,
-0.7766438, 0.9632793, 1.046283, 0.7803922, 1, 0, 1,
-0.773888, -0.7220233, -3.68339, 0.7764706, 1, 0, 1,
-0.772282, 1.077192, -1.578659, 0.7686275, 1, 0, 1,
-0.7683545, -1.845736, -2.51618, 0.7647059, 1, 0, 1,
-0.7680749, -0.3413239, -2.102555, 0.7568628, 1, 0, 1,
-0.7598895, -0.08619917, -1.854, 0.7529412, 1, 0, 1,
-0.753576, 0.3043265, -0.1473739, 0.7450981, 1, 0, 1,
-0.7504899, -0.08007366, -0.5791065, 0.7411765, 1, 0, 1,
-0.7501931, -1.277004, -1.863531, 0.7333333, 1, 0, 1,
-0.7445052, -1.809858, -1.148408, 0.7294118, 1, 0, 1,
-0.741359, 0.2471634, -1.149726, 0.7215686, 1, 0, 1,
-0.7396522, -1.428709, -1.81225, 0.7176471, 1, 0, 1,
-0.7376646, -0.3682378, -1.248845, 0.7098039, 1, 0, 1,
-0.736407, -0.4278115, -3.122947, 0.7058824, 1, 0, 1,
-0.7341332, -0.1218383, -0.7697712, 0.6980392, 1, 0, 1,
-0.7298893, 0.4176383, -2.284757, 0.6901961, 1, 0, 1,
-0.7273292, 1.135393, -1.263072, 0.6862745, 1, 0, 1,
-0.7238681, 0.9761148, -0.661504, 0.6784314, 1, 0, 1,
-0.7224644, 1.431021, 0.5028663, 0.6745098, 1, 0, 1,
-0.7214241, 1.121459, -1.467648, 0.6666667, 1, 0, 1,
-0.7198718, 0.1970294, -0.8781766, 0.6627451, 1, 0, 1,
-0.719845, 0.5103765, -1.761199, 0.654902, 1, 0, 1,
-0.7140547, 0.5009227, 0.7136558, 0.6509804, 1, 0, 1,
-0.7018931, -0.386254, -1.933125, 0.6431373, 1, 0, 1,
-0.6999089, 1.352556, 0.2014102, 0.6392157, 1, 0, 1,
-0.6991383, -0.9062649, -2.80195, 0.6313726, 1, 0, 1,
-0.697925, -1.233211, -3.351575, 0.627451, 1, 0, 1,
-0.6962622, -0.9152554, -1.600446, 0.6196079, 1, 0, 1,
-0.6954029, -0.2679524, -0.9914013, 0.6156863, 1, 0, 1,
-0.6916722, 0.1194707, -1.792446, 0.6078432, 1, 0, 1,
-0.6912374, -0.6681191, -2.152052, 0.6039216, 1, 0, 1,
-0.6907457, -1.291477, -2.284094, 0.5960785, 1, 0, 1,
-0.6903337, -1.269806, -1.962295, 0.5882353, 1, 0, 1,
-0.6897944, -0.5847969, -2.338888, 0.5843138, 1, 0, 1,
-0.6893507, -1.131297, -0.6292516, 0.5764706, 1, 0, 1,
-0.681588, -0.6180739, -2.345693, 0.572549, 1, 0, 1,
-0.6814697, 0.6146508, -1.42297, 0.5647059, 1, 0, 1,
-0.6784703, -0.3336947, -1.326733, 0.5607843, 1, 0, 1,
-0.6755037, -0.6615707, -2.58851, 0.5529412, 1, 0, 1,
-0.6737005, -0.5172424, -1.752393, 0.5490196, 1, 0, 1,
-0.6720657, 1.542846, -0.6813304, 0.5411765, 1, 0, 1,
-0.6688294, 1.025205, -2.395313, 0.5372549, 1, 0, 1,
-0.6622078, -0.3077121, -2.726722, 0.5294118, 1, 0, 1,
-0.6572174, -0.1656785, -2.902688, 0.5254902, 1, 0, 1,
-0.652972, -0.8566687, -0.551085, 0.5176471, 1, 0, 1,
-0.6485342, -1.680265, -1.521266, 0.5137255, 1, 0, 1,
-0.6453722, -0.3855254, -4.059073, 0.5058824, 1, 0, 1,
-0.6439499, -0.07206024, 0.0459936, 0.5019608, 1, 0, 1,
-0.643497, 0.6881167, -0.3959076, 0.4941176, 1, 0, 1,
-0.6411116, 0.8564848, -1.093235, 0.4862745, 1, 0, 1,
-0.6407943, 1.67083, -0.1222395, 0.4823529, 1, 0, 1,
-0.6379305, -0.3856761, -1.974096, 0.4745098, 1, 0, 1,
-0.6375023, -1.583067, -3.227782, 0.4705882, 1, 0, 1,
-0.6367754, -1.806698, -2.985071, 0.4627451, 1, 0, 1,
-0.633258, -1.744886, -2.624397, 0.4588235, 1, 0, 1,
-0.6305715, 1.272019, 0.3886725, 0.4509804, 1, 0, 1,
-0.6251453, 1.666523, -0.2924765, 0.4470588, 1, 0, 1,
-0.6190706, -0.1998776, -0.8208942, 0.4392157, 1, 0, 1,
-0.6157802, 0.9352434, -0.5527788, 0.4352941, 1, 0, 1,
-0.6135884, -1.651322, -3.483564, 0.427451, 1, 0, 1,
-0.6095536, -0.08483956, -0.4136629, 0.4235294, 1, 0, 1,
-0.6079105, -0.06898817, -3.440086, 0.4156863, 1, 0, 1,
-0.6006194, 0.06822763, -0.8859105, 0.4117647, 1, 0, 1,
-0.597718, -0.3429982, -4.533298, 0.4039216, 1, 0, 1,
-0.5954005, -1.719814, -2.651181, 0.3960784, 1, 0, 1,
-0.5945904, -0.5373091, -1.639836, 0.3921569, 1, 0, 1,
-0.5941433, 1.261159, 0.71376, 0.3843137, 1, 0, 1,
-0.5912424, 0.7661083, -0.1824778, 0.3803922, 1, 0, 1,
-0.5800908, 0.7746235, -0.9913205, 0.372549, 1, 0, 1,
-0.5794073, -0.2456753, -1.549562, 0.3686275, 1, 0, 1,
-0.5788695, -0.133865, -0.8824196, 0.3607843, 1, 0, 1,
-0.5772394, 1.611853, -0.2455095, 0.3568628, 1, 0, 1,
-0.5752939, -1.453627, -1.324472, 0.3490196, 1, 0, 1,
-0.5739196, -0.152292, -1.159856, 0.345098, 1, 0, 1,
-0.5718787, 0.6354111, -0.9272821, 0.3372549, 1, 0, 1,
-0.5641865, -0.5556096, -2.486332, 0.3333333, 1, 0, 1,
-0.5624962, -1.173457, -4.162515, 0.3254902, 1, 0, 1,
-0.5603766, -1.518176, -3.625536, 0.3215686, 1, 0, 1,
-0.5554898, 0.9029457, -1.115472, 0.3137255, 1, 0, 1,
-0.5521494, -1.198641, -2.905178, 0.3098039, 1, 0, 1,
-0.5489873, -0.1359495, -1.545866, 0.3019608, 1, 0, 1,
-0.5487326, -0.006922604, -2.020991, 0.2941177, 1, 0, 1,
-0.5467249, -0.3731627, -3.190351, 0.2901961, 1, 0, 1,
-0.5278577, 1.458986, -0.4105378, 0.282353, 1, 0, 1,
-0.5275093, -0.4748915, -1.850919, 0.2784314, 1, 0, 1,
-0.5243086, -1.138374, -2.900366, 0.2705882, 1, 0, 1,
-0.5152164, -1.293742, -2.324244, 0.2666667, 1, 0, 1,
-0.5147964, 0.8554168, 0.03030576, 0.2588235, 1, 0, 1,
-0.5129437, -0.04018345, -1.441378, 0.254902, 1, 0, 1,
-0.5070293, -1.454193, -2.57764, 0.2470588, 1, 0, 1,
-0.5037357, -1.286334, -0.4777076, 0.2431373, 1, 0, 1,
-0.5024294, -0.644624, -2.675543, 0.2352941, 1, 0, 1,
-0.5018251, 0.6288584, -1.062013, 0.2313726, 1, 0, 1,
-0.4905035, -0.7384336, -3.643077, 0.2235294, 1, 0, 1,
-0.4876908, 1.624122, 0.8777922, 0.2196078, 1, 0, 1,
-0.4839977, 0.8910009, -1.290732, 0.2117647, 1, 0, 1,
-0.4807801, 1.332273, -1.740576, 0.2078431, 1, 0, 1,
-0.4805253, 0.06023855, -1.826485, 0.2, 1, 0, 1,
-0.4766633, 1.709396, -0.2833372, 0.1921569, 1, 0, 1,
-0.4745271, -0.5609729, -2.315345, 0.1882353, 1, 0, 1,
-0.4708903, -1.706383, -2.928977, 0.1803922, 1, 0, 1,
-0.4687739, -0.4796395, -1.14184, 0.1764706, 1, 0, 1,
-0.4676235, -0.2657276, -1.842486, 0.1686275, 1, 0, 1,
-0.4648423, 0.4873778, 0.2439955, 0.1647059, 1, 0, 1,
-0.4621489, 0.6698208, -0.7523575, 0.1568628, 1, 0, 1,
-0.4610208, -1.294682, -3.29635, 0.1529412, 1, 0, 1,
-0.4607517, 0.7649451, -1.107119, 0.145098, 1, 0, 1,
-0.4557658, -1.383505, -3.509727, 0.1411765, 1, 0, 1,
-0.4536866, 2.057025, -0.4178599, 0.1333333, 1, 0, 1,
-0.4533482, -0.03185926, -1.877777, 0.1294118, 1, 0, 1,
-0.4520546, -0.6731004, -3.860027, 0.1215686, 1, 0, 1,
-0.4484889, 0.3308068, 0.1726577, 0.1176471, 1, 0, 1,
-0.440919, 1.636947, 1.799312, 0.1098039, 1, 0, 1,
-0.4353283, 1.854176, -0.9897672, 0.1058824, 1, 0, 1,
-0.4329727, -0.1651208, -1.164569, 0.09803922, 1, 0, 1,
-0.4299601, -0.430342, -1.71422, 0.09019608, 1, 0, 1,
-0.4285704, -0.592853, -4.18382, 0.08627451, 1, 0, 1,
-0.4277151, -1.132072, -2.291898, 0.07843138, 1, 0, 1,
-0.41947, -0.1736343, -2.168111, 0.07450981, 1, 0, 1,
-0.4117658, -2.403797, -3.30889, 0.06666667, 1, 0, 1,
-0.4117128, -1.800923, -3.845555, 0.0627451, 1, 0, 1,
-0.4108689, -2.012719, -2.415758, 0.05490196, 1, 0, 1,
-0.4102491, -0.8570638, -2.889094, 0.05098039, 1, 0, 1,
-0.4095663, 0.3330553, 0.8849678, 0.04313726, 1, 0, 1,
-0.4002766, 1.34398, -1.330347, 0.03921569, 1, 0, 1,
-0.3992924, -1.316062, -1.924579, 0.03137255, 1, 0, 1,
-0.398355, -0.6384878, -1.612625, 0.02745098, 1, 0, 1,
-0.3979426, 1.471965, 0.8388978, 0.01960784, 1, 0, 1,
-0.3943132, 0.2337463, -1.834749, 0.01568628, 1, 0, 1,
-0.3922202, -0.8813187, -3.512937, 0.007843138, 1, 0, 1,
-0.3861611, 1.70941, -2.051028, 0.003921569, 1, 0, 1,
-0.3836545, -0.4434646, -3.237981, 0, 1, 0.003921569, 1,
-0.3803191, -0.4383421, -3.020211, 0, 1, 0.01176471, 1,
-0.3754273, 1.275636, 0.3591247, 0, 1, 0.01568628, 1,
-0.3752052, 0.4735576, 1.190043, 0, 1, 0.02352941, 1,
-0.3700294, -2.237131, -2.643084, 0, 1, 0.02745098, 1,
-0.366919, -0.716729, -3.413453, 0, 1, 0.03529412, 1,
-0.3663086, 1.577914, -0.1362397, 0, 1, 0.03921569, 1,
-0.3660246, -0.1070625, -1.893414, 0, 1, 0.04705882, 1,
-0.362053, 1.267872, -0.9923006, 0, 1, 0.05098039, 1,
-0.3609997, -0.0008334745, -1.076161, 0, 1, 0.05882353, 1,
-0.3566315, -0.8646576, -4.379821, 0, 1, 0.0627451, 1,
-0.3544159, -0.9467658, -4.678102, 0, 1, 0.07058824, 1,
-0.3522945, 0.6604689, -1.329941, 0, 1, 0.07450981, 1,
-0.3502923, -1.790535, -2.199466, 0, 1, 0.08235294, 1,
-0.348635, -1.423247, -2.934353, 0, 1, 0.08627451, 1,
-0.3435695, 1.979352, 0.1269943, 0, 1, 0.09411765, 1,
-0.3427114, 0.3292187, -0.420987, 0, 1, 0.1019608, 1,
-0.3423792, 0.2883988, -0.66395, 0, 1, 0.1058824, 1,
-0.3420151, 1.087068, -0.8932196, 0, 1, 0.1137255, 1,
-0.3408284, -0.333372, -2.103785, 0, 1, 0.1176471, 1,
-0.3387235, -1.747885, -2.104616, 0, 1, 0.1254902, 1,
-0.3377314, -1.849286, -2.382276, 0, 1, 0.1294118, 1,
-0.3314722, -1.035442, -1.428822, 0, 1, 0.1372549, 1,
-0.3312347, 0.214213, -1.982537, 0, 1, 0.1411765, 1,
-0.3308599, -0.7269332, -3.968195, 0, 1, 0.1490196, 1,
-0.3285941, 0.3156084, -1.361449, 0, 1, 0.1529412, 1,
-0.3202499, -2.890079, -4.305211, 0, 1, 0.1607843, 1,
-0.318369, 2.697807, 2.119652, 0, 1, 0.1647059, 1,
-0.3138447, -0.1418096, -2.01052, 0, 1, 0.172549, 1,
-0.3127651, -0.0813882, 0.3089076, 0, 1, 0.1764706, 1,
-0.3080844, 0.5129161, -0.8330042, 0, 1, 0.1843137, 1,
-0.3067362, 0.4929068, 1.627777, 0, 1, 0.1882353, 1,
-0.302261, -2.222083, -3.237456, 0, 1, 0.1960784, 1,
-0.2984748, -0.09610361, -1.46773, 0, 1, 0.2039216, 1,
-0.2930456, 0.2770729, -0.8886291, 0, 1, 0.2078431, 1,
-0.2866136, 1.35397, -0.671621, 0, 1, 0.2156863, 1,
-0.2859201, -0.1297582, -0.211619, 0, 1, 0.2196078, 1,
-0.2842975, -0.9131415, -2.805669, 0, 1, 0.227451, 1,
-0.2812631, -0.3575496, -3.909259, 0, 1, 0.2313726, 1,
-0.2809999, 1.48254, 0.9304539, 0, 1, 0.2392157, 1,
-0.2773345, -0.6855382, -2.334744, 0, 1, 0.2431373, 1,
-0.2772428, -0.4135835, -2.637683, 0, 1, 0.2509804, 1,
-0.2750727, -0.4788788, -2.351843, 0, 1, 0.254902, 1,
-0.2702338, 0.7139314, 0.321751, 0, 1, 0.2627451, 1,
-0.269722, -1.158154, -1.818465, 0, 1, 0.2666667, 1,
-0.268266, 2.913278, -0.7039081, 0, 1, 0.2745098, 1,
-0.267341, 0.4325379, -0.02230236, 0, 1, 0.2784314, 1,
-0.2672199, 0.3303242, -0.02642079, 0, 1, 0.2862745, 1,
-0.2664082, 0.8443277, 0.1250315, 0, 1, 0.2901961, 1,
-0.2655628, -1.669592, -2.858478, 0, 1, 0.2980392, 1,
-0.2637144, 0.2980933, 0.555539, 0, 1, 0.3058824, 1,
-0.2622813, -0.5811147, -2.348604, 0, 1, 0.3098039, 1,
-0.2618401, 0.6926394, -1.200696, 0, 1, 0.3176471, 1,
-0.2586888, -0.9625819, -2.414081, 0, 1, 0.3215686, 1,
-0.2560309, -1.150301, -1.697168, 0, 1, 0.3294118, 1,
-0.2547387, 0.2120643, 0.3032276, 0, 1, 0.3333333, 1,
-0.2527086, -0.1530592, -3.460512, 0, 1, 0.3411765, 1,
-0.2514486, -0.84341, -3.27488, 0, 1, 0.345098, 1,
-0.2508523, 0.7087999, 0.03782954, 0, 1, 0.3529412, 1,
-0.2488106, 0.5826479, -0.1586144, 0, 1, 0.3568628, 1,
-0.2475694, 1.047382, -1.929522, 0, 1, 0.3647059, 1,
-0.2381135, -1.986776, -2.369677, 0, 1, 0.3686275, 1,
-0.2346812, 0.1333173, -0.3361083, 0, 1, 0.3764706, 1,
-0.2345489, 1.299207, 0.77525, 0, 1, 0.3803922, 1,
-0.2327496, 1.930681, 0.006089477, 0, 1, 0.3882353, 1,
-0.225372, -2.358915, -2.491237, 0, 1, 0.3921569, 1,
-0.2241616, -0.4058123, -4.556171, 0, 1, 0.4, 1,
-0.2218593, 1.207731, -0.8819662, 0, 1, 0.4078431, 1,
-0.2203716, 0.6811826, -0.9819859, 0, 1, 0.4117647, 1,
-0.2197619, 0.8201382, -0.3370044, 0, 1, 0.4196078, 1,
-0.2163228, 1.01926, -1.271291, 0, 1, 0.4235294, 1,
-0.21379, -0.9031235, -2.215621, 0, 1, 0.4313726, 1,
-0.2119019, 0.1847499, -0.3369481, 0, 1, 0.4352941, 1,
-0.2095785, 0.02121157, -0.5389844, 0, 1, 0.4431373, 1,
-0.2071568, 0.3255802, 0.15086, 0, 1, 0.4470588, 1,
-0.2061442, -0.8533319, -1.756951, 0, 1, 0.454902, 1,
-0.1957319, 0.8304797, 0.7069867, 0, 1, 0.4588235, 1,
-0.189823, 0.2631475, -0.0592712, 0, 1, 0.4666667, 1,
-0.1891557, -0.7618371, -3.094841, 0, 1, 0.4705882, 1,
-0.1862543, -0.08663042, -1.453447, 0, 1, 0.4784314, 1,
-0.1758306, 0.7016505, 0.5708395, 0, 1, 0.4823529, 1,
-0.1739521, -0.6385784, -3.222064, 0, 1, 0.4901961, 1,
-0.1736777, -0.3882895, -3.362596, 0, 1, 0.4941176, 1,
-0.1736247, 0.713082, 1.393133, 0, 1, 0.5019608, 1,
-0.1724916, 0.8339932, 0.7687808, 0, 1, 0.509804, 1,
-0.1723217, -0.489447, -3.8088, 0, 1, 0.5137255, 1,
-0.1706914, 1.246571, 0.2990288, 0, 1, 0.5215687, 1,
-0.1673722, -1.090773, -1.379554, 0, 1, 0.5254902, 1,
-0.1623121, 0.7779695, -0.4363435, 0, 1, 0.5333334, 1,
-0.1611885, -1.007329, -2.701836, 0, 1, 0.5372549, 1,
-0.1550736, -0.008334351, -1.70671, 0, 1, 0.5450981, 1,
-0.151314, -0.7599843, -3.961316, 0, 1, 0.5490196, 1,
-0.1486838, 0.3157343, -0.03067718, 0, 1, 0.5568628, 1,
-0.1464269, -0.7821511, -3.007738, 0, 1, 0.5607843, 1,
-0.1456719, 0.7808967, 1.886639, 0, 1, 0.5686275, 1,
-0.144986, -0.1515586, -3.419659, 0, 1, 0.572549, 1,
-0.1428015, 0.4398329, -0.8196792, 0, 1, 0.5803922, 1,
-0.142303, -1.719628, -3.132061, 0, 1, 0.5843138, 1,
-0.1413418, -1.917382, -3.825308, 0, 1, 0.5921569, 1,
-0.1386891, 0.6291858, -2.733936, 0, 1, 0.5960785, 1,
-0.1326944, 2.891093, -2.569571, 0, 1, 0.6039216, 1,
-0.1323643, -0.8251417, -2.441198, 0, 1, 0.6117647, 1,
-0.1299221, 0.8206267, -0.834838, 0, 1, 0.6156863, 1,
-0.1297619, -1.192613, -1.443435, 0, 1, 0.6235294, 1,
-0.1289573, -0.1191402, -2.566768, 0, 1, 0.627451, 1,
-0.1263571, -0.3401987, -2.806263, 0, 1, 0.6352941, 1,
-0.1249249, -1.428545, -1.713782, 0, 1, 0.6392157, 1,
-0.1247579, 0.09957899, -1.400678, 0, 1, 0.6470588, 1,
-0.1240635, -2.788534, -4.500006, 0, 1, 0.6509804, 1,
-0.1215933, -0.5167587, -2.563186, 0, 1, 0.6588235, 1,
-0.1204559, 0.4589517, -0.4274125, 0, 1, 0.6627451, 1,
-0.1200943, -0.005962603, -2.354442, 0, 1, 0.6705883, 1,
-0.1195937, -0.8643501, -0.7782569, 0, 1, 0.6745098, 1,
-0.1168087, -1.184845, -3.293408, 0, 1, 0.682353, 1,
-0.1141604, -2.183481, -3.375483, 0, 1, 0.6862745, 1,
-0.1107712, 1.508805, 1.514429, 0, 1, 0.6941177, 1,
-0.1106629, 0.9938198, 0.6452904, 0, 1, 0.7019608, 1,
-0.1102946, 0.7752721, -0.544057, 0, 1, 0.7058824, 1,
-0.1062881, 0.3118606, 0.4434182, 0, 1, 0.7137255, 1,
-0.1057063, -0.4753593, -4.796836, 0, 1, 0.7176471, 1,
-0.1019544, 0.1651662, -2.468779, 0, 1, 0.7254902, 1,
-0.09243055, 0.3800474, -0.7283294, 0, 1, 0.7294118, 1,
-0.09155889, -2.378736, -2.954527, 0, 1, 0.7372549, 1,
-0.08088099, -0.9470798, -3.402773, 0, 1, 0.7411765, 1,
-0.07778375, 0.2570465, 0.5385636, 0, 1, 0.7490196, 1,
-0.07527004, -0.5070933, -3.145761, 0, 1, 0.7529412, 1,
-0.07448843, 1.895163, -1.260722, 0, 1, 0.7607843, 1,
-0.07177487, -2.01778, -2.441846, 0, 1, 0.7647059, 1,
-0.06545018, -0.1158674, -1.208227, 0, 1, 0.772549, 1,
-0.06405213, 0.8625194, -0.7231816, 0, 1, 0.7764706, 1,
-0.06296138, 0.03127451, -1.396579, 0, 1, 0.7843137, 1,
-0.06079291, -0.3626467, -2.366854, 0, 1, 0.7882353, 1,
-0.05781677, -1.61208, -4.91179, 0, 1, 0.7960784, 1,
-0.05651017, 0.9915433, -0.4769816, 0, 1, 0.8039216, 1,
-0.05646126, 1.376186, 0.1834239, 0, 1, 0.8078431, 1,
-0.0537353, 0.7246234, -0.5414212, 0, 1, 0.8156863, 1,
-0.04509875, 1.513205, 2.060001, 0, 1, 0.8196079, 1,
-0.04347528, -0.8858421, -3.087276, 0, 1, 0.827451, 1,
-0.0384308, -0.4229158, -3.817227, 0, 1, 0.8313726, 1,
-0.03720875, 0.963339, -1.646298, 0, 1, 0.8392157, 1,
-0.03156756, -0.2696345, -3.238341, 0, 1, 0.8431373, 1,
-0.03142938, 0.4679025, 1.06199, 0, 1, 0.8509804, 1,
-0.03112816, 0.1461513, -1.380249, 0, 1, 0.854902, 1,
-0.02877791, 1.234107, 1.669458, 0, 1, 0.8627451, 1,
-0.02676607, -0.2959924, -3.699569, 0, 1, 0.8666667, 1,
-0.01993069, 0.910876, -0.7373558, 0, 1, 0.8745098, 1,
-0.01484585, 1.067655, 0.7241004, 0, 1, 0.8784314, 1,
-0.01434349, 0.2373616, -1.583944, 0, 1, 0.8862745, 1,
-0.01228934, 0.8830003, -0.2554166, 0, 1, 0.8901961, 1,
-0.01176564, 0.4437188, -0.2916409, 0, 1, 0.8980392, 1,
-0.008768301, -1.449117, -2.980692, 0, 1, 0.9058824, 1,
-0.002760931, -0.07928762, -4.212384, 0, 1, 0.9098039, 1,
0.001292423, 0.1437041, -0.9200665, 0, 1, 0.9176471, 1,
0.003884221, -1.681854, 3.146544, 0, 1, 0.9215686, 1,
0.004975278, 0.8859062, 0.4957427, 0, 1, 0.9294118, 1,
0.007625553, 0.2067799, 1.178745, 0, 1, 0.9333333, 1,
0.008904999, -0.05187649, 3.129365, 0, 1, 0.9411765, 1,
0.01122808, -0.6120761, 2.638625, 0, 1, 0.945098, 1,
0.01188934, 0.01148549, 0.580735, 0, 1, 0.9529412, 1,
0.01536671, -0.2358304, 3.02725, 0, 1, 0.9568627, 1,
0.02055288, -0.04265323, 2.650606, 0, 1, 0.9647059, 1,
0.02100434, 0.0192123, 0.7898526, 0, 1, 0.9686275, 1,
0.02479298, 0.2614346, -0.7901281, 0, 1, 0.9764706, 1,
0.02815765, 0.6663718, -0.6295151, 0, 1, 0.9803922, 1,
0.02831751, 0.1431368, 0.4414561, 0, 1, 0.9882353, 1,
0.02837924, 2.281515, 0.6969835, 0, 1, 0.9921569, 1,
0.03006178, 1.49014, 0.6228765, 0, 1, 1, 1,
0.03743999, -1.264284, 0.5899515, 0, 0.9921569, 1, 1,
0.04175625, 0.1563232, -0.003545255, 0, 0.9882353, 1, 1,
0.04585786, 1.14308, 0.6783499, 0, 0.9803922, 1, 1,
0.04751363, -0.1853788, 1.134701, 0, 0.9764706, 1, 1,
0.04914744, 0.4768173, -1.008926, 0, 0.9686275, 1, 1,
0.05230312, -1.702609, 2.718351, 0, 0.9647059, 1, 1,
0.05324798, 0.4350908, 0.2072748, 0, 0.9568627, 1, 1,
0.05614523, -0.1889921, 3.173506, 0, 0.9529412, 1, 1,
0.05731769, -0.2795402, 1.892483, 0, 0.945098, 1, 1,
0.06042199, -0.1284087, 2.75411, 0, 0.9411765, 1, 1,
0.06535346, -0.1272715, 3.861707, 0, 0.9333333, 1, 1,
0.06627904, 0.2586861, -0.1446141, 0, 0.9294118, 1, 1,
0.06768409, 1.409568, 0.5103625, 0, 0.9215686, 1, 1,
0.0697199, -1.367412, 3.46906, 0, 0.9176471, 1, 1,
0.07157841, -0.8839285, 2.873239, 0, 0.9098039, 1, 1,
0.07800285, -0.2427885, 2.069536, 0, 0.9058824, 1, 1,
0.07921505, -1.227311, 4.841918, 0, 0.8980392, 1, 1,
0.0804749, 1.259041, 1.045613, 0, 0.8901961, 1, 1,
0.0812144, -0.6399246, 4.178512, 0, 0.8862745, 1, 1,
0.08161465, -0.6246747, 1.77343, 0, 0.8784314, 1, 1,
0.0816954, -1.148211, 3.397981, 0, 0.8745098, 1, 1,
0.08212052, 2.682958, -0.173539, 0, 0.8666667, 1, 1,
0.08705266, 1.2245, 0.5683712, 0, 0.8627451, 1, 1,
0.0922799, -1.736611, 4.364119, 0, 0.854902, 1, 1,
0.09283864, -0.7391675, 3.170006, 0, 0.8509804, 1, 1,
0.09291908, 1.139704, 1.684344, 0, 0.8431373, 1, 1,
0.09362434, -1.265419, 4.653299, 0, 0.8392157, 1, 1,
0.09371267, -0.2408389, 3.84171, 0, 0.8313726, 1, 1,
0.09964733, 0.4534171, -0.5681633, 0, 0.827451, 1, 1,
0.1012846, -0.2359108, 3.227394, 0, 0.8196079, 1, 1,
0.1018218, -0.6340441, 2.375412, 0, 0.8156863, 1, 1,
0.1032755, 0.3603398, 1.986424, 0, 0.8078431, 1, 1,
0.1045539, 0.9076451, -0.2772108, 0, 0.8039216, 1, 1,
0.1097462, -0.842476, 1.930865, 0, 0.7960784, 1, 1,
0.1145785, -2.321007, 3.327733, 0, 0.7882353, 1, 1,
0.1164146, -0.038035, 3.447865, 0, 0.7843137, 1, 1,
0.1169191, -0.3047261, 2.744447, 0, 0.7764706, 1, 1,
0.1190762, 0.6791101, -1.903165, 0, 0.772549, 1, 1,
0.1207897, -1.666835, 3.769112, 0, 0.7647059, 1, 1,
0.1212603, 1.218595, 0.176823, 0, 0.7607843, 1, 1,
0.1235625, 1.413492, 0.4999579, 0, 0.7529412, 1, 1,
0.1267744, -1.916781, 1.938153, 0, 0.7490196, 1, 1,
0.1280625, 1.622998, 0.3125799, 0, 0.7411765, 1, 1,
0.1293069, 0.1779294, 0.4298607, 0, 0.7372549, 1, 1,
0.129934, 0.8151761, 1.010487, 0, 0.7294118, 1, 1,
0.1300199, 0.409844, 0.4314528, 0, 0.7254902, 1, 1,
0.1303189, -0.07964661, 1.854886, 0, 0.7176471, 1, 1,
0.1326106, 0.7828854, 1.754714, 0, 0.7137255, 1, 1,
0.1344512, 0.7249059, 0.9814168, 0, 0.7058824, 1, 1,
0.1392955, -1.149621, 3.404755, 0, 0.6980392, 1, 1,
0.1401513, -0.1356505, 2.605922, 0, 0.6941177, 1, 1,
0.1415267, 0.02146417, 1.945143, 0, 0.6862745, 1, 1,
0.1433357, 1.056813, 0.8397609, 0, 0.682353, 1, 1,
0.1434292, 0.9066279, 0.6612997, 0, 0.6745098, 1, 1,
0.149765, 1.742189, -0.9274657, 0, 0.6705883, 1, 1,
0.1501117, 1.986294, 1.331413, 0, 0.6627451, 1, 1,
0.151988, 1.196814, -0.3712187, 0, 0.6588235, 1, 1,
0.1534748, 0.6131982, -0.6201255, 0, 0.6509804, 1, 1,
0.1535118, -1.532164, 4.03835, 0, 0.6470588, 1, 1,
0.1586971, -2.096062, 2.97386, 0, 0.6392157, 1, 1,
0.1589356, -0.248768, 3.115917, 0, 0.6352941, 1, 1,
0.1608393, -0.3009252, 2.858516, 0, 0.627451, 1, 1,
0.1617541, -0.8424544, 4.096346, 0, 0.6235294, 1, 1,
0.165989, -1.311032, 2.938758, 0, 0.6156863, 1, 1,
0.1661545, 0.321949, 2.219201, 0, 0.6117647, 1, 1,
0.1697483, -1.718116, 2.204223, 0, 0.6039216, 1, 1,
0.1742258, 0.8682135, -0.3223872, 0, 0.5960785, 1, 1,
0.1807708, -1.541885, 2.211131, 0, 0.5921569, 1, 1,
0.185496, 0.4743006, 1.014567, 0, 0.5843138, 1, 1,
0.1859037, 0.6201588, -1.976988, 0, 0.5803922, 1, 1,
0.1872447, -1.030835, 2.967559, 0, 0.572549, 1, 1,
0.1892534, 1.465035, 1.529795, 0, 0.5686275, 1, 1,
0.191645, 2.032894, 2.626759, 0, 0.5607843, 1, 1,
0.1985539, 0.6135443, -0.02041452, 0, 0.5568628, 1, 1,
0.2033539, 1.117733, -0.5164115, 0, 0.5490196, 1, 1,
0.2063035, -1.077416, 3.1029, 0, 0.5450981, 1, 1,
0.2115386, -0.239785, 1.989464, 0, 0.5372549, 1, 1,
0.2127234, 0.9665709, 0.715362, 0, 0.5333334, 1, 1,
0.2142659, 1.013804, -0.6068792, 0, 0.5254902, 1, 1,
0.2228646, 0.8908544, 0.002329753, 0, 0.5215687, 1, 1,
0.2239607, 0.711784, 0.02589661, 0, 0.5137255, 1, 1,
0.2267097, 0.7599862, 2.088264, 0, 0.509804, 1, 1,
0.2277384, 0.6941461, 0.9851761, 0, 0.5019608, 1, 1,
0.2279334, 1.241367, -0.1792069, 0, 0.4941176, 1, 1,
0.2392669, 0.9636707, 0.02377876, 0, 0.4901961, 1, 1,
0.240115, -0.3809772, 2.185122, 0, 0.4823529, 1, 1,
0.2410975, 2.068825, 0.6770429, 0, 0.4784314, 1, 1,
0.2422229, 1.552217, -0.317744, 0, 0.4705882, 1, 1,
0.2450028, 1.803533, 0.6155787, 0, 0.4666667, 1, 1,
0.2456212, -1.163487, 4.033578, 0, 0.4588235, 1, 1,
0.2458732, 0.7263141, -0.9296131, 0, 0.454902, 1, 1,
0.247837, -0.2545316, 1.723416, 0, 0.4470588, 1, 1,
0.2503453, -0.2918664, 2.387127, 0, 0.4431373, 1, 1,
0.250537, -0.4604432, 3.276462, 0, 0.4352941, 1, 1,
0.2519822, -0.7400436, 3.357925, 0, 0.4313726, 1, 1,
0.2548846, -0.380373, 3.13364, 0, 0.4235294, 1, 1,
0.2561434, 0.8260475, -0.9903075, 0, 0.4196078, 1, 1,
0.2570758, 0.1306856, -0.4089982, 0, 0.4117647, 1, 1,
0.2591571, 0.3036367, 0.3930114, 0, 0.4078431, 1, 1,
0.2638993, -1.227872, 3.663654, 0, 0.4, 1, 1,
0.2738419, 0.3751567, 0.9760553, 0, 0.3921569, 1, 1,
0.2788026, 0.1345687, 2.137375, 0, 0.3882353, 1, 1,
0.2874209, 0.3255579, 2.55313, 0, 0.3803922, 1, 1,
0.2952955, 0.03968914, 2.231291, 0, 0.3764706, 1, 1,
0.2954856, 1.134091, 2.048148, 0, 0.3686275, 1, 1,
0.297265, 0.04095618, 1.843897, 0, 0.3647059, 1, 1,
0.2973168, -2.032282, 3.981843, 0, 0.3568628, 1, 1,
0.297715, -1.240357, 5.162777, 0, 0.3529412, 1, 1,
0.2994902, 1.050286, 1.298025, 0, 0.345098, 1, 1,
0.3003849, 0.7042715, -0.4076459, 0, 0.3411765, 1, 1,
0.3066172, 0.8328011, -0.02460665, 0, 0.3333333, 1, 1,
0.3128322, -0.8780538, 2.651247, 0, 0.3294118, 1, 1,
0.3210478, 0.8308177, 0.9569381, 0, 0.3215686, 1, 1,
0.3217482, -0.6826693, 1.006371, 0, 0.3176471, 1, 1,
0.3248142, -0.6593761, 1.828889, 0, 0.3098039, 1, 1,
0.3264198, -0.1654081, 2.158578, 0, 0.3058824, 1, 1,
0.3264768, -0.3226269, 2.905839, 0, 0.2980392, 1, 1,
0.3273369, -0.4402068, 3.097335, 0, 0.2901961, 1, 1,
0.3273655, -0.2800198, 2.742316, 0, 0.2862745, 1, 1,
0.3370149, 0.4101516, 0.7957809, 0, 0.2784314, 1, 1,
0.3431381, 1.81147, 1.62841, 0, 0.2745098, 1, 1,
0.348408, 0.3659341, 1.102616, 0, 0.2666667, 1, 1,
0.3501287, -0.5204518, 3.468429, 0, 0.2627451, 1, 1,
0.35648, 0.2391703, -0.4981462, 0, 0.254902, 1, 1,
0.357037, -0.6345125, 2.383721, 0, 0.2509804, 1, 1,
0.3573581, -0.9148257, 4.23456, 0, 0.2431373, 1, 1,
0.3573713, 0.05391315, 0.7638892, 0, 0.2392157, 1, 1,
0.3574193, -1.424777, 0.6627476, 0, 0.2313726, 1, 1,
0.3612913, -1.225888, 3.317799, 0, 0.227451, 1, 1,
0.3624271, -0.3314444, 3.725472, 0, 0.2196078, 1, 1,
0.3624721, 0.3583658, 0.4491348, 0, 0.2156863, 1, 1,
0.3662691, 0.7143068, -0.5782893, 0, 0.2078431, 1, 1,
0.3697739, -1.370362, 2.882789, 0, 0.2039216, 1, 1,
0.3702088, -0.4808976, 2.465346, 0, 0.1960784, 1, 1,
0.3707508, -0.6471072, 3.745085, 0, 0.1882353, 1, 1,
0.3760828, 0.08643217, 1.430459, 0, 0.1843137, 1, 1,
0.379378, 0.09677097, 0.8739524, 0, 0.1764706, 1, 1,
0.3796481, 0.2934573, 0.7841629, 0, 0.172549, 1, 1,
0.380932, 0.3825819, 0.9146928, 0, 0.1647059, 1, 1,
0.3857938, -1.293358, 2.449994, 0, 0.1607843, 1, 1,
0.3860287, 0.9190567, 2.646823, 0, 0.1529412, 1, 1,
0.3873726, -0.7091212, 0.8776809, 0, 0.1490196, 1, 1,
0.3875255, -0.6874758, 1.212484, 0, 0.1411765, 1, 1,
0.3888558, 0.05643825, 2.897291, 0, 0.1372549, 1, 1,
0.3913923, 0.3983984, 1.494308, 0, 0.1294118, 1, 1,
0.3974104, 1.45898, 0.5501117, 0, 0.1254902, 1, 1,
0.4003199, -0.1164369, -0.1324601, 0, 0.1176471, 1, 1,
0.4013581, 0.2992116, 0.8943035, 0, 0.1137255, 1, 1,
0.403771, -0.1386309, 3.529707, 0, 0.1058824, 1, 1,
0.4066018, -1.437418, 2.73443, 0, 0.09803922, 1, 1,
0.4090992, -0.6268989, 3.200491, 0, 0.09411765, 1, 1,
0.4105859, 0.4541976, -0.2099408, 0, 0.08627451, 1, 1,
0.4198376, 1.02997, 2.21169, 0, 0.08235294, 1, 1,
0.4211709, 0.808943, -0.9041565, 0, 0.07450981, 1, 1,
0.4248815, 0.2855448, -0.1041751, 0, 0.07058824, 1, 1,
0.4248833, 0.3731781, 0.009543657, 0, 0.0627451, 1, 1,
0.4252429, -0.7591503, 3.359028, 0, 0.05882353, 1, 1,
0.4258463, -0.8818605, 3.360848, 0, 0.05098039, 1, 1,
0.4331635, -0.8088928, 0.8741786, 0, 0.04705882, 1, 1,
0.4358873, -0.4658029, 2.526629, 0, 0.03921569, 1, 1,
0.4400654, -1.263279, 1.897142, 0, 0.03529412, 1, 1,
0.4405312, 0.5131561, 2.22879, 0, 0.02745098, 1, 1,
0.4406098, -2.319811, 2.654404, 0, 0.02352941, 1, 1,
0.4455517, 1.477266, 0.5746305, 0, 0.01568628, 1, 1,
0.4480914, 0.9436435, 0.3559347, 0, 0.01176471, 1, 1,
0.4487562, 0.3207799, 0.9402739, 0, 0.003921569, 1, 1,
0.4493847, 0.4598038, 1.81323, 0.003921569, 0, 1, 1,
0.4502459, -1.490429, 2.118968, 0.007843138, 0, 1, 1,
0.4528036, -0.2476789, 2.411912, 0.01568628, 0, 1, 1,
0.4570889, 2.335448, -0.6963176, 0.01960784, 0, 1, 1,
0.458744, -0.3035023, 3.461692, 0.02745098, 0, 1, 1,
0.4589383, -0.7680311, 3.01485, 0.03137255, 0, 1, 1,
0.4625733, -1.832388, 3.28011, 0.03921569, 0, 1, 1,
0.4642622, 1.12625, 1.419655, 0.04313726, 0, 1, 1,
0.4643711, 0.8661439, 2.136909, 0.05098039, 0, 1, 1,
0.468751, -0.3388916, 2.728181, 0.05490196, 0, 1, 1,
0.4706691, -0.5346717, 1.548941, 0.0627451, 0, 1, 1,
0.4759779, -1.037116, 3.446142, 0.06666667, 0, 1, 1,
0.4763926, 0.8836127, 1.925497, 0.07450981, 0, 1, 1,
0.4791185, -0.6340856, 4.67796, 0.07843138, 0, 1, 1,
0.4885081, -1.295301, 0.5002922, 0.08627451, 0, 1, 1,
0.4891199, 0.6023022, 0.6229256, 0.09019608, 0, 1, 1,
0.4934938, 1.181347, -0.5910581, 0.09803922, 0, 1, 1,
0.495438, -0.3288022, 3.477633, 0.1058824, 0, 1, 1,
0.495809, 0.1009119, 2.761632, 0.1098039, 0, 1, 1,
0.4973801, -0.005294445, 1.125496, 0.1176471, 0, 1, 1,
0.4978423, -1.240993, 3.54102, 0.1215686, 0, 1, 1,
0.49792, -0.3414502, 2.226148, 0.1294118, 0, 1, 1,
0.5011665, -1.008685, 2.198147, 0.1333333, 0, 1, 1,
0.5020674, 0.6439398, -1.108768, 0.1411765, 0, 1, 1,
0.5030335, 0.7202805, -1.600685, 0.145098, 0, 1, 1,
0.5065136, -0.1799025, 4.982779, 0.1529412, 0, 1, 1,
0.5088513, 0.2903505, 2.129628, 0.1568628, 0, 1, 1,
0.509953, 1.108698, 0.1535788, 0.1647059, 0, 1, 1,
0.5117919, 0.3555172, 0.1358558, 0.1686275, 0, 1, 1,
0.5126184, -0.7003162, 1.244717, 0.1764706, 0, 1, 1,
0.5136379, -0.6483296, 1.521769, 0.1803922, 0, 1, 1,
0.5185043, 0.6575926, 0.0278521, 0.1882353, 0, 1, 1,
0.5219308, -0.123318, 4.004855, 0.1921569, 0, 1, 1,
0.5225425, 0.412687, 1.223768, 0.2, 0, 1, 1,
0.5267324, 1.51793, -0.4602252, 0.2078431, 0, 1, 1,
0.5294856, 0.5588036, 0.391892, 0.2117647, 0, 1, 1,
0.5355427, 1.891962, 0.127474, 0.2196078, 0, 1, 1,
0.5379897, 1.007429, 1.573217, 0.2235294, 0, 1, 1,
0.5432877, 1.899113, -1.060842, 0.2313726, 0, 1, 1,
0.5521612, 1.796997, -0.3998872, 0.2352941, 0, 1, 1,
0.5527039, 0.8760905, 0.4391761, 0.2431373, 0, 1, 1,
0.5534842, -1.929508, 1.596693, 0.2470588, 0, 1, 1,
0.5616169, 2.012544, -0.2370948, 0.254902, 0, 1, 1,
0.5623212, 0.8011128, 0.1625002, 0.2588235, 0, 1, 1,
0.5633873, 1.004807, -0.3733585, 0.2666667, 0, 1, 1,
0.5639486, 0.6247228, 0.9525519, 0.2705882, 0, 1, 1,
0.5648505, 0.1481277, 1.314347, 0.2784314, 0, 1, 1,
0.5677775, -0.8032845, 2.59584, 0.282353, 0, 1, 1,
0.5763735, -1.742563, 3.017778, 0.2901961, 0, 1, 1,
0.5803578, -0.5838993, 3.436948, 0.2941177, 0, 1, 1,
0.5888406, 0.6694013, 0.9444608, 0.3019608, 0, 1, 1,
0.5930701, -1.345345, 4.551649, 0.3098039, 0, 1, 1,
0.5969723, -0.1575095, 0.6265534, 0.3137255, 0, 1, 1,
0.5976711, 0.6140585, 0.8463718, 0.3215686, 0, 1, 1,
0.5984151, -0.4367729, 1.596746, 0.3254902, 0, 1, 1,
0.6002689, 0.8352524, 0.8589108, 0.3333333, 0, 1, 1,
0.6016645, 1.080991, 0.8659532, 0.3372549, 0, 1, 1,
0.6019139, 0.08719007, 2.339025, 0.345098, 0, 1, 1,
0.608479, 1.271975, -0.8280011, 0.3490196, 0, 1, 1,
0.6094359, 1.045842, -0.3860422, 0.3568628, 0, 1, 1,
0.6103139, 0.03606983, 2.574818, 0.3607843, 0, 1, 1,
0.6196674, 0.6294924, 0.3761588, 0.3686275, 0, 1, 1,
0.6270175, 0.9405702, 2.175072, 0.372549, 0, 1, 1,
0.6274119, -0.2447033, 2.810777, 0.3803922, 0, 1, 1,
0.6276619, 0.3831012, 1.442037, 0.3843137, 0, 1, 1,
0.6289679, -0.4723004, 2.987983, 0.3921569, 0, 1, 1,
0.6290314, 0.6276065, -0.424015, 0.3960784, 0, 1, 1,
0.6353288, 1.297606, -0.2933915, 0.4039216, 0, 1, 1,
0.6413629, -2.41157, 3.071712, 0.4117647, 0, 1, 1,
0.6431584, 1.334773, 0.7568899, 0.4156863, 0, 1, 1,
0.6445186, 2.110204, -0.3337114, 0.4235294, 0, 1, 1,
0.6490417, 0.2635671, 1.830742, 0.427451, 0, 1, 1,
0.6552768, 0.5818795, 1.479439, 0.4352941, 0, 1, 1,
0.6604849, -0.02453898, 2.811882, 0.4392157, 0, 1, 1,
0.6680077, -0.4646932, 3.116739, 0.4470588, 0, 1, 1,
0.6732671, 0.7842278, 1.480366, 0.4509804, 0, 1, 1,
0.6767518, -2.219313, 4.121747, 0.4588235, 0, 1, 1,
0.6775458, 3.901141, -1.388696, 0.4627451, 0, 1, 1,
0.680675, -0.3951044, -0.7438189, 0.4705882, 0, 1, 1,
0.6812484, 0.805976, -0.1441623, 0.4745098, 0, 1, 1,
0.682557, 1.472012, -0.6605335, 0.4823529, 0, 1, 1,
0.6952465, 1.116372, 2.129457, 0.4862745, 0, 1, 1,
0.6968889, -0.3788897, 2.562737, 0.4941176, 0, 1, 1,
0.6971422, 1.628087, -1.646003, 0.5019608, 0, 1, 1,
0.6975734, -0.5266398, 0.1230435, 0.5058824, 0, 1, 1,
0.6989626, 0.2294816, 1.83718, 0.5137255, 0, 1, 1,
0.7001699, 1.57757, 1.754383, 0.5176471, 0, 1, 1,
0.7057763, 0.2318038, 0.4684658, 0.5254902, 0, 1, 1,
0.707133, 0.7921166, -0.2948078, 0.5294118, 0, 1, 1,
0.7110787, -1.13617, 1.95681, 0.5372549, 0, 1, 1,
0.7155362, 0.09587441, 1.416447, 0.5411765, 0, 1, 1,
0.7198477, 1.558579, -0.08167579, 0.5490196, 0, 1, 1,
0.733452, 0.4278073, 0.4674394, 0.5529412, 0, 1, 1,
0.7348911, -0.1577094, 0.7294615, 0.5607843, 0, 1, 1,
0.7414696, -1.324217, 2.781424, 0.5647059, 0, 1, 1,
0.7464873, 0.09930705, 0.2701361, 0.572549, 0, 1, 1,
0.7484086, 0.5044879, 0.5119726, 0.5764706, 0, 1, 1,
0.7495269, -1.186479, 2.182312, 0.5843138, 0, 1, 1,
0.750939, 1.186366, 1.201061, 0.5882353, 0, 1, 1,
0.7623361, 0.1194894, 1.736206, 0.5960785, 0, 1, 1,
0.7623469, -0.5701935, 2.298741, 0.6039216, 0, 1, 1,
0.7658453, 0.7004198, 0.5863755, 0.6078432, 0, 1, 1,
0.7665755, -0.598004, 3.008915, 0.6156863, 0, 1, 1,
0.7671496, -0.6342196, 3.349653, 0.6196079, 0, 1, 1,
0.7691445, 0.3551582, 1.665308, 0.627451, 0, 1, 1,
0.7700744, 0.3246731, 1.012973, 0.6313726, 0, 1, 1,
0.7703384, 0.6219465, 1.734307, 0.6392157, 0, 1, 1,
0.7729115, 0.1190987, 0.7546831, 0.6431373, 0, 1, 1,
0.7729246, -0.7952634, 1.452068, 0.6509804, 0, 1, 1,
0.7739686, -0.1953606, -0.340699, 0.654902, 0, 1, 1,
0.7761493, -0.2370212, 0.7641826, 0.6627451, 0, 1, 1,
0.7785667, 0.9257476, -0.4723704, 0.6666667, 0, 1, 1,
0.7788529, -0.6153535, 1.552914, 0.6745098, 0, 1, 1,
0.7799386, -0.1632837, 1.257474, 0.6784314, 0, 1, 1,
0.7879897, -0.2032884, 2.269319, 0.6862745, 0, 1, 1,
0.791025, 0.7065493, 0.1147096, 0.6901961, 0, 1, 1,
0.8028888, -0.4240575, 2.429951, 0.6980392, 0, 1, 1,
0.8095083, -0.4454328, 2.731618, 0.7058824, 0, 1, 1,
0.8128416, 0.1891099, 0.5074027, 0.7098039, 0, 1, 1,
0.8156113, -0.6730763, 2.596151, 0.7176471, 0, 1, 1,
0.815948, -0.8565862, 3.506657, 0.7215686, 0, 1, 1,
0.8208219, -0.3692847, 3.506785, 0.7294118, 0, 1, 1,
0.8219686, -0.1633415, 0.9401206, 0.7333333, 0, 1, 1,
0.8227289, 0.1440131, 0.1286628, 0.7411765, 0, 1, 1,
0.8265601, -2.141283, 2.538068, 0.7450981, 0, 1, 1,
0.8316465, 0.209502, 2.937287, 0.7529412, 0, 1, 1,
0.831929, -1.647977, 1.829621, 0.7568628, 0, 1, 1,
0.8361902, 0.1146075, 3.17371, 0.7647059, 0, 1, 1,
0.8368499, 0.1232239, 1.162915, 0.7686275, 0, 1, 1,
0.8394353, 2.606825, -0.8437388, 0.7764706, 0, 1, 1,
0.8403577, 0.1838415, 1.992123, 0.7803922, 0, 1, 1,
0.8409119, -0.2706191, 2.358231, 0.7882353, 0, 1, 1,
0.8438249, 1.024721, 1.400429, 0.7921569, 0, 1, 1,
0.8443242, 0.3017426, 1.314815, 0.8, 0, 1, 1,
0.8554344, 0.07314266, 1.331574, 0.8078431, 0, 1, 1,
0.8564255, -1.008021, 2.129468, 0.8117647, 0, 1, 1,
0.8636, -3.061904, 3.498026, 0.8196079, 0, 1, 1,
0.8667102, 1.495876, 2.362219, 0.8235294, 0, 1, 1,
0.8726481, -0.4632366, 3.42812, 0.8313726, 0, 1, 1,
0.8743879, 0.06055949, 0.6948917, 0.8352941, 0, 1, 1,
0.8767639, 0.2963241, 2.899423, 0.8431373, 0, 1, 1,
0.876774, -0.826461, 3.057872, 0.8470588, 0, 1, 1,
0.8793859, -1.221599, 3.02611, 0.854902, 0, 1, 1,
0.8795226, 0.7537025, 0.3685593, 0.8588235, 0, 1, 1,
0.8848081, 0.3907246, 1.040071, 0.8666667, 0, 1, 1,
0.8908116, -0.084048, 0.9575163, 0.8705882, 0, 1, 1,
0.8913335, -0.04325537, -0.05617617, 0.8784314, 0, 1, 1,
0.8914671, -0.9587309, 3.652217, 0.8823529, 0, 1, 1,
0.8959839, 0.1271512, 1.850231, 0.8901961, 0, 1, 1,
0.8964105, 1.299264, -0.1356295, 0.8941177, 0, 1, 1,
0.8980205, -0.6202198, 3.233064, 0.9019608, 0, 1, 1,
0.9014687, -1.416336, 3.68739, 0.9098039, 0, 1, 1,
0.9079118, -0.5735304, 1.533874, 0.9137255, 0, 1, 1,
0.9101136, -0.6742, 0.5618201, 0.9215686, 0, 1, 1,
0.9141654, 0.09170763, 1.977442, 0.9254902, 0, 1, 1,
0.9164026, 3.176422, -0.6541529, 0.9333333, 0, 1, 1,
0.9214141, 2.000927, 1.65465, 0.9372549, 0, 1, 1,
0.9230383, -0.2027574, 2.497043, 0.945098, 0, 1, 1,
0.9242761, -1.294302, 2.267425, 0.9490196, 0, 1, 1,
0.9266443, 0.1730365, 3.126426, 0.9568627, 0, 1, 1,
0.9277459, -1.196293, 2.961439, 0.9607843, 0, 1, 1,
0.9347107, 0.3094349, -0.05290711, 0.9686275, 0, 1, 1,
0.9363104, 0.01029001, 0.5566517, 0.972549, 0, 1, 1,
0.9374552, -0.4746756, 1.49264, 0.9803922, 0, 1, 1,
0.9398029, 0.03257019, 0.6829346, 0.9843137, 0, 1, 1,
0.9407251, -1.730947, 3.091485, 0.9921569, 0, 1, 1,
0.9466404, 0.8325493, -1.478054, 0.9960784, 0, 1, 1,
0.9484564, -1.472973, 1.215016, 1, 0, 0.9960784, 1,
0.9510866, 1.472909, 3.177568, 1, 0, 0.9882353, 1,
0.9513232, 1.102533, 0.7189542, 1, 0, 0.9843137, 1,
0.9554965, -0.6779986, 4.217193, 1, 0, 0.9764706, 1,
0.9610981, 0.12055, 0.6546771, 1, 0, 0.972549, 1,
0.9639649, 0.3398735, 0.3866671, 1, 0, 0.9647059, 1,
0.9691899, -0.5651276, 1.095805, 1, 0, 0.9607843, 1,
0.9695217, 0.8569573, 1.155436, 1, 0, 0.9529412, 1,
0.981409, -0.07976235, 1.029466, 1, 0, 0.9490196, 1,
0.9903544, -1.463008, 2.558414, 1, 0, 0.9411765, 1,
1.005077, -0.11451, 0.483213, 1, 0, 0.9372549, 1,
1.005369, 0.2489173, 0.8911039, 1, 0, 0.9294118, 1,
1.015058, -0.9023617, 1.402048, 1, 0, 0.9254902, 1,
1.018113, -1.280966, 2.242469, 1, 0, 0.9176471, 1,
1.021788, -1.777491, 1.367078, 1, 0, 0.9137255, 1,
1.03197, -0.4840578, 2.760541, 1, 0, 0.9058824, 1,
1.036015, -0.5253526, 1.813911, 1, 0, 0.9019608, 1,
1.042473, -1.485108, 3.595534, 1, 0, 0.8941177, 1,
1.045743, -1.76406, 3.216052, 1, 0, 0.8862745, 1,
1.061033, 1.012887, 1.321667, 1, 0, 0.8823529, 1,
1.062811, 0.06467307, 1.288804, 1, 0, 0.8745098, 1,
1.065304, 2.419088, -0.7298304, 1, 0, 0.8705882, 1,
1.070607, -1.03858, 3.517613, 1, 0, 0.8627451, 1,
1.072433, -0.8255195, 2.575195, 1, 0, 0.8588235, 1,
1.085229, -0.4861892, 1.301873, 1, 0, 0.8509804, 1,
1.086146, -1.123023, 2.954861, 1, 0, 0.8470588, 1,
1.098808, -0.1276067, 1.072408, 1, 0, 0.8392157, 1,
1.099146, -0.003485704, 0.9129139, 1, 0, 0.8352941, 1,
1.10241, 0.1589964, 0.5659755, 1, 0, 0.827451, 1,
1.105283, 0.5707657, 0.4399669, 1, 0, 0.8235294, 1,
1.105471, 2.607916, -0.2582592, 1, 0, 0.8156863, 1,
1.107955, -1.016915, 2.549258, 1, 0, 0.8117647, 1,
1.108303, -0.2166796, 1.089715, 1, 0, 0.8039216, 1,
1.114325, 0.2967815, 1.693974, 1, 0, 0.7960784, 1,
1.116357, 0.06359131, 0.1964375, 1, 0, 0.7921569, 1,
1.11998, 0.2271118, 1.514594, 1, 0, 0.7843137, 1,
1.124726, -0.1351198, 1.578065, 1, 0, 0.7803922, 1,
1.125573, -0.4716727, 0.8368062, 1, 0, 0.772549, 1,
1.127904, 0.122697, 2.197675, 1, 0, 0.7686275, 1,
1.129732, 0.5066489, 0.3531291, 1, 0, 0.7607843, 1,
1.1299, -1.136064, 3.094517, 1, 0, 0.7568628, 1,
1.133242, 0.600301, -0.3613711, 1, 0, 0.7490196, 1,
1.149808, 0.7208007, 1.124402, 1, 0, 0.7450981, 1,
1.157583, 0.6906546, 0.3780943, 1, 0, 0.7372549, 1,
1.165411, 1.024036, 1.04404, 1, 0, 0.7333333, 1,
1.17286, 0.1985056, 1.119851, 1, 0, 0.7254902, 1,
1.174852, -1.31046, 3.088589, 1, 0, 0.7215686, 1,
1.181151, -0.1962258, -0.1991535, 1, 0, 0.7137255, 1,
1.186831, 0.9903932, 1.933275, 1, 0, 0.7098039, 1,
1.196147, -1.602434, 1.494397, 1, 0, 0.7019608, 1,
1.204133, -0.9858658, 4.068359, 1, 0, 0.6941177, 1,
1.207349, 1.210917, 1.055681, 1, 0, 0.6901961, 1,
1.213004, -0.311823, 3.064368, 1, 0, 0.682353, 1,
1.216672, 1.029953, 1.090818, 1, 0, 0.6784314, 1,
1.231674, -0.09370185, 1.696906, 1, 0, 0.6705883, 1,
1.235034, 0.7387052, 2.266556, 1, 0, 0.6666667, 1,
1.235987, -0.9256921, 2.748291, 1, 0, 0.6588235, 1,
1.237494, 0.5660584, 1.630912, 1, 0, 0.654902, 1,
1.240921, 1.684677, 0.4335488, 1, 0, 0.6470588, 1,
1.24184, -0.3400514, -0.0532467, 1, 0, 0.6431373, 1,
1.245147, -0.2635961, 1.762368, 1, 0, 0.6352941, 1,
1.248314, -0.9405286, 3.784945, 1, 0, 0.6313726, 1,
1.248712, -0.5406113, 3.318844, 1, 0, 0.6235294, 1,
1.250925, 1.526198, 1.325879, 1, 0, 0.6196079, 1,
1.253532, 1.282932, 1.27279, 1, 0, 0.6117647, 1,
1.254283, 0.7443296, 0.96775, 1, 0, 0.6078432, 1,
1.259846, -0.6463757, 2.597095, 1, 0, 0.6, 1,
1.265622, -0.2941423, 0.9812943, 1, 0, 0.5921569, 1,
1.265854, -0.8479728, 1.912222, 1, 0, 0.5882353, 1,
1.269921, -1.616975, 1.812739, 1, 0, 0.5803922, 1,
1.273496, 0.7819469, -0.242304, 1, 0, 0.5764706, 1,
1.275399, -1.037209, 3.242978, 1, 0, 0.5686275, 1,
1.280058, 1.698149, 1.092273, 1, 0, 0.5647059, 1,
1.280846, 0.5609872, -0.006051852, 1, 0, 0.5568628, 1,
1.284512, -0.08440427, 0.8911392, 1, 0, 0.5529412, 1,
1.285551, 0.4105664, 1.003938, 1, 0, 0.5450981, 1,
1.286002, 0.3353987, 1.875428, 1, 0, 0.5411765, 1,
1.294883, 1.110411, -0.4295962, 1, 0, 0.5333334, 1,
1.295001, 0.9877077, 0.5295961, 1, 0, 0.5294118, 1,
1.295453, 0.3510635, -0.5257172, 1, 0, 0.5215687, 1,
1.298672, 0.5176696, 0.3663604, 1, 0, 0.5176471, 1,
1.299794, 1.014165, 1.28956, 1, 0, 0.509804, 1,
1.304983, -1.055603, 2.004956, 1, 0, 0.5058824, 1,
1.306984, 0.7622461, 1.17732, 1, 0, 0.4980392, 1,
1.311473, 0.2183082, 0.4554703, 1, 0, 0.4901961, 1,
1.312145, 1.442241, -0.9220739, 1, 0, 0.4862745, 1,
1.318719, -0.6506649, 2.623414, 1, 0, 0.4784314, 1,
1.323001, 0.234673, 1.770724, 1, 0, 0.4745098, 1,
1.328121, 0.03651598, 2.232733, 1, 0, 0.4666667, 1,
1.349761, 1.188682, -1.041661, 1, 0, 0.4627451, 1,
1.352555, -1.493323, 2.796327, 1, 0, 0.454902, 1,
1.362743, 1.494952, 1.494029, 1, 0, 0.4509804, 1,
1.367428, -0.5814011, 2.641351, 1, 0, 0.4431373, 1,
1.389775, -1.187803, 2.988157, 1, 0, 0.4392157, 1,
1.390164, 1.382506, -0.574623, 1, 0, 0.4313726, 1,
1.403088, 1.736124, -0.006702635, 1, 0, 0.427451, 1,
1.404517, 1.015118, 0.8480328, 1, 0, 0.4196078, 1,
1.408334, -1.266195, 2.775431, 1, 0, 0.4156863, 1,
1.416751, -0.554028, 2.564016, 1, 0, 0.4078431, 1,
1.41702, 1.028522, 0.8732039, 1, 0, 0.4039216, 1,
1.417244, 1.552648, 1.012857, 1, 0, 0.3960784, 1,
1.438813, -0.3881029, 3.123431, 1, 0, 0.3882353, 1,
1.453124, -0.157845, 0.5805424, 1, 0, 0.3843137, 1,
1.458161, -1.605379, 1.527226, 1, 0, 0.3764706, 1,
1.472098, 0.6503854, 2.588413, 1, 0, 0.372549, 1,
1.47315, -0.7806883, 1.874536, 1, 0, 0.3647059, 1,
1.479676, 1.010496, 0.704293, 1, 0, 0.3607843, 1,
1.481317, -0.4521483, 2.306743, 1, 0, 0.3529412, 1,
1.487748, -0.2474387, 1.939849, 1, 0, 0.3490196, 1,
1.488488, -0.7250859, 0.3616747, 1, 0, 0.3411765, 1,
1.488714, 0.6253206, 2.57649, 1, 0, 0.3372549, 1,
1.518136, 1.759421, -0.1253805, 1, 0, 0.3294118, 1,
1.518566, -0.264577, 2.413883, 1, 0, 0.3254902, 1,
1.532977, 0.03554674, 0.6272743, 1, 0, 0.3176471, 1,
1.535093, -0.6911205, 0.5894501, 1, 0, 0.3137255, 1,
1.548399, -0.366074, 1.607756, 1, 0, 0.3058824, 1,
1.550844, 0.02056169, 0.7998471, 1, 0, 0.2980392, 1,
1.609976, 0.9202864, 1.63405, 1, 0, 0.2941177, 1,
1.61294, -0.8466663, 2.477042, 1, 0, 0.2862745, 1,
1.627118, 1.598576, 1.811514, 1, 0, 0.282353, 1,
1.630404, -0.591632, 1.642525, 1, 0, 0.2745098, 1,
1.630781, 1.567255, -0.5116009, 1, 0, 0.2705882, 1,
1.631629, -0.6692578, -0.2516159, 1, 0, 0.2627451, 1,
1.638011, -0.5706473, 0.8592695, 1, 0, 0.2588235, 1,
1.650838, -1.503704, 2.86735, 1, 0, 0.2509804, 1,
1.653533, -0.7941326, 1.106944, 1, 0, 0.2470588, 1,
1.659826, -0.5891733, 2.954684, 1, 0, 0.2392157, 1,
1.672724, -2.343001, 3.403879, 1, 0, 0.2352941, 1,
1.679571, -0.1402278, 1.327986, 1, 0, 0.227451, 1,
1.681011, 0.6805551, 0.9822836, 1, 0, 0.2235294, 1,
1.687444, 0.1411744, 1.100098, 1, 0, 0.2156863, 1,
1.688221, 0.2780964, -3.050952, 1, 0, 0.2117647, 1,
1.690726, 0.2245207, 0.4055366, 1, 0, 0.2039216, 1,
1.71125, -1.221481, 2.690048, 1, 0, 0.1960784, 1,
1.711519, -0.4035728, 2.33785, 1, 0, 0.1921569, 1,
1.713966, 0.7449042, -0.7207074, 1, 0, 0.1843137, 1,
1.755133, -1.246327, 0.944337, 1, 0, 0.1803922, 1,
1.759926, 1.150523, 1.425544, 1, 0, 0.172549, 1,
1.766177, -0.1936674, 2.751212, 1, 0, 0.1686275, 1,
1.778054, -0.4065376, 1.836997, 1, 0, 0.1607843, 1,
1.827725, -1.740635, 2.506756, 1, 0, 0.1568628, 1,
1.857777, 1.432889, 2.933534, 1, 0, 0.1490196, 1,
1.876715, 0.5127497, 0.4558396, 1, 0, 0.145098, 1,
1.879433, -0.5948814, 1.367203, 1, 0, 0.1372549, 1,
1.906536, -0.5508341, 2.414809, 1, 0, 0.1333333, 1,
1.910549, 0.6006219, 1.178512, 1, 0, 0.1254902, 1,
2.020246, -1.411628, 2.590607, 1, 0, 0.1215686, 1,
2.038587, 0.6063031, 1.659898, 1, 0, 0.1137255, 1,
2.046247, -0.5502099, 1.97463, 1, 0, 0.1098039, 1,
2.154699, -1.753068, 2.499724, 1, 0, 0.1019608, 1,
2.193542, 0.2380208, 1.531256, 1, 0, 0.09411765, 1,
2.212034, -0.4120917, 1.290647, 1, 0, 0.09019608, 1,
2.219505, 0.2964442, -0.578927, 1, 0, 0.08235294, 1,
2.279926, -1.148679, 1.348054, 1, 0, 0.07843138, 1,
2.281959, 1.214372, 0.8793834, 1, 0, 0.07058824, 1,
2.287601, 0.5954211, 0.4702966, 1, 0, 0.06666667, 1,
2.302024, -1.548932, 2.574566, 1, 0, 0.05882353, 1,
2.400063, 1.863943, 1.317371, 1, 0, 0.05490196, 1,
2.41162, 1.411091, -0.09026285, 1, 0, 0.04705882, 1,
2.463245, -2.544598, 1.512835, 1, 0, 0.04313726, 1,
2.549184, -0.4730914, 0.3607927, 1, 0, 0.03529412, 1,
2.575874, 1.669357, 0.4357545, 1, 0, 0.03137255, 1,
2.579808, 1.613887, 1.238544, 1, 0, 0.02352941, 1,
2.768174, -1.212086, 0.6385184, 1, 0, 0.01960784, 1,
3.057815, 0.1601517, 2.912384, 1, 0, 0.01176471, 1,
3.720623, 1.157274, 1.502773, 1, 0, 0.007843138, 1
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
-0.06523216, -4.24214, -6.754601, 0, -0.5, 0.5, 0.5,
-0.06523216, -4.24214, -6.754601, 1, -0.5, 0.5, 0.5,
-0.06523216, -4.24214, -6.754601, 1, 1.5, 0.5, 0.5,
-0.06523216, -4.24214, -6.754601, 0, 1.5, 0.5, 0.5
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
-5.134492, 0.4196186, -6.754601, 0, -0.5, 0.5, 0.5,
-5.134492, 0.4196186, -6.754601, 1, -0.5, 0.5, 0.5,
-5.134492, 0.4196186, -6.754601, 1, 1.5, 0.5, 0.5,
-5.134492, 0.4196186, -6.754601, 0, 1.5, 0.5, 0.5
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
-5.134492, -4.24214, 0.06770325, 0, -0.5, 0.5, 0.5,
-5.134492, -4.24214, 0.06770325, 1, -0.5, 0.5, 0.5,
-5.134492, -4.24214, 0.06770325, 1, 1.5, 0.5, 0.5,
-5.134492, -4.24214, 0.06770325, 0, 1.5, 0.5, 0.5
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
-2, -3.16635, -5.180223,
2, -3.16635, -5.180223,
-2, -3.16635, -5.180223,
-2, -3.345648, -5.442619,
0, -3.16635, -5.180223,
0, -3.345648, -5.442619,
2, -3.16635, -5.180223,
2, -3.345648, -5.442619
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
"-2",
"0",
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
-2, -3.704245, -5.967412, 0, -0.5, 0.5, 0.5,
-2, -3.704245, -5.967412, 1, -0.5, 0.5, 0.5,
-2, -3.704245, -5.967412, 1, 1.5, 0.5, 0.5,
-2, -3.704245, -5.967412, 0, 1.5, 0.5, 0.5,
0, -3.704245, -5.967412, 0, -0.5, 0.5, 0.5,
0, -3.704245, -5.967412, 1, -0.5, 0.5, 0.5,
0, -3.704245, -5.967412, 1, 1.5, 0.5, 0.5,
0, -3.704245, -5.967412, 0, 1.5, 0.5, 0.5,
2, -3.704245, -5.967412, 0, -0.5, 0.5, 0.5,
2, -3.704245, -5.967412, 1, -0.5, 0.5, 0.5,
2, -3.704245, -5.967412, 1, 1.5, 0.5, 0.5,
2, -3.704245, -5.967412, 0, 1.5, 0.5, 0.5
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
-3.964663, -3, -5.180223,
-3.964663, 3, -5.180223,
-3.964663, -3, -5.180223,
-4.159635, -3, -5.442619,
-3.964663, -2, -5.180223,
-4.159635, -2, -5.442619,
-3.964663, -1, -5.180223,
-4.159635, -1, -5.442619,
-3.964663, 0, -5.180223,
-4.159635, 0, -5.442619,
-3.964663, 1, -5.180223,
-4.159635, 1, -5.442619,
-3.964663, 2, -5.180223,
-4.159635, 2, -5.442619,
-3.964663, 3, -5.180223,
-4.159635, 3, -5.442619
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
-4.549578, -3, -5.967412, 0, -0.5, 0.5, 0.5,
-4.549578, -3, -5.967412, 1, -0.5, 0.5, 0.5,
-4.549578, -3, -5.967412, 1, 1.5, 0.5, 0.5,
-4.549578, -3, -5.967412, 0, 1.5, 0.5, 0.5,
-4.549578, -2, -5.967412, 0, -0.5, 0.5, 0.5,
-4.549578, -2, -5.967412, 1, -0.5, 0.5, 0.5,
-4.549578, -2, -5.967412, 1, 1.5, 0.5, 0.5,
-4.549578, -2, -5.967412, 0, 1.5, 0.5, 0.5,
-4.549578, -1, -5.967412, 0, -0.5, 0.5, 0.5,
-4.549578, -1, -5.967412, 1, -0.5, 0.5, 0.5,
-4.549578, -1, -5.967412, 1, 1.5, 0.5, 0.5,
-4.549578, -1, -5.967412, 0, 1.5, 0.5, 0.5,
-4.549578, 0, -5.967412, 0, -0.5, 0.5, 0.5,
-4.549578, 0, -5.967412, 1, -0.5, 0.5, 0.5,
-4.549578, 0, -5.967412, 1, 1.5, 0.5, 0.5,
-4.549578, 0, -5.967412, 0, 1.5, 0.5, 0.5,
-4.549578, 1, -5.967412, 0, -0.5, 0.5, 0.5,
-4.549578, 1, -5.967412, 1, -0.5, 0.5, 0.5,
-4.549578, 1, -5.967412, 1, 1.5, 0.5, 0.5,
-4.549578, 1, -5.967412, 0, 1.5, 0.5, 0.5,
-4.549578, 2, -5.967412, 0, -0.5, 0.5, 0.5,
-4.549578, 2, -5.967412, 1, -0.5, 0.5, 0.5,
-4.549578, 2, -5.967412, 1, 1.5, 0.5, 0.5,
-4.549578, 2, -5.967412, 0, 1.5, 0.5, 0.5,
-4.549578, 3, -5.967412, 0, -0.5, 0.5, 0.5,
-4.549578, 3, -5.967412, 1, -0.5, 0.5, 0.5,
-4.549578, 3, -5.967412, 1, 1.5, 0.5, 0.5,
-4.549578, 3, -5.967412, 0, 1.5, 0.5, 0.5
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
-3.964663, -3.16635, -4,
-3.964663, -3.16635, 4,
-3.964663, -3.16635, -4,
-4.159635, -3.345648, -4,
-3.964663, -3.16635, -2,
-4.159635, -3.345648, -2,
-3.964663, -3.16635, 0,
-4.159635, -3.345648, 0,
-3.964663, -3.16635, 2,
-4.159635, -3.345648, 2,
-3.964663, -3.16635, 4,
-4.159635, -3.345648, 4
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
-4.549578, -3.704245, -4, 0, -0.5, 0.5, 0.5,
-4.549578, -3.704245, -4, 1, -0.5, 0.5, 0.5,
-4.549578, -3.704245, -4, 1, 1.5, 0.5, 0.5,
-4.549578, -3.704245, -4, 0, 1.5, 0.5, 0.5,
-4.549578, -3.704245, -2, 0, -0.5, 0.5, 0.5,
-4.549578, -3.704245, -2, 1, -0.5, 0.5, 0.5,
-4.549578, -3.704245, -2, 1, 1.5, 0.5, 0.5,
-4.549578, -3.704245, -2, 0, 1.5, 0.5, 0.5,
-4.549578, -3.704245, 0, 0, -0.5, 0.5, 0.5,
-4.549578, -3.704245, 0, 1, -0.5, 0.5, 0.5,
-4.549578, -3.704245, 0, 1, 1.5, 0.5, 0.5,
-4.549578, -3.704245, 0, 0, 1.5, 0.5, 0.5,
-4.549578, -3.704245, 2, 0, -0.5, 0.5, 0.5,
-4.549578, -3.704245, 2, 1, -0.5, 0.5, 0.5,
-4.549578, -3.704245, 2, 1, 1.5, 0.5, 0.5,
-4.549578, -3.704245, 2, 0, 1.5, 0.5, 0.5,
-4.549578, -3.704245, 4, 0, -0.5, 0.5, 0.5,
-4.549578, -3.704245, 4, 1, -0.5, 0.5, 0.5,
-4.549578, -3.704245, 4, 1, 1.5, 0.5, 0.5,
-4.549578, -3.704245, 4, 0, 1.5, 0.5, 0.5
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
-3.964663, -3.16635, -5.180223,
-3.964663, 4.005587, -5.180223,
-3.964663, -3.16635, 5.315629,
-3.964663, 4.005587, 5.315629,
-3.964663, -3.16635, -5.180223,
-3.964663, -3.16635, 5.315629,
-3.964663, 4.005587, -5.180223,
-3.964663, 4.005587, 5.315629,
-3.964663, -3.16635, -5.180223,
3.834199, -3.16635, -5.180223,
-3.964663, -3.16635, 5.315629,
3.834199, -3.16635, 5.315629,
-3.964663, 4.005587, -5.180223,
3.834199, 4.005587, -5.180223,
-3.964663, 4.005587, 5.315629,
3.834199, 4.005587, 5.315629,
3.834199, -3.16635, -5.180223,
3.834199, 4.005587, -5.180223,
3.834199, -3.16635, 5.315629,
3.834199, 4.005587, 5.315629,
3.834199, -3.16635, -5.180223,
3.834199, -3.16635, 5.315629,
3.834199, 4.005587, -5.180223,
3.834199, 4.005587, 5.315629
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
var radius = 7.963687;
var distance = 35.43134;
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
mvMatrix.translate( 0.06523216, -0.4196186, -0.06770325 );
mvMatrix.scale( 1.104071, 1.200581, 0.8203712 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.43134);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Mecoprop<-read.table("Mecoprop.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Mecoprop$V2
```

```
## Error in eval(expr, envir, enclos): object 'Mecoprop' not found
```

```r
y<-Mecoprop$V3
```

```
## Error in eval(expr, envir, enclos): object 'Mecoprop' not found
```

```r
z<-Mecoprop$V4
```

```
## Error in eval(expr, envir, enclos): object 'Mecoprop' not found
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
-3.851088, 0.5630093, -0.8170131, 0, 0, 1, 1, 1,
-3.092441, 0.7373976, -1.975296, 1, 0, 0, 1, 1,
-2.953688, -0.8022863, -1.969799, 1, 0, 0, 1, 1,
-2.590163, 0.571154, -1.278519, 1, 0, 0, 1, 1,
-2.523279, -0.5449219, -1.73787, 1, 0, 0, 1, 1,
-2.434453, 2.168636, -1.607457, 1, 0, 0, 1, 1,
-2.423087, 1.116439, -0.1236522, 0, 0, 0, 1, 1,
-2.390394, -0.1731969, -1.459053, 0, 0, 0, 1, 1,
-2.378137, -0.9356849, -0.8224046, 0, 0, 0, 1, 1,
-2.332045, 0.9352185, -1.328184, 0, 0, 0, 1, 1,
-2.117432, -1.109827, -2.812721, 0, 0, 0, 1, 1,
-2.113617, -0.8955659, -0.334171, 0, 0, 0, 1, 1,
-2.099571, 0.6709073, -1.967912, 0, 0, 0, 1, 1,
-2.075427, 1.341888, -0.1151988, 1, 1, 1, 1, 1,
-2.033488, 0.2493397, -3.097945, 1, 1, 1, 1, 1,
-2.017005, 1.558995, 0.3787963, 1, 1, 1, 1, 1,
-2.000375, 1.072731, -3.117564, 1, 1, 1, 1, 1,
-1.986874, 0.8739755, -1.756216, 1, 1, 1, 1, 1,
-1.97073, -0.2921057, -0.7040825, 1, 1, 1, 1, 1,
-1.961794, 0.445277, -1.945914, 1, 1, 1, 1, 1,
-1.942476, -1.484025, -3.628464, 1, 1, 1, 1, 1,
-1.939146, 2.080383, -1.421219, 1, 1, 1, 1, 1,
-1.901197, 1.299333, -0.3024932, 1, 1, 1, 1, 1,
-1.898644, 0.8636233, -1.496775, 1, 1, 1, 1, 1,
-1.839125, -1.273949, -2.146353, 1, 1, 1, 1, 1,
-1.826233, 2.413915, 1.113763, 1, 1, 1, 1, 1,
-1.820651, -1.358724, -1.826002, 1, 1, 1, 1, 1,
-1.766721, -1.002413, -2.21052, 1, 1, 1, 1, 1,
-1.740162, -0.7925261, -1.864879, 0, 0, 1, 1, 1,
-1.729851, 0.04966791, 0.3079435, 1, 0, 0, 1, 1,
-1.719095, -0.3816782, -1.339261, 1, 0, 0, 1, 1,
-1.715851, -1.384402, -0.07163686, 1, 0, 0, 1, 1,
-1.705331, -1.110509, -4.227733, 1, 0, 0, 1, 1,
-1.701904, 0.6745975, -1.263823, 1, 0, 0, 1, 1,
-1.699417, -1.080253, -2.020523, 0, 0, 0, 1, 1,
-1.697434, -0.2591244, -2.638514, 0, 0, 0, 1, 1,
-1.675288, -0.5535808, -2.542533, 0, 0, 0, 1, 1,
-1.666466, 0.8524446, -2.517517, 0, 0, 0, 1, 1,
-1.660052, 0.9983748, 0.3120321, 0, 0, 0, 1, 1,
-1.652248, -0.08429003, -1.338002, 0, 0, 0, 1, 1,
-1.651505, 0.8004304, -1.796047, 0, 0, 0, 1, 1,
-1.649667, 0.3550247, 0.1633126, 1, 1, 1, 1, 1,
-1.646676, 0.6281491, -1.199774, 1, 1, 1, 1, 1,
-1.62023, -0.4633284, -2.584948, 1, 1, 1, 1, 1,
-1.616495, -0.1327853, -0.0807695, 1, 1, 1, 1, 1,
-1.613443, -0.1655508, -0.5603863, 1, 1, 1, 1, 1,
-1.610521, -0.7751387, -1.877722, 1, 1, 1, 1, 1,
-1.605135, 0.5189437, -0.9531279, 1, 1, 1, 1, 1,
-1.601246, 0.03921026, -0.6524178, 1, 1, 1, 1, 1,
-1.599822, -1.384998, -2.941258, 1, 1, 1, 1, 1,
-1.594687, 0.6902429, -1.640667, 1, 1, 1, 1, 1,
-1.586531, -1.2765, -5.027371, 1, 1, 1, 1, 1,
-1.584424, 0.03289428, -1.67739, 1, 1, 1, 1, 1,
-1.580992, 0.8643849, -1.564981, 1, 1, 1, 1, 1,
-1.57811, 1.350527, 0.3556772, 1, 1, 1, 1, 1,
-1.578048, -0.2889398, -2.429525, 1, 1, 1, 1, 1,
-1.576948, -0.1490174, -2.904287, 0, 0, 1, 1, 1,
-1.573454, 0.7549021, -1.422871, 1, 0, 0, 1, 1,
-1.564448, -0.3623627, -1.276996, 1, 0, 0, 1, 1,
-1.562252, -2.07906, -2.019025, 1, 0, 0, 1, 1,
-1.559727, 0.1406432, -3.181072, 1, 0, 0, 1, 1,
-1.537354, -0.2098879, -0.9009645, 1, 0, 0, 1, 1,
-1.534942, 1.388266, -2.554945, 0, 0, 0, 1, 1,
-1.531258, -0.3917116, -1.558693, 0, 0, 0, 1, 1,
-1.519047, -0.4497023, -0.1059549, 0, 0, 0, 1, 1,
-1.518162, 1.028345, -1.207298, 0, 0, 0, 1, 1,
-1.509696, -0.2293594, -3.664563, 0, 0, 0, 1, 1,
-1.49082, 1.542161, -0.09135586, 0, 0, 0, 1, 1,
-1.488729, -0.8829849, -3.291014, 0, 0, 0, 1, 1,
-1.488147, 0.4842379, -2.126873, 1, 1, 1, 1, 1,
-1.481357, -0.5527759, -2.586123, 1, 1, 1, 1, 1,
-1.47978, 0.9202765, -1.723039, 1, 1, 1, 1, 1,
-1.464649, 0.6420519, -0.8534107, 1, 1, 1, 1, 1,
-1.446592, 0.4631747, -1.987146, 1, 1, 1, 1, 1,
-1.437296, -1.590759, -4.143215, 1, 1, 1, 1, 1,
-1.436628, 0.4182217, 0.6778584, 1, 1, 1, 1, 1,
-1.420516, -1.255888, -1.724102, 1, 1, 1, 1, 1,
-1.418913, 0.5279879, -1.387107, 1, 1, 1, 1, 1,
-1.417674, 1.087156, 1.661473, 1, 1, 1, 1, 1,
-1.408706, 1.278023, -1.527153, 1, 1, 1, 1, 1,
-1.397255, 1.636837, -1.952482, 1, 1, 1, 1, 1,
-1.39055, 1.058102, -1.000142, 1, 1, 1, 1, 1,
-1.38127, 0.06512468, -2.323733, 1, 1, 1, 1, 1,
-1.363733, 0.2468987, -2.699702, 1, 1, 1, 1, 1,
-1.35588, 0.5128664, -1.077469, 0, 0, 1, 1, 1,
-1.34075, -0.5471068, -2.740649, 1, 0, 0, 1, 1,
-1.335302, 0.2313231, -1.226154, 1, 0, 0, 1, 1,
-1.333881, 0.7740941, -1.699357, 1, 0, 0, 1, 1,
-1.324828, 0.3327127, -1.987543, 1, 0, 0, 1, 1,
-1.321031, 1.866335, -0.7467576, 1, 0, 0, 1, 1,
-1.318169, 1.43586, -0.7721158, 0, 0, 0, 1, 1,
-1.315634, -0.07626056, -1.547701, 0, 0, 0, 1, 1,
-1.307249, 1.13277, -2.101432, 0, 0, 0, 1, 1,
-1.302219, 0.1316484, -1.403636, 0, 0, 0, 1, 1,
-1.299603, 0.3095044, -2.326369, 0, 0, 0, 1, 1,
-1.290982, -0.240325, -0.9700586, 0, 0, 0, 1, 1,
-1.288977, 0.8657228, -0.4999739, 0, 0, 0, 1, 1,
-1.28815, -0.2353588, -0.3184423, 1, 1, 1, 1, 1,
-1.284178, 1.337518, -1.726431, 1, 1, 1, 1, 1,
-1.283099, -0.04814297, -1.987106, 1, 1, 1, 1, 1,
-1.261925, -0.1541518, -0.6842682, 1, 1, 1, 1, 1,
-1.25816, -0.2966174, -3.166785, 1, 1, 1, 1, 1,
-1.256929, 1.779834, 0.07824131, 1, 1, 1, 1, 1,
-1.252504, 1.486274, -0.7425835, 1, 1, 1, 1, 1,
-1.242226, -0.5546303, -4.072191, 1, 1, 1, 1, 1,
-1.231957, 1.119703, -1.821882, 1, 1, 1, 1, 1,
-1.228755, 0.1107009, -1.637535, 1, 1, 1, 1, 1,
-1.227171, -2.738515, -1.973041, 1, 1, 1, 1, 1,
-1.226573, -0.4386124, -1.76043, 1, 1, 1, 1, 1,
-1.222051, 1.079709, -2.194267, 1, 1, 1, 1, 1,
-1.218348, 0.6184468, -0.8999179, 1, 1, 1, 1, 1,
-1.214922, -0.7968547, -2.497138, 1, 1, 1, 1, 1,
-1.209407, -2.172599, -2.14397, 0, 0, 1, 1, 1,
-1.204326, -1.011839, -2.171246, 1, 0, 0, 1, 1,
-1.199819, -1.040759, -3.392856, 1, 0, 0, 1, 1,
-1.191998, 1.071814, -0.4280097, 1, 0, 0, 1, 1,
-1.191068, -0.2703315, -1.379035, 1, 0, 0, 1, 1,
-1.190427, 0.1876793, -1.573267, 1, 0, 0, 1, 1,
-1.189671, 0.2535229, -0.7447041, 0, 0, 0, 1, 1,
-1.186585, 0.6600426, 1.434561, 0, 0, 0, 1, 1,
-1.184264, 2.400671, 1.742337, 0, 0, 0, 1, 1,
-1.180776, 1.113657, -0.5132348, 0, 0, 0, 1, 1,
-1.169968, -1.237796, -3.923211, 0, 0, 0, 1, 1,
-1.159807, 2.441113, -1.97128, 0, 0, 0, 1, 1,
-1.155656, -0.2065801, -1.521303, 0, 0, 0, 1, 1,
-1.149491, -0.6125825, -2.222586, 1, 1, 1, 1, 1,
-1.143998, 0.149982, -1.255211, 1, 1, 1, 1, 1,
-1.120121, -0.8272709, -1.907529, 1, 1, 1, 1, 1,
-1.118495, 0.3563682, -1.235917, 1, 1, 1, 1, 1,
-1.117822, -1.126407, -1.790129, 1, 1, 1, 1, 1,
-1.116836, -1.457867, -2.801036, 1, 1, 1, 1, 1,
-1.108327, -0.1707963, -1.990975, 1, 1, 1, 1, 1,
-1.092365, -0.8115736, -0.7894987, 1, 1, 1, 1, 1,
-1.086814, -0.8682301, -4.742498, 1, 1, 1, 1, 1,
-1.079787, 0.8580899, -1.179957, 1, 1, 1, 1, 1,
-1.074041, 1.848169, -0.03929062, 1, 1, 1, 1, 1,
-1.066541, -1.038915, -2.992955, 1, 1, 1, 1, 1,
-1.061821, 0.3173541, -0.3065716, 1, 1, 1, 1, 1,
-1.058743, 0.322447, 0.136079, 1, 1, 1, 1, 1,
-1.058237, -1.873467, -4.413561, 1, 1, 1, 1, 1,
-1.053075, 0.1846609, -0.4706384, 0, 0, 1, 1, 1,
-1.05173, 1.035256, 0.2430483, 1, 0, 0, 1, 1,
-1.048577, 0.5660245, -1.402067, 1, 0, 0, 1, 1,
-1.047313, -0.7389652, -2.470178, 1, 0, 0, 1, 1,
-1.04679, -0.565641, -1.205315, 1, 0, 0, 1, 1,
-1.043662, -0.02989343, -1.065553, 1, 0, 0, 1, 1,
-1.040819, -0.8638268, -3.896585, 0, 0, 0, 1, 1,
-1.038112, -1.799687, -1.656425, 0, 0, 0, 1, 1,
-1.037495, 1.270219, -0.6850677, 0, 0, 0, 1, 1,
-1.034892, 0.02764357, -3.13439, 0, 0, 0, 1, 1,
-1.015873, -0.935065, -2.802607, 0, 0, 0, 1, 1,
-1.010257, -0.4616208, -3.358512, 0, 0, 0, 1, 1,
-1.008745, 0.4803522, -0.9862205, 0, 0, 0, 1, 1,
-1.008152, 0.549974, -1.202079, 1, 1, 1, 1, 1,
-1.000132, 1.527392, -0.182565, 1, 1, 1, 1, 1,
-0.9920335, -0.5403351, -0.2440604, 1, 1, 1, 1, 1,
-0.9898325, 0.3789222, -1.5723, 1, 1, 1, 1, 1,
-0.9861294, -2.388601, -2.984564, 1, 1, 1, 1, 1,
-0.9850305, -2.044308, -2.643719, 1, 1, 1, 1, 1,
-0.9795451, 0.6937471, -1.168355, 1, 1, 1, 1, 1,
-0.9765576, 0.3710045, 0.006724713, 1, 1, 1, 1, 1,
-0.969775, -0.8287187, -3.195423, 1, 1, 1, 1, 1,
-0.9648696, -0.6334974, -2.439159, 1, 1, 1, 1, 1,
-0.9606377, -1.005674, -1.927125, 1, 1, 1, 1, 1,
-0.9593969, 3.65327, -0.3794064, 1, 1, 1, 1, 1,
-0.9503202, -0.5093186, -1.629183, 1, 1, 1, 1, 1,
-0.9494998, 0.2767627, -0.09611613, 1, 1, 1, 1, 1,
-0.9450145, 0.5403184, -0.5102122, 1, 1, 1, 1, 1,
-0.9429109, -0.143284, -2.429789, 0, 0, 1, 1, 1,
-0.9387202, -0.5462393, -2.72687, 1, 0, 0, 1, 1,
-0.9363725, -0.6026713, -2.841264, 1, 0, 0, 1, 1,
-0.9313365, -2.399101, -3.742854, 1, 0, 0, 1, 1,
-0.9293306, -0.6320864, -3.559857, 1, 0, 0, 1, 1,
-0.9252409, 1.300934, -0.9050866, 1, 0, 0, 1, 1,
-0.9191203, -0.7757802, -1.577652, 0, 0, 0, 1, 1,
-0.9159749, -1.243668, -0.8609945, 0, 0, 0, 1, 1,
-0.9154213, 0.4717525, -0.3802227, 0, 0, 0, 1, 1,
-0.9145638, -0.3323894, -1.884174, 0, 0, 0, 1, 1,
-0.9072877, -0.09330328, -1.330872, 0, 0, 0, 1, 1,
-0.8771287, 0.06808437, -2.670484, 0, 0, 0, 1, 1,
-0.8708912, 0.9889279, 0.6259445, 0, 0, 0, 1, 1,
-0.8704637, 0.8873558, -0.3613373, 1, 1, 1, 1, 1,
-0.8683518, -0.198366, -2.995751, 1, 1, 1, 1, 1,
-0.8680811, 0.03048985, -2.900363, 1, 1, 1, 1, 1,
-0.8641558, -0.4959706, -3.484952, 1, 1, 1, 1, 1,
-0.8640913, 0.562354, -1.39531, 1, 1, 1, 1, 1,
-0.8613471, -1.135926, -4.119246, 1, 1, 1, 1, 1,
-0.8521737, -0.3020163, -0.7070639, 1, 1, 1, 1, 1,
-0.8492188, -1.741234, -2.350907, 1, 1, 1, 1, 1,
-0.8469144, -0.07066116, -2.68081, 1, 1, 1, 1, 1,
-0.8284874, -0.2841501, -1.62848, 1, 1, 1, 1, 1,
-0.8283931, -0.3535926, -3.198998, 1, 1, 1, 1, 1,
-0.827799, -0.4216209, -3.060027, 1, 1, 1, 1, 1,
-0.8181587, -0.03696256, 0.06154083, 1, 1, 1, 1, 1,
-0.8181303, 0.5247998, -1.073101, 1, 1, 1, 1, 1,
-0.8095144, -1.22136, -3.261192, 1, 1, 1, 1, 1,
-0.799216, -2.075676, -2.28221, 0, 0, 1, 1, 1,
-0.7988274, -0.08856591, -1.90432, 1, 0, 0, 1, 1,
-0.7965972, -0.1973346, -0.270679, 1, 0, 0, 1, 1,
-0.7930942, 0.8892208, 0.1806616, 1, 0, 0, 1, 1,
-0.7904312, 0.2519789, -2.090696, 1, 0, 0, 1, 1,
-0.7830432, 0.2798271, -0.927404, 1, 0, 0, 1, 1,
-0.781441, -0.4339623, -0.1988529, 0, 0, 0, 1, 1,
-0.7766438, 0.9632793, 1.046283, 0, 0, 0, 1, 1,
-0.773888, -0.7220233, -3.68339, 0, 0, 0, 1, 1,
-0.772282, 1.077192, -1.578659, 0, 0, 0, 1, 1,
-0.7683545, -1.845736, -2.51618, 0, 0, 0, 1, 1,
-0.7680749, -0.3413239, -2.102555, 0, 0, 0, 1, 1,
-0.7598895, -0.08619917, -1.854, 0, 0, 0, 1, 1,
-0.753576, 0.3043265, -0.1473739, 1, 1, 1, 1, 1,
-0.7504899, -0.08007366, -0.5791065, 1, 1, 1, 1, 1,
-0.7501931, -1.277004, -1.863531, 1, 1, 1, 1, 1,
-0.7445052, -1.809858, -1.148408, 1, 1, 1, 1, 1,
-0.741359, 0.2471634, -1.149726, 1, 1, 1, 1, 1,
-0.7396522, -1.428709, -1.81225, 1, 1, 1, 1, 1,
-0.7376646, -0.3682378, -1.248845, 1, 1, 1, 1, 1,
-0.736407, -0.4278115, -3.122947, 1, 1, 1, 1, 1,
-0.7341332, -0.1218383, -0.7697712, 1, 1, 1, 1, 1,
-0.7298893, 0.4176383, -2.284757, 1, 1, 1, 1, 1,
-0.7273292, 1.135393, -1.263072, 1, 1, 1, 1, 1,
-0.7238681, 0.9761148, -0.661504, 1, 1, 1, 1, 1,
-0.7224644, 1.431021, 0.5028663, 1, 1, 1, 1, 1,
-0.7214241, 1.121459, -1.467648, 1, 1, 1, 1, 1,
-0.7198718, 0.1970294, -0.8781766, 1, 1, 1, 1, 1,
-0.719845, 0.5103765, -1.761199, 0, 0, 1, 1, 1,
-0.7140547, 0.5009227, 0.7136558, 1, 0, 0, 1, 1,
-0.7018931, -0.386254, -1.933125, 1, 0, 0, 1, 1,
-0.6999089, 1.352556, 0.2014102, 1, 0, 0, 1, 1,
-0.6991383, -0.9062649, -2.80195, 1, 0, 0, 1, 1,
-0.697925, -1.233211, -3.351575, 1, 0, 0, 1, 1,
-0.6962622, -0.9152554, -1.600446, 0, 0, 0, 1, 1,
-0.6954029, -0.2679524, -0.9914013, 0, 0, 0, 1, 1,
-0.6916722, 0.1194707, -1.792446, 0, 0, 0, 1, 1,
-0.6912374, -0.6681191, -2.152052, 0, 0, 0, 1, 1,
-0.6907457, -1.291477, -2.284094, 0, 0, 0, 1, 1,
-0.6903337, -1.269806, -1.962295, 0, 0, 0, 1, 1,
-0.6897944, -0.5847969, -2.338888, 0, 0, 0, 1, 1,
-0.6893507, -1.131297, -0.6292516, 1, 1, 1, 1, 1,
-0.681588, -0.6180739, -2.345693, 1, 1, 1, 1, 1,
-0.6814697, 0.6146508, -1.42297, 1, 1, 1, 1, 1,
-0.6784703, -0.3336947, -1.326733, 1, 1, 1, 1, 1,
-0.6755037, -0.6615707, -2.58851, 1, 1, 1, 1, 1,
-0.6737005, -0.5172424, -1.752393, 1, 1, 1, 1, 1,
-0.6720657, 1.542846, -0.6813304, 1, 1, 1, 1, 1,
-0.6688294, 1.025205, -2.395313, 1, 1, 1, 1, 1,
-0.6622078, -0.3077121, -2.726722, 1, 1, 1, 1, 1,
-0.6572174, -0.1656785, -2.902688, 1, 1, 1, 1, 1,
-0.652972, -0.8566687, -0.551085, 1, 1, 1, 1, 1,
-0.6485342, -1.680265, -1.521266, 1, 1, 1, 1, 1,
-0.6453722, -0.3855254, -4.059073, 1, 1, 1, 1, 1,
-0.6439499, -0.07206024, 0.0459936, 1, 1, 1, 1, 1,
-0.643497, 0.6881167, -0.3959076, 1, 1, 1, 1, 1,
-0.6411116, 0.8564848, -1.093235, 0, 0, 1, 1, 1,
-0.6407943, 1.67083, -0.1222395, 1, 0, 0, 1, 1,
-0.6379305, -0.3856761, -1.974096, 1, 0, 0, 1, 1,
-0.6375023, -1.583067, -3.227782, 1, 0, 0, 1, 1,
-0.6367754, -1.806698, -2.985071, 1, 0, 0, 1, 1,
-0.633258, -1.744886, -2.624397, 1, 0, 0, 1, 1,
-0.6305715, 1.272019, 0.3886725, 0, 0, 0, 1, 1,
-0.6251453, 1.666523, -0.2924765, 0, 0, 0, 1, 1,
-0.6190706, -0.1998776, -0.8208942, 0, 0, 0, 1, 1,
-0.6157802, 0.9352434, -0.5527788, 0, 0, 0, 1, 1,
-0.6135884, -1.651322, -3.483564, 0, 0, 0, 1, 1,
-0.6095536, -0.08483956, -0.4136629, 0, 0, 0, 1, 1,
-0.6079105, -0.06898817, -3.440086, 0, 0, 0, 1, 1,
-0.6006194, 0.06822763, -0.8859105, 1, 1, 1, 1, 1,
-0.597718, -0.3429982, -4.533298, 1, 1, 1, 1, 1,
-0.5954005, -1.719814, -2.651181, 1, 1, 1, 1, 1,
-0.5945904, -0.5373091, -1.639836, 1, 1, 1, 1, 1,
-0.5941433, 1.261159, 0.71376, 1, 1, 1, 1, 1,
-0.5912424, 0.7661083, -0.1824778, 1, 1, 1, 1, 1,
-0.5800908, 0.7746235, -0.9913205, 1, 1, 1, 1, 1,
-0.5794073, -0.2456753, -1.549562, 1, 1, 1, 1, 1,
-0.5788695, -0.133865, -0.8824196, 1, 1, 1, 1, 1,
-0.5772394, 1.611853, -0.2455095, 1, 1, 1, 1, 1,
-0.5752939, -1.453627, -1.324472, 1, 1, 1, 1, 1,
-0.5739196, -0.152292, -1.159856, 1, 1, 1, 1, 1,
-0.5718787, 0.6354111, -0.9272821, 1, 1, 1, 1, 1,
-0.5641865, -0.5556096, -2.486332, 1, 1, 1, 1, 1,
-0.5624962, -1.173457, -4.162515, 1, 1, 1, 1, 1,
-0.5603766, -1.518176, -3.625536, 0, 0, 1, 1, 1,
-0.5554898, 0.9029457, -1.115472, 1, 0, 0, 1, 1,
-0.5521494, -1.198641, -2.905178, 1, 0, 0, 1, 1,
-0.5489873, -0.1359495, -1.545866, 1, 0, 0, 1, 1,
-0.5487326, -0.006922604, -2.020991, 1, 0, 0, 1, 1,
-0.5467249, -0.3731627, -3.190351, 1, 0, 0, 1, 1,
-0.5278577, 1.458986, -0.4105378, 0, 0, 0, 1, 1,
-0.5275093, -0.4748915, -1.850919, 0, 0, 0, 1, 1,
-0.5243086, -1.138374, -2.900366, 0, 0, 0, 1, 1,
-0.5152164, -1.293742, -2.324244, 0, 0, 0, 1, 1,
-0.5147964, 0.8554168, 0.03030576, 0, 0, 0, 1, 1,
-0.5129437, -0.04018345, -1.441378, 0, 0, 0, 1, 1,
-0.5070293, -1.454193, -2.57764, 0, 0, 0, 1, 1,
-0.5037357, -1.286334, -0.4777076, 1, 1, 1, 1, 1,
-0.5024294, -0.644624, -2.675543, 1, 1, 1, 1, 1,
-0.5018251, 0.6288584, -1.062013, 1, 1, 1, 1, 1,
-0.4905035, -0.7384336, -3.643077, 1, 1, 1, 1, 1,
-0.4876908, 1.624122, 0.8777922, 1, 1, 1, 1, 1,
-0.4839977, 0.8910009, -1.290732, 1, 1, 1, 1, 1,
-0.4807801, 1.332273, -1.740576, 1, 1, 1, 1, 1,
-0.4805253, 0.06023855, -1.826485, 1, 1, 1, 1, 1,
-0.4766633, 1.709396, -0.2833372, 1, 1, 1, 1, 1,
-0.4745271, -0.5609729, -2.315345, 1, 1, 1, 1, 1,
-0.4708903, -1.706383, -2.928977, 1, 1, 1, 1, 1,
-0.4687739, -0.4796395, -1.14184, 1, 1, 1, 1, 1,
-0.4676235, -0.2657276, -1.842486, 1, 1, 1, 1, 1,
-0.4648423, 0.4873778, 0.2439955, 1, 1, 1, 1, 1,
-0.4621489, 0.6698208, -0.7523575, 1, 1, 1, 1, 1,
-0.4610208, -1.294682, -3.29635, 0, 0, 1, 1, 1,
-0.4607517, 0.7649451, -1.107119, 1, 0, 0, 1, 1,
-0.4557658, -1.383505, -3.509727, 1, 0, 0, 1, 1,
-0.4536866, 2.057025, -0.4178599, 1, 0, 0, 1, 1,
-0.4533482, -0.03185926, -1.877777, 1, 0, 0, 1, 1,
-0.4520546, -0.6731004, -3.860027, 1, 0, 0, 1, 1,
-0.4484889, 0.3308068, 0.1726577, 0, 0, 0, 1, 1,
-0.440919, 1.636947, 1.799312, 0, 0, 0, 1, 1,
-0.4353283, 1.854176, -0.9897672, 0, 0, 0, 1, 1,
-0.4329727, -0.1651208, -1.164569, 0, 0, 0, 1, 1,
-0.4299601, -0.430342, -1.71422, 0, 0, 0, 1, 1,
-0.4285704, -0.592853, -4.18382, 0, 0, 0, 1, 1,
-0.4277151, -1.132072, -2.291898, 0, 0, 0, 1, 1,
-0.41947, -0.1736343, -2.168111, 1, 1, 1, 1, 1,
-0.4117658, -2.403797, -3.30889, 1, 1, 1, 1, 1,
-0.4117128, -1.800923, -3.845555, 1, 1, 1, 1, 1,
-0.4108689, -2.012719, -2.415758, 1, 1, 1, 1, 1,
-0.4102491, -0.8570638, -2.889094, 1, 1, 1, 1, 1,
-0.4095663, 0.3330553, 0.8849678, 1, 1, 1, 1, 1,
-0.4002766, 1.34398, -1.330347, 1, 1, 1, 1, 1,
-0.3992924, -1.316062, -1.924579, 1, 1, 1, 1, 1,
-0.398355, -0.6384878, -1.612625, 1, 1, 1, 1, 1,
-0.3979426, 1.471965, 0.8388978, 1, 1, 1, 1, 1,
-0.3943132, 0.2337463, -1.834749, 1, 1, 1, 1, 1,
-0.3922202, -0.8813187, -3.512937, 1, 1, 1, 1, 1,
-0.3861611, 1.70941, -2.051028, 1, 1, 1, 1, 1,
-0.3836545, -0.4434646, -3.237981, 1, 1, 1, 1, 1,
-0.3803191, -0.4383421, -3.020211, 1, 1, 1, 1, 1,
-0.3754273, 1.275636, 0.3591247, 0, 0, 1, 1, 1,
-0.3752052, 0.4735576, 1.190043, 1, 0, 0, 1, 1,
-0.3700294, -2.237131, -2.643084, 1, 0, 0, 1, 1,
-0.366919, -0.716729, -3.413453, 1, 0, 0, 1, 1,
-0.3663086, 1.577914, -0.1362397, 1, 0, 0, 1, 1,
-0.3660246, -0.1070625, -1.893414, 1, 0, 0, 1, 1,
-0.362053, 1.267872, -0.9923006, 0, 0, 0, 1, 1,
-0.3609997, -0.0008334745, -1.076161, 0, 0, 0, 1, 1,
-0.3566315, -0.8646576, -4.379821, 0, 0, 0, 1, 1,
-0.3544159, -0.9467658, -4.678102, 0, 0, 0, 1, 1,
-0.3522945, 0.6604689, -1.329941, 0, 0, 0, 1, 1,
-0.3502923, -1.790535, -2.199466, 0, 0, 0, 1, 1,
-0.348635, -1.423247, -2.934353, 0, 0, 0, 1, 1,
-0.3435695, 1.979352, 0.1269943, 1, 1, 1, 1, 1,
-0.3427114, 0.3292187, -0.420987, 1, 1, 1, 1, 1,
-0.3423792, 0.2883988, -0.66395, 1, 1, 1, 1, 1,
-0.3420151, 1.087068, -0.8932196, 1, 1, 1, 1, 1,
-0.3408284, -0.333372, -2.103785, 1, 1, 1, 1, 1,
-0.3387235, -1.747885, -2.104616, 1, 1, 1, 1, 1,
-0.3377314, -1.849286, -2.382276, 1, 1, 1, 1, 1,
-0.3314722, -1.035442, -1.428822, 1, 1, 1, 1, 1,
-0.3312347, 0.214213, -1.982537, 1, 1, 1, 1, 1,
-0.3308599, -0.7269332, -3.968195, 1, 1, 1, 1, 1,
-0.3285941, 0.3156084, -1.361449, 1, 1, 1, 1, 1,
-0.3202499, -2.890079, -4.305211, 1, 1, 1, 1, 1,
-0.318369, 2.697807, 2.119652, 1, 1, 1, 1, 1,
-0.3138447, -0.1418096, -2.01052, 1, 1, 1, 1, 1,
-0.3127651, -0.0813882, 0.3089076, 1, 1, 1, 1, 1,
-0.3080844, 0.5129161, -0.8330042, 0, 0, 1, 1, 1,
-0.3067362, 0.4929068, 1.627777, 1, 0, 0, 1, 1,
-0.302261, -2.222083, -3.237456, 1, 0, 0, 1, 1,
-0.2984748, -0.09610361, -1.46773, 1, 0, 0, 1, 1,
-0.2930456, 0.2770729, -0.8886291, 1, 0, 0, 1, 1,
-0.2866136, 1.35397, -0.671621, 1, 0, 0, 1, 1,
-0.2859201, -0.1297582, -0.211619, 0, 0, 0, 1, 1,
-0.2842975, -0.9131415, -2.805669, 0, 0, 0, 1, 1,
-0.2812631, -0.3575496, -3.909259, 0, 0, 0, 1, 1,
-0.2809999, 1.48254, 0.9304539, 0, 0, 0, 1, 1,
-0.2773345, -0.6855382, -2.334744, 0, 0, 0, 1, 1,
-0.2772428, -0.4135835, -2.637683, 0, 0, 0, 1, 1,
-0.2750727, -0.4788788, -2.351843, 0, 0, 0, 1, 1,
-0.2702338, 0.7139314, 0.321751, 1, 1, 1, 1, 1,
-0.269722, -1.158154, -1.818465, 1, 1, 1, 1, 1,
-0.268266, 2.913278, -0.7039081, 1, 1, 1, 1, 1,
-0.267341, 0.4325379, -0.02230236, 1, 1, 1, 1, 1,
-0.2672199, 0.3303242, -0.02642079, 1, 1, 1, 1, 1,
-0.2664082, 0.8443277, 0.1250315, 1, 1, 1, 1, 1,
-0.2655628, -1.669592, -2.858478, 1, 1, 1, 1, 1,
-0.2637144, 0.2980933, 0.555539, 1, 1, 1, 1, 1,
-0.2622813, -0.5811147, -2.348604, 1, 1, 1, 1, 1,
-0.2618401, 0.6926394, -1.200696, 1, 1, 1, 1, 1,
-0.2586888, -0.9625819, -2.414081, 1, 1, 1, 1, 1,
-0.2560309, -1.150301, -1.697168, 1, 1, 1, 1, 1,
-0.2547387, 0.2120643, 0.3032276, 1, 1, 1, 1, 1,
-0.2527086, -0.1530592, -3.460512, 1, 1, 1, 1, 1,
-0.2514486, -0.84341, -3.27488, 1, 1, 1, 1, 1,
-0.2508523, 0.7087999, 0.03782954, 0, 0, 1, 1, 1,
-0.2488106, 0.5826479, -0.1586144, 1, 0, 0, 1, 1,
-0.2475694, 1.047382, -1.929522, 1, 0, 0, 1, 1,
-0.2381135, -1.986776, -2.369677, 1, 0, 0, 1, 1,
-0.2346812, 0.1333173, -0.3361083, 1, 0, 0, 1, 1,
-0.2345489, 1.299207, 0.77525, 1, 0, 0, 1, 1,
-0.2327496, 1.930681, 0.006089477, 0, 0, 0, 1, 1,
-0.225372, -2.358915, -2.491237, 0, 0, 0, 1, 1,
-0.2241616, -0.4058123, -4.556171, 0, 0, 0, 1, 1,
-0.2218593, 1.207731, -0.8819662, 0, 0, 0, 1, 1,
-0.2203716, 0.6811826, -0.9819859, 0, 0, 0, 1, 1,
-0.2197619, 0.8201382, -0.3370044, 0, 0, 0, 1, 1,
-0.2163228, 1.01926, -1.271291, 0, 0, 0, 1, 1,
-0.21379, -0.9031235, -2.215621, 1, 1, 1, 1, 1,
-0.2119019, 0.1847499, -0.3369481, 1, 1, 1, 1, 1,
-0.2095785, 0.02121157, -0.5389844, 1, 1, 1, 1, 1,
-0.2071568, 0.3255802, 0.15086, 1, 1, 1, 1, 1,
-0.2061442, -0.8533319, -1.756951, 1, 1, 1, 1, 1,
-0.1957319, 0.8304797, 0.7069867, 1, 1, 1, 1, 1,
-0.189823, 0.2631475, -0.0592712, 1, 1, 1, 1, 1,
-0.1891557, -0.7618371, -3.094841, 1, 1, 1, 1, 1,
-0.1862543, -0.08663042, -1.453447, 1, 1, 1, 1, 1,
-0.1758306, 0.7016505, 0.5708395, 1, 1, 1, 1, 1,
-0.1739521, -0.6385784, -3.222064, 1, 1, 1, 1, 1,
-0.1736777, -0.3882895, -3.362596, 1, 1, 1, 1, 1,
-0.1736247, 0.713082, 1.393133, 1, 1, 1, 1, 1,
-0.1724916, 0.8339932, 0.7687808, 1, 1, 1, 1, 1,
-0.1723217, -0.489447, -3.8088, 1, 1, 1, 1, 1,
-0.1706914, 1.246571, 0.2990288, 0, 0, 1, 1, 1,
-0.1673722, -1.090773, -1.379554, 1, 0, 0, 1, 1,
-0.1623121, 0.7779695, -0.4363435, 1, 0, 0, 1, 1,
-0.1611885, -1.007329, -2.701836, 1, 0, 0, 1, 1,
-0.1550736, -0.008334351, -1.70671, 1, 0, 0, 1, 1,
-0.151314, -0.7599843, -3.961316, 1, 0, 0, 1, 1,
-0.1486838, 0.3157343, -0.03067718, 0, 0, 0, 1, 1,
-0.1464269, -0.7821511, -3.007738, 0, 0, 0, 1, 1,
-0.1456719, 0.7808967, 1.886639, 0, 0, 0, 1, 1,
-0.144986, -0.1515586, -3.419659, 0, 0, 0, 1, 1,
-0.1428015, 0.4398329, -0.8196792, 0, 0, 0, 1, 1,
-0.142303, -1.719628, -3.132061, 0, 0, 0, 1, 1,
-0.1413418, -1.917382, -3.825308, 0, 0, 0, 1, 1,
-0.1386891, 0.6291858, -2.733936, 1, 1, 1, 1, 1,
-0.1326944, 2.891093, -2.569571, 1, 1, 1, 1, 1,
-0.1323643, -0.8251417, -2.441198, 1, 1, 1, 1, 1,
-0.1299221, 0.8206267, -0.834838, 1, 1, 1, 1, 1,
-0.1297619, -1.192613, -1.443435, 1, 1, 1, 1, 1,
-0.1289573, -0.1191402, -2.566768, 1, 1, 1, 1, 1,
-0.1263571, -0.3401987, -2.806263, 1, 1, 1, 1, 1,
-0.1249249, -1.428545, -1.713782, 1, 1, 1, 1, 1,
-0.1247579, 0.09957899, -1.400678, 1, 1, 1, 1, 1,
-0.1240635, -2.788534, -4.500006, 1, 1, 1, 1, 1,
-0.1215933, -0.5167587, -2.563186, 1, 1, 1, 1, 1,
-0.1204559, 0.4589517, -0.4274125, 1, 1, 1, 1, 1,
-0.1200943, -0.005962603, -2.354442, 1, 1, 1, 1, 1,
-0.1195937, -0.8643501, -0.7782569, 1, 1, 1, 1, 1,
-0.1168087, -1.184845, -3.293408, 1, 1, 1, 1, 1,
-0.1141604, -2.183481, -3.375483, 0, 0, 1, 1, 1,
-0.1107712, 1.508805, 1.514429, 1, 0, 0, 1, 1,
-0.1106629, 0.9938198, 0.6452904, 1, 0, 0, 1, 1,
-0.1102946, 0.7752721, -0.544057, 1, 0, 0, 1, 1,
-0.1062881, 0.3118606, 0.4434182, 1, 0, 0, 1, 1,
-0.1057063, -0.4753593, -4.796836, 1, 0, 0, 1, 1,
-0.1019544, 0.1651662, -2.468779, 0, 0, 0, 1, 1,
-0.09243055, 0.3800474, -0.7283294, 0, 0, 0, 1, 1,
-0.09155889, -2.378736, -2.954527, 0, 0, 0, 1, 1,
-0.08088099, -0.9470798, -3.402773, 0, 0, 0, 1, 1,
-0.07778375, 0.2570465, 0.5385636, 0, 0, 0, 1, 1,
-0.07527004, -0.5070933, -3.145761, 0, 0, 0, 1, 1,
-0.07448843, 1.895163, -1.260722, 0, 0, 0, 1, 1,
-0.07177487, -2.01778, -2.441846, 1, 1, 1, 1, 1,
-0.06545018, -0.1158674, -1.208227, 1, 1, 1, 1, 1,
-0.06405213, 0.8625194, -0.7231816, 1, 1, 1, 1, 1,
-0.06296138, 0.03127451, -1.396579, 1, 1, 1, 1, 1,
-0.06079291, -0.3626467, -2.366854, 1, 1, 1, 1, 1,
-0.05781677, -1.61208, -4.91179, 1, 1, 1, 1, 1,
-0.05651017, 0.9915433, -0.4769816, 1, 1, 1, 1, 1,
-0.05646126, 1.376186, 0.1834239, 1, 1, 1, 1, 1,
-0.0537353, 0.7246234, -0.5414212, 1, 1, 1, 1, 1,
-0.04509875, 1.513205, 2.060001, 1, 1, 1, 1, 1,
-0.04347528, -0.8858421, -3.087276, 1, 1, 1, 1, 1,
-0.0384308, -0.4229158, -3.817227, 1, 1, 1, 1, 1,
-0.03720875, 0.963339, -1.646298, 1, 1, 1, 1, 1,
-0.03156756, -0.2696345, -3.238341, 1, 1, 1, 1, 1,
-0.03142938, 0.4679025, 1.06199, 1, 1, 1, 1, 1,
-0.03112816, 0.1461513, -1.380249, 0, 0, 1, 1, 1,
-0.02877791, 1.234107, 1.669458, 1, 0, 0, 1, 1,
-0.02676607, -0.2959924, -3.699569, 1, 0, 0, 1, 1,
-0.01993069, 0.910876, -0.7373558, 1, 0, 0, 1, 1,
-0.01484585, 1.067655, 0.7241004, 1, 0, 0, 1, 1,
-0.01434349, 0.2373616, -1.583944, 1, 0, 0, 1, 1,
-0.01228934, 0.8830003, -0.2554166, 0, 0, 0, 1, 1,
-0.01176564, 0.4437188, -0.2916409, 0, 0, 0, 1, 1,
-0.008768301, -1.449117, -2.980692, 0, 0, 0, 1, 1,
-0.002760931, -0.07928762, -4.212384, 0, 0, 0, 1, 1,
0.001292423, 0.1437041, -0.9200665, 0, 0, 0, 1, 1,
0.003884221, -1.681854, 3.146544, 0, 0, 0, 1, 1,
0.004975278, 0.8859062, 0.4957427, 0, 0, 0, 1, 1,
0.007625553, 0.2067799, 1.178745, 1, 1, 1, 1, 1,
0.008904999, -0.05187649, 3.129365, 1, 1, 1, 1, 1,
0.01122808, -0.6120761, 2.638625, 1, 1, 1, 1, 1,
0.01188934, 0.01148549, 0.580735, 1, 1, 1, 1, 1,
0.01536671, -0.2358304, 3.02725, 1, 1, 1, 1, 1,
0.02055288, -0.04265323, 2.650606, 1, 1, 1, 1, 1,
0.02100434, 0.0192123, 0.7898526, 1, 1, 1, 1, 1,
0.02479298, 0.2614346, -0.7901281, 1, 1, 1, 1, 1,
0.02815765, 0.6663718, -0.6295151, 1, 1, 1, 1, 1,
0.02831751, 0.1431368, 0.4414561, 1, 1, 1, 1, 1,
0.02837924, 2.281515, 0.6969835, 1, 1, 1, 1, 1,
0.03006178, 1.49014, 0.6228765, 1, 1, 1, 1, 1,
0.03743999, -1.264284, 0.5899515, 1, 1, 1, 1, 1,
0.04175625, 0.1563232, -0.003545255, 1, 1, 1, 1, 1,
0.04585786, 1.14308, 0.6783499, 1, 1, 1, 1, 1,
0.04751363, -0.1853788, 1.134701, 0, 0, 1, 1, 1,
0.04914744, 0.4768173, -1.008926, 1, 0, 0, 1, 1,
0.05230312, -1.702609, 2.718351, 1, 0, 0, 1, 1,
0.05324798, 0.4350908, 0.2072748, 1, 0, 0, 1, 1,
0.05614523, -0.1889921, 3.173506, 1, 0, 0, 1, 1,
0.05731769, -0.2795402, 1.892483, 1, 0, 0, 1, 1,
0.06042199, -0.1284087, 2.75411, 0, 0, 0, 1, 1,
0.06535346, -0.1272715, 3.861707, 0, 0, 0, 1, 1,
0.06627904, 0.2586861, -0.1446141, 0, 0, 0, 1, 1,
0.06768409, 1.409568, 0.5103625, 0, 0, 0, 1, 1,
0.0697199, -1.367412, 3.46906, 0, 0, 0, 1, 1,
0.07157841, -0.8839285, 2.873239, 0, 0, 0, 1, 1,
0.07800285, -0.2427885, 2.069536, 0, 0, 0, 1, 1,
0.07921505, -1.227311, 4.841918, 1, 1, 1, 1, 1,
0.0804749, 1.259041, 1.045613, 1, 1, 1, 1, 1,
0.0812144, -0.6399246, 4.178512, 1, 1, 1, 1, 1,
0.08161465, -0.6246747, 1.77343, 1, 1, 1, 1, 1,
0.0816954, -1.148211, 3.397981, 1, 1, 1, 1, 1,
0.08212052, 2.682958, -0.173539, 1, 1, 1, 1, 1,
0.08705266, 1.2245, 0.5683712, 1, 1, 1, 1, 1,
0.0922799, -1.736611, 4.364119, 1, 1, 1, 1, 1,
0.09283864, -0.7391675, 3.170006, 1, 1, 1, 1, 1,
0.09291908, 1.139704, 1.684344, 1, 1, 1, 1, 1,
0.09362434, -1.265419, 4.653299, 1, 1, 1, 1, 1,
0.09371267, -0.2408389, 3.84171, 1, 1, 1, 1, 1,
0.09964733, 0.4534171, -0.5681633, 1, 1, 1, 1, 1,
0.1012846, -0.2359108, 3.227394, 1, 1, 1, 1, 1,
0.1018218, -0.6340441, 2.375412, 1, 1, 1, 1, 1,
0.1032755, 0.3603398, 1.986424, 0, 0, 1, 1, 1,
0.1045539, 0.9076451, -0.2772108, 1, 0, 0, 1, 1,
0.1097462, -0.842476, 1.930865, 1, 0, 0, 1, 1,
0.1145785, -2.321007, 3.327733, 1, 0, 0, 1, 1,
0.1164146, -0.038035, 3.447865, 1, 0, 0, 1, 1,
0.1169191, -0.3047261, 2.744447, 1, 0, 0, 1, 1,
0.1190762, 0.6791101, -1.903165, 0, 0, 0, 1, 1,
0.1207897, -1.666835, 3.769112, 0, 0, 0, 1, 1,
0.1212603, 1.218595, 0.176823, 0, 0, 0, 1, 1,
0.1235625, 1.413492, 0.4999579, 0, 0, 0, 1, 1,
0.1267744, -1.916781, 1.938153, 0, 0, 0, 1, 1,
0.1280625, 1.622998, 0.3125799, 0, 0, 0, 1, 1,
0.1293069, 0.1779294, 0.4298607, 0, 0, 0, 1, 1,
0.129934, 0.8151761, 1.010487, 1, 1, 1, 1, 1,
0.1300199, 0.409844, 0.4314528, 1, 1, 1, 1, 1,
0.1303189, -0.07964661, 1.854886, 1, 1, 1, 1, 1,
0.1326106, 0.7828854, 1.754714, 1, 1, 1, 1, 1,
0.1344512, 0.7249059, 0.9814168, 1, 1, 1, 1, 1,
0.1392955, -1.149621, 3.404755, 1, 1, 1, 1, 1,
0.1401513, -0.1356505, 2.605922, 1, 1, 1, 1, 1,
0.1415267, 0.02146417, 1.945143, 1, 1, 1, 1, 1,
0.1433357, 1.056813, 0.8397609, 1, 1, 1, 1, 1,
0.1434292, 0.9066279, 0.6612997, 1, 1, 1, 1, 1,
0.149765, 1.742189, -0.9274657, 1, 1, 1, 1, 1,
0.1501117, 1.986294, 1.331413, 1, 1, 1, 1, 1,
0.151988, 1.196814, -0.3712187, 1, 1, 1, 1, 1,
0.1534748, 0.6131982, -0.6201255, 1, 1, 1, 1, 1,
0.1535118, -1.532164, 4.03835, 1, 1, 1, 1, 1,
0.1586971, -2.096062, 2.97386, 0, 0, 1, 1, 1,
0.1589356, -0.248768, 3.115917, 1, 0, 0, 1, 1,
0.1608393, -0.3009252, 2.858516, 1, 0, 0, 1, 1,
0.1617541, -0.8424544, 4.096346, 1, 0, 0, 1, 1,
0.165989, -1.311032, 2.938758, 1, 0, 0, 1, 1,
0.1661545, 0.321949, 2.219201, 1, 0, 0, 1, 1,
0.1697483, -1.718116, 2.204223, 0, 0, 0, 1, 1,
0.1742258, 0.8682135, -0.3223872, 0, 0, 0, 1, 1,
0.1807708, -1.541885, 2.211131, 0, 0, 0, 1, 1,
0.185496, 0.4743006, 1.014567, 0, 0, 0, 1, 1,
0.1859037, 0.6201588, -1.976988, 0, 0, 0, 1, 1,
0.1872447, -1.030835, 2.967559, 0, 0, 0, 1, 1,
0.1892534, 1.465035, 1.529795, 0, 0, 0, 1, 1,
0.191645, 2.032894, 2.626759, 1, 1, 1, 1, 1,
0.1985539, 0.6135443, -0.02041452, 1, 1, 1, 1, 1,
0.2033539, 1.117733, -0.5164115, 1, 1, 1, 1, 1,
0.2063035, -1.077416, 3.1029, 1, 1, 1, 1, 1,
0.2115386, -0.239785, 1.989464, 1, 1, 1, 1, 1,
0.2127234, 0.9665709, 0.715362, 1, 1, 1, 1, 1,
0.2142659, 1.013804, -0.6068792, 1, 1, 1, 1, 1,
0.2228646, 0.8908544, 0.002329753, 1, 1, 1, 1, 1,
0.2239607, 0.711784, 0.02589661, 1, 1, 1, 1, 1,
0.2267097, 0.7599862, 2.088264, 1, 1, 1, 1, 1,
0.2277384, 0.6941461, 0.9851761, 1, 1, 1, 1, 1,
0.2279334, 1.241367, -0.1792069, 1, 1, 1, 1, 1,
0.2392669, 0.9636707, 0.02377876, 1, 1, 1, 1, 1,
0.240115, -0.3809772, 2.185122, 1, 1, 1, 1, 1,
0.2410975, 2.068825, 0.6770429, 1, 1, 1, 1, 1,
0.2422229, 1.552217, -0.317744, 0, 0, 1, 1, 1,
0.2450028, 1.803533, 0.6155787, 1, 0, 0, 1, 1,
0.2456212, -1.163487, 4.033578, 1, 0, 0, 1, 1,
0.2458732, 0.7263141, -0.9296131, 1, 0, 0, 1, 1,
0.247837, -0.2545316, 1.723416, 1, 0, 0, 1, 1,
0.2503453, -0.2918664, 2.387127, 1, 0, 0, 1, 1,
0.250537, -0.4604432, 3.276462, 0, 0, 0, 1, 1,
0.2519822, -0.7400436, 3.357925, 0, 0, 0, 1, 1,
0.2548846, -0.380373, 3.13364, 0, 0, 0, 1, 1,
0.2561434, 0.8260475, -0.9903075, 0, 0, 0, 1, 1,
0.2570758, 0.1306856, -0.4089982, 0, 0, 0, 1, 1,
0.2591571, 0.3036367, 0.3930114, 0, 0, 0, 1, 1,
0.2638993, -1.227872, 3.663654, 0, 0, 0, 1, 1,
0.2738419, 0.3751567, 0.9760553, 1, 1, 1, 1, 1,
0.2788026, 0.1345687, 2.137375, 1, 1, 1, 1, 1,
0.2874209, 0.3255579, 2.55313, 1, 1, 1, 1, 1,
0.2952955, 0.03968914, 2.231291, 1, 1, 1, 1, 1,
0.2954856, 1.134091, 2.048148, 1, 1, 1, 1, 1,
0.297265, 0.04095618, 1.843897, 1, 1, 1, 1, 1,
0.2973168, -2.032282, 3.981843, 1, 1, 1, 1, 1,
0.297715, -1.240357, 5.162777, 1, 1, 1, 1, 1,
0.2994902, 1.050286, 1.298025, 1, 1, 1, 1, 1,
0.3003849, 0.7042715, -0.4076459, 1, 1, 1, 1, 1,
0.3066172, 0.8328011, -0.02460665, 1, 1, 1, 1, 1,
0.3128322, -0.8780538, 2.651247, 1, 1, 1, 1, 1,
0.3210478, 0.8308177, 0.9569381, 1, 1, 1, 1, 1,
0.3217482, -0.6826693, 1.006371, 1, 1, 1, 1, 1,
0.3248142, -0.6593761, 1.828889, 1, 1, 1, 1, 1,
0.3264198, -0.1654081, 2.158578, 0, 0, 1, 1, 1,
0.3264768, -0.3226269, 2.905839, 1, 0, 0, 1, 1,
0.3273369, -0.4402068, 3.097335, 1, 0, 0, 1, 1,
0.3273655, -0.2800198, 2.742316, 1, 0, 0, 1, 1,
0.3370149, 0.4101516, 0.7957809, 1, 0, 0, 1, 1,
0.3431381, 1.81147, 1.62841, 1, 0, 0, 1, 1,
0.348408, 0.3659341, 1.102616, 0, 0, 0, 1, 1,
0.3501287, -0.5204518, 3.468429, 0, 0, 0, 1, 1,
0.35648, 0.2391703, -0.4981462, 0, 0, 0, 1, 1,
0.357037, -0.6345125, 2.383721, 0, 0, 0, 1, 1,
0.3573581, -0.9148257, 4.23456, 0, 0, 0, 1, 1,
0.3573713, 0.05391315, 0.7638892, 0, 0, 0, 1, 1,
0.3574193, -1.424777, 0.6627476, 0, 0, 0, 1, 1,
0.3612913, -1.225888, 3.317799, 1, 1, 1, 1, 1,
0.3624271, -0.3314444, 3.725472, 1, 1, 1, 1, 1,
0.3624721, 0.3583658, 0.4491348, 1, 1, 1, 1, 1,
0.3662691, 0.7143068, -0.5782893, 1, 1, 1, 1, 1,
0.3697739, -1.370362, 2.882789, 1, 1, 1, 1, 1,
0.3702088, -0.4808976, 2.465346, 1, 1, 1, 1, 1,
0.3707508, -0.6471072, 3.745085, 1, 1, 1, 1, 1,
0.3760828, 0.08643217, 1.430459, 1, 1, 1, 1, 1,
0.379378, 0.09677097, 0.8739524, 1, 1, 1, 1, 1,
0.3796481, 0.2934573, 0.7841629, 1, 1, 1, 1, 1,
0.380932, 0.3825819, 0.9146928, 1, 1, 1, 1, 1,
0.3857938, -1.293358, 2.449994, 1, 1, 1, 1, 1,
0.3860287, 0.9190567, 2.646823, 1, 1, 1, 1, 1,
0.3873726, -0.7091212, 0.8776809, 1, 1, 1, 1, 1,
0.3875255, -0.6874758, 1.212484, 1, 1, 1, 1, 1,
0.3888558, 0.05643825, 2.897291, 0, 0, 1, 1, 1,
0.3913923, 0.3983984, 1.494308, 1, 0, 0, 1, 1,
0.3974104, 1.45898, 0.5501117, 1, 0, 0, 1, 1,
0.4003199, -0.1164369, -0.1324601, 1, 0, 0, 1, 1,
0.4013581, 0.2992116, 0.8943035, 1, 0, 0, 1, 1,
0.403771, -0.1386309, 3.529707, 1, 0, 0, 1, 1,
0.4066018, -1.437418, 2.73443, 0, 0, 0, 1, 1,
0.4090992, -0.6268989, 3.200491, 0, 0, 0, 1, 1,
0.4105859, 0.4541976, -0.2099408, 0, 0, 0, 1, 1,
0.4198376, 1.02997, 2.21169, 0, 0, 0, 1, 1,
0.4211709, 0.808943, -0.9041565, 0, 0, 0, 1, 1,
0.4248815, 0.2855448, -0.1041751, 0, 0, 0, 1, 1,
0.4248833, 0.3731781, 0.009543657, 0, 0, 0, 1, 1,
0.4252429, -0.7591503, 3.359028, 1, 1, 1, 1, 1,
0.4258463, -0.8818605, 3.360848, 1, 1, 1, 1, 1,
0.4331635, -0.8088928, 0.8741786, 1, 1, 1, 1, 1,
0.4358873, -0.4658029, 2.526629, 1, 1, 1, 1, 1,
0.4400654, -1.263279, 1.897142, 1, 1, 1, 1, 1,
0.4405312, 0.5131561, 2.22879, 1, 1, 1, 1, 1,
0.4406098, -2.319811, 2.654404, 1, 1, 1, 1, 1,
0.4455517, 1.477266, 0.5746305, 1, 1, 1, 1, 1,
0.4480914, 0.9436435, 0.3559347, 1, 1, 1, 1, 1,
0.4487562, 0.3207799, 0.9402739, 1, 1, 1, 1, 1,
0.4493847, 0.4598038, 1.81323, 1, 1, 1, 1, 1,
0.4502459, -1.490429, 2.118968, 1, 1, 1, 1, 1,
0.4528036, -0.2476789, 2.411912, 1, 1, 1, 1, 1,
0.4570889, 2.335448, -0.6963176, 1, 1, 1, 1, 1,
0.458744, -0.3035023, 3.461692, 1, 1, 1, 1, 1,
0.4589383, -0.7680311, 3.01485, 0, 0, 1, 1, 1,
0.4625733, -1.832388, 3.28011, 1, 0, 0, 1, 1,
0.4642622, 1.12625, 1.419655, 1, 0, 0, 1, 1,
0.4643711, 0.8661439, 2.136909, 1, 0, 0, 1, 1,
0.468751, -0.3388916, 2.728181, 1, 0, 0, 1, 1,
0.4706691, -0.5346717, 1.548941, 1, 0, 0, 1, 1,
0.4759779, -1.037116, 3.446142, 0, 0, 0, 1, 1,
0.4763926, 0.8836127, 1.925497, 0, 0, 0, 1, 1,
0.4791185, -0.6340856, 4.67796, 0, 0, 0, 1, 1,
0.4885081, -1.295301, 0.5002922, 0, 0, 0, 1, 1,
0.4891199, 0.6023022, 0.6229256, 0, 0, 0, 1, 1,
0.4934938, 1.181347, -0.5910581, 0, 0, 0, 1, 1,
0.495438, -0.3288022, 3.477633, 0, 0, 0, 1, 1,
0.495809, 0.1009119, 2.761632, 1, 1, 1, 1, 1,
0.4973801, -0.005294445, 1.125496, 1, 1, 1, 1, 1,
0.4978423, -1.240993, 3.54102, 1, 1, 1, 1, 1,
0.49792, -0.3414502, 2.226148, 1, 1, 1, 1, 1,
0.5011665, -1.008685, 2.198147, 1, 1, 1, 1, 1,
0.5020674, 0.6439398, -1.108768, 1, 1, 1, 1, 1,
0.5030335, 0.7202805, -1.600685, 1, 1, 1, 1, 1,
0.5065136, -0.1799025, 4.982779, 1, 1, 1, 1, 1,
0.5088513, 0.2903505, 2.129628, 1, 1, 1, 1, 1,
0.509953, 1.108698, 0.1535788, 1, 1, 1, 1, 1,
0.5117919, 0.3555172, 0.1358558, 1, 1, 1, 1, 1,
0.5126184, -0.7003162, 1.244717, 1, 1, 1, 1, 1,
0.5136379, -0.6483296, 1.521769, 1, 1, 1, 1, 1,
0.5185043, 0.6575926, 0.0278521, 1, 1, 1, 1, 1,
0.5219308, -0.123318, 4.004855, 1, 1, 1, 1, 1,
0.5225425, 0.412687, 1.223768, 0, 0, 1, 1, 1,
0.5267324, 1.51793, -0.4602252, 1, 0, 0, 1, 1,
0.5294856, 0.5588036, 0.391892, 1, 0, 0, 1, 1,
0.5355427, 1.891962, 0.127474, 1, 0, 0, 1, 1,
0.5379897, 1.007429, 1.573217, 1, 0, 0, 1, 1,
0.5432877, 1.899113, -1.060842, 1, 0, 0, 1, 1,
0.5521612, 1.796997, -0.3998872, 0, 0, 0, 1, 1,
0.5527039, 0.8760905, 0.4391761, 0, 0, 0, 1, 1,
0.5534842, -1.929508, 1.596693, 0, 0, 0, 1, 1,
0.5616169, 2.012544, -0.2370948, 0, 0, 0, 1, 1,
0.5623212, 0.8011128, 0.1625002, 0, 0, 0, 1, 1,
0.5633873, 1.004807, -0.3733585, 0, 0, 0, 1, 1,
0.5639486, 0.6247228, 0.9525519, 0, 0, 0, 1, 1,
0.5648505, 0.1481277, 1.314347, 1, 1, 1, 1, 1,
0.5677775, -0.8032845, 2.59584, 1, 1, 1, 1, 1,
0.5763735, -1.742563, 3.017778, 1, 1, 1, 1, 1,
0.5803578, -0.5838993, 3.436948, 1, 1, 1, 1, 1,
0.5888406, 0.6694013, 0.9444608, 1, 1, 1, 1, 1,
0.5930701, -1.345345, 4.551649, 1, 1, 1, 1, 1,
0.5969723, -0.1575095, 0.6265534, 1, 1, 1, 1, 1,
0.5976711, 0.6140585, 0.8463718, 1, 1, 1, 1, 1,
0.5984151, -0.4367729, 1.596746, 1, 1, 1, 1, 1,
0.6002689, 0.8352524, 0.8589108, 1, 1, 1, 1, 1,
0.6016645, 1.080991, 0.8659532, 1, 1, 1, 1, 1,
0.6019139, 0.08719007, 2.339025, 1, 1, 1, 1, 1,
0.608479, 1.271975, -0.8280011, 1, 1, 1, 1, 1,
0.6094359, 1.045842, -0.3860422, 1, 1, 1, 1, 1,
0.6103139, 0.03606983, 2.574818, 1, 1, 1, 1, 1,
0.6196674, 0.6294924, 0.3761588, 0, 0, 1, 1, 1,
0.6270175, 0.9405702, 2.175072, 1, 0, 0, 1, 1,
0.6274119, -0.2447033, 2.810777, 1, 0, 0, 1, 1,
0.6276619, 0.3831012, 1.442037, 1, 0, 0, 1, 1,
0.6289679, -0.4723004, 2.987983, 1, 0, 0, 1, 1,
0.6290314, 0.6276065, -0.424015, 1, 0, 0, 1, 1,
0.6353288, 1.297606, -0.2933915, 0, 0, 0, 1, 1,
0.6413629, -2.41157, 3.071712, 0, 0, 0, 1, 1,
0.6431584, 1.334773, 0.7568899, 0, 0, 0, 1, 1,
0.6445186, 2.110204, -0.3337114, 0, 0, 0, 1, 1,
0.6490417, 0.2635671, 1.830742, 0, 0, 0, 1, 1,
0.6552768, 0.5818795, 1.479439, 0, 0, 0, 1, 1,
0.6604849, -0.02453898, 2.811882, 0, 0, 0, 1, 1,
0.6680077, -0.4646932, 3.116739, 1, 1, 1, 1, 1,
0.6732671, 0.7842278, 1.480366, 1, 1, 1, 1, 1,
0.6767518, -2.219313, 4.121747, 1, 1, 1, 1, 1,
0.6775458, 3.901141, -1.388696, 1, 1, 1, 1, 1,
0.680675, -0.3951044, -0.7438189, 1, 1, 1, 1, 1,
0.6812484, 0.805976, -0.1441623, 1, 1, 1, 1, 1,
0.682557, 1.472012, -0.6605335, 1, 1, 1, 1, 1,
0.6952465, 1.116372, 2.129457, 1, 1, 1, 1, 1,
0.6968889, -0.3788897, 2.562737, 1, 1, 1, 1, 1,
0.6971422, 1.628087, -1.646003, 1, 1, 1, 1, 1,
0.6975734, -0.5266398, 0.1230435, 1, 1, 1, 1, 1,
0.6989626, 0.2294816, 1.83718, 1, 1, 1, 1, 1,
0.7001699, 1.57757, 1.754383, 1, 1, 1, 1, 1,
0.7057763, 0.2318038, 0.4684658, 1, 1, 1, 1, 1,
0.707133, 0.7921166, -0.2948078, 1, 1, 1, 1, 1,
0.7110787, -1.13617, 1.95681, 0, 0, 1, 1, 1,
0.7155362, 0.09587441, 1.416447, 1, 0, 0, 1, 1,
0.7198477, 1.558579, -0.08167579, 1, 0, 0, 1, 1,
0.733452, 0.4278073, 0.4674394, 1, 0, 0, 1, 1,
0.7348911, -0.1577094, 0.7294615, 1, 0, 0, 1, 1,
0.7414696, -1.324217, 2.781424, 1, 0, 0, 1, 1,
0.7464873, 0.09930705, 0.2701361, 0, 0, 0, 1, 1,
0.7484086, 0.5044879, 0.5119726, 0, 0, 0, 1, 1,
0.7495269, -1.186479, 2.182312, 0, 0, 0, 1, 1,
0.750939, 1.186366, 1.201061, 0, 0, 0, 1, 1,
0.7623361, 0.1194894, 1.736206, 0, 0, 0, 1, 1,
0.7623469, -0.5701935, 2.298741, 0, 0, 0, 1, 1,
0.7658453, 0.7004198, 0.5863755, 0, 0, 0, 1, 1,
0.7665755, -0.598004, 3.008915, 1, 1, 1, 1, 1,
0.7671496, -0.6342196, 3.349653, 1, 1, 1, 1, 1,
0.7691445, 0.3551582, 1.665308, 1, 1, 1, 1, 1,
0.7700744, 0.3246731, 1.012973, 1, 1, 1, 1, 1,
0.7703384, 0.6219465, 1.734307, 1, 1, 1, 1, 1,
0.7729115, 0.1190987, 0.7546831, 1, 1, 1, 1, 1,
0.7729246, -0.7952634, 1.452068, 1, 1, 1, 1, 1,
0.7739686, -0.1953606, -0.340699, 1, 1, 1, 1, 1,
0.7761493, -0.2370212, 0.7641826, 1, 1, 1, 1, 1,
0.7785667, 0.9257476, -0.4723704, 1, 1, 1, 1, 1,
0.7788529, -0.6153535, 1.552914, 1, 1, 1, 1, 1,
0.7799386, -0.1632837, 1.257474, 1, 1, 1, 1, 1,
0.7879897, -0.2032884, 2.269319, 1, 1, 1, 1, 1,
0.791025, 0.7065493, 0.1147096, 1, 1, 1, 1, 1,
0.8028888, -0.4240575, 2.429951, 1, 1, 1, 1, 1,
0.8095083, -0.4454328, 2.731618, 0, 0, 1, 1, 1,
0.8128416, 0.1891099, 0.5074027, 1, 0, 0, 1, 1,
0.8156113, -0.6730763, 2.596151, 1, 0, 0, 1, 1,
0.815948, -0.8565862, 3.506657, 1, 0, 0, 1, 1,
0.8208219, -0.3692847, 3.506785, 1, 0, 0, 1, 1,
0.8219686, -0.1633415, 0.9401206, 1, 0, 0, 1, 1,
0.8227289, 0.1440131, 0.1286628, 0, 0, 0, 1, 1,
0.8265601, -2.141283, 2.538068, 0, 0, 0, 1, 1,
0.8316465, 0.209502, 2.937287, 0, 0, 0, 1, 1,
0.831929, -1.647977, 1.829621, 0, 0, 0, 1, 1,
0.8361902, 0.1146075, 3.17371, 0, 0, 0, 1, 1,
0.8368499, 0.1232239, 1.162915, 0, 0, 0, 1, 1,
0.8394353, 2.606825, -0.8437388, 0, 0, 0, 1, 1,
0.8403577, 0.1838415, 1.992123, 1, 1, 1, 1, 1,
0.8409119, -0.2706191, 2.358231, 1, 1, 1, 1, 1,
0.8438249, 1.024721, 1.400429, 1, 1, 1, 1, 1,
0.8443242, 0.3017426, 1.314815, 1, 1, 1, 1, 1,
0.8554344, 0.07314266, 1.331574, 1, 1, 1, 1, 1,
0.8564255, -1.008021, 2.129468, 1, 1, 1, 1, 1,
0.8636, -3.061904, 3.498026, 1, 1, 1, 1, 1,
0.8667102, 1.495876, 2.362219, 1, 1, 1, 1, 1,
0.8726481, -0.4632366, 3.42812, 1, 1, 1, 1, 1,
0.8743879, 0.06055949, 0.6948917, 1, 1, 1, 1, 1,
0.8767639, 0.2963241, 2.899423, 1, 1, 1, 1, 1,
0.876774, -0.826461, 3.057872, 1, 1, 1, 1, 1,
0.8793859, -1.221599, 3.02611, 1, 1, 1, 1, 1,
0.8795226, 0.7537025, 0.3685593, 1, 1, 1, 1, 1,
0.8848081, 0.3907246, 1.040071, 1, 1, 1, 1, 1,
0.8908116, -0.084048, 0.9575163, 0, 0, 1, 1, 1,
0.8913335, -0.04325537, -0.05617617, 1, 0, 0, 1, 1,
0.8914671, -0.9587309, 3.652217, 1, 0, 0, 1, 1,
0.8959839, 0.1271512, 1.850231, 1, 0, 0, 1, 1,
0.8964105, 1.299264, -0.1356295, 1, 0, 0, 1, 1,
0.8980205, -0.6202198, 3.233064, 1, 0, 0, 1, 1,
0.9014687, -1.416336, 3.68739, 0, 0, 0, 1, 1,
0.9079118, -0.5735304, 1.533874, 0, 0, 0, 1, 1,
0.9101136, -0.6742, 0.5618201, 0, 0, 0, 1, 1,
0.9141654, 0.09170763, 1.977442, 0, 0, 0, 1, 1,
0.9164026, 3.176422, -0.6541529, 0, 0, 0, 1, 1,
0.9214141, 2.000927, 1.65465, 0, 0, 0, 1, 1,
0.9230383, -0.2027574, 2.497043, 0, 0, 0, 1, 1,
0.9242761, -1.294302, 2.267425, 1, 1, 1, 1, 1,
0.9266443, 0.1730365, 3.126426, 1, 1, 1, 1, 1,
0.9277459, -1.196293, 2.961439, 1, 1, 1, 1, 1,
0.9347107, 0.3094349, -0.05290711, 1, 1, 1, 1, 1,
0.9363104, 0.01029001, 0.5566517, 1, 1, 1, 1, 1,
0.9374552, -0.4746756, 1.49264, 1, 1, 1, 1, 1,
0.9398029, 0.03257019, 0.6829346, 1, 1, 1, 1, 1,
0.9407251, -1.730947, 3.091485, 1, 1, 1, 1, 1,
0.9466404, 0.8325493, -1.478054, 1, 1, 1, 1, 1,
0.9484564, -1.472973, 1.215016, 1, 1, 1, 1, 1,
0.9510866, 1.472909, 3.177568, 1, 1, 1, 1, 1,
0.9513232, 1.102533, 0.7189542, 1, 1, 1, 1, 1,
0.9554965, -0.6779986, 4.217193, 1, 1, 1, 1, 1,
0.9610981, 0.12055, 0.6546771, 1, 1, 1, 1, 1,
0.9639649, 0.3398735, 0.3866671, 1, 1, 1, 1, 1,
0.9691899, -0.5651276, 1.095805, 0, 0, 1, 1, 1,
0.9695217, 0.8569573, 1.155436, 1, 0, 0, 1, 1,
0.981409, -0.07976235, 1.029466, 1, 0, 0, 1, 1,
0.9903544, -1.463008, 2.558414, 1, 0, 0, 1, 1,
1.005077, -0.11451, 0.483213, 1, 0, 0, 1, 1,
1.005369, 0.2489173, 0.8911039, 1, 0, 0, 1, 1,
1.015058, -0.9023617, 1.402048, 0, 0, 0, 1, 1,
1.018113, -1.280966, 2.242469, 0, 0, 0, 1, 1,
1.021788, -1.777491, 1.367078, 0, 0, 0, 1, 1,
1.03197, -0.4840578, 2.760541, 0, 0, 0, 1, 1,
1.036015, -0.5253526, 1.813911, 0, 0, 0, 1, 1,
1.042473, -1.485108, 3.595534, 0, 0, 0, 1, 1,
1.045743, -1.76406, 3.216052, 0, 0, 0, 1, 1,
1.061033, 1.012887, 1.321667, 1, 1, 1, 1, 1,
1.062811, 0.06467307, 1.288804, 1, 1, 1, 1, 1,
1.065304, 2.419088, -0.7298304, 1, 1, 1, 1, 1,
1.070607, -1.03858, 3.517613, 1, 1, 1, 1, 1,
1.072433, -0.8255195, 2.575195, 1, 1, 1, 1, 1,
1.085229, -0.4861892, 1.301873, 1, 1, 1, 1, 1,
1.086146, -1.123023, 2.954861, 1, 1, 1, 1, 1,
1.098808, -0.1276067, 1.072408, 1, 1, 1, 1, 1,
1.099146, -0.003485704, 0.9129139, 1, 1, 1, 1, 1,
1.10241, 0.1589964, 0.5659755, 1, 1, 1, 1, 1,
1.105283, 0.5707657, 0.4399669, 1, 1, 1, 1, 1,
1.105471, 2.607916, -0.2582592, 1, 1, 1, 1, 1,
1.107955, -1.016915, 2.549258, 1, 1, 1, 1, 1,
1.108303, -0.2166796, 1.089715, 1, 1, 1, 1, 1,
1.114325, 0.2967815, 1.693974, 1, 1, 1, 1, 1,
1.116357, 0.06359131, 0.1964375, 0, 0, 1, 1, 1,
1.11998, 0.2271118, 1.514594, 1, 0, 0, 1, 1,
1.124726, -0.1351198, 1.578065, 1, 0, 0, 1, 1,
1.125573, -0.4716727, 0.8368062, 1, 0, 0, 1, 1,
1.127904, 0.122697, 2.197675, 1, 0, 0, 1, 1,
1.129732, 0.5066489, 0.3531291, 1, 0, 0, 1, 1,
1.1299, -1.136064, 3.094517, 0, 0, 0, 1, 1,
1.133242, 0.600301, -0.3613711, 0, 0, 0, 1, 1,
1.149808, 0.7208007, 1.124402, 0, 0, 0, 1, 1,
1.157583, 0.6906546, 0.3780943, 0, 0, 0, 1, 1,
1.165411, 1.024036, 1.04404, 0, 0, 0, 1, 1,
1.17286, 0.1985056, 1.119851, 0, 0, 0, 1, 1,
1.174852, -1.31046, 3.088589, 0, 0, 0, 1, 1,
1.181151, -0.1962258, -0.1991535, 1, 1, 1, 1, 1,
1.186831, 0.9903932, 1.933275, 1, 1, 1, 1, 1,
1.196147, -1.602434, 1.494397, 1, 1, 1, 1, 1,
1.204133, -0.9858658, 4.068359, 1, 1, 1, 1, 1,
1.207349, 1.210917, 1.055681, 1, 1, 1, 1, 1,
1.213004, -0.311823, 3.064368, 1, 1, 1, 1, 1,
1.216672, 1.029953, 1.090818, 1, 1, 1, 1, 1,
1.231674, -0.09370185, 1.696906, 1, 1, 1, 1, 1,
1.235034, 0.7387052, 2.266556, 1, 1, 1, 1, 1,
1.235987, -0.9256921, 2.748291, 1, 1, 1, 1, 1,
1.237494, 0.5660584, 1.630912, 1, 1, 1, 1, 1,
1.240921, 1.684677, 0.4335488, 1, 1, 1, 1, 1,
1.24184, -0.3400514, -0.0532467, 1, 1, 1, 1, 1,
1.245147, -0.2635961, 1.762368, 1, 1, 1, 1, 1,
1.248314, -0.9405286, 3.784945, 1, 1, 1, 1, 1,
1.248712, -0.5406113, 3.318844, 0, 0, 1, 1, 1,
1.250925, 1.526198, 1.325879, 1, 0, 0, 1, 1,
1.253532, 1.282932, 1.27279, 1, 0, 0, 1, 1,
1.254283, 0.7443296, 0.96775, 1, 0, 0, 1, 1,
1.259846, -0.6463757, 2.597095, 1, 0, 0, 1, 1,
1.265622, -0.2941423, 0.9812943, 1, 0, 0, 1, 1,
1.265854, -0.8479728, 1.912222, 0, 0, 0, 1, 1,
1.269921, -1.616975, 1.812739, 0, 0, 0, 1, 1,
1.273496, 0.7819469, -0.242304, 0, 0, 0, 1, 1,
1.275399, -1.037209, 3.242978, 0, 0, 0, 1, 1,
1.280058, 1.698149, 1.092273, 0, 0, 0, 1, 1,
1.280846, 0.5609872, -0.006051852, 0, 0, 0, 1, 1,
1.284512, -0.08440427, 0.8911392, 0, 0, 0, 1, 1,
1.285551, 0.4105664, 1.003938, 1, 1, 1, 1, 1,
1.286002, 0.3353987, 1.875428, 1, 1, 1, 1, 1,
1.294883, 1.110411, -0.4295962, 1, 1, 1, 1, 1,
1.295001, 0.9877077, 0.5295961, 1, 1, 1, 1, 1,
1.295453, 0.3510635, -0.5257172, 1, 1, 1, 1, 1,
1.298672, 0.5176696, 0.3663604, 1, 1, 1, 1, 1,
1.299794, 1.014165, 1.28956, 1, 1, 1, 1, 1,
1.304983, -1.055603, 2.004956, 1, 1, 1, 1, 1,
1.306984, 0.7622461, 1.17732, 1, 1, 1, 1, 1,
1.311473, 0.2183082, 0.4554703, 1, 1, 1, 1, 1,
1.312145, 1.442241, -0.9220739, 1, 1, 1, 1, 1,
1.318719, -0.6506649, 2.623414, 1, 1, 1, 1, 1,
1.323001, 0.234673, 1.770724, 1, 1, 1, 1, 1,
1.328121, 0.03651598, 2.232733, 1, 1, 1, 1, 1,
1.349761, 1.188682, -1.041661, 1, 1, 1, 1, 1,
1.352555, -1.493323, 2.796327, 0, 0, 1, 1, 1,
1.362743, 1.494952, 1.494029, 1, 0, 0, 1, 1,
1.367428, -0.5814011, 2.641351, 1, 0, 0, 1, 1,
1.389775, -1.187803, 2.988157, 1, 0, 0, 1, 1,
1.390164, 1.382506, -0.574623, 1, 0, 0, 1, 1,
1.403088, 1.736124, -0.006702635, 1, 0, 0, 1, 1,
1.404517, 1.015118, 0.8480328, 0, 0, 0, 1, 1,
1.408334, -1.266195, 2.775431, 0, 0, 0, 1, 1,
1.416751, -0.554028, 2.564016, 0, 0, 0, 1, 1,
1.41702, 1.028522, 0.8732039, 0, 0, 0, 1, 1,
1.417244, 1.552648, 1.012857, 0, 0, 0, 1, 1,
1.438813, -0.3881029, 3.123431, 0, 0, 0, 1, 1,
1.453124, -0.157845, 0.5805424, 0, 0, 0, 1, 1,
1.458161, -1.605379, 1.527226, 1, 1, 1, 1, 1,
1.472098, 0.6503854, 2.588413, 1, 1, 1, 1, 1,
1.47315, -0.7806883, 1.874536, 1, 1, 1, 1, 1,
1.479676, 1.010496, 0.704293, 1, 1, 1, 1, 1,
1.481317, -0.4521483, 2.306743, 1, 1, 1, 1, 1,
1.487748, -0.2474387, 1.939849, 1, 1, 1, 1, 1,
1.488488, -0.7250859, 0.3616747, 1, 1, 1, 1, 1,
1.488714, 0.6253206, 2.57649, 1, 1, 1, 1, 1,
1.518136, 1.759421, -0.1253805, 1, 1, 1, 1, 1,
1.518566, -0.264577, 2.413883, 1, 1, 1, 1, 1,
1.532977, 0.03554674, 0.6272743, 1, 1, 1, 1, 1,
1.535093, -0.6911205, 0.5894501, 1, 1, 1, 1, 1,
1.548399, -0.366074, 1.607756, 1, 1, 1, 1, 1,
1.550844, 0.02056169, 0.7998471, 1, 1, 1, 1, 1,
1.609976, 0.9202864, 1.63405, 1, 1, 1, 1, 1,
1.61294, -0.8466663, 2.477042, 0, 0, 1, 1, 1,
1.627118, 1.598576, 1.811514, 1, 0, 0, 1, 1,
1.630404, -0.591632, 1.642525, 1, 0, 0, 1, 1,
1.630781, 1.567255, -0.5116009, 1, 0, 0, 1, 1,
1.631629, -0.6692578, -0.2516159, 1, 0, 0, 1, 1,
1.638011, -0.5706473, 0.8592695, 1, 0, 0, 1, 1,
1.650838, -1.503704, 2.86735, 0, 0, 0, 1, 1,
1.653533, -0.7941326, 1.106944, 0, 0, 0, 1, 1,
1.659826, -0.5891733, 2.954684, 0, 0, 0, 1, 1,
1.672724, -2.343001, 3.403879, 0, 0, 0, 1, 1,
1.679571, -0.1402278, 1.327986, 0, 0, 0, 1, 1,
1.681011, 0.6805551, 0.9822836, 0, 0, 0, 1, 1,
1.687444, 0.1411744, 1.100098, 0, 0, 0, 1, 1,
1.688221, 0.2780964, -3.050952, 1, 1, 1, 1, 1,
1.690726, 0.2245207, 0.4055366, 1, 1, 1, 1, 1,
1.71125, -1.221481, 2.690048, 1, 1, 1, 1, 1,
1.711519, -0.4035728, 2.33785, 1, 1, 1, 1, 1,
1.713966, 0.7449042, -0.7207074, 1, 1, 1, 1, 1,
1.755133, -1.246327, 0.944337, 1, 1, 1, 1, 1,
1.759926, 1.150523, 1.425544, 1, 1, 1, 1, 1,
1.766177, -0.1936674, 2.751212, 1, 1, 1, 1, 1,
1.778054, -0.4065376, 1.836997, 1, 1, 1, 1, 1,
1.827725, -1.740635, 2.506756, 1, 1, 1, 1, 1,
1.857777, 1.432889, 2.933534, 1, 1, 1, 1, 1,
1.876715, 0.5127497, 0.4558396, 1, 1, 1, 1, 1,
1.879433, -0.5948814, 1.367203, 1, 1, 1, 1, 1,
1.906536, -0.5508341, 2.414809, 1, 1, 1, 1, 1,
1.910549, 0.6006219, 1.178512, 1, 1, 1, 1, 1,
2.020246, -1.411628, 2.590607, 0, 0, 1, 1, 1,
2.038587, 0.6063031, 1.659898, 1, 0, 0, 1, 1,
2.046247, -0.5502099, 1.97463, 1, 0, 0, 1, 1,
2.154699, -1.753068, 2.499724, 1, 0, 0, 1, 1,
2.193542, 0.2380208, 1.531256, 1, 0, 0, 1, 1,
2.212034, -0.4120917, 1.290647, 1, 0, 0, 1, 1,
2.219505, 0.2964442, -0.578927, 0, 0, 0, 1, 1,
2.279926, -1.148679, 1.348054, 0, 0, 0, 1, 1,
2.281959, 1.214372, 0.8793834, 0, 0, 0, 1, 1,
2.287601, 0.5954211, 0.4702966, 0, 0, 0, 1, 1,
2.302024, -1.548932, 2.574566, 0, 0, 0, 1, 1,
2.400063, 1.863943, 1.317371, 0, 0, 0, 1, 1,
2.41162, 1.411091, -0.09026285, 0, 0, 0, 1, 1,
2.463245, -2.544598, 1.512835, 1, 1, 1, 1, 1,
2.549184, -0.4730914, 0.3607927, 1, 1, 1, 1, 1,
2.575874, 1.669357, 0.4357545, 1, 1, 1, 1, 1,
2.579808, 1.613887, 1.238544, 1, 1, 1, 1, 1,
2.768174, -1.212086, 0.6385184, 1, 1, 1, 1, 1,
3.057815, 0.1601517, 2.912384, 1, 1, 1, 1, 1,
3.720623, 1.157274, 1.502773, 1, 1, 1, 1, 1
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
var radius = 9.847205;
var distance = 34.58789;
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
mvMatrix.translate( 0.06523228, -0.4196186, -0.06770325 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.58789);
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
