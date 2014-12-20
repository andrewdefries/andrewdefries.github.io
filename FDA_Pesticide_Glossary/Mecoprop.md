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
-2.675587, 0.277144, -2.630422, 1, 0, 0, 1,
-2.607077, 1.216805, -1.404525, 1, 0.007843138, 0, 1,
-2.558197, -0.3451634, -2.154081, 1, 0.01176471, 0, 1,
-2.429708, 0.04701039, -0.8737866, 1, 0.01960784, 0, 1,
-2.415755, 1.228824, -1.814192, 1, 0.02352941, 0, 1,
-2.2287, -1.180117, -2.459347, 1, 0.03137255, 0, 1,
-2.176196, -1.214697, -2.076841, 1, 0.03529412, 0, 1,
-2.167645, 0.9518825, -1.344292, 1, 0.04313726, 0, 1,
-2.158929, 0.9809971, -0.4887128, 1, 0.04705882, 0, 1,
-2.117223, -0.6400807, -1.743417, 1, 0.05490196, 0, 1,
-2.06734, -0.7828393, -3.268064, 1, 0.05882353, 0, 1,
-2.048111, 1.002398, -0.9617501, 1, 0.06666667, 0, 1,
-2.028043, -0.1886809, -3.178147, 1, 0.07058824, 0, 1,
-1.999643, -0.4898845, -1.666476, 1, 0.07843138, 0, 1,
-1.984533, 0.7653548, -1.384396, 1, 0.08235294, 0, 1,
-1.977706, -0.05818355, -1.672575, 1, 0.09019608, 0, 1,
-1.970936, 1.37481, -2.21704, 1, 0.09411765, 0, 1,
-1.968783, -0.7109761, -1.962437, 1, 0.1019608, 0, 1,
-1.95513, 1.098772, -0.393896, 1, 0.1098039, 0, 1,
-1.951962, 0.1103608, -2.465419, 1, 0.1137255, 0, 1,
-1.949411, 0.1363388, -2.340191, 1, 0.1215686, 0, 1,
-1.929344, -1.12237, -2.354216, 1, 0.1254902, 0, 1,
-1.924791, -1.715554, -1.801146, 1, 0.1333333, 0, 1,
-1.875773, 0.545336, -3.361278, 1, 0.1372549, 0, 1,
-1.874382, -0.5679758, -3.330301, 1, 0.145098, 0, 1,
-1.855859, -0.6674294, -1.360177, 1, 0.1490196, 0, 1,
-1.851051, -0.205861, -2.392219, 1, 0.1568628, 0, 1,
-1.819243, -0.1370225, -3.302463, 1, 0.1607843, 0, 1,
-1.789368, -1.336973, -2.231787, 1, 0.1686275, 0, 1,
-1.786533, -0.3513802, -2.829789, 1, 0.172549, 0, 1,
-1.778194, -0.02853806, -2.972296, 1, 0.1803922, 0, 1,
-1.76949, -0.9836364, -2.733411, 1, 0.1843137, 0, 1,
-1.745549, -0.1597393, -0.774035, 1, 0.1921569, 0, 1,
-1.739568, 1.151375, -0.767551, 1, 0.1960784, 0, 1,
-1.727022, 0.3536744, -1.712239, 1, 0.2039216, 0, 1,
-1.696647, -1.315776, -3.059179, 1, 0.2117647, 0, 1,
-1.686052, 0.1964118, -0.3736531, 1, 0.2156863, 0, 1,
-1.68564, -0.4751834, -0.5369387, 1, 0.2235294, 0, 1,
-1.666691, 0.3163681, -0.605881, 1, 0.227451, 0, 1,
-1.666202, -0.7073587, -2.012511, 1, 0.2352941, 0, 1,
-1.663996, 0.9473819, 0.4337404, 1, 0.2392157, 0, 1,
-1.659295, -0.7080893, -1.275881, 1, 0.2470588, 0, 1,
-1.658253, -0.1265486, -2.306248, 1, 0.2509804, 0, 1,
-1.652281, 1.297441, -0.9730915, 1, 0.2588235, 0, 1,
-1.626315, -0.8029786, -2.525052, 1, 0.2627451, 0, 1,
-1.618295, -1.046022, -0.3908871, 1, 0.2705882, 0, 1,
-1.615212, 0.2003235, -2.763828, 1, 0.2745098, 0, 1,
-1.609252, 0.2808101, -1.881681, 1, 0.282353, 0, 1,
-1.606969, -1.692079, -2.694906, 1, 0.2862745, 0, 1,
-1.604048, -1.046661, -2.835904, 1, 0.2941177, 0, 1,
-1.593046, -1.876033, -2.032197, 1, 0.3019608, 0, 1,
-1.586696, 0.9535115, -1.396681, 1, 0.3058824, 0, 1,
-1.578928, -0.2710403, -1.784712, 1, 0.3137255, 0, 1,
-1.544326, -2.697423, -3.7198, 1, 0.3176471, 0, 1,
-1.537218, -0.6908997, -2.97571, 1, 0.3254902, 0, 1,
-1.535866, -0.7936527, -1.497961, 1, 0.3294118, 0, 1,
-1.529312, -0.2667133, -1.953837, 1, 0.3372549, 0, 1,
-1.525652, 0.6475938, 0.09208533, 1, 0.3411765, 0, 1,
-1.52293, -0.7116515, -1.645437, 1, 0.3490196, 0, 1,
-1.516851, 0.8862805, -0.9337065, 1, 0.3529412, 0, 1,
-1.513828, 1.35404, -0.4609944, 1, 0.3607843, 0, 1,
-1.513362, 0.0002319899, -1.463947, 1, 0.3647059, 0, 1,
-1.512606, -1.560195, -2.030011, 1, 0.372549, 0, 1,
-1.510908, 0.5842183, -0.7373674, 1, 0.3764706, 0, 1,
-1.493134, 1.314694, -1.009832, 1, 0.3843137, 0, 1,
-1.486138, -0.4531982, -1.82754, 1, 0.3882353, 0, 1,
-1.484752, 0.7399686, -1.52647, 1, 0.3960784, 0, 1,
-1.482799, 1.701308, -1.45037, 1, 0.4039216, 0, 1,
-1.458498, 0.674458, -2.599707, 1, 0.4078431, 0, 1,
-1.444876, -0.7884884, -2.74472, 1, 0.4156863, 0, 1,
-1.444838, 0.6953641, -1.019867, 1, 0.4196078, 0, 1,
-1.44215, 0.3537025, -0.8707366, 1, 0.427451, 0, 1,
-1.432251, -0.4990129, 0.0006523127, 1, 0.4313726, 0, 1,
-1.428171, -0.3547643, -1.006881, 1, 0.4392157, 0, 1,
-1.42739, 0.5338646, -2.44437, 1, 0.4431373, 0, 1,
-1.423777, -0.659227, -2.67714, 1, 0.4509804, 0, 1,
-1.407042, 0.006882509, -1.425896, 1, 0.454902, 0, 1,
-1.406573, 1.083434, 0.1370895, 1, 0.4627451, 0, 1,
-1.400561, -0.3640832, -3.030833, 1, 0.4666667, 0, 1,
-1.395442, 0.03449561, -0.8679352, 1, 0.4745098, 0, 1,
-1.386179, 0.4621121, -2.401242, 1, 0.4784314, 0, 1,
-1.383681, -2.057648, -2.348864, 1, 0.4862745, 0, 1,
-1.378587, 0.3552749, -0.4203526, 1, 0.4901961, 0, 1,
-1.372818, -0.3375054, -1.578563, 1, 0.4980392, 0, 1,
-1.371641, -1.243321, -1.426214, 1, 0.5058824, 0, 1,
-1.365239, 0.2123068, -2.620085, 1, 0.509804, 0, 1,
-1.357033, 0.4770395, -0.7575052, 1, 0.5176471, 0, 1,
-1.354294, -1.058162, -2.465662, 1, 0.5215687, 0, 1,
-1.343131, 0.8225556, -0.06269384, 1, 0.5294118, 0, 1,
-1.334695, 0.888234, -0.6834905, 1, 0.5333334, 0, 1,
-1.32586, 0.1606522, -0.4064244, 1, 0.5411765, 0, 1,
-1.319657, 0.6165795, -1.283841, 1, 0.5450981, 0, 1,
-1.312976, -0.9108311, -0.8855477, 1, 0.5529412, 0, 1,
-1.308026, -0.6493029, -1.619711, 1, 0.5568628, 0, 1,
-1.304476, -1.513173, -2.16977, 1, 0.5647059, 0, 1,
-1.302033, 0.8551242, -0.6331212, 1, 0.5686275, 0, 1,
-1.289139, 1.047141, -2.094706, 1, 0.5764706, 0, 1,
-1.288191, 0.9588045, 0.2173394, 1, 0.5803922, 0, 1,
-1.288081, -1.070063, -3.209744, 1, 0.5882353, 0, 1,
-1.284244, -1.935768, -1.585194, 1, 0.5921569, 0, 1,
-1.282437, 0.3409065, -1.024752, 1, 0.6, 0, 1,
-1.271741, -0.5767206, -0.4604665, 1, 0.6078432, 0, 1,
-1.256728, 0.5192522, -0.2073594, 1, 0.6117647, 0, 1,
-1.254174, 0.205061, -1.656222, 1, 0.6196079, 0, 1,
-1.251554, 0.4068628, -0.9462893, 1, 0.6235294, 0, 1,
-1.251009, -2.32082, -1.864917, 1, 0.6313726, 0, 1,
-1.248116, -0.1173842, -1.178379, 1, 0.6352941, 0, 1,
-1.24208, 1.209174, -0.8628539, 1, 0.6431373, 0, 1,
-1.236634, 0.281468, -1.421954, 1, 0.6470588, 0, 1,
-1.230838, -0.7485649, -2.106996, 1, 0.654902, 0, 1,
-1.230054, -1.879987, -0.4591523, 1, 0.6588235, 0, 1,
-1.226599, 0.8769435, -1.315302, 1, 0.6666667, 0, 1,
-1.218016, 0.09000146, -0.4113308, 1, 0.6705883, 0, 1,
-1.210732, -0.4198707, -3.924144, 1, 0.6784314, 0, 1,
-1.207483, -0.03147969, -1.092726, 1, 0.682353, 0, 1,
-1.205606, 0.07682244, -0.6174359, 1, 0.6901961, 0, 1,
-1.204431, -0.8046766, -0.810355, 1, 0.6941177, 0, 1,
-1.203404, -0.8451385, -1.420305, 1, 0.7019608, 0, 1,
-1.198556, 0.7909381, -0.9595178, 1, 0.7098039, 0, 1,
-1.194854, -0.9292659, -3.820668, 1, 0.7137255, 0, 1,
-1.18885, 0.6146069, -2.724076, 1, 0.7215686, 0, 1,
-1.185237, 0.6696656, 0.9737386, 1, 0.7254902, 0, 1,
-1.184481, 0.9416728, 1.112608, 1, 0.7333333, 0, 1,
-1.176894, -2.280083, -2.039753, 1, 0.7372549, 0, 1,
-1.170897, 0.1199666, -1.387363, 1, 0.7450981, 0, 1,
-1.162258, 0.5552007, -0.2499496, 1, 0.7490196, 0, 1,
-1.152048, -1.26517, -1.467652, 1, 0.7568628, 0, 1,
-1.150817, -1.903062, -0.5207623, 1, 0.7607843, 0, 1,
-1.150118, -2.613978, -3.233023, 1, 0.7686275, 0, 1,
-1.139239, -1.482799, -3.791125, 1, 0.772549, 0, 1,
-1.128915, -0.5928038, -1.732121, 1, 0.7803922, 0, 1,
-1.126571, 0.1752383, -3.094491, 1, 0.7843137, 0, 1,
-1.126215, -0.3659055, -2.808334, 1, 0.7921569, 0, 1,
-1.103214, 0.720786, -1.260464, 1, 0.7960784, 0, 1,
-1.102312, -0.07116091, -3.967396, 1, 0.8039216, 0, 1,
-1.101689, -0.8594063, -2.325308, 1, 0.8117647, 0, 1,
-1.1016, 0.4269144, 0.8387309, 1, 0.8156863, 0, 1,
-1.100611, -0.2156817, -0.8720838, 1, 0.8235294, 0, 1,
-1.098988, 0.3384201, -2.093717, 1, 0.827451, 0, 1,
-1.093403, -0.01024259, -0.489318, 1, 0.8352941, 0, 1,
-1.090868, -0.6164464, -1.149601, 1, 0.8392157, 0, 1,
-1.077461, 0.2536593, -2.511484, 1, 0.8470588, 0, 1,
-1.069156, 0.5878242, 0.1775567, 1, 0.8509804, 0, 1,
-1.067044, -0.1623674, -1.60695, 1, 0.8588235, 0, 1,
-1.065255, -0.7407004, -4.183778, 1, 0.8627451, 0, 1,
-1.059666, 0.7219833, -0.7685251, 1, 0.8705882, 0, 1,
-1.054696, 0.3060371, -1.169173, 1, 0.8745098, 0, 1,
-1.052327, 0.3793809, -2.336448, 1, 0.8823529, 0, 1,
-1.05047, -1.111119, -1.222194, 1, 0.8862745, 0, 1,
-1.049172, -0.5821881, -3.375729, 1, 0.8941177, 0, 1,
-1.039551, -0.9502774, -2.366278, 1, 0.8980392, 0, 1,
-1.034872, 0.2314724, -0.5261183, 1, 0.9058824, 0, 1,
-1.034843, 1.037359, -0.788222, 1, 0.9137255, 0, 1,
-1.03347, -1.595057, -2.699868, 1, 0.9176471, 0, 1,
-1.02125, 1.803514, -1.3697, 1, 0.9254902, 0, 1,
-1.017934, 0.4683183, -1.69415, 1, 0.9294118, 0, 1,
-1.012998, 0.5578383, -1.284091, 1, 0.9372549, 0, 1,
-1.012394, 0.7528223, -1.533375, 1, 0.9411765, 0, 1,
-1.00336, 0.4769716, -3.145777, 1, 0.9490196, 0, 1,
-1.001398, 0.439499, -0.9673549, 1, 0.9529412, 0, 1,
-0.9972075, -0.6920601, -1.530488, 1, 0.9607843, 0, 1,
-0.9910675, 0.420009, -1.904306, 1, 0.9647059, 0, 1,
-0.9876253, -0.8344238, 0.3930238, 1, 0.972549, 0, 1,
-0.9876127, 0.05147105, -1.494147, 1, 0.9764706, 0, 1,
-0.9872076, 0.5743838, 0.00616379, 1, 0.9843137, 0, 1,
-0.9828101, 0.5515949, -1.017676, 1, 0.9882353, 0, 1,
-0.9778259, -0.5052297, -0.246114, 1, 0.9960784, 0, 1,
-0.9704576, -0.3229873, -2.470233, 0.9960784, 1, 0, 1,
-0.9701932, -0.4681145, -3.419799, 0.9921569, 1, 0, 1,
-0.9700699, 1.635436, -0.9715222, 0.9843137, 1, 0, 1,
-0.9644549, -2.84138, -2.521982, 0.9803922, 1, 0, 1,
-0.9615921, 0.311564, -0.01864365, 0.972549, 1, 0, 1,
-0.9580167, -0.5541147, -1.616034, 0.9686275, 1, 0, 1,
-0.956163, -1.623952, -1.76896, 0.9607843, 1, 0, 1,
-0.9423845, 0.2858316, -2.163021, 0.9568627, 1, 0, 1,
-0.9418786, -0.5451884, -3.78969, 0.9490196, 1, 0, 1,
-0.9410881, -1.398706, -1.166904, 0.945098, 1, 0, 1,
-0.9409708, -0.2603688, -1.810729, 0.9372549, 1, 0, 1,
-0.9402335, -0.4889291, -1.483196, 0.9333333, 1, 0, 1,
-0.9401419, -1.776474, -2.096433, 0.9254902, 1, 0, 1,
-0.9389135, -0.4518006, -3.024986, 0.9215686, 1, 0, 1,
-0.9363096, -0.4430423, -0.1735194, 0.9137255, 1, 0, 1,
-0.9341473, -0.08583743, -3.910658, 0.9098039, 1, 0, 1,
-0.9328433, 0.8948793, 1.522114, 0.9019608, 1, 0, 1,
-0.9271332, -0.2521919, -4.784917, 0.8941177, 1, 0, 1,
-0.9208571, 0.6374515, -2.558304, 0.8901961, 1, 0, 1,
-0.9171597, -2.205608, -2.311945, 0.8823529, 1, 0, 1,
-0.9140335, 1.26973, -0.2184593, 0.8784314, 1, 0, 1,
-0.9120752, 0.5731596, -0.1591684, 0.8705882, 1, 0, 1,
-0.9101287, 2.294042, 0.6306773, 0.8666667, 1, 0, 1,
-0.9077557, -2.477108, -1.202027, 0.8588235, 1, 0, 1,
-0.9057496, 0.6549023, -2.124182, 0.854902, 1, 0, 1,
-0.9002343, 0.2994283, -0.2563754, 0.8470588, 1, 0, 1,
-0.8980294, 0.799217, 0.1072411, 0.8431373, 1, 0, 1,
-0.8873424, 1.701089, 1.431606, 0.8352941, 1, 0, 1,
-0.8841513, -3.420866, -1.601182, 0.8313726, 1, 0, 1,
-0.8825899, -0.6513007, -1.895643, 0.8235294, 1, 0, 1,
-0.8809448, -0.2381915, -0.7043946, 0.8196079, 1, 0, 1,
-0.8749866, -0.6504368, -0.8999577, 0.8117647, 1, 0, 1,
-0.8710478, -0.8422547, -1.918419, 0.8078431, 1, 0, 1,
-0.8705022, 0.06226151, -0.3554653, 0.8, 1, 0, 1,
-0.8647968, 0.9565492, -1.526429, 0.7921569, 1, 0, 1,
-0.8628072, 0.5291776, -1.665152, 0.7882353, 1, 0, 1,
-0.8591321, -0.1697115, -1.038532, 0.7803922, 1, 0, 1,
-0.8577115, -0.8399955, -1.759341, 0.7764706, 1, 0, 1,
-0.856719, 0.2468843, -0.7214205, 0.7686275, 1, 0, 1,
-0.8504271, -0.3135225, -0.5115547, 0.7647059, 1, 0, 1,
-0.8503798, -0.7564715, -1.701345, 0.7568628, 1, 0, 1,
-0.8492019, 1.052743, -1.079004, 0.7529412, 1, 0, 1,
-0.8427564, 0.2583196, 0.01454732, 0.7450981, 1, 0, 1,
-0.8421014, 1.330158, -1.20094, 0.7411765, 1, 0, 1,
-0.8418923, -2.014379, -3.275485, 0.7333333, 1, 0, 1,
-0.8284251, 0.6550112, -0.4989431, 0.7294118, 1, 0, 1,
-0.8268214, 0.3369998, -1.222633, 0.7215686, 1, 0, 1,
-0.8241751, 0.4684922, -1.453832, 0.7176471, 1, 0, 1,
-0.8238317, -0.3274085, -1.016536, 0.7098039, 1, 0, 1,
-0.8206984, 1.056322, -1.654267, 0.7058824, 1, 0, 1,
-0.8143055, -1.033252, -2.569316, 0.6980392, 1, 0, 1,
-0.8114179, -2.23477, -1.722821, 0.6901961, 1, 0, 1,
-0.8085552, -1.112212, -2.248153, 0.6862745, 1, 0, 1,
-0.8083347, -1.605512, -2.388293, 0.6784314, 1, 0, 1,
-0.7984337, 0.2631221, -1.612211, 0.6745098, 1, 0, 1,
-0.7972788, 1.790115, -0.3609196, 0.6666667, 1, 0, 1,
-0.7965611, -0.3912759, -1.081104, 0.6627451, 1, 0, 1,
-0.7945942, -1.652878, -0.815699, 0.654902, 1, 0, 1,
-0.7925774, 0.3319187, -1.617025, 0.6509804, 1, 0, 1,
-0.7896839, -0.6279988, -3.58357, 0.6431373, 1, 0, 1,
-0.7893787, 1.772288, 0.6044085, 0.6392157, 1, 0, 1,
-0.7889968, 0.04179293, -0.9725478, 0.6313726, 1, 0, 1,
-0.7830943, 0.5728946, -0.1844273, 0.627451, 1, 0, 1,
-0.7828075, -0.8651085, -2.03888, 0.6196079, 1, 0, 1,
-0.780911, -0.4699093, -2.633837, 0.6156863, 1, 0, 1,
-0.775653, 0.4261003, -0.6940039, 0.6078432, 1, 0, 1,
-0.7734211, -0.00869074, -1.287514, 0.6039216, 1, 0, 1,
-0.7678385, 0.06295677, -1.544763, 0.5960785, 1, 0, 1,
-0.764813, -0.2556771, -2.467103, 0.5882353, 1, 0, 1,
-0.7623833, -0.3251712, 1.157995, 0.5843138, 1, 0, 1,
-0.7587145, -1.806705, -2.773409, 0.5764706, 1, 0, 1,
-0.7584279, 0.6499929, 0.5583005, 0.572549, 1, 0, 1,
-0.7577055, 0.3529542, -1.708493, 0.5647059, 1, 0, 1,
-0.7560418, -0.2586727, -1.332259, 0.5607843, 1, 0, 1,
-0.7555945, 0.5621537, -1.414186, 0.5529412, 1, 0, 1,
-0.7534793, 0.6682116, -2.58626, 0.5490196, 1, 0, 1,
-0.7533348, 0.9052953, -0.7043037, 0.5411765, 1, 0, 1,
-0.7522897, -0.2610825, -0.9973236, 0.5372549, 1, 0, 1,
-0.7484825, 1.279594, 0.8203466, 0.5294118, 1, 0, 1,
-0.7461277, -0.9975679, -0.5925201, 0.5254902, 1, 0, 1,
-0.7424762, 0.4864819, -0.5440132, 0.5176471, 1, 0, 1,
-0.7368478, 0.7962424, 1.305289, 0.5137255, 1, 0, 1,
-0.7334022, 0.3688856, -1.370059, 0.5058824, 1, 0, 1,
-0.7284248, 0.5034804, 0.7079811, 0.5019608, 1, 0, 1,
-0.7252735, -1.585685, -2.39007, 0.4941176, 1, 0, 1,
-0.7189153, -0.7972275, -3.096409, 0.4862745, 1, 0, 1,
-0.7182636, -1.29765, -2.936738, 0.4823529, 1, 0, 1,
-0.7181283, -0.3079704, -3.283918, 0.4745098, 1, 0, 1,
-0.718108, 1.124356, -0.126828, 0.4705882, 1, 0, 1,
-0.7181014, 0.7462509, -1.291257, 0.4627451, 1, 0, 1,
-0.710171, 0.2520401, -1.972193, 0.4588235, 1, 0, 1,
-0.705135, 0.1787429, -2.098241, 0.4509804, 1, 0, 1,
-0.7033388, -0.1277018, -1.27631, 0.4470588, 1, 0, 1,
-0.7013623, 0.1286808, -0.9284412, 0.4392157, 1, 0, 1,
-0.7003587, -0.0133861, -2.630669, 0.4352941, 1, 0, 1,
-0.6998414, 1.019478, -2.387564, 0.427451, 1, 0, 1,
-0.6915497, -0.5948559, -1.640134, 0.4235294, 1, 0, 1,
-0.6869931, 1.246431, -1.130895, 0.4156863, 1, 0, 1,
-0.6842053, 0.2778851, -1.744707, 0.4117647, 1, 0, 1,
-0.6840993, 0.74061, -0.4528915, 0.4039216, 1, 0, 1,
-0.6806885, 0.1590867, -1.467597, 0.3960784, 1, 0, 1,
-0.6790344, -0.7598251, -3.652853, 0.3921569, 1, 0, 1,
-0.6776727, -0.5863349, -3.192093, 0.3843137, 1, 0, 1,
-0.6705665, -1.088584, -3.336748, 0.3803922, 1, 0, 1,
-0.6667582, -0.2083357, -1.471089, 0.372549, 1, 0, 1,
-0.6665117, 0.2133017, 0.4301346, 0.3686275, 1, 0, 1,
-0.6633896, 0.597597, -0.4708623, 0.3607843, 1, 0, 1,
-0.6630905, 1.663121, -1.598117, 0.3568628, 1, 0, 1,
-0.6600299, -1.081406, -3.99661, 0.3490196, 1, 0, 1,
-0.6567026, -3.026481, -2.889112, 0.345098, 1, 0, 1,
-0.6564705, 0.6336151, 0.1106457, 0.3372549, 1, 0, 1,
-0.651975, 1.795643, -0.5862755, 0.3333333, 1, 0, 1,
-0.6470718, 0.06186476, -2.359498, 0.3254902, 1, 0, 1,
-0.6469446, -0.5597222, -2.670109, 0.3215686, 1, 0, 1,
-0.6397958, -0.08021873, -0.01425867, 0.3137255, 1, 0, 1,
-0.6392862, 0.771794, -2.064934, 0.3098039, 1, 0, 1,
-0.6383226, -1.876085, -4.248819, 0.3019608, 1, 0, 1,
-0.6377174, 0.3096077, 0.1829899, 0.2941177, 1, 0, 1,
-0.6371748, 0.4252289, -1.138672, 0.2901961, 1, 0, 1,
-0.6358381, 0.4996557, -0.4318728, 0.282353, 1, 0, 1,
-0.6348652, 0.2061837, -0.7146804, 0.2784314, 1, 0, 1,
-0.6292881, 0.6848263, -0.4091192, 0.2705882, 1, 0, 1,
-0.6292199, -1.161796, -1.535267, 0.2666667, 1, 0, 1,
-0.6262002, -1.91976, -2.009304, 0.2588235, 1, 0, 1,
-0.6204435, 1.383779, 0.4502504, 0.254902, 1, 0, 1,
-0.6195723, 1.30708, -2.281567, 0.2470588, 1, 0, 1,
-0.6185965, 1.429783, 0.2025138, 0.2431373, 1, 0, 1,
-0.6176811, -1.95454, -3.632268, 0.2352941, 1, 0, 1,
-0.6139542, 1.586393, 0.2560183, 0.2313726, 1, 0, 1,
-0.6124669, -0.1473621, -3.688121, 0.2235294, 1, 0, 1,
-0.6108111, -0.1496508, -0.3062281, 0.2196078, 1, 0, 1,
-0.6088115, -0.4098112, -3.112112, 0.2117647, 1, 0, 1,
-0.6084598, 0.4873979, 0.6036616, 0.2078431, 1, 0, 1,
-0.5943873, 1.229897, -1.058597, 0.2, 1, 0, 1,
-0.593466, -0.1573523, -1.64721, 0.1921569, 1, 0, 1,
-0.5913261, 0.9952655, -1.109089, 0.1882353, 1, 0, 1,
-0.5901445, 0.3359621, -0.8600683, 0.1803922, 1, 0, 1,
-0.590095, -2.626321, -2.985773, 0.1764706, 1, 0, 1,
-0.5880637, 0.6509046, -0.9375919, 0.1686275, 1, 0, 1,
-0.5804707, -0.04707825, -0.9235267, 0.1647059, 1, 0, 1,
-0.5755293, 0.007826256, -2.00191, 0.1568628, 1, 0, 1,
-0.5748554, 0.4494963, 0.1013822, 0.1529412, 1, 0, 1,
-0.5705577, 0.281982, -1.332721, 0.145098, 1, 0, 1,
-0.5665881, 0.8245954, -0.8374019, 0.1411765, 1, 0, 1,
-0.5628858, -0.4970014, -1.461416, 0.1333333, 1, 0, 1,
-0.5614995, 0.7550034, -1.920016, 0.1294118, 1, 0, 1,
-0.5565546, 0.2056439, -1.05125, 0.1215686, 1, 0, 1,
-0.5491872, 0.3019664, -0.9989465, 0.1176471, 1, 0, 1,
-0.5484892, 1.203247, -1.435671, 0.1098039, 1, 0, 1,
-0.5484591, -0.3595498, -2.613759, 0.1058824, 1, 0, 1,
-0.5466644, -0.4664933, -1.61421, 0.09803922, 1, 0, 1,
-0.5395548, 0.1823352, -2.13161, 0.09019608, 1, 0, 1,
-0.5384158, -1.003506, -2.083007, 0.08627451, 1, 0, 1,
-0.5357991, 1.503558, -1.285322, 0.07843138, 1, 0, 1,
-0.5276318, 1.456295, 0.5375915, 0.07450981, 1, 0, 1,
-0.5216092, 0.4137423, -1.374454, 0.06666667, 1, 0, 1,
-0.5139639, 0.425335, -0.9986051, 0.0627451, 1, 0, 1,
-0.5104207, 0.3327636, -1.744351, 0.05490196, 1, 0, 1,
-0.5070654, 0.6812092, -2.306901, 0.05098039, 1, 0, 1,
-0.5047306, 2.511638, -0.2901367, 0.04313726, 1, 0, 1,
-0.5045772, -1.817191, -4.163972, 0.03921569, 1, 0, 1,
-0.5000807, 0.3054336, -2.225797, 0.03137255, 1, 0, 1,
-0.4894296, -1.820773, -2.137476, 0.02745098, 1, 0, 1,
-0.4804743, -0.7563369, -3.14169, 0.01960784, 1, 0, 1,
-0.4796818, -1.409045, -2.635355, 0.01568628, 1, 0, 1,
-0.476263, -0.9760071, -3.596644, 0.007843138, 1, 0, 1,
-0.4747419, 0.7264509, -0.4597162, 0.003921569, 1, 0, 1,
-0.4740228, -1.990065, -4.42001, 0, 1, 0.003921569, 1,
-0.4724826, -0.363234, -3.06181, 0, 1, 0.01176471, 1,
-0.4699956, 0.520654, -1.113966, 0, 1, 0.01568628, 1,
-0.4682406, 0.5659377, -1.168872, 0, 1, 0.02352941, 1,
-0.4677445, 0.8827454, -0.08982798, 0, 1, 0.02745098, 1,
-0.4672826, 0.2542635, 0.4363513, 0, 1, 0.03529412, 1,
-0.4657925, 1.134921, -0.2641064, 0, 1, 0.03921569, 1,
-0.4646181, -0.7837643, -3.689398, 0, 1, 0.04705882, 1,
-0.4559693, 0.05382386, -2.115998, 0, 1, 0.05098039, 1,
-0.455424, 1.657392, 0.04344498, 0, 1, 0.05882353, 1,
-0.4540048, 2.37922, -0.07854779, 0, 1, 0.0627451, 1,
-0.4537394, 0.6018957, -1.941304, 0, 1, 0.07058824, 1,
-0.4507061, 0.141061, -1.707942, 0, 1, 0.07450981, 1,
-0.4466943, -0.01559251, -0.2216692, 0, 1, 0.08235294, 1,
-0.4451353, 0.226186, -1.5515, 0, 1, 0.08627451, 1,
-0.4416989, 1.187837, 0.0182091, 0, 1, 0.09411765, 1,
-0.438888, -0.7009639, -3.484391, 0, 1, 0.1019608, 1,
-0.4387186, 0.2452994, -0.7048835, 0, 1, 0.1058824, 1,
-0.4363728, -0.8678193, -2.917076, 0, 1, 0.1137255, 1,
-0.4332351, -0.8538738, -2.011512, 0, 1, 0.1176471, 1,
-0.4320447, -0.609386, -3.421226, 0, 1, 0.1254902, 1,
-0.4264805, 0.09298021, -0.6254875, 0, 1, 0.1294118, 1,
-0.4243026, 0.4689878, 1.643371, 0, 1, 0.1372549, 1,
-0.4212261, -1.069725, -2.668953, 0, 1, 0.1411765, 1,
-0.4191932, 0.8246512, -0.01035749, 0, 1, 0.1490196, 1,
-0.4162492, -0.9462233, -3.749261, 0, 1, 0.1529412, 1,
-0.4159374, 1.783762, 0.5398676, 0, 1, 0.1607843, 1,
-0.4157573, -0.3564464, -1.675929, 0, 1, 0.1647059, 1,
-0.4121306, 0.04531436, -1.171699, 0, 1, 0.172549, 1,
-0.4084644, -0.8272455, -1.898679, 0, 1, 0.1764706, 1,
-0.4066964, -1.079717, -1.99188, 0, 1, 0.1843137, 1,
-0.4033082, -0.5598919, -2.808506, 0, 1, 0.1882353, 1,
-0.4019136, -0.09419107, -1.512749, 0, 1, 0.1960784, 1,
-0.399012, -0.9979529, -2.548541, 0, 1, 0.2039216, 1,
-0.3973936, 1.123995, 0.2525012, 0, 1, 0.2078431, 1,
-0.3927446, -0.2043454, -2.87699, 0, 1, 0.2156863, 1,
-0.3875627, 0.7195907, -1.163131, 0, 1, 0.2196078, 1,
-0.3840495, 1.21967, -0.02934294, 0, 1, 0.227451, 1,
-0.3819738, -0.1157824, -0.7545511, 0, 1, 0.2313726, 1,
-0.3775267, -0.1576809, -2.183105, 0, 1, 0.2392157, 1,
-0.3762929, 0.3930421, -1.883912, 0, 1, 0.2431373, 1,
-0.3759215, -0.4979829, -2.476619, 0, 1, 0.2509804, 1,
-0.3716229, 0.4508511, -0.4439068, 0, 1, 0.254902, 1,
-0.3704271, 1.678217, -1.650416, 0, 1, 0.2627451, 1,
-0.3619666, 0.4309908, 0.8404163, 0, 1, 0.2666667, 1,
-0.3615517, 1.306295, -0.05798996, 0, 1, 0.2745098, 1,
-0.3602908, -1.094229, -3.391959, 0, 1, 0.2784314, 1,
-0.3587845, 0.105551, -2.967544, 0, 1, 0.2862745, 1,
-0.3575697, -1.754724, -3.933137, 0, 1, 0.2901961, 1,
-0.3567609, 0.5790256, -0.3069678, 0, 1, 0.2980392, 1,
-0.3554145, -0.5789462, -5.472626, 0, 1, 0.3058824, 1,
-0.3552758, -0.1652256, -1.286308, 0, 1, 0.3098039, 1,
-0.3543575, -1.69435, -1.480524, 0, 1, 0.3176471, 1,
-0.3513589, 1.974813, 1.187163, 0, 1, 0.3215686, 1,
-0.3423109, -1.044131, -2.489333, 0, 1, 0.3294118, 1,
-0.3225565, 0.2464878, 0.3735779, 0, 1, 0.3333333, 1,
-0.3174392, -0.3548193, -1.336392, 0, 1, 0.3411765, 1,
-0.3168406, -2.081573, -1.046838, 0, 1, 0.345098, 1,
-0.3146164, 0.3721681, -1.461715, 0, 1, 0.3529412, 1,
-0.3112549, 0.4454134, -0.9867681, 0, 1, 0.3568628, 1,
-0.3082061, 2.088029, 1.022355, 0, 1, 0.3647059, 1,
-0.3051607, -0.3192942, -1.054618, 0, 1, 0.3686275, 1,
-0.303465, -0.785295, -3.208855, 0, 1, 0.3764706, 1,
-0.3021023, 1.569026, 0.2149798, 0, 1, 0.3803922, 1,
-0.2963382, 0.4822428, 0.09601471, 0, 1, 0.3882353, 1,
-0.294406, -0.3321818, -1.070172, 0, 1, 0.3921569, 1,
-0.2892661, 0.07753146, -1.479399, 0, 1, 0.4, 1,
-0.2794825, -0.4165262, -3.158097, 0, 1, 0.4078431, 1,
-0.2794551, -1.038157, -2.5713, 0, 1, 0.4117647, 1,
-0.274314, 0.552032, 0.1540196, 0, 1, 0.4196078, 1,
-0.2688382, -0.6019591, -2.393182, 0, 1, 0.4235294, 1,
-0.2650127, -0.08293676, -2.669229, 0, 1, 0.4313726, 1,
-0.2629847, 0.8050872, -2.26392, 0, 1, 0.4352941, 1,
-0.2622075, 0.2688855, -1.284564, 0, 1, 0.4431373, 1,
-0.2597995, 0.3558577, 0.3492358, 0, 1, 0.4470588, 1,
-0.2594863, -0.356725, -3.90237, 0, 1, 0.454902, 1,
-0.2575705, 0.4895991, 0.5136535, 0, 1, 0.4588235, 1,
-0.2498107, -0.1300629, -0.6213835, 0, 1, 0.4666667, 1,
-0.2493577, -1.53841, -2.648615, 0, 1, 0.4705882, 1,
-0.2492245, -0.7602666, -2.460198, 0, 1, 0.4784314, 1,
-0.2451856, -1.178392, -2.159326, 0, 1, 0.4823529, 1,
-0.2430273, -0.4819876, -3.905307, 0, 1, 0.4901961, 1,
-0.2387735, -0.921356, -3.979479, 0, 1, 0.4941176, 1,
-0.235215, 0.4347743, 0.1388242, 0, 1, 0.5019608, 1,
-0.234183, -1.244115, -3.402318, 0, 1, 0.509804, 1,
-0.2332261, 0.7240369, -1.534508, 0, 1, 0.5137255, 1,
-0.2320758, -2.229956, -4.938515, 0, 1, 0.5215687, 1,
-0.2280642, 0.6762953, -1.18292, 0, 1, 0.5254902, 1,
-0.2239522, 1.111176, 0.1383788, 0, 1, 0.5333334, 1,
-0.2181716, 0.1795556, -2.28512, 0, 1, 0.5372549, 1,
-0.214735, -1.954064, -3.567599, 0, 1, 0.5450981, 1,
-0.2136106, -0.8250355, -1.325363, 0, 1, 0.5490196, 1,
-0.2110875, 1.91091, -0.4752243, 0, 1, 0.5568628, 1,
-0.2105342, -1.839926, -2.613244, 0, 1, 0.5607843, 1,
-0.2029505, 0.1951617, -1.921647, 0, 1, 0.5686275, 1,
-0.2028774, 1.272834, 0.1162927, 0, 1, 0.572549, 1,
-0.1955058, 1.520582, -0.7360822, 0, 1, 0.5803922, 1,
-0.1948851, -0.3403348, -2.813121, 0, 1, 0.5843138, 1,
-0.1925997, 0.7839992, -0.3146898, 0, 1, 0.5921569, 1,
-0.1923857, -0.1546685, -2.538365, 0, 1, 0.5960785, 1,
-0.1896588, -0.04439099, 0.1836621, 0, 1, 0.6039216, 1,
-0.1886867, -1.353747, -1.869688, 0, 1, 0.6117647, 1,
-0.1879097, -2.015612, -3.499082, 0, 1, 0.6156863, 1,
-0.1840067, 0.6515232, 1.824898, 0, 1, 0.6235294, 1,
-0.1821061, 1.229182, -0.04759191, 0, 1, 0.627451, 1,
-0.1792946, -0.05895411, -2.369733, 0, 1, 0.6352941, 1,
-0.1791958, -0.4067515, -3.9183, 0, 1, 0.6392157, 1,
-0.1774009, 0.5266451, -0.5834873, 0, 1, 0.6470588, 1,
-0.1772256, -0.6384286, -4.315909, 0, 1, 0.6509804, 1,
-0.1749949, -0.2539127, -2.380426, 0, 1, 0.6588235, 1,
-0.1716304, 0.4856403, -0.8425835, 0, 1, 0.6627451, 1,
-0.1693308, 0.8510098, -1.028564, 0, 1, 0.6705883, 1,
-0.16005, -0.2945279, -2.014797, 0, 1, 0.6745098, 1,
-0.1598036, -0.8123694, -3.32684, 0, 1, 0.682353, 1,
-0.1572323, -0.3073272, -4.146582, 0, 1, 0.6862745, 1,
-0.1552643, 0.9750973, -0.4722563, 0, 1, 0.6941177, 1,
-0.1478897, 0.6609427, 1.077624, 0, 1, 0.7019608, 1,
-0.1476192, -0.8052924, -1.771542, 0, 1, 0.7058824, 1,
-0.145745, 0.4977462, -0.880583, 0, 1, 0.7137255, 1,
-0.144078, -2.145196, -2.43006, 0, 1, 0.7176471, 1,
-0.1416079, -0.5519006, -2.627386, 0, 1, 0.7254902, 1,
-0.1399283, -1.076676, -2.346147, 0, 1, 0.7294118, 1,
-0.1357407, 0.1818161, -0.1577795, 0, 1, 0.7372549, 1,
-0.1325465, -0.3645806, -4.357751, 0, 1, 0.7411765, 1,
-0.1321718, 1.142866, 0.7775129, 0, 1, 0.7490196, 1,
-0.1308158, -0.06505703, -1.630468, 0, 1, 0.7529412, 1,
-0.1293691, -0.515246, -3.304038, 0, 1, 0.7607843, 1,
-0.1274746, -0.4330283, -2.175096, 0, 1, 0.7647059, 1,
-0.1252847, -0.5758633, -3.062085, 0, 1, 0.772549, 1,
-0.121242, -0.1119387, -1.865014, 0, 1, 0.7764706, 1,
-0.1183796, -0.1502663, -2.838995, 0, 1, 0.7843137, 1,
-0.1179429, 0.1457609, 0.8690926, 0, 1, 0.7882353, 1,
-0.109508, -0.682756, -4.040394, 0, 1, 0.7960784, 1,
-0.1008107, 0.9313084, -1.314333, 0, 1, 0.8039216, 1,
-0.09939549, -0.225108, -2.940295, 0, 1, 0.8078431, 1,
-0.09647737, -1.083926, -3.346265, 0, 1, 0.8156863, 1,
-0.09573996, -1.33525, -1.994689, 0, 1, 0.8196079, 1,
-0.09295505, 1.414044, -1.281303, 0, 1, 0.827451, 1,
-0.09207915, -1.840571, -2.588982, 0, 1, 0.8313726, 1,
-0.08527608, -0.2449164, -1.875221, 0, 1, 0.8392157, 1,
-0.08463147, 1.604011, -0.1467889, 0, 1, 0.8431373, 1,
-0.08365145, 0.1223008, -0.3367089, 0, 1, 0.8509804, 1,
-0.0817498, 1.461803, 0.247629, 0, 1, 0.854902, 1,
-0.07680718, 1.574845, 1.169626, 0, 1, 0.8627451, 1,
-0.07613578, -1.520609, -2.503013, 0, 1, 0.8666667, 1,
-0.07550597, -1.49356, -2.356498, 0, 1, 0.8745098, 1,
-0.07541405, 0.6293851, 1.086755, 0, 1, 0.8784314, 1,
-0.07516128, -0.6244193, -4.716253, 0, 1, 0.8862745, 1,
-0.07266741, -0.9105157, -1.219108, 0, 1, 0.8901961, 1,
-0.07026937, 1.916527, 0.4542725, 0, 1, 0.8980392, 1,
-0.06934091, -0.1380793, -3.700283, 0, 1, 0.9058824, 1,
-0.06916677, 0.1448338, -1.228698, 0, 1, 0.9098039, 1,
-0.06896079, 0.2548979, -0.2062156, 0, 1, 0.9176471, 1,
-0.06724115, 0.5864263, -0.8239951, 0, 1, 0.9215686, 1,
-0.06318558, 2.198032, 1.386965, 0, 1, 0.9294118, 1,
-0.06314105, 1.328168, -0.5610427, 0, 1, 0.9333333, 1,
-0.06291745, -0.3727592, -5.541867, 0, 1, 0.9411765, 1,
-0.06212296, 1.997702, 0.2420893, 0, 1, 0.945098, 1,
-0.05870458, 0.6912045, 0.6692658, 0, 1, 0.9529412, 1,
-0.05463922, -0.9698586, -2.178674, 0, 1, 0.9568627, 1,
-0.05192631, -0.5700864, -2.337901, 0, 1, 0.9647059, 1,
-0.05115494, 0.4193863, 0.6473131, 0, 1, 0.9686275, 1,
-0.04095822, 0.9325212, -1.241208, 0, 1, 0.9764706, 1,
-0.0383095, 0.5218945, -1.358401, 0, 1, 0.9803922, 1,
-0.03612552, -0.08154772, -5.97752, 0, 1, 0.9882353, 1,
-0.03544099, -0.2148979, -5.253829, 0, 1, 0.9921569, 1,
-0.03517382, 1.927019, -0.8293481, 0, 1, 1, 1,
-0.03377472, 1.256646, -0.1740089, 0, 0.9921569, 1, 1,
-0.03073787, -0.5675024, -4.435584, 0, 0.9882353, 1, 1,
-0.02544463, -0.33566, -1.086914, 0, 0.9803922, 1, 1,
-0.02481358, -0.8150156, -4.223061, 0, 0.9764706, 1, 1,
-0.02101096, 0.1773397, -0.3166408, 0, 0.9686275, 1, 1,
-0.02064053, -0.4485286, -1.750036, 0, 0.9647059, 1, 1,
-0.01748773, -1.843879, -2.460806, 0, 0.9568627, 1, 1,
0.003127866, -0.03282653, 1.373312, 0, 0.9529412, 1, 1,
0.01032375, -0.1908439, 3.845052, 0, 0.945098, 1, 1,
0.01324274, -0.07256838, 3.336137, 0, 0.9411765, 1, 1,
0.01396699, 1.05883, -0.06033473, 0, 0.9333333, 1, 1,
0.01466915, 1.63069, 0.9307934, 0, 0.9294118, 1, 1,
0.02263612, 2.803114, 0.8749098, 0, 0.9215686, 1, 1,
0.02503229, 1.74335, 1.900988, 0, 0.9176471, 1, 1,
0.02730814, -1.299373, 3.739091, 0, 0.9098039, 1, 1,
0.02757684, 1.339503, 0.9934436, 0, 0.9058824, 1, 1,
0.02804929, -0.3039834, 1.006896, 0, 0.8980392, 1, 1,
0.02814522, 1.17407, -1.048468, 0, 0.8901961, 1, 1,
0.02899196, 0.1476379, -1.220867, 0, 0.8862745, 1, 1,
0.02992421, -1.352696, 4.695356, 0, 0.8784314, 1, 1,
0.03253248, 0.6423861, -0.755109, 0, 0.8745098, 1, 1,
0.03486938, -0.4219431, 1.678653, 0, 0.8666667, 1, 1,
0.03554265, -0.1695288, 3.686387, 0, 0.8627451, 1, 1,
0.03695467, 0.6756442, 2.01071, 0, 0.854902, 1, 1,
0.04202659, -0.1782131, 2.184457, 0, 0.8509804, 1, 1,
0.04209889, -0.740881, 2.63552, 0, 0.8431373, 1, 1,
0.04217669, -2.155596, 2.919379, 0, 0.8392157, 1, 1,
0.04246768, 0.206526, -0.4295366, 0, 0.8313726, 1, 1,
0.04398085, 0.9262417, 0.6168145, 0, 0.827451, 1, 1,
0.04446841, -0.01695268, 1.293854, 0, 0.8196079, 1, 1,
0.04493243, -0.05323153, 2.796627, 0, 0.8156863, 1, 1,
0.04580329, -0.8588421, 2.798196, 0, 0.8078431, 1, 1,
0.05113599, -2.02122, 2.689273, 0, 0.8039216, 1, 1,
0.05148985, 1.640864, 0.3910114, 0, 0.7960784, 1, 1,
0.05189621, -0.1621115, 1.569981, 0, 0.7882353, 1, 1,
0.05870197, 0.6262076, 0.6157514, 0, 0.7843137, 1, 1,
0.05910982, -1.076178, 3.592803, 0, 0.7764706, 1, 1,
0.06087302, 1.315902, 0.5401192, 0, 0.772549, 1, 1,
0.06095047, 0.4556552, 0.673193, 0, 0.7647059, 1, 1,
0.06235006, 0.006334712, 1.91917, 0, 0.7607843, 1, 1,
0.06373683, -0.06317337, 2.885555, 0, 0.7529412, 1, 1,
0.06379309, 0.8171322, 1.040125, 0, 0.7490196, 1, 1,
0.06470414, 2.38811, 0.01470753, 0, 0.7411765, 1, 1,
0.06694439, 0.4222441, -0.9962959, 0, 0.7372549, 1, 1,
0.06982832, 0.5163515, 2.924492, 0, 0.7294118, 1, 1,
0.07385948, 0.08070824, 1.387266, 0, 0.7254902, 1, 1,
0.07392062, -0.3251273, 3.654303, 0, 0.7176471, 1, 1,
0.07433551, 0.8743327, -0.3544979, 0, 0.7137255, 1, 1,
0.07440846, 1.954093, 1.601532, 0, 0.7058824, 1, 1,
0.07476338, -0.5585821, 6.335005, 0, 0.6980392, 1, 1,
0.07676499, 0.0624417, 1.383581, 0, 0.6941177, 1, 1,
0.07740389, -0.2493722, 3.063977, 0, 0.6862745, 1, 1,
0.08104417, 1.083276, -1.359956, 0, 0.682353, 1, 1,
0.08566794, -0.8910054, 2.374521, 0, 0.6745098, 1, 1,
0.08647399, 0.1634936, 0.9224145, 0, 0.6705883, 1, 1,
0.08654097, 0.2468792, -0.1278252, 0, 0.6627451, 1, 1,
0.08825985, 0.1868264, 0.711795, 0, 0.6588235, 1, 1,
0.08978586, 0.719796, -2.10302, 0, 0.6509804, 1, 1,
0.09081533, 0.6604064, -1.714868, 0, 0.6470588, 1, 1,
0.09427394, -2.296178, 3.736597, 0, 0.6392157, 1, 1,
0.09604405, -0.8339704, 2.834314, 0, 0.6352941, 1, 1,
0.1043223, -0.4917646, 3.659792, 0, 0.627451, 1, 1,
0.105336, 1.072453, 0.5931792, 0, 0.6235294, 1, 1,
0.1054, 1.097331, 1.479378, 0, 0.6156863, 1, 1,
0.1054672, 0.09806454, 0.9241615, 0, 0.6117647, 1, 1,
0.113844, -1.03653, 2.5855, 0, 0.6039216, 1, 1,
0.115625, 1.440815, -0.4566014, 0, 0.5960785, 1, 1,
0.1157764, 0.3143288, 1.695392, 0, 0.5921569, 1, 1,
0.1168948, 0.9986547, 0.3666118, 0, 0.5843138, 1, 1,
0.1242928, 2.55077, -0.5225731, 0, 0.5803922, 1, 1,
0.1251385, -0.4100879, 4.054345, 0, 0.572549, 1, 1,
0.127332, -1.327231, 3.569799, 0, 0.5686275, 1, 1,
0.1317341, -0.5529385, 1.860861, 0, 0.5607843, 1, 1,
0.1381618, 1.509801, -0.6001741, 0, 0.5568628, 1, 1,
0.1458446, -0.8429291, 2.776736, 0, 0.5490196, 1, 1,
0.1473287, -0.2566551, 2.481402, 0, 0.5450981, 1, 1,
0.1517357, -0.1189522, 2.082829, 0, 0.5372549, 1, 1,
0.1519455, 0.7307851, -0.4818362, 0, 0.5333334, 1, 1,
0.1553433, 1.789035, 0.5483902, 0, 0.5254902, 1, 1,
0.1554272, -1.686381, 1.636787, 0, 0.5215687, 1, 1,
0.1554969, 0.2304054, -0.04725479, 0, 0.5137255, 1, 1,
0.1560068, -0.3705342, 3.083139, 0, 0.509804, 1, 1,
0.1571987, -0.2189486, 1.450844, 0, 0.5019608, 1, 1,
0.160631, -0.3149426, 3.300124, 0, 0.4941176, 1, 1,
0.1607472, 1.203122, 0.1517865, 0, 0.4901961, 1, 1,
0.1611003, -1.987951, 3.846792, 0, 0.4823529, 1, 1,
0.1620162, 1.45605, -0.3533012, 0, 0.4784314, 1, 1,
0.1637757, -2.336517, 2.25766, 0, 0.4705882, 1, 1,
0.1657162, -0.4369315, 3.948321, 0, 0.4666667, 1, 1,
0.1735931, -1.512894, 4.038474, 0, 0.4588235, 1, 1,
0.1748497, 0.9249933, 0.2739602, 0, 0.454902, 1, 1,
0.1764044, -0.771582, 4.517586, 0, 0.4470588, 1, 1,
0.1785294, -0.4059685, 2.162331, 0, 0.4431373, 1, 1,
0.1797839, -1.706466, 3.787646, 0, 0.4352941, 1, 1,
0.1805911, -1.07883, 4.268797, 0, 0.4313726, 1, 1,
0.1808643, 0.2343643, 0.954088, 0, 0.4235294, 1, 1,
0.1833787, 0.203744, 0.2606874, 0, 0.4196078, 1, 1,
0.1841273, 0.356151, 0.6179094, 0, 0.4117647, 1, 1,
0.1875811, -1.603369, 4.22143, 0, 0.4078431, 1, 1,
0.1890402, -0.1502474, 1.522459, 0, 0.4, 1, 1,
0.190969, 1.61864, 0.2709832, 0, 0.3921569, 1, 1,
0.1931492, -0.2477965, 2.728164, 0, 0.3882353, 1, 1,
0.1938569, -1.205912, 2.922996, 0, 0.3803922, 1, 1,
0.1948415, -0.553121, 0.8953564, 0, 0.3764706, 1, 1,
0.1968741, -1.08442, 2.262206, 0, 0.3686275, 1, 1,
0.1981498, 1.142412, -0.05326073, 0, 0.3647059, 1, 1,
0.1994014, 0.1951328, 0.1597177, 0, 0.3568628, 1, 1,
0.2038565, 1.146569, -1.105555, 0, 0.3529412, 1, 1,
0.2057558, -0.2212668, 2.457659, 0, 0.345098, 1, 1,
0.2073649, 2.088088, -0.1762862, 0, 0.3411765, 1, 1,
0.210504, -0.8892824, 4.237234, 0, 0.3333333, 1, 1,
0.2120434, -2.397753, 3.9744, 0, 0.3294118, 1, 1,
0.2130599, 1.503693, 0.3584302, 0, 0.3215686, 1, 1,
0.214585, 0.6931739, -1.230297, 0, 0.3176471, 1, 1,
0.2159755, 0.3698737, 1.337006, 0, 0.3098039, 1, 1,
0.2250771, 0.5550939, 0.8999949, 0, 0.3058824, 1, 1,
0.225762, 0.983206, -0.9869024, 0, 0.2980392, 1, 1,
0.22601, 1.350162, -0.1160437, 0, 0.2901961, 1, 1,
0.226462, 0.03919131, 2.574066, 0, 0.2862745, 1, 1,
0.2269778, -0.0988171, 2.056406, 0, 0.2784314, 1, 1,
0.2299842, -0.09163143, 2.671715, 0, 0.2745098, 1, 1,
0.2321677, 0.3179286, 1.110303, 0, 0.2666667, 1, 1,
0.2345766, -0.2387593, 2.761858, 0, 0.2627451, 1, 1,
0.2349001, -1.657667, 2.761362, 0, 0.254902, 1, 1,
0.2398061, 0.6276483, 0.3812016, 0, 0.2509804, 1, 1,
0.2401092, 1.352922, -0.5260316, 0, 0.2431373, 1, 1,
0.2418212, -0.2613311, 3.646593, 0, 0.2392157, 1, 1,
0.2447519, -0.3399286, 2.716895, 0, 0.2313726, 1, 1,
0.2461743, 1.781952, -1.092033, 0, 0.227451, 1, 1,
0.247429, -0.0507037, 2.126126, 0, 0.2196078, 1, 1,
0.2544252, -1.107599, 3.216289, 0, 0.2156863, 1, 1,
0.2579261, -1.619188, 4.18718, 0, 0.2078431, 1, 1,
0.2650146, -0.01733599, 1.454494, 0, 0.2039216, 1, 1,
0.2665308, 0.3994287, -1.01572, 0, 0.1960784, 1, 1,
0.2676382, 1.015878, -0.04310577, 0, 0.1882353, 1, 1,
0.2732664, -0.1648967, -0.08487303, 0, 0.1843137, 1, 1,
0.2737771, -0.6231749, 5.13081, 0, 0.1764706, 1, 1,
0.2746732, -0.6016641, 2.790903, 0, 0.172549, 1, 1,
0.2756999, 0.8274678, 0.3397847, 0, 0.1647059, 1, 1,
0.2780219, -2.195347, 2.887578, 0, 0.1607843, 1, 1,
0.2794362, -0.9158577, 2.63813, 0, 0.1529412, 1, 1,
0.28756, -0.2375002, 2.606917, 0, 0.1490196, 1, 1,
0.288157, 1.736629, -0.7077948, 0, 0.1411765, 1, 1,
0.2947149, 0.7620208, 1.133118, 0, 0.1372549, 1, 1,
0.2959465, 0.1102329, 1.435319, 0, 0.1294118, 1, 1,
0.2967865, 0.5151781, 1.898001, 0, 0.1254902, 1, 1,
0.2990365, -0.5580437, 3.730143, 0, 0.1176471, 1, 1,
0.3004307, -1.852113, 4.348534, 0, 0.1137255, 1, 1,
0.3072678, -0.9340258, 2.075521, 0, 0.1058824, 1, 1,
0.3090862, 0.6661878, -0.992221, 0, 0.09803922, 1, 1,
0.3118095, 0.07289609, 2.122931, 0, 0.09411765, 1, 1,
0.3204811, 0.001586892, 1.292645, 0, 0.08627451, 1, 1,
0.3220763, 1.833203, -0.4200369, 0, 0.08235294, 1, 1,
0.3242972, 0.361906, -0.6946658, 0, 0.07450981, 1, 1,
0.3259991, 0.2371745, 1.578275, 0, 0.07058824, 1, 1,
0.336322, -0.3797231, 1.379811, 0, 0.0627451, 1, 1,
0.3376441, -0.6090485, 3.353936, 0, 0.05882353, 1, 1,
0.3399943, -1.247415, 3.117124, 0, 0.05098039, 1, 1,
0.3407741, -2.610114, 2.222773, 0, 0.04705882, 1, 1,
0.3420606, -0.4829343, 1.827986, 0, 0.03921569, 1, 1,
0.3427141, 1.312359, 1.126001, 0, 0.03529412, 1, 1,
0.3429574, -0.4175206, 2.536451, 0, 0.02745098, 1, 1,
0.3446597, -1.411813, 3.083002, 0, 0.02352941, 1, 1,
0.3483545, 1.045408, 0.7306869, 0, 0.01568628, 1, 1,
0.350879, -1.844799, 3.018351, 0, 0.01176471, 1, 1,
0.3517601, -0.2794372, 2.516177, 0, 0.003921569, 1, 1,
0.3539365, 1.004329, 0.4502887, 0.003921569, 0, 1, 1,
0.3542605, 0.1795756, 1.660457, 0.007843138, 0, 1, 1,
0.3546626, 0.8260973, 0.0742465, 0.01568628, 0, 1, 1,
0.3551992, -0.3871458, 1.500313, 0.01960784, 0, 1, 1,
0.3577082, -0.4270316, 2.005431, 0.02745098, 0, 1, 1,
0.3591501, -0.1367453, 1.05395, 0.03137255, 0, 1, 1,
0.3597856, 0.9289557, 0.04991909, 0.03921569, 0, 1, 1,
0.3602, -1.853396, 1.116431, 0.04313726, 0, 1, 1,
0.3681094, 1.087735, -1.194263, 0.05098039, 0, 1, 1,
0.3688787, 0.5811765, -0.06080187, 0.05490196, 0, 1, 1,
0.3698707, -1.928818, 1.157843, 0.0627451, 0, 1, 1,
0.371224, -0.856531, 3.968114, 0.06666667, 0, 1, 1,
0.3744451, 2.00971, -1.818474, 0.07450981, 0, 1, 1,
0.3793191, 0.8826222, -1.262044, 0.07843138, 0, 1, 1,
0.3858337, -1.861303, 2.910895, 0.08627451, 0, 1, 1,
0.3885125, 1.040792, -0.260736, 0.09019608, 0, 1, 1,
0.3916266, -0.514039, 2.510197, 0.09803922, 0, 1, 1,
0.3940413, 0.5298043, -0.678317, 0.1058824, 0, 1, 1,
0.3990047, 0.5324228, 0.8061166, 0.1098039, 0, 1, 1,
0.4033014, -1.314499, 1.688295, 0.1176471, 0, 1, 1,
0.4041143, 0.2355104, 1.959532, 0.1215686, 0, 1, 1,
0.4086678, -0.0130528, 1.67585, 0.1294118, 0, 1, 1,
0.408804, -0.3478091, 3.877223, 0.1333333, 0, 1, 1,
0.415181, 0.9319932, -0.7873254, 0.1411765, 0, 1, 1,
0.4174089, -0.9339669, 1.238568, 0.145098, 0, 1, 1,
0.4183097, -0.4698818, 1.857124, 0.1529412, 0, 1, 1,
0.4228204, -1.325664, 2.835815, 0.1568628, 0, 1, 1,
0.4279768, -0.8109678, 1.576876, 0.1647059, 0, 1, 1,
0.4282416, -0.1650674, 0.326869, 0.1686275, 0, 1, 1,
0.4282613, -2.278374, 3.323161, 0.1764706, 0, 1, 1,
0.4286827, 2.272317, 1.156655, 0.1803922, 0, 1, 1,
0.4288764, 1.837987, -0.03511331, 0.1882353, 0, 1, 1,
0.4303088, 0.6069543, 0.5078359, 0.1921569, 0, 1, 1,
0.4307946, 0.7647458, 2.268122, 0.2, 0, 1, 1,
0.4318131, 0.2321681, 1.854728, 0.2078431, 0, 1, 1,
0.4423211, 0.3147063, 1.16121, 0.2117647, 0, 1, 1,
0.4507599, 0.9850076, 0.08131692, 0.2196078, 0, 1, 1,
0.4522948, 1.127744, 2.438909, 0.2235294, 0, 1, 1,
0.4571689, -0.7021831, 4.195995, 0.2313726, 0, 1, 1,
0.4742718, -1.302199, 3.423727, 0.2352941, 0, 1, 1,
0.47517, 0.2401161, 0.3742391, 0.2431373, 0, 1, 1,
0.4760503, 0.768636, 3.336865, 0.2470588, 0, 1, 1,
0.4765252, -0.7859222, 3.020123, 0.254902, 0, 1, 1,
0.4827906, -2.436044, 2.282591, 0.2588235, 0, 1, 1,
0.4856793, -0.9364402, 4.288344, 0.2666667, 0, 1, 1,
0.4861144, -1.278911, 2.783962, 0.2705882, 0, 1, 1,
0.4870747, 1.835002, -0.9613018, 0.2784314, 0, 1, 1,
0.488172, 0.1713646, 0.8088655, 0.282353, 0, 1, 1,
0.490355, 0.3380363, 1.818647, 0.2901961, 0, 1, 1,
0.4950356, 1.060674, 1.966341, 0.2941177, 0, 1, 1,
0.4955747, 1.25863, 0.3676161, 0.3019608, 0, 1, 1,
0.4984055, -0.1527137, 4.917774, 0.3098039, 0, 1, 1,
0.5002766, 2.170377, -1.327839, 0.3137255, 0, 1, 1,
0.5042673, 0.04989929, 0.3446611, 0.3215686, 0, 1, 1,
0.5044807, -0.9782816, 2.548148, 0.3254902, 0, 1, 1,
0.5103669, -0.9264293, 2.971161, 0.3333333, 0, 1, 1,
0.5156465, -1.260156, 2.573228, 0.3372549, 0, 1, 1,
0.519556, -0.7243443, 2.7063, 0.345098, 0, 1, 1,
0.5221162, -0.7598846, 3.149273, 0.3490196, 0, 1, 1,
0.5250193, 1.977722, -0.8793973, 0.3568628, 0, 1, 1,
0.5257831, 1.278054, -0.3523451, 0.3607843, 0, 1, 1,
0.5272931, -0.3393262, 3.513522, 0.3686275, 0, 1, 1,
0.5366439, -0.3580643, 3.547381, 0.372549, 0, 1, 1,
0.5385743, -0.8801749, 0.8793734, 0.3803922, 0, 1, 1,
0.5398942, -0.1387021, 1.108224, 0.3843137, 0, 1, 1,
0.5407427, -0.1216379, 1.200267, 0.3921569, 0, 1, 1,
0.5424688, 0.52669, 1.183947, 0.3960784, 0, 1, 1,
0.5452835, -0.3095259, 3.415891, 0.4039216, 0, 1, 1,
0.5513242, -0.5444615, -0.3963595, 0.4117647, 0, 1, 1,
0.5526378, 0.5121059, 0.03242996, 0.4156863, 0, 1, 1,
0.5529013, -0.6461495, 2.363051, 0.4235294, 0, 1, 1,
0.5553367, -0.4506875, 3.498294, 0.427451, 0, 1, 1,
0.5590231, -1.473093, 2.538524, 0.4352941, 0, 1, 1,
0.5596608, -0.3596137, 1.783071, 0.4392157, 0, 1, 1,
0.5626791, 1.221472, -0.1140444, 0.4470588, 0, 1, 1,
0.5695862, 1.070478, 1.340031, 0.4509804, 0, 1, 1,
0.5798418, 0.1222188, 1.532987, 0.4588235, 0, 1, 1,
0.5799623, -1.34838, 1.792441, 0.4627451, 0, 1, 1,
0.5831745, -0.455009, 1.084742, 0.4705882, 0, 1, 1,
0.5924149, -1.354761, 2.834543, 0.4745098, 0, 1, 1,
0.5968333, -0.1863481, 2.077116, 0.4823529, 0, 1, 1,
0.6024031, -1.839435, 2.171955, 0.4862745, 0, 1, 1,
0.6058152, 0.465259, 0.9797971, 0.4941176, 0, 1, 1,
0.6087413, -0.3778401, 2.656008, 0.5019608, 0, 1, 1,
0.6096, -1.303298, 3.091341, 0.5058824, 0, 1, 1,
0.6127191, 0.9311695, -1.334076, 0.5137255, 0, 1, 1,
0.6239761, -1.461021, 1.832388, 0.5176471, 0, 1, 1,
0.6325785, -0.8169476, 1.899615, 0.5254902, 0, 1, 1,
0.6361758, -1.679003, 4.398861, 0.5294118, 0, 1, 1,
0.6369076, 0.5166662, 0.324633, 0.5372549, 0, 1, 1,
0.6386201, 0.8081452, 1.115805, 0.5411765, 0, 1, 1,
0.6498449, 0.8498375, 1.249021, 0.5490196, 0, 1, 1,
0.6506095, -0.1738695, 2.208634, 0.5529412, 0, 1, 1,
0.6521124, -0.378239, 3.849105, 0.5607843, 0, 1, 1,
0.6553597, 0.8933178, 1.232327, 0.5647059, 0, 1, 1,
0.6605524, -0.7839624, 2.545372, 0.572549, 0, 1, 1,
0.6656032, 0.885536, 0.6010927, 0.5764706, 0, 1, 1,
0.6664859, 1.41819, -1.537601, 0.5843138, 0, 1, 1,
0.6702706, 0.04363107, 2.450678, 0.5882353, 0, 1, 1,
0.674993, 0.6971339, 2.017107, 0.5960785, 0, 1, 1,
0.6756248, -0.9274262, 2.851959, 0.6039216, 0, 1, 1,
0.6777488, 0.3376227, -0.2018017, 0.6078432, 0, 1, 1,
0.6791503, 0.3413514, 1.589792, 0.6156863, 0, 1, 1,
0.6794557, 0.8357792, 0.8339196, 0.6196079, 0, 1, 1,
0.6810352, 0.4867265, 1.602047, 0.627451, 0, 1, 1,
0.6836054, 0.2790592, 1.599487, 0.6313726, 0, 1, 1,
0.6867012, 0.187923, 1.53521, 0.6392157, 0, 1, 1,
0.6877353, 0.3684519, 1.73047, 0.6431373, 0, 1, 1,
0.6878111, -1.517767, 1.222873, 0.6509804, 0, 1, 1,
0.6927401, 0.2918986, 1.64066, 0.654902, 0, 1, 1,
0.6939173, 2.385385, -0.07874574, 0.6627451, 0, 1, 1,
0.6950294, -0.1864761, 1.460024, 0.6666667, 0, 1, 1,
0.6957788, 0.08212118, -0.6289994, 0.6745098, 0, 1, 1,
0.703227, -0.7888947, 2.235844, 0.6784314, 0, 1, 1,
0.7059852, 0.7644259, 0.722401, 0.6862745, 0, 1, 1,
0.7080122, -1.24685, 1.943099, 0.6901961, 0, 1, 1,
0.7105625, 0.944173, -0.1091735, 0.6980392, 0, 1, 1,
0.7106458, -1.426364, 1.659907, 0.7058824, 0, 1, 1,
0.7126363, 0.1633278, 0.9371259, 0.7098039, 0, 1, 1,
0.7264297, -0.1398895, 1.667155, 0.7176471, 0, 1, 1,
0.7384512, 0.969246, 0.3141859, 0.7215686, 0, 1, 1,
0.7460493, 0.5702394, 2.095547, 0.7294118, 0, 1, 1,
0.7547113, -0.9098527, 2.504442, 0.7333333, 0, 1, 1,
0.7566327, -1.597976, 3.471936, 0.7411765, 0, 1, 1,
0.7600076, 0.2162436, 0.6650722, 0.7450981, 0, 1, 1,
0.7618598, 0.7902371, 0.9093148, 0.7529412, 0, 1, 1,
0.7619224, -0.7571821, 2.022084, 0.7568628, 0, 1, 1,
0.7636305, 0.6884859, -1.634978, 0.7647059, 0, 1, 1,
0.7765149, -0.8812945, 2.904673, 0.7686275, 0, 1, 1,
0.7775587, -0.06863221, 2.569404, 0.7764706, 0, 1, 1,
0.7786739, 1.698321, 0.003790956, 0.7803922, 0, 1, 1,
0.7868525, 0.2259396, 0.9532016, 0.7882353, 0, 1, 1,
0.7880181, -0.4535725, 1.98485, 0.7921569, 0, 1, 1,
0.7887493, -1.668308, 2.269767, 0.8, 0, 1, 1,
0.7980128, 0.1460539, 2.93768, 0.8078431, 0, 1, 1,
0.7992455, 0.7915865, 0.3746523, 0.8117647, 0, 1, 1,
0.8041335, -2.157896, 2.978266, 0.8196079, 0, 1, 1,
0.8089681, -0.3710624, 0.817925, 0.8235294, 0, 1, 1,
0.8099172, -0.6540139, 1.374095, 0.8313726, 0, 1, 1,
0.8104535, -1.788916, 2.597347, 0.8352941, 0, 1, 1,
0.8119509, 0.3378376, 1.686505, 0.8431373, 0, 1, 1,
0.8139578, 0.301663, 0.8603265, 0.8470588, 0, 1, 1,
0.8270413, 0.5822763, 1.891104, 0.854902, 0, 1, 1,
0.840476, 2.596142, 0.3123158, 0.8588235, 0, 1, 1,
0.8577323, 0.1517436, 3.55863, 0.8666667, 0, 1, 1,
0.8795286, -0.4921496, 1.413105, 0.8705882, 0, 1, 1,
0.8828349, -0.6028154, 1.612594, 0.8784314, 0, 1, 1,
0.8834584, 0.6304748, 1.741338, 0.8823529, 0, 1, 1,
0.884409, -0.217898, -0.358797, 0.8901961, 0, 1, 1,
0.8915538, 0.4904423, 1.974951, 0.8941177, 0, 1, 1,
0.8935434, -1.012718, 5.041052, 0.9019608, 0, 1, 1,
0.8959509, -1.40589, 3.566679, 0.9098039, 0, 1, 1,
0.8976799, 0.7911641, 1.132938, 0.9137255, 0, 1, 1,
0.903918, -1.14372, 3.24482, 0.9215686, 0, 1, 1,
0.9096037, 0.2292462, 1.758349, 0.9254902, 0, 1, 1,
0.9113512, 0.2604806, 1.822835, 0.9333333, 0, 1, 1,
0.9120122, 0.1365932, 2.1225, 0.9372549, 0, 1, 1,
0.9154124, 0.08319353, 2.551193, 0.945098, 0, 1, 1,
0.9165793, 1.004167, 0.5222263, 0.9490196, 0, 1, 1,
0.9213987, -1.34333, 2.125916, 0.9568627, 0, 1, 1,
0.9274691, 0.6885954, 1.251442, 0.9607843, 0, 1, 1,
0.9315166, -1.530998, 3.808544, 0.9686275, 0, 1, 1,
0.9328101, -1.158612, 2.702968, 0.972549, 0, 1, 1,
0.9383149, -0.1871697, 2.626342, 0.9803922, 0, 1, 1,
0.9470413, 1.342317, 1.017101, 0.9843137, 0, 1, 1,
0.9471143, 0.134075, 0.01748271, 0.9921569, 0, 1, 1,
0.9655739, -1.237094, 3.782419, 0.9960784, 0, 1, 1,
0.9698218, -0.7859146, 2.751925, 1, 0, 0.9960784, 1,
0.9704169, 0.8009493, 0.4754342, 1, 0, 0.9882353, 1,
0.976694, 0.01052806, 2.323136, 1, 0, 0.9843137, 1,
0.9772021, 0.5465041, 2.224718, 1, 0, 0.9764706, 1,
0.978814, 0.7777346, 1.48756, 1, 0, 0.972549, 1,
0.9790152, -2.323548, 2.212343, 1, 0, 0.9647059, 1,
0.982914, -0.003697571, -0.07590023, 1, 0, 0.9607843, 1,
0.9879825, 0.9358936, 0.2284455, 1, 0, 0.9529412, 1,
0.9971083, 1.847161, -0.004850081, 1, 0, 0.9490196, 1,
1.001674, -2.042352, 1.932664, 1, 0, 0.9411765, 1,
1.010961, -0.1417394, 2.834086, 1, 0, 0.9372549, 1,
1.02364, -1.039021, 2.260075, 1, 0, 0.9294118, 1,
1.025224, -0.8779266, 2.511335, 1, 0, 0.9254902, 1,
1.026257, 0.8094873, 0.1838837, 1, 0, 0.9176471, 1,
1.027064, -0.1232164, 2.089843, 1, 0, 0.9137255, 1,
1.027481, 0.6788915, 2.651766, 1, 0, 0.9058824, 1,
1.031168, 1.011894, -0.1730868, 1, 0, 0.9019608, 1,
1.031717, 1.189876, -0.153232, 1, 0, 0.8941177, 1,
1.038231, 0.02102603, -1.392108, 1, 0, 0.8862745, 1,
1.038406, 0.908834, 1.654972, 1, 0, 0.8823529, 1,
1.043841, -0.5541807, 1.211329, 1, 0, 0.8745098, 1,
1.05167, -0.8622352, 3.592091, 1, 0, 0.8705882, 1,
1.052445, -0.6307116, 3.600233, 1, 0, 0.8627451, 1,
1.05391, 0.2596928, 1.420757, 1, 0, 0.8588235, 1,
1.059691, 0.2523706, 1.663484, 1, 0, 0.8509804, 1,
1.062385, -0.208673, 2.288859, 1, 0, 0.8470588, 1,
1.062659, 1.596944, 0.9451319, 1, 0, 0.8392157, 1,
1.065349, -1.942826, 4.269742, 1, 0, 0.8352941, 1,
1.065838, 0.7678186, 1.513778, 1, 0, 0.827451, 1,
1.073789, -0.6879086, 2.550136, 1, 0, 0.8235294, 1,
1.076636, -0.1652831, -0.06717201, 1, 0, 0.8156863, 1,
1.076787, -0.1486109, 0.8354631, 1, 0, 0.8117647, 1,
1.08123, -0.08459593, 2.381735, 1, 0, 0.8039216, 1,
1.084159, 1.025712, 2.435444, 1, 0, 0.7960784, 1,
1.087521, 1.26532, -0.2156947, 1, 0, 0.7921569, 1,
1.087611, -1.011138, 3.025759, 1, 0, 0.7843137, 1,
1.097451, -0.1173183, 1.638211, 1, 0, 0.7803922, 1,
1.09921, 2.148535, -0.3448247, 1, 0, 0.772549, 1,
1.104669, -0.5757504, 1.97575, 1, 0, 0.7686275, 1,
1.113055, -1.473571, 1.787946, 1, 0, 0.7607843, 1,
1.115972, 0.1678379, 0.0866667, 1, 0, 0.7568628, 1,
1.11674, -0.7275091, 1.979267, 1, 0, 0.7490196, 1,
1.12029, -1.837562, 1.156097, 1, 0, 0.7450981, 1,
1.122162, -0.9798243, 2.99573, 1, 0, 0.7372549, 1,
1.132927, -0.009529287, 2.238012, 1, 0, 0.7333333, 1,
1.138665, 1.219959, 0.3362164, 1, 0, 0.7254902, 1,
1.142691, -1.302354, 1.33145, 1, 0, 0.7215686, 1,
1.150893, -0.1650829, 1.756334, 1, 0, 0.7137255, 1,
1.154404, -0.615228, 1.291035, 1, 0, 0.7098039, 1,
1.154859, -0.4586927, 1.072874, 1, 0, 0.7019608, 1,
1.176136, -0.8245474, 2.969444, 1, 0, 0.6941177, 1,
1.188184, -0.6087667, 2.156943, 1, 0, 0.6901961, 1,
1.194079, -0.2700079, 1.144009, 1, 0, 0.682353, 1,
1.197091, 0.5023457, 1.030908, 1, 0, 0.6784314, 1,
1.198239, 0.02998081, 1.791479, 1, 0, 0.6705883, 1,
1.204488, 0.7222147, 1.007951, 1, 0, 0.6666667, 1,
1.226763, 0.4688421, 2.350844, 1, 0, 0.6588235, 1,
1.234462, -1.088106, 3.749641, 1, 0, 0.654902, 1,
1.239417, -0.7617539, 2.576458, 1, 0, 0.6470588, 1,
1.239807, 0.7750507, 0.1150544, 1, 0, 0.6431373, 1,
1.247366, -0.7799179, 2.134171, 1, 0, 0.6352941, 1,
1.251616, -0.2958688, 2.961491, 1, 0, 0.6313726, 1,
1.252966, -0.2658458, 2.162723, 1, 0, 0.6235294, 1,
1.261392, 1.013058, 1.303833, 1, 0, 0.6196079, 1,
1.261602, 0.6974416, 0.3434518, 1, 0, 0.6117647, 1,
1.273575, 0.5529508, 0.04777843, 1, 0, 0.6078432, 1,
1.276598, -0.2097999, 0.4643421, 1, 0, 0.6, 1,
1.288447, -0.6049594, 2.404627, 1, 0, 0.5921569, 1,
1.296514, -0.1235847, 2.199993, 1, 0, 0.5882353, 1,
1.297059, -1.078513, 2.022974, 1, 0, 0.5803922, 1,
1.298952, 1.342964, 0.1389842, 1, 0, 0.5764706, 1,
1.306693, -1.072754, 1.597769, 1, 0, 0.5686275, 1,
1.310205, 0.5370892, 0.4976417, 1, 0, 0.5647059, 1,
1.311295, -1.84979, 2.821974, 1, 0, 0.5568628, 1,
1.316069, -0.3145937, 0.4633461, 1, 0, 0.5529412, 1,
1.322345, 0.4725772, -0.1655857, 1, 0, 0.5450981, 1,
1.324616, 0.1749169, 1.959965, 1, 0, 0.5411765, 1,
1.345002, -1.107778, 1.766718, 1, 0, 0.5333334, 1,
1.347854, -0.4096196, 2.34807, 1, 0, 0.5294118, 1,
1.366073, 0.315082, 1.409456, 1, 0, 0.5215687, 1,
1.367231, 1.56754, 1.201976, 1, 0, 0.5176471, 1,
1.369113, -0.50566, 2.8477, 1, 0, 0.509804, 1,
1.373566, 0.001789284, 2.070666, 1, 0, 0.5058824, 1,
1.382368, 0.86521, 0.4362462, 1, 0, 0.4980392, 1,
1.387878, 0.3062195, -0.0453252, 1, 0, 0.4901961, 1,
1.388965, -0.6842597, 0.8374422, 1, 0, 0.4862745, 1,
1.403948, 0.02906808, 2.628593, 1, 0, 0.4784314, 1,
1.410237, 0.1951018, 0.2807288, 1, 0, 0.4745098, 1,
1.411439, -1.396335, 0.3712133, 1, 0, 0.4666667, 1,
1.428075, -0.5290304, 3.636912, 1, 0, 0.4627451, 1,
1.433044, -1.868031, 2.052024, 1, 0, 0.454902, 1,
1.433916, -1.353831, 2.213128, 1, 0, 0.4509804, 1,
1.435554, -0.6980072, 0.8584975, 1, 0, 0.4431373, 1,
1.438071, 0.0230113, 1.645042, 1, 0, 0.4392157, 1,
1.438406, -0.5711454, 0.8576239, 1, 0, 0.4313726, 1,
1.442047, -0.9292393, 1.303162, 1, 0, 0.427451, 1,
1.446847, -0.3587913, 2.694154, 1, 0, 0.4196078, 1,
1.448035, 0.7459955, 3.802876, 1, 0, 0.4156863, 1,
1.449095, -1.98158, 1.577866, 1, 0, 0.4078431, 1,
1.48487, 1.200816, 1.562761, 1, 0, 0.4039216, 1,
1.495229, 0.7815069, 2.909848, 1, 0, 0.3960784, 1,
1.503923, 0.9205942, 2.392195, 1, 0, 0.3882353, 1,
1.520569, 0.5348761, 0.6162411, 1, 0, 0.3843137, 1,
1.521904, -1.096318, 2.007518, 1, 0, 0.3764706, 1,
1.528725, -0.8790652, 1.739372, 1, 0, 0.372549, 1,
1.530295, -0.8705687, 1.494057, 1, 0, 0.3647059, 1,
1.545401, 0.7710111, -1.087839, 1, 0, 0.3607843, 1,
1.54563, -1.281772, 2.331586, 1, 0, 0.3529412, 1,
1.594352, -1.314038, 2.674569, 1, 0, 0.3490196, 1,
1.597985, -0.814653, 1.874059, 1, 0, 0.3411765, 1,
1.61453, -0.8562412, 2.531851, 1, 0, 0.3372549, 1,
1.614604, 0.05448868, 1.386265, 1, 0, 0.3294118, 1,
1.621415, -0.3291987, 2.154377, 1, 0, 0.3254902, 1,
1.625255, 0.3243318, 0.9988679, 1, 0, 0.3176471, 1,
1.640311, 0.4902977, 1.207467, 1, 0, 0.3137255, 1,
1.644729, 0.7349123, 2.110254, 1, 0, 0.3058824, 1,
1.65912, -1.919897, 2.056679, 1, 0, 0.2980392, 1,
1.683974, 1.561815, 1.111457, 1, 0, 0.2941177, 1,
1.697852, -1.139475, 1.96934, 1, 0, 0.2862745, 1,
1.700263, -1.376019, 2.871867, 1, 0, 0.282353, 1,
1.703473, -0.09448188, 0.8720811, 1, 0, 0.2745098, 1,
1.703565, -0.256254, 3.765457, 1, 0, 0.2705882, 1,
1.707353, -1.781976, 2.064567, 1, 0, 0.2627451, 1,
1.711756, 0.8837487, 1.062141, 1, 0, 0.2588235, 1,
1.724572, -0.4704381, 0.9637353, 1, 0, 0.2509804, 1,
1.758379, 0.7807734, -0.5147438, 1, 0, 0.2470588, 1,
1.761215, 1.228683, 1.720783, 1, 0, 0.2392157, 1,
1.762911, 0.1172938, 2.718282, 1, 0, 0.2352941, 1,
1.774096, -1.956053, 1.529634, 1, 0, 0.227451, 1,
1.778238, 1.054778, -0.2958584, 1, 0, 0.2235294, 1,
1.790018, 0.3882916, 2.359679, 1, 0, 0.2156863, 1,
1.791925, -0.1389653, 0.6017251, 1, 0, 0.2117647, 1,
1.806296, 0.7129592, -0.64204, 1, 0, 0.2039216, 1,
1.820873, 0.6978244, 0.1324229, 1, 0, 0.1960784, 1,
1.830261, -0.7722354, 1.573195, 1, 0, 0.1921569, 1,
1.831028, -0.8047211, 2.534504, 1, 0, 0.1843137, 1,
1.835351, -1.005633, 2.051297, 1, 0, 0.1803922, 1,
1.841354, -0.4769398, 3.288224, 1, 0, 0.172549, 1,
1.84659, 1.273305, 0.2919747, 1, 0, 0.1686275, 1,
1.85134, 1.400179, -0.1264053, 1, 0, 0.1607843, 1,
1.863186, 2.513412, 0.4624959, 1, 0, 0.1568628, 1,
1.896075, 0.382815, 1.75454, 1, 0, 0.1490196, 1,
1.936623, -0.09471809, 1.556212, 1, 0, 0.145098, 1,
1.969974, 0.6703225, 1.031095, 1, 0, 0.1372549, 1,
1.979231, -0.9083226, 3.490891, 1, 0, 0.1333333, 1,
1.999998, 0.9203597, -0.3160188, 1, 0, 0.1254902, 1,
2.000758, 0.2920234, 2.822909, 1, 0, 0.1215686, 1,
2.006595, -0.09837849, 1.340617, 1, 0, 0.1137255, 1,
2.056633, -1.746182, 2.318399, 1, 0, 0.1098039, 1,
2.118814, 3.016812, -0.2624732, 1, 0, 0.1019608, 1,
2.184702, -1.125862, 0.536585, 1, 0, 0.09411765, 1,
2.195171, -0.5103803, 1.731668, 1, 0, 0.09019608, 1,
2.20553, -1.892302, 2.163251, 1, 0, 0.08235294, 1,
2.206646, 0.6886101, 2.716264, 1, 0, 0.07843138, 1,
2.261408, 1.941573, 0.9477286, 1, 0, 0.07058824, 1,
2.309799, 0.8483213, 2.166215, 1, 0, 0.06666667, 1,
2.312012, 0.2596114, 1.447557, 1, 0, 0.05882353, 1,
2.315506, -0.3600898, 1.66398, 1, 0, 0.05490196, 1,
2.521972, 1.444664, -0.06340054, 1, 0, 0.04705882, 1,
2.534607, 0.1549237, 1.937696, 1, 0, 0.04313726, 1,
2.565217, -0.7461054, 1.260136, 1, 0, 0.03529412, 1,
2.619892, 2.175042, 0.0340619, 1, 0, 0.03137255, 1,
2.897834, 0.3255016, 3.387698, 1, 0, 0.02352941, 1,
3.404484, 0.3536955, 0.4535255, 1, 0, 0.01960784, 1,
3.666703, 0.3801107, 0.874741, 1, 0, 0.01176471, 1,
3.911647, 1.124074, 2.00135, 1, 0, 0.007843138, 1
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
0.6180296, -4.512053, -8.064493, 0, -0.5, 0.5, 0.5,
0.6180296, -4.512053, -8.064493, 1, -0.5, 0.5, 0.5,
0.6180296, -4.512053, -8.064493, 1, 1.5, 0.5, 0.5,
0.6180296, -4.512053, -8.064493, 0, 1.5, 0.5, 0.5
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
-3.792124, -0.202027, -8.064493, 0, -0.5, 0.5, 0.5,
-3.792124, -0.202027, -8.064493, 1, -0.5, 0.5, 0.5,
-3.792124, -0.202027, -8.064493, 1, 1.5, 0.5, 0.5,
-3.792124, -0.202027, -8.064493, 0, 1.5, 0.5, 0.5
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
-3.792124, -4.512053, 0.1787422, 0, -0.5, 0.5, 0.5,
-3.792124, -4.512053, 0.1787422, 1, -0.5, 0.5, 0.5,
-3.792124, -4.512053, 0.1787422, 1, 1.5, 0.5, 0.5,
-3.792124, -4.512053, 0.1787422, 0, 1.5, 0.5, 0.5
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
-2, -3.517431, -6.162209,
3, -3.517431, -6.162209,
-2, -3.517431, -6.162209,
-2, -3.683201, -6.479256,
-1, -3.517431, -6.162209,
-1, -3.683201, -6.479256,
0, -3.517431, -6.162209,
0, -3.683201, -6.479256,
1, -3.517431, -6.162209,
1, -3.683201, -6.479256,
2, -3.517431, -6.162209,
2, -3.683201, -6.479256,
3, -3.517431, -6.162209,
3, -3.683201, -6.479256
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
-2, -4.014742, -7.113351, 0, -0.5, 0.5, 0.5,
-2, -4.014742, -7.113351, 1, -0.5, 0.5, 0.5,
-2, -4.014742, -7.113351, 1, 1.5, 0.5, 0.5,
-2, -4.014742, -7.113351, 0, 1.5, 0.5, 0.5,
-1, -4.014742, -7.113351, 0, -0.5, 0.5, 0.5,
-1, -4.014742, -7.113351, 1, -0.5, 0.5, 0.5,
-1, -4.014742, -7.113351, 1, 1.5, 0.5, 0.5,
-1, -4.014742, -7.113351, 0, 1.5, 0.5, 0.5,
0, -4.014742, -7.113351, 0, -0.5, 0.5, 0.5,
0, -4.014742, -7.113351, 1, -0.5, 0.5, 0.5,
0, -4.014742, -7.113351, 1, 1.5, 0.5, 0.5,
0, -4.014742, -7.113351, 0, 1.5, 0.5, 0.5,
1, -4.014742, -7.113351, 0, -0.5, 0.5, 0.5,
1, -4.014742, -7.113351, 1, -0.5, 0.5, 0.5,
1, -4.014742, -7.113351, 1, 1.5, 0.5, 0.5,
1, -4.014742, -7.113351, 0, 1.5, 0.5, 0.5,
2, -4.014742, -7.113351, 0, -0.5, 0.5, 0.5,
2, -4.014742, -7.113351, 1, -0.5, 0.5, 0.5,
2, -4.014742, -7.113351, 1, 1.5, 0.5, 0.5,
2, -4.014742, -7.113351, 0, 1.5, 0.5, 0.5,
3, -4.014742, -7.113351, 0, -0.5, 0.5, 0.5,
3, -4.014742, -7.113351, 1, -0.5, 0.5, 0.5,
3, -4.014742, -7.113351, 1, 1.5, 0.5, 0.5,
3, -4.014742, -7.113351, 0, 1.5, 0.5, 0.5
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
-2.774396, -3, -6.162209,
-2.774396, 3, -6.162209,
-2.774396, -3, -6.162209,
-2.944017, -3, -6.479256,
-2.774396, -2, -6.162209,
-2.944017, -2, -6.479256,
-2.774396, -1, -6.162209,
-2.944017, -1, -6.479256,
-2.774396, 0, -6.162209,
-2.944017, 0, -6.479256,
-2.774396, 1, -6.162209,
-2.944017, 1, -6.479256,
-2.774396, 2, -6.162209,
-2.944017, 2, -6.479256,
-2.774396, 3, -6.162209,
-2.944017, 3, -6.479256
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
-3.28326, -3, -7.113351, 0, -0.5, 0.5, 0.5,
-3.28326, -3, -7.113351, 1, -0.5, 0.5, 0.5,
-3.28326, -3, -7.113351, 1, 1.5, 0.5, 0.5,
-3.28326, -3, -7.113351, 0, 1.5, 0.5, 0.5,
-3.28326, -2, -7.113351, 0, -0.5, 0.5, 0.5,
-3.28326, -2, -7.113351, 1, -0.5, 0.5, 0.5,
-3.28326, -2, -7.113351, 1, 1.5, 0.5, 0.5,
-3.28326, -2, -7.113351, 0, 1.5, 0.5, 0.5,
-3.28326, -1, -7.113351, 0, -0.5, 0.5, 0.5,
-3.28326, -1, -7.113351, 1, -0.5, 0.5, 0.5,
-3.28326, -1, -7.113351, 1, 1.5, 0.5, 0.5,
-3.28326, -1, -7.113351, 0, 1.5, 0.5, 0.5,
-3.28326, 0, -7.113351, 0, -0.5, 0.5, 0.5,
-3.28326, 0, -7.113351, 1, -0.5, 0.5, 0.5,
-3.28326, 0, -7.113351, 1, 1.5, 0.5, 0.5,
-3.28326, 0, -7.113351, 0, 1.5, 0.5, 0.5,
-3.28326, 1, -7.113351, 0, -0.5, 0.5, 0.5,
-3.28326, 1, -7.113351, 1, -0.5, 0.5, 0.5,
-3.28326, 1, -7.113351, 1, 1.5, 0.5, 0.5,
-3.28326, 1, -7.113351, 0, 1.5, 0.5, 0.5,
-3.28326, 2, -7.113351, 0, -0.5, 0.5, 0.5,
-3.28326, 2, -7.113351, 1, -0.5, 0.5, 0.5,
-3.28326, 2, -7.113351, 1, 1.5, 0.5, 0.5,
-3.28326, 2, -7.113351, 0, 1.5, 0.5, 0.5,
-3.28326, 3, -7.113351, 0, -0.5, 0.5, 0.5,
-3.28326, 3, -7.113351, 1, -0.5, 0.5, 0.5,
-3.28326, 3, -7.113351, 1, 1.5, 0.5, 0.5,
-3.28326, 3, -7.113351, 0, 1.5, 0.5, 0.5
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
-2.774396, -3.517431, -4,
-2.774396, -3.517431, 6,
-2.774396, -3.517431, -4,
-2.944017, -3.683201, -4,
-2.774396, -3.517431, -2,
-2.944017, -3.683201, -2,
-2.774396, -3.517431, 0,
-2.944017, -3.683201, 0,
-2.774396, -3.517431, 2,
-2.944017, -3.683201, 2,
-2.774396, -3.517431, 4,
-2.944017, -3.683201, 4,
-2.774396, -3.517431, 6,
-2.944017, -3.683201, 6
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
"4",
"6"
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
-3.28326, -4.014742, -4, 0, -0.5, 0.5, 0.5,
-3.28326, -4.014742, -4, 1, -0.5, 0.5, 0.5,
-3.28326, -4.014742, -4, 1, 1.5, 0.5, 0.5,
-3.28326, -4.014742, -4, 0, 1.5, 0.5, 0.5,
-3.28326, -4.014742, -2, 0, -0.5, 0.5, 0.5,
-3.28326, -4.014742, -2, 1, -0.5, 0.5, 0.5,
-3.28326, -4.014742, -2, 1, 1.5, 0.5, 0.5,
-3.28326, -4.014742, -2, 0, 1.5, 0.5, 0.5,
-3.28326, -4.014742, 0, 0, -0.5, 0.5, 0.5,
-3.28326, -4.014742, 0, 1, -0.5, 0.5, 0.5,
-3.28326, -4.014742, 0, 1, 1.5, 0.5, 0.5,
-3.28326, -4.014742, 0, 0, 1.5, 0.5, 0.5,
-3.28326, -4.014742, 2, 0, -0.5, 0.5, 0.5,
-3.28326, -4.014742, 2, 1, -0.5, 0.5, 0.5,
-3.28326, -4.014742, 2, 1, 1.5, 0.5, 0.5,
-3.28326, -4.014742, 2, 0, 1.5, 0.5, 0.5,
-3.28326, -4.014742, 4, 0, -0.5, 0.5, 0.5,
-3.28326, -4.014742, 4, 1, -0.5, 0.5, 0.5,
-3.28326, -4.014742, 4, 1, 1.5, 0.5, 0.5,
-3.28326, -4.014742, 4, 0, 1.5, 0.5, 0.5,
-3.28326, -4.014742, 6, 0, -0.5, 0.5, 0.5,
-3.28326, -4.014742, 6, 1, -0.5, 0.5, 0.5,
-3.28326, -4.014742, 6, 1, 1.5, 0.5, 0.5,
-3.28326, -4.014742, 6, 0, 1.5, 0.5, 0.5
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
-2.774396, -3.517431, -6.162209,
-2.774396, 3.113377, -6.162209,
-2.774396, -3.517431, 6.519693,
-2.774396, 3.113377, 6.519693,
-2.774396, -3.517431, -6.162209,
-2.774396, -3.517431, 6.519693,
-2.774396, 3.113377, -6.162209,
-2.774396, 3.113377, 6.519693,
-2.774396, -3.517431, -6.162209,
4.010455, -3.517431, -6.162209,
-2.774396, -3.517431, 6.519693,
4.010455, -3.517431, 6.519693,
-2.774396, 3.113377, -6.162209,
4.010455, 3.113377, -6.162209,
-2.774396, 3.113377, 6.519693,
4.010455, 3.113377, 6.519693,
4.010455, -3.517431, -6.162209,
4.010455, 3.113377, -6.162209,
4.010455, -3.517431, 6.519693,
4.010455, 3.113377, 6.519693,
4.010455, -3.517431, -6.162209,
4.010455, -3.517431, 6.519693,
4.010455, 3.113377, -6.162209,
4.010455, 3.113377, 6.519693
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
var radius = 8.457019;
var distance = 37.62624;
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
mvMatrix.translate( -0.6180296, 0.202027, -0.1787422 );
mvMatrix.scale( 1.347693, 1.379001, 0.7210193 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.62624);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Mecoprop<-read.table("Mecoprop.xyz")
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
-2.675587, 0.277144, -2.630422, 0, 0, 1, 1, 1,
-2.607077, 1.216805, -1.404525, 1, 0, 0, 1, 1,
-2.558197, -0.3451634, -2.154081, 1, 0, 0, 1, 1,
-2.429708, 0.04701039, -0.8737866, 1, 0, 0, 1, 1,
-2.415755, 1.228824, -1.814192, 1, 0, 0, 1, 1,
-2.2287, -1.180117, -2.459347, 1, 0, 0, 1, 1,
-2.176196, -1.214697, -2.076841, 0, 0, 0, 1, 1,
-2.167645, 0.9518825, -1.344292, 0, 0, 0, 1, 1,
-2.158929, 0.9809971, -0.4887128, 0, 0, 0, 1, 1,
-2.117223, -0.6400807, -1.743417, 0, 0, 0, 1, 1,
-2.06734, -0.7828393, -3.268064, 0, 0, 0, 1, 1,
-2.048111, 1.002398, -0.9617501, 0, 0, 0, 1, 1,
-2.028043, -0.1886809, -3.178147, 0, 0, 0, 1, 1,
-1.999643, -0.4898845, -1.666476, 1, 1, 1, 1, 1,
-1.984533, 0.7653548, -1.384396, 1, 1, 1, 1, 1,
-1.977706, -0.05818355, -1.672575, 1, 1, 1, 1, 1,
-1.970936, 1.37481, -2.21704, 1, 1, 1, 1, 1,
-1.968783, -0.7109761, -1.962437, 1, 1, 1, 1, 1,
-1.95513, 1.098772, -0.393896, 1, 1, 1, 1, 1,
-1.951962, 0.1103608, -2.465419, 1, 1, 1, 1, 1,
-1.949411, 0.1363388, -2.340191, 1, 1, 1, 1, 1,
-1.929344, -1.12237, -2.354216, 1, 1, 1, 1, 1,
-1.924791, -1.715554, -1.801146, 1, 1, 1, 1, 1,
-1.875773, 0.545336, -3.361278, 1, 1, 1, 1, 1,
-1.874382, -0.5679758, -3.330301, 1, 1, 1, 1, 1,
-1.855859, -0.6674294, -1.360177, 1, 1, 1, 1, 1,
-1.851051, -0.205861, -2.392219, 1, 1, 1, 1, 1,
-1.819243, -0.1370225, -3.302463, 1, 1, 1, 1, 1,
-1.789368, -1.336973, -2.231787, 0, 0, 1, 1, 1,
-1.786533, -0.3513802, -2.829789, 1, 0, 0, 1, 1,
-1.778194, -0.02853806, -2.972296, 1, 0, 0, 1, 1,
-1.76949, -0.9836364, -2.733411, 1, 0, 0, 1, 1,
-1.745549, -0.1597393, -0.774035, 1, 0, 0, 1, 1,
-1.739568, 1.151375, -0.767551, 1, 0, 0, 1, 1,
-1.727022, 0.3536744, -1.712239, 0, 0, 0, 1, 1,
-1.696647, -1.315776, -3.059179, 0, 0, 0, 1, 1,
-1.686052, 0.1964118, -0.3736531, 0, 0, 0, 1, 1,
-1.68564, -0.4751834, -0.5369387, 0, 0, 0, 1, 1,
-1.666691, 0.3163681, -0.605881, 0, 0, 0, 1, 1,
-1.666202, -0.7073587, -2.012511, 0, 0, 0, 1, 1,
-1.663996, 0.9473819, 0.4337404, 0, 0, 0, 1, 1,
-1.659295, -0.7080893, -1.275881, 1, 1, 1, 1, 1,
-1.658253, -0.1265486, -2.306248, 1, 1, 1, 1, 1,
-1.652281, 1.297441, -0.9730915, 1, 1, 1, 1, 1,
-1.626315, -0.8029786, -2.525052, 1, 1, 1, 1, 1,
-1.618295, -1.046022, -0.3908871, 1, 1, 1, 1, 1,
-1.615212, 0.2003235, -2.763828, 1, 1, 1, 1, 1,
-1.609252, 0.2808101, -1.881681, 1, 1, 1, 1, 1,
-1.606969, -1.692079, -2.694906, 1, 1, 1, 1, 1,
-1.604048, -1.046661, -2.835904, 1, 1, 1, 1, 1,
-1.593046, -1.876033, -2.032197, 1, 1, 1, 1, 1,
-1.586696, 0.9535115, -1.396681, 1, 1, 1, 1, 1,
-1.578928, -0.2710403, -1.784712, 1, 1, 1, 1, 1,
-1.544326, -2.697423, -3.7198, 1, 1, 1, 1, 1,
-1.537218, -0.6908997, -2.97571, 1, 1, 1, 1, 1,
-1.535866, -0.7936527, -1.497961, 1, 1, 1, 1, 1,
-1.529312, -0.2667133, -1.953837, 0, 0, 1, 1, 1,
-1.525652, 0.6475938, 0.09208533, 1, 0, 0, 1, 1,
-1.52293, -0.7116515, -1.645437, 1, 0, 0, 1, 1,
-1.516851, 0.8862805, -0.9337065, 1, 0, 0, 1, 1,
-1.513828, 1.35404, -0.4609944, 1, 0, 0, 1, 1,
-1.513362, 0.0002319899, -1.463947, 1, 0, 0, 1, 1,
-1.512606, -1.560195, -2.030011, 0, 0, 0, 1, 1,
-1.510908, 0.5842183, -0.7373674, 0, 0, 0, 1, 1,
-1.493134, 1.314694, -1.009832, 0, 0, 0, 1, 1,
-1.486138, -0.4531982, -1.82754, 0, 0, 0, 1, 1,
-1.484752, 0.7399686, -1.52647, 0, 0, 0, 1, 1,
-1.482799, 1.701308, -1.45037, 0, 0, 0, 1, 1,
-1.458498, 0.674458, -2.599707, 0, 0, 0, 1, 1,
-1.444876, -0.7884884, -2.74472, 1, 1, 1, 1, 1,
-1.444838, 0.6953641, -1.019867, 1, 1, 1, 1, 1,
-1.44215, 0.3537025, -0.8707366, 1, 1, 1, 1, 1,
-1.432251, -0.4990129, 0.0006523127, 1, 1, 1, 1, 1,
-1.428171, -0.3547643, -1.006881, 1, 1, 1, 1, 1,
-1.42739, 0.5338646, -2.44437, 1, 1, 1, 1, 1,
-1.423777, -0.659227, -2.67714, 1, 1, 1, 1, 1,
-1.407042, 0.006882509, -1.425896, 1, 1, 1, 1, 1,
-1.406573, 1.083434, 0.1370895, 1, 1, 1, 1, 1,
-1.400561, -0.3640832, -3.030833, 1, 1, 1, 1, 1,
-1.395442, 0.03449561, -0.8679352, 1, 1, 1, 1, 1,
-1.386179, 0.4621121, -2.401242, 1, 1, 1, 1, 1,
-1.383681, -2.057648, -2.348864, 1, 1, 1, 1, 1,
-1.378587, 0.3552749, -0.4203526, 1, 1, 1, 1, 1,
-1.372818, -0.3375054, -1.578563, 1, 1, 1, 1, 1,
-1.371641, -1.243321, -1.426214, 0, 0, 1, 1, 1,
-1.365239, 0.2123068, -2.620085, 1, 0, 0, 1, 1,
-1.357033, 0.4770395, -0.7575052, 1, 0, 0, 1, 1,
-1.354294, -1.058162, -2.465662, 1, 0, 0, 1, 1,
-1.343131, 0.8225556, -0.06269384, 1, 0, 0, 1, 1,
-1.334695, 0.888234, -0.6834905, 1, 0, 0, 1, 1,
-1.32586, 0.1606522, -0.4064244, 0, 0, 0, 1, 1,
-1.319657, 0.6165795, -1.283841, 0, 0, 0, 1, 1,
-1.312976, -0.9108311, -0.8855477, 0, 0, 0, 1, 1,
-1.308026, -0.6493029, -1.619711, 0, 0, 0, 1, 1,
-1.304476, -1.513173, -2.16977, 0, 0, 0, 1, 1,
-1.302033, 0.8551242, -0.6331212, 0, 0, 0, 1, 1,
-1.289139, 1.047141, -2.094706, 0, 0, 0, 1, 1,
-1.288191, 0.9588045, 0.2173394, 1, 1, 1, 1, 1,
-1.288081, -1.070063, -3.209744, 1, 1, 1, 1, 1,
-1.284244, -1.935768, -1.585194, 1, 1, 1, 1, 1,
-1.282437, 0.3409065, -1.024752, 1, 1, 1, 1, 1,
-1.271741, -0.5767206, -0.4604665, 1, 1, 1, 1, 1,
-1.256728, 0.5192522, -0.2073594, 1, 1, 1, 1, 1,
-1.254174, 0.205061, -1.656222, 1, 1, 1, 1, 1,
-1.251554, 0.4068628, -0.9462893, 1, 1, 1, 1, 1,
-1.251009, -2.32082, -1.864917, 1, 1, 1, 1, 1,
-1.248116, -0.1173842, -1.178379, 1, 1, 1, 1, 1,
-1.24208, 1.209174, -0.8628539, 1, 1, 1, 1, 1,
-1.236634, 0.281468, -1.421954, 1, 1, 1, 1, 1,
-1.230838, -0.7485649, -2.106996, 1, 1, 1, 1, 1,
-1.230054, -1.879987, -0.4591523, 1, 1, 1, 1, 1,
-1.226599, 0.8769435, -1.315302, 1, 1, 1, 1, 1,
-1.218016, 0.09000146, -0.4113308, 0, 0, 1, 1, 1,
-1.210732, -0.4198707, -3.924144, 1, 0, 0, 1, 1,
-1.207483, -0.03147969, -1.092726, 1, 0, 0, 1, 1,
-1.205606, 0.07682244, -0.6174359, 1, 0, 0, 1, 1,
-1.204431, -0.8046766, -0.810355, 1, 0, 0, 1, 1,
-1.203404, -0.8451385, -1.420305, 1, 0, 0, 1, 1,
-1.198556, 0.7909381, -0.9595178, 0, 0, 0, 1, 1,
-1.194854, -0.9292659, -3.820668, 0, 0, 0, 1, 1,
-1.18885, 0.6146069, -2.724076, 0, 0, 0, 1, 1,
-1.185237, 0.6696656, 0.9737386, 0, 0, 0, 1, 1,
-1.184481, 0.9416728, 1.112608, 0, 0, 0, 1, 1,
-1.176894, -2.280083, -2.039753, 0, 0, 0, 1, 1,
-1.170897, 0.1199666, -1.387363, 0, 0, 0, 1, 1,
-1.162258, 0.5552007, -0.2499496, 1, 1, 1, 1, 1,
-1.152048, -1.26517, -1.467652, 1, 1, 1, 1, 1,
-1.150817, -1.903062, -0.5207623, 1, 1, 1, 1, 1,
-1.150118, -2.613978, -3.233023, 1, 1, 1, 1, 1,
-1.139239, -1.482799, -3.791125, 1, 1, 1, 1, 1,
-1.128915, -0.5928038, -1.732121, 1, 1, 1, 1, 1,
-1.126571, 0.1752383, -3.094491, 1, 1, 1, 1, 1,
-1.126215, -0.3659055, -2.808334, 1, 1, 1, 1, 1,
-1.103214, 0.720786, -1.260464, 1, 1, 1, 1, 1,
-1.102312, -0.07116091, -3.967396, 1, 1, 1, 1, 1,
-1.101689, -0.8594063, -2.325308, 1, 1, 1, 1, 1,
-1.1016, 0.4269144, 0.8387309, 1, 1, 1, 1, 1,
-1.100611, -0.2156817, -0.8720838, 1, 1, 1, 1, 1,
-1.098988, 0.3384201, -2.093717, 1, 1, 1, 1, 1,
-1.093403, -0.01024259, -0.489318, 1, 1, 1, 1, 1,
-1.090868, -0.6164464, -1.149601, 0, 0, 1, 1, 1,
-1.077461, 0.2536593, -2.511484, 1, 0, 0, 1, 1,
-1.069156, 0.5878242, 0.1775567, 1, 0, 0, 1, 1,
-1.067044, -0.1623674, -1.60695, 1, 0, 0, 1, 1,
-1.065255, -0.7407004, -4.183778, 1, 0, 0, 1, 1,
-1.059666, 0.7219833, -0.7685251, 1, 0, 0, 1, 1,
-1.054696, 0.3060371, -1.169173, 0, 0, 0, 1, 1,
-1.052327, 0.3793809, -2.336448, 0, 0, 0, 1, 1,
-1.05047, -1.111119, -1.222194, 0, 0, 0, 1, 1,
-1.049172, -0.5821881, -3.375729, 0, 0, 0, 1, 1,
-1.039551, -0.9502774, -2.366278, 0, 0, 0, 1, 1,
-1.034872, 0.2314724, -0.5261183, 0, 0, 0, 1, 1,
-1.034843, 1.037359, -0.788222, 0, 0, 0, 1, 1,
-1.03347, -1.595057, -2.699868, 1, 1, 1, 1, 1,
-1.02125, 1.803514, -1.3697, 1, 1, 1, 1, 1,
-1.017934, 0.4683183, -1.69415, 1, 1, 1, 1, 1,
-1.012998, 0.5578383, -1.284091, 1, 1, 1, 1, 1,
-1.012394, 0.7528223, -1.533375, 1, 1, 1, 1, 1,
-1.00336, 0.4769716, -3.145777, 1, 1, 1, 1, 1,
-1.001398, 0.439499, -0.9673549, 1, 1, 1, 1, 1,
-0.9972075, -0.6920601, -1.530488, 1, 1, 1, 1, 1,
-0.9910675, 0.420009, -1.904306, 1, 1, 1, 1, 1,
-0.9876253, -0.8344238, 0.3930238, 1, 1, 1, 1, 1,
-0.9876127, 0.05147105, -1.494147, 1, 1, 1, 1, 1,
-0.9872076, 0.5743838, 0.00616379, 1, 1, 1, 1, 1,
-0.9828101, 0.5515949, -1.017676, 1, 1, 1, 1, 1,
-0.9778259, -0.5052297, -0.246114, 1, 1, 1, 1, 1,
-0.9704576, -0.3229873, -2.470233, 1, 1, 1, 1, 1,
-0.9701932, -0.4681145, -3.419799, 0, 0, 1, 1, 1,
-0.9700699, 1.635436, -0.9715222, 1, 0, 0, 1, 1,
-0.9644549, -2.84138, -2.521982, 1, 0, 0, 1, 1,
-0.9615921, 0.311564, -0.01864365, 1, 0, 0, 1, 1,
-0.9580167, -0.5541147, -1.616034, 1, 0, 0, 1, 1,
-0.956163, -1.623952, -1.76896, 1, 0, 0, 1, 1,
-0.9423845, 0.2858316, -2.163021, 0, 0, 0, 1, 1,
-0.9418786, -0.5451884, -3.78969, 0, 0, 0, 1, 1,
-0.9410881, -1.398706, -1.166904, 0, 0, 0, 1, 1,
-0.9409708, -0.2603688, -1.810729, 0, 0, 0, 1, 1,
-0.9402335, -0.4889291, -1.483196, 0, 0, 0, 1, 1,
-0.9401419, -1.776474, -2.096433, 0, 0, 0, 1, 1,
-0.9389135, -0.4518006, -3.024986, 0, 0, 0, 1, 1,
-0.9363096, -0.4430423, -0.1735194, 1, 1, 1, 1, 1,
-0.9341473, -0.08583743, -3.910658, 1, 1, 1, 1, 1,
-0.9328433, 0.8948793, 1.522114, 1, 1, 1, 1, 1,
-0.9271332, -0.2521919, -4.784917, 1, 1, 1, 1, 1,
-0.9208571, 0.6374515, -2.558304, 1, 1, 1, 1, 1,
-0.9171597, -2.205608, -2.311945, 1, 1, 1, 1, 1,
-0.9140335, 1.26973, -0.2184593, 1, 1, 1, 1, 1,
-0.9120752, 0.5731596, -0.1591684, 1, 1, 1, 1, 1,
-0.9101287, 2.294042, 0.6306773, 1, 1, 1, 1, 1,
-0.9077557, -2.477108, -1.202027, 1, 1, 1, 1, 1,
-0.9057496, 0.6549023, -2.124182, 1, 1, 1, 1, 1,
-0.9002343, 0.2994283, -0.2563754, 1, 1, 1, 1, 1,
-0.8980294, 0.799217, 0.1072411, 1, 1, 1, 1, 1,
-0.8873424, 1.701089, 1.431606, 1, 1, 1, 1, 1,
-0.8841513, -3.420866, -1.601182, 1, 1, 1, 1, 1,
-0.8825899, -0.6513007, -1.895643, 0, 0, 1, 1, 1,
-0.8809448, -0.2381915, -0.7043946, 1, 0, 0, 1, 1,
-0.8749866, -0.6504368, -0.8999577, 1, 0, 0, 1, 1,
-0.8710478, -0.8422547, -1.918419, 1, 0, 0, 1, 1,
-0.8705022, 0.06226151, -0.3554653, 1, 0, 0, 1, 1,
-0.8647968, 0.9565492, -1.526429, 1, 0, 0, 1, 1,
-0.8628072, 0.5291776, -1.665152, 0, 0, 0, 1, 1,
-0.8591321, -0.1697115, -1.038532, 0, 0, 0, 1, 1,
-0.8577115, -0.8399955, -1.759341, 0, 0, 0, 1, 1,
-0.856719, 0.2468843, -0.7214205, 0, 0, 0, 1, 1,
-0.8504271, -0.3135225, -0.5115547, 0, 0, 0, 1, 1,
-0.8503798, -0.7564715, -1.701345, 0, 0, 0, 1, 1,
-0.8492019, 1.052743, -1.079004, 0, 0, 0, 1, 1,
-0.8427564, 0.2583196, 0.01454732, 1, 1, 1, 1, 1,
-0.8421014, 1.330158, -1.20094, 1, 1, 1, 1, 1,
-0.8418923, -2.014379, -3.275485, 1, 1, 1, 1, 1,
-0.8284251, 0.6550112, -0.4989431, 1, 1, 1, 1, 1,
-0.8268214, 0.3369998, -1.222633, 1, 1, 1, 1, 1,
-0.8241751, 0.4684922, -1.453832, 1, 1, 1, 1, 1,
-0.8238317, -0.3274085, -1.016536, 1, 1, 1, 1, 1,
-0.8206984, 1.056322, -1.654267, 1, 1, 1, 1, 1,
-0.8143055, -1.033252, -2.569316, 1, 1, 1, 1, 1,
-0.8114179, -2.23477, -1.722821, 1, 1, 1, 1, 1,
-0.8085552, -1.112212, -2.248153, 1, 1, 1, 1, 1,
-0.8083347, -1.605512, -2.388293, 1, 1, 1, 1, 1,
-0.7984337, 0.2631221, -1.612211, 1, 1, 1, 1, 1,
-0.7972788, 1.790115, -0.3609196, 1, 1, 1, 1, 1,
-0.7965611, -0.3912759, -1.081104, 1, 1, 1, 1, 1,
-0.7945942, -1.652878, -0.815699, 0, 0, 1, 1, 1,
-0.7925774, 0.3319187, -1.617025, 1, 0, 0, 1, 1,
-0.7896839, -0.6279988, -3.58357, 1, 0, 0, 1, 1,
-0.7893787, 1.772288, 0.6044085, 1, 0, 0, 1, 1,
-0.7889968, 0.04179293, -0.9725478, 1, 0, 0, 1, 1,
-0.7830943, 0.5728946, -0.1844273, 1, 0, 0, 1, 1,
-0.7828075, -0.8651085, -2.03888, 0, 0, 0, 1, 1,
-0.780911, -0.4699093, -2.633837, 0, 0, 0, 1, 1,
-0.775653, 0.4261003, -0.6940039, 0, 0, 0, 1, 1,
-0.7734211, -0.00869074, -1.287514, 0, 0, 0, 1, 1,
-0.7678385, 0.06295677, -1.544763, 0, 0, 0, 1, 1,
-0.764813, -0.2556771, -2.467103, 0, 0, 0, 1, 1,
-0.7623833, -0.3251712, 1.157995, 0, 0, 0, 1, 1,
-0.7587145, -1.806705, -2.773409, 1, 1, 1, 1, 1,
-0.7584279, 0.6499929, 0.5583005, 1, 1, 1, 1, 1,
-0.7577055, 0.3529542, -1.708493, 1, 1, 1, 1, 1,
-0.7560418, -0.2586727, -1.332259, 1, 1, 1, 1, 1,
-0.7555945, 0.5621537, -1.414186, 1, 1, 1, 1, 1,
-0.7534793, 0.6682116, -2.58626, 1, 1, 1, 1, 1,
-0.7533348, 0.9052953, -0.7043037, 1, 1, 1, 1, 1,
-0.7522897, -0.2610825, -0.9973236, 1, 1, 1, 1, 1,
-0.7484825, 1.279594, 0.8203466, 1, 1, 1, 1, 1,
-0.7461277, -0.9975679, -0.5925201, 1, 1, 1, 1, 1,
-0.7424762, 0.4864819, -0.5440132, 1, 1, 1, 1, 1,
-0.7368478, 0.7962424, 1.305289, 1, 1, 1, 1, 1,
-0.7334022, 0.3688856, -1.370059, 1, 1, 1, 1, 1,
-0.7284248, 0.5034804, 0.7079811, 1, 1, 1, 1, 1,
-0.7252735, -1.585685, -2.39007, 1, 1, 1, 1, 1,
-0.7189153, -0.7972275, -3.096409, 0, 0, 1, 1, 1,
-0.7182636, -1.29765, -2.936738, 1, 0, 0, 1, 1,
-0.7181283, -0.3079704, -3.283918, 1, 0, 0, 1, 1,
-0.718108, 1.124356, -0.126828, 1, 0, 0, 1, 1,
-0.7181014, 0.7462509, -1.291257, 1, 0, 0, 1, 1,
-0.710171, 0.2520401, -1.972193, 1, 0, 0, 1, 1,
-0.705135, 0.1787429, -2.098241, 0, 0, 0, 1, 1,
-0.7033388, -0.1277018, -1.27631, 0, 0, 0, 1, 1,
-0.7013623, 0.1286808, -0.9284412, 0, 0, 0, 1, 1,
-0.7003587, -0.0133861, -2.630669, 0, 0, 0, 1, 1,
-0.6998414, 1.019478, -2.387564, 0, 0, 0, 1, 1,
-0.6915497, -0.5948559, -1.640134, 0, 0, 0, 1, 1,
-0.6869931, 1.246431, -1.130895, 0, 0, 0, 1, 1,
-0.6842053, 0.2778851, -1.744707, 1, 1, 1, 1, 1,
-0.6840993, 0.74061, -0.4528915, 1, 1, 1, 1, 1,
-0.6806885, 0.1590867, -1.467597, 1, 1, 1, 1, 1,
-0.6790344, -0.7598251, -3.652853, 1, 1, 1, 1, 1,
-0.6776727, -0.5863349, -3.192093, 1, 1, 1, 1, 1,
-0.6705665, -1.088584, -3.336748, 1, 1, 1, 1, 1,
-0.6667582, -0.2083357, -1.471089, 1, 1, 1, 1, 1,
-0.6665117, 0.2133017, 0.4301346, 1, 1, 1, 1, 1,
-0.6633896, 0.597597, -0.4708623, 1, 1, 1, 1, 1,
-0.6630905, 1.663121, -1.598117, 1, 1, 1, 1, 1,
-0.6600299, -1.081406, -3.99661, 1, 1, 1, 1, 1,
-0.6567026, -3.026481, -2.889112, 1, 1, 1, 1, 1,
-0.6564705, 0.6336151, 0.1106457, 1, 1, 1, 1, 1,
-0.651975, 1.795643, -0.5862755, 1, 1, 1, 1, 1,
-0.6470718, 0.06186476, -2.359498, 1, 1, 1, 1, 1,
-0.6469446, -0.5597222, -2.670109, 0, 0, 1, 1, 1,
-0.6397958, -0.08021873, -0.01425867, 1, 0, 0, 1, 1,
-0.6392862, 0.771794, -2.064934, 1, 0, 0, 1, 1,
-0.6383226, -1.876085, -4.248819, 1, 0, 0, 1, 1,
-0.6377174, 0.3096077, 0.1829899, 1, 0, 0, 1, 1,
-0.6371748, 0.4252289, -1.138672, 1, 0, 0, 1, 1,
-0.6358381, 0.4996557, -0.4318728, 0, 0, 0, 1, 1,
-0.6348652, 0.2061837, -0.7146804, 0, 0, 0, 1, 1,
-0.6292881, 0.6848263, -0.4091192, 0, 0, 0, 1, 1,
-0.6292199, -1.161796, -1.535267, 0, 0, 0, 1, 1,
-0.6262002, -1.91976, -2.009304, 0, 0, 0, 1, 1,
-0.6204435, 1.383779, 0.4502504, 0, 0, 0, 1, 1,
-0.6195723, 1.30708, -2.281567, 0, 0, 0, 1, 1,
-0.6185965, 1.429783, 0.2025138, 1, 1, 1, 1, 1,
-0.6176811, -1.95454, -3.632268, 1, 1, 1, 1, 1,
-0.6139542, 1.586393, 0.2560183, 1, 1, 1, 1, 1,
-0.6124669, -0.1473621, -3.688121, 1, 1, 1, 1, 1,
-0.6108111, -0.1496508, -0.3062281, 1, 1, 1, 1, 1,
-0.6088115, -0.4098112, -3.112112, 1, 1, 1, 1, 1,
-0.6084598, 0.4873979, 0.6036616, 1, 1, 1, 1, 1,
-0.5943873, 1.229897, -1.058597, 1, 1, 1, 1, 1,
-0.593466, -0.1573523, -1.64721, 1, 1, 1, 1, 1,
-0.5913261, 0.9952655, -1.109089, 1, 1, 1, 1, 1,
-0.5901445, 0.3359621, -0.8600683, 1, 1, 1, 1, 1,
-0.590095, -2.626321, -2.985773, 1, 1, 1, 1, 1,
-0.5880637, 0.6509046, -0.9375919, 1, 1, 1, 1, 1,
-0.5804707, -0.04707825, -0.9235267, 1, 1, 1, 1, 1,
-0.5755293, 0.007826256, -2.00191, 1, 1, 1, 1, 1,
-0.5748554, 0.4494963, 0.1013822, 0, 0, 1, 1, 1,
-0.5705577, 0.281982, -1.332721, 1, 0, 0, 1, 1,
-0.5665881, 0.8245954, -0.8374019, 1, 0, 0, 1, 1,
-0.5628858, -0.4970014, -1.461416, 1, 0, 0, 1, 1,
-0.5614995, 0.7550034, -1.920016, 1, 0, 0, 1, 1,
-0.5565546, 0.2056439, -1.05125, 1, 0, 0, 1, 1,
-0.5491872, 0.3019664, -0.9989465, 0, 0, 0, 1, 1,
-0.5484892, 1.203247, -1.435671, 0, 0, 0, 1, 1,
-0.5484591, -0.3595498, -2.613759, 0, 0, 0, 1, 1,
-0.5466644, -0.4664933, -1.61421, 0, 0, 0, 1, 1,
-0.5395548, 0.1823352, -2.13161, 0, 0, 0, 1, 1,
-0.5384158, -1.003506, -2.083007, 0, 0, 0, 1, 1,
-0.5357991, 1.503558, -1.285322, 0, 0, 0, 1, 1,
-0.5276318, 1.456295, 0.5375915, 1, 1, 1, 1, 1,
-0.5216092, 0.4137423, -1.374454, 1, 1, 1, 1, 1,
-0.5139639, 0.425335, -0.9986051, 1, 1, 1, 1, 1,
-0.5104207, 0.3327636, -1.744351, 1, 1, 1, 1, 1,
-0.5070654, 0.6812092, -2.306901, 1, 1, 1, 1, 1,
-0.5047306, 2.511638, -0.2901367, 1, 1, 1, 1, 1,
-0.5045772, -1.817191, -4.163972, 1, 1, 1, 1, 1,
-0.5000807, 0.3054336, -2.225797, 1, 1, 1, 1, 1,
-0.4894296, -1.820773, -2.137476, 1, 1, 1, 1, 1,
-0.4804743, -0.7563369, -3.14169, 1, 1, 1, 1, 1,
-0.4796818, -1.409045, -2.635355, 1, 1, 1, 1, 1,
-0.476263, -0.9760071, -3.596644, 1, 1, 1, 1, 1,
-0.4747419, 0.7264509, -0.4597162, 1, 1, 1, 1, 1,
-0.4740228, -1.990065, -4.42001, 1, 1, 1, 1, 1,
-0.4724826, -0.363234, -3.06181, 1, 1, 1, 1, 1,
-0.4699956, 0.520654, -1.113966, 0, 0, 1, 1, 1,
-0.4682406, 0.5659377, -1.168872, 1, 0, 0, 1, 1,
-0.4677445, 0.8827454, -0.08982798, 1, 0, 0, 1, 1,
-0.4672826, 0.2542635, 0.4363513, 1, 0, 0, 1, 1,
-0.4657925, 1.134921, -0.2641064, 1, 0, 0, 1, 1,
-0.4646181, -0.7837643, -3.689398, 1, 0, 0, 1, 1,
-0.4559693, 0.05382386, -2.115998, 0, 0, 0, 1, 1,
-0.455424, 1.657392, 0.04344498, 0, 0, 0, 1, 1,
-0.4540048, 2.37922, -0.07854779, 0, 0, 0, 1, 1,
-0.4537394, 0.6018957, -1.941304, 0, 0, 0, 1, 1,
-0.4507061, 0.141061, -1.707942, 0, 0, 0, 1, 1,
-0.4466943, -0.01559251, -0.2216692, 0, 0, 0, 1, 1,
-0.4451353, 0.226186, -1.5515, 0, 0, 0, 1, 1,
-0.4416989, 1.187837, 0.0182091, 1, 1, 1, 1, 1,
-0.438888, -0.7009639, -3.484391, 1, 1, 1, 1, 1,
-0.4387186, 0.2452994, -0.7048835, 1, 1, 1, 1, 1,
-0.4363728, -0.8678193, -2.917076, 1, 1, 1, 1, 1,
-0.4332351, -0.8538738, -2.011512, 1, 1, 1, 1, 1,
-0.4320447, -0.609386, -3.421226, 1, 1, 1, 1, 1,
-0.4264805, 0.09298021, -0.6254875, 1, 1, 1, 1, 1,
-0.4243026, 0.4689878, 1.643371, 1, 1, 1, 1, 1,
-0.4212261, -1.069725, -2.668953, 1, 1, 1, 1, 1,
-0.4191932, 0.8246512, -0.01035749, 1, 1, 1, 1, 1,
-0.4162492, -0.9462233, -3.749261, 1, 1, 1, 1, 1,
-0.4159374, 1.783762, 0.5398676, 1, 1, 1, 1, 1,
-0.4157573, -0.3564464, -1.675929, 1, 1, 1, 1, 1,
-0.4121306, 0.04531436, -1.171699, 1, 1, 1, 1, 1,
-0.4084644, -0.8272455, -1.898679, 1, 1, 1, 1, 1,
-0.4066964, -1.079717, -1.99188, 0, 0, 1, 1, 1,
-0.4033082, -0.5598919, -2.808506, 1, 0, 0, 1, 1,
-0.4019136, -0.09419107, -1.512749, 1, 0, 0, 1, 1,
-0.399012, -0.9979529, -2.548541, 1, 0, 0, 1, 1,
-0.3973936, 1.123995, 0.2525012, 1, 0, 0, 1, 1,
-0.3927446, -0.2043454, -2.87699, 1, 0, 0, 1, 1,
-0.3875627, 0.7195907, -1.163131, 0, 0, 0, 1, 1,
-0.3840495, 1.21967, -0.02934294, 0, 0, 0, 1, 1,
-0.3819738, -0.1157824, -0.7545511, 0, 0, 0, 1, 1,
-0.3775267, -0.1576809, -2.183105, 0, 0, 0, 1, 1,
-0.3762929, 0.3930421, -1.883912, 0, 0, 0, 1, 1,
-0.3759215, -0.4979829, -2.476619, 0, 0, 0, 1, 1,
-0.3716229, 0.4508511, -0.4439068, 0, 0, 0, 1, 1,
-0.3704271, 1.678217, -1.650416, 1, 1, 1, 1, 1,
-0.3619666, 0.4309908, 0.8404163, 1, 1, 1, 1, 1,
-0.3615517, 1.306295, -0.05798996, 1, 1, 1, 1, 1,
-0.3602908, -1.094229, -3.391959, 1, 1, 1, 1, 1,
-0.3587845, 0.105551, -2.967544, 1, 1, 1, 1, 1,
-0.3575697, -1.754724, -3.933137, 1, 1, 1, 1, 1,
-0.3567609, 0.5790256, -0.3069678, 1, 1, 1, 1, 1,
-0.3554145, -0.5789462, -5.472626, 1, 1, 1, 1, 1,
-0.3552758, -0.1652256, -1.286308, 1, 1, 1, 1, 1,
-0.3543575, -1.69435, -1.480524, 1, 1, 1, 1, 1,
-0.3513589, 1.974813, 1.187163, 1, 1, 1, 1, 1,
-0.3423109, -1.044131, -2.489333, 1, 1, 1, 1, 1,
-0.3225565, 0.2464878, 0.3735779, 1, 1, 1, 1, 1,
-0.3174392, -0.3548193, -1.336392, 1, 1, 1, 1, 1,
-0.3168406, -2.081573, -1.046838, 1, 1, 1, 1, 1,
-0.3146164, 0.3721681, -1.461715, 0, 0, 1, 1, 1,
-0.3112549, 0.4454134, -0.9867681, 1, 0, 0, 1, 1,
-0.3082061, 2.088029, 1.022355, 1, 0, 0, 1, 1,
-0.3051607, -0.3192942, -1.054618, 1, 0, 0, 1, 1,
-0.303465, -0.785295, -3.208855, 1, 0, 0, 1, 1,
-0.3021023, 1.569026, 0.2149798, 1, 0, 0, 1, 1,
-0.2963382, 0.4822428, 0.09601471, 0, 0, 0, 1, 1,
-0.294406, -0.3321818, -1.070172, 0, 0, 0, 1, 1,
-0.2892661, 0.07753146, -1.479399, 0, 0, 0, 1, 1,
-0.2794825, -0.4165262, -3.158097, 0, 0, 0, 1, 1,
-0.2794551, -1.038157, -2.5713, 0, 0, 0, 1, 1,
-0.274314, 0.552032, 0.1540196, 0, 0, 0, 1, 1,
-0.2688382, -0.6019591, -2.393182, 0, 0, 0, 1, 1,
-0.2650127, -0.08293676, -2.669229, 1, 1, 1, 1, 1,
-0.2629847, 0.8050872, -2.26392, 1, 1, 1, 1, 1,
-0.2622075, 0.2688855, -1.284564, 1, 1, 1, 1, 1,
-0.2597995, 0.3558577, 0.3492358, 1, 1, 1, 1, 1,
-0.2594863, -0.356725, -3.90237, 1, 1, 1, 1, 1,
-0.2575705, 0.4895991, 0.5136535, 1, 1, 1, 1, 1,
-0.2498107, -0.1300629, -0.6213835, 1, 1, 1, 1, 1,
-0.2493577, -1.53841, -2.648615, 1, 1, 1, 1, 1,
-0.2492245, -0.7602666, -2.460198, 1, 1, 1, 1, 1,
-0.2451856, -1.178392, -2.159326, 1, 1, 1, 1, 1,
-0.2430273, -0.4819876, -3.905307, 1, 1, 1, 1, 1,
-0.2387735, -0.921356, -3.979479, 1, 1, 1, 1, 1,
-0.235215, 0.4347743, 0.1388242, 1, 1, 1, 1, 1,
-0.234183, -1.244115, -3.402318, 1, 1, 1, 1, 1,
-0.2332261, 0.7240369, -1.534508, 1, 1, 1, 1, 1,
-0.2320758, -2.229956, -4.938515, 0, 0, 1, 1, 1,
-0.2280642, 0.6762953, -1.18292, 1, 0, 0, 1, 1,
-0.2239522, 1.111176, 0.1383788, 1, 0, 0, 1, 1,
-0.2181716, 0.1795556, -2.28512, 1, 0, 0, 1, 1,
-0.214735, -1.954064, -3.567599, 1, 0, 0, 1, 1,
-0.2136106, -0.8250355, -1.325363, 1, 0, 0, 1, 1,
-0.2110875, 1.91091, -0.4752243, 0, 0, 0, 1, 1,
-0.2105342, -1.839926, -2.613244, 0, 0, 0, 1, 1,
-0.2029505, 0.1951617, -1.921647, 0, 0, 0, 1, 1,
-0.2028774, 1.272834, 0.1162927, 0, 0, 0, 1, 1,
-0.1955058, 1.520582, -0.7360822, 0, 0, 0, 1, 1,
-0.1948851, -0.3403348, -2.813121, 0, 0, 0, 1, 1,
-0.1925997, 0.7839992, -0.3146898, 0, 0, 0, 1, 1,
-0.1923857, -0.1546685, -2.538365, 1, 1, 1, 1, 1,
-0.1896588, -0.04439099, 0.1836621, 1, 1, 1, 1, 1,
-0.1886867, -1.353747, -1.869688, 1, 1, 1, 1, 1,
-0.1879097, -2.015612, -3.499082, 1, 1, 1, 1, 1,
-0.1840067, 0.6515232, 1.824898, 1, 1, 1, 1, 1,
-0.1821061, 1.229182, -0.04759191, 1, 1, 1, 1, 1,
-0.1792946, -0.05895411, -2.369733, 1, 1, 1, 1, 1,
-0.1791958, -0.4067515, -3.9183, 1, 1, 1, 1, 1,
-0.1774009, 0.5266451, -0.5834873, 1, 1, 1, 1, 1,
-0.1772256, -0.6384286, -4.315909, 1, 1, 1, 1, 1,
-0.1749949, -0.2539127, -2.380426, 1, 1, 1, 1, 1,
-0.1716304, 0.4856403, -0.8425835, 1, 1, 1, 1, 1,
-0.1693308, 0.8510098, -1.028564, 1, 1, 1, 1, 1,
-0.16005, -0.2945279, -2.014797, 1, 1, 1, 1, 1,
-0.1598036, -0.8123694, -3.32684, 1, 1, 1, 1, 1,
-0.1572323, -0.3073272, -4.146582, 0, 0, 1, 1, 1,
-0.1552643, 0.9750973, -0.4722563, 1, 0, 0, 1, 1,
-0.1478897, 0.6609427, 1.077624, 1, 0, 0, 1, 1,
-0.1476192, -0.8052924, -1.771542, 1, 0, 0, 1, 1,
-0.145745, 0.4977462, -0.880583, 1, 0, 0, 1, 1,
-0.144078, -2.145196, -2.43006, 1, 0, 0, 1, 1,
-0.1416079, -0.5519006, -2.627386, 0, 0, 0, 1, 1,
-0.1399283, -1.076676, -2.346147, 0, 0, 0, 1, 1,
-0.1357407, 0.1818161, -0.1577795, 0, 0, 0, 1, 1,
-0.1325465, -0.3645806, -4.357751, 0, 0, 0, 1, 1,
-0.1321718, 1.142866, 0.7775129, 0, 0, 0, 1, 1,
-0.1308158, -0.06505703, -1.630468, 0, 0, 0, 1, 1,
-0.1293691, -0.515246, -3.304038, 0, 0, 0, 1, 1,
-0.1274746, -0.4330283, -2.175096, 1, 1, 1, 1, 1,
-0.1252847, -0.5758633, -3.062085, 1, 1, 1, 1, 1,
-0.121242, -0.1119387, -1.865014, 1, 1, 1, 1, 1,
-0.1183796, -0.1502663, -2.838995, 1, 1, 1, 1, 1,
-0.1179429, 0.1457609, 0.8690926, 1, 1, 1, 1, 1,
-0.109508, -0.682756, -4.040394, 1, 1, 1, 1, 1,
-0.1008107, 0.9313084, -1.314333, 1, 1, 1, 1, 1,
-0.09939549, -0.225108, -2.940295, 1, 1, 1, 1, 1,
-0.09647737, -1.083926, -3.346265, 1, 1, 1, 1, 1,
-0.09573996, -1.33525, -1.994689, 1, 1, 1, 1, 1,
-0.09295505, 1.414044, -1.281303, 1, 1, 1, 1, 1,
-0.09207915, -1.840571, -2.588982, 1, 1, 1, 1, 1,
-0.08527608, -0.2449164, -1.875221, 1, 1, 1, 1, 1,
-0.08463147, 1.604011, -0.1467889, 1, 1, 1, 1, 1,
-0.08365145, 0.1223008, -0.3367089, 1, 1, 1, 1, 1,
-0.0817498, 1.461803, 0.247629, 0, 0, 1, 1, 1,
-0.07680718, 1.574845, 1.169626, 1, 0, 0, 1, 1,
-0.07613578, -1.520609, -2.503013, 1, 0, 0, 1, 1,
-0.07550597, -1.49356, -2.356498, 1, 0, 0, 1, 1,
-0.07541405, 0.6293851, 1.086755, 1, 0, 0, 1, 1,
-0.07516128, -0.6244193, -4.716253, 1, 0, 0, 1, 1,
-0.07266741, -0.9105157, -1.219108, 0, 0, 0, 1, 1,
-0.07026937, 1.916527, 0.4542725, 0, 0, 0, 1, 1,
-0.06934091, -0.1380793, -3.700283, 0, 0, 0, 1, 1,
-0.06916677, 0.1448338, -1.228698, 0, 0, 0, 1, 1,
-0.06896079, 0.2548979, -0.2062156, 0, 0, 0, 1, 1,
-0.06724115, 0.5864263, -0.8239951, 0, 0, 0, 1, 1,
-0.06318558, 2.198032, 1.386965, 0, 0, 0, 1, 1,
-0.06314105, 1.328168, -0.5610427, 1, 1, 1, 1, 1,
-0.06291745, -0.3727592, -5.541867, 1, 1, 1, 1, 1,
-0.06212296, 1.997702, 0.2420893, 1, 1, 1, 1, 1,
-0.05870458, 0.6912045, 0.6692658, 1, 1, 1, 1, 1,
-0.05463922, -0.9698586, -2.178674, 1, 1, 1, 1, 1,
-0.05192631, -0.5700864, -2.337901, 1, 1, 1, 1, 1,
-0.05115494, 0.4193863, 0.6473131, 1, 1, 1, 1, 1,
-0.04095822, 0.9325212, -1.241208, 1, 1, 1, 1, 1,
-0.0383095, 0.5218945, -1.358401, 1, 1, 1, 1, 1,
-0.03612552, -0.08154772, -5.97752, 1, 1, 1, 1, 1,
-0.03544099, -0.2148979, -5.253829, 1, 1, 1, 1, 1,
-0.03517382, 1.927019, -0.8293481, 1, 1, 1, 1, 1,
-0.03377472, 1.256646, -0.1740089, 1, 1, 1, 1, 1,
-0.03073787, -0.5675024, -4.435584, 1, 1, 1, 1, 1,
-0.02544463, -0.33566, -1.086914, 1, 1, 1, 1, 1,
-0.02481358, -0.8150156, -4.223061, 0, 0, 1, 1, 1,
-0.02101096, 0.1773397, -0.3166408, 1, 0, 0, 1, 1,
-0.02064053, -0.4485286, -1.750036, 1, 0, 0, 1, 1,
-0.01748773, -1.843879, -2.460806, 1, 0, 0, 1, 1,
0.003127866, -0.03282653, 1.373312, 1, 0, 0, 1, 1,
0.01032375, -0.1908439, 3.845052, 1, 0, 0, 1, 1,
0.01324274, -0.07256838, 3.336137, 0, 0, 0, 1, 1,
0.01396699, 1.05883, -0.06033473, 0, 0, 0, 1, 1,
0.01466915, 1.63069, 0.9307934, 0, 0, 0, 1, 1,
0.02263612, 2.803114, 0.8749098, 0, 0, 0, 1, 1,
0.02503229, 1.74335, 1.900988, 0, 0, 0, 1, 1,
0.02730814, -1.299373, 3.739091, 0, 0, 0, 1, 1,
0.02757684, 1.339503, 0.9934436, 0, 0, 0, 1, 1,
0.02804929, -0.3039834, 1.006896, 1, 1, 1, 1, 1,
0.02814522, 1.17407, -1.048468, 1, 1, 1, 1, 1,
0.02899196, 0.1476379, -1.220867, 1, 1, 1, 1, 1,
0.02992421, -1.352696, 4.695356, 1, 1, 1, 1, 1,
0.03253248, 0.6423861, -0.755109, 1, 1, 1, 1, 1,
0.03486938, -0.4219431, 1.678653, 1, 1, 1, 1, 1,
0.03554265, -0.1695288, 3.686387, 1, 1, 1, 1, 1,
0.03695467, 0.6756442, 2.01071, 1, 1, 1, 1, 1,
0.04202659, -0.1782131, 2.184457, 1, 1, 1, 1, 1,
0.04209889, -0.740881, 2.63552, 1, 1, 1, 1, 1,
0.04217669, -2.155596, 2.919379, 1, 1, 1, 1, 1,
0.04246768, 0.206526, -0.4295366, 1, 1, 1, 1, 1,
0.04398085, 0.9262417, 0.6168145, 1, 1, 1, 1, 1,
0.04446841, -0.01695268, 1.293854, 1, 1, 1, 1, 1,
0.04493243, -0.05323153, 2.796627, 1, 1, 1, 1, 1,
0.04580329, -0.8588421, 2.798196, 0, 0, 1, 1, 1,
0.05113599, -2.02122, 2.689273, 1, 0, 0, 1, 1,
0.05148985, 1.640864, 0.3910114, 1, 0, 0, 1, 1,
0.05189621, -0.1621115, 1.569981, 1, 0, 0, 1, 1,
0.05870197, 0.6262076, 0.6157514, 1, 0, 0, 1, 1,
0.05910982, -1.076178, 3.592803, 1, 0, 0, 1, 1,
0.06087302, 1.315902, 0.5401192, 0, 0, 0, 1, 1,
0.06095047, 0.4556552, 0.673193, 0, 0, 0, 1, 1,
0.06235006, 0.006334712, 1.91917, 0, 0, 0, 1, 1,
0.06373683, -0.06317337, 2.885555, 0, 0, 0, 1, 1,
0.06379309, 0.8171322, 1.040125, 0, 0, 0, 1, 1,
0.06470414, 2.38811, 0.01470753, 0, 0, 0, 1, 1,
0.06694439, 0.4222441, -0.9962959, 0, 0, 0, 1, 1,
0.06982832, 0.5163515, 2.924492, 1, 1, 1, 1, 1,
0.07385948, 0.08070824, 1.387266, 1, 1, 1, 1, 1,
0.07392062, -0.3251273, 3.654303, 1, 1, 1, 1, 1,
0.07433551, 0.8743327, -0.3544979, 1, 1, 1, 1, 1,
0.07440846, 1.954093, 1.601532, 1, 1, 1, 1, 1,
0.07476338, -0.5585821, 6.335005, 1, 1, 1, 1, 1,
0.07676499, 0.0624417, 1.383581, 1, 1, 1, 1, 1,
0.07740389, -0.2493722, 3.063977, 1, 1, 1, 1, 1,
0.08104417, 1.083276, -1.359956, 1, 1, 1, 1, 1,
0.08566794, -0.8910054, 2.374521, 1, 1, 1, 1, 1,
0.08647399, 0.1634936, 0.9224145, 1, 1, 1, 1, 1,
0.08654097, 0.2468792, -0.1278252, 1, 1, 1, 1, 1,
0.08825985, 0.1868264, 0.711795, 1, 1, 1, 1, 1,
0.08978586, 0.719796, -2.10302, 1, 1, 1, 1, 1,
0.09081533, 0.6604064, -1.714868, 1, 1, 1, 1, 1,
0.09427394, -2.296178, 3.736597, 0, 0, 1, 1, 1,
0.09604405, -0.8339704, 2.834314, 1, 0, 0, 1, 1,
0.1043223, -0.4917646, 3.659792, 1, 0, 0, 1, 1,
0.105336, 1.072453, 0.5931792, 1, 0, 0, 1, 1,
0.1054, 1.097331, 1.479378, 1, 0, 0, 1, 1,
0.1054672, 0.09806454, 0.9241615, 1, 0, 0, 1, 1,
0.113844, -1.03653, 2.5855, 0, 0, 0, 1, 1,
0.115625, 1.440815, -0.4566014, 0, 0, 0, 1, 1,
0.1157764, 0.3143288, 1.695392, 0, 0, 0, 1, 1,
0.1168948, 0.9986547, 0.3666118, 0, 0, 0, 1, 1,
0.1242928, 2.55077, -0.5225731, 0, 0, 0, 1, 1,
0.1251385, -0.4100879, 4.054345, 0, 0, 0, 1, 1,
0.127332, -1.327231, 3.569799, 0, 0, 0, 1, 1,
0.1317341, -0.5529385, 1.860861, 1, 1, 1, 1, 1,
0.1381618, 1.509801, -0.6001741, 1, 1, 1, 1, 1,
0.1458446, -0.8429291, 2.776736, 1, 1, 1, 1, 1,
0.1473287, -0.2566551, 2.481402, 1, 1, 1, 1, 1,
0.1517357, -0.1189522, 2.082829, 1, 1, 1, 1, 1,
0.1519455, 0.7307851, -0.4818362, 1, 1, 1, 1, 1,
0.1553433, 1.789035, 0.5483902, 1, 1, 1, 1, 1,
0.1554272, -1.686381, 1.636787, 1, 1, 1, 1, 1,
0.1554969, 0.2304054, -0.04725479, 1, 1, 1, 1, 1,
0.1560068, -0.3705342, 3.083139, 1, 1, 1, 1, 1,
0.1571987, -0.2189486, 1.450844, 1, 1, 1, 1, 1,
0.160631, -0.3149426, 3.300124, 1, 1, 1, 1, 1,
0.1607472, 1.203122, 0.1517865, 1, 1, 1, 1, 1,
0.1611003, -1.987951, 3.846792, 1, 1, 1, 1, 1,
0.1620162, 1.45605, -0.3533012, 1, 1, 1, 1, 1,
0.1637757, -2.336517, 2.25766, 0, 0, 1, 1, 1,
0.1657162, -0.4369315, 3.948321, 1, 0, 0, 1, 1,
0.1735931, -1.512894, 4.038474, 1, 0, 0, 1, 1,
0.1748497, 0.9249933, 0.2739602, 1, 0, 0, 1, 1,
0.1764044, -0.771582, 4.517586, 1, 0, 0, 1, 1,
0.1785294, -0.4059685, 2.162331, 1, 0, 0, 1, 1,
0.1797839, -1.706466, 3.787646, 0, 0, 0, 1, 1,
0.1805911, -1.07883, 4.268797, 0, 0, 0, 1, 1,
0.1808643, 0.2343643, 0.954088, 0, 0, 0, 1, 1,
0.1833787, 0.203744, 0.2606874, 0, 0, 0, 1, 1,
0.1841273, 0.356151, 0.6179094, 0, 0, 0, 1, 1,
0.1875811, -1.603369, 4.22143, 0, 0, 0, 1, 1,
0.1890402, -0.1502474, 1.522459, 0, 0, 0, 1, 1,
0.190969, 1.61864, 0.2709832, 1, 1, 1, 1, 1,
0.1931492, -0.2477965, 2.728164, 1, 1, 1, 1, 1,
0.1938569, -1.205912, 2.922996, 1, 1, 1, 1, 1,
0.1948415, -0.553121, 0.8953564, 1, 1, 1, 1, 1,
0.1968741, -1.08442, 2.262206, 1, 1, 1, 1, 1,
0.1981498, 1.142412, -0.05326073, 1, 1, 1, 1, 1,
0.1994014, 0.1951328, 0.1597177, 1, 1, 1, 1, 1,
0.2038565, 1.146569, -1.105555, 1, 1, 1, 1, 1,
0.2057558, -0.2212668, 2.457659, 1, 1, 1, 1, 1,
0.2073649, 2.088088, -0.1762862, 1, 1, 1, 1, 1,
0.210504, -0.8892824, 4.237234, 1, 1, 1, 1, 1,
0.2120434, -2.397753, 3.9744, 1, 1, 1, 1, 1,
0.2130599, 1.503693, 0.3584302, 1, 1, 1, 1, 1,
0.214585, 0.6931739, -1.230297, 1, 1, 1, 1, 1,
0.2159755, 0.3698737, 1.337006, 1, 1, 1, 1, 1,
0.2250771, 0.5550939, 0.8999949, 0, 0, 1, 1, 1,
0.225762, 0.983206, -0.9869024, 1, 0, 0, 1, 1,
0.22601, 1.350162, -0.1160437, 1, 0, 0, 1, 1,
0.226462, 0.03919131, 2.574066, 1, 0, 0, 1, 1,
0.2269778, -0.0988171, 2.056406, 1, 0, 0, 1, 1,
0.2299842, -0.09163143, 2.671715, 1, 0, 0, 1, 1,
0.2321677, 0.3179286, 1.110303, 0, 0, 0, 1, 1,
0.2345766, -0.2387593, 2.761858, 0, 0, 0, 1, 1,
0.2349001, -1.657667, 2.761362, 0, 0, 0, 1, 1,
0.2398061, 0.6276483, 0.3812016, 0, 0, 0, 1, 1,
0.2401092, 1.352922, -0.5260316, 0, 0, 0, 1, 1,
0.2418212, -0.2613311, 3.646593, 0, 0, 0, 1, 1,
0.2447519, -0.3399286, 2.716895, 0, 0, 0, 1, 1,
0.2461743, 1.781952, -1.092033, 1, 1, 1, 1, 1,
0.247429, -0.0507037, 2.126126, 1, 1, 1, 1, 1,
0.2544252, -1.107599, 3.216289, 1, 1, 1, 1, 1,
0.2579261, -1.619188, 4.18718, 1, 1, 1, 1, 1,
0.2650146, -0.01733599, 1.454494, 1, 1, 1, 1, 1,
0.2665308, 0.3994287, -1.01572, 1, 1, 1, 1, 1,
0.2676382, 1.015878, -0.04310577, 1, 1, 1, 1, 1,
0.2732664, -0.1648967, -0.08487303, 1, 1, 1, 1, 1,
0.2737771, -0.6231749, 5.13081, 1, 1, 1, 1, 1,
0.2746732, -0.6016641, 2.790903, 1, 1, 1, 1, 1,
0.2756999, 0.8274678, 0.3397847, 1, 1, 1, 1, 1,
0.2780219, -2.195347, 2.887578, 1, 1, 1, 1, 1,
0.2794362, -0.9158577, 2.63813, 1, 1, 1, 1, 1,
0.28756, -0.2375002, 2.606917, 1, 1, 1, 1, 1,
0.288157, 1.736629, -0.7077948, 1, 1, 1, 1, 1,
0.2947149, 0.7620208, 1.133118, 0, 0, 1, 1, 1,
0.2959465, 0.1102329, 1.435319, 1, 0, 0, 1, 1,
0.2967865, 0.5151781, 1.898001, 1, 0, 0, 1, 1,
0.2990365, -0.5580437, 3.730143, 1, 0, 0, 1, 1,
0.3004307, -1.852113, 4.348534, 1, 0, 0, 1, 1,
0.3072678, -0.9340258, 2.075521, 1, 0, 0, 1, 1,
0.3090862, 0.6661878, -0.992221, 0, 0, 0, 1, 1,
0.3118095, 0.07289609, 2.122931, 0, 0, 0, 1, 1,
0.3204811, 0.001586892, 1.292645, 0, 0, 0, 1, 1,
0.3220763, 1.833203, -0.4200369, 0, 0, 0, 1, 1,
0.3242972, 0.361906, -0.6946658, 0, 0, 0, 1, 1,
0.3259991, 0.2371745, 1.578275, 0, 0, 0, 1, 1,
0.336322, -0.3797231, 1.379811, 0, 0, 0, 1, 1,
0.3376441, -0.6090485, 3.353936, 1, 1, 1, 1, 1,
0.3399943, -1.247415, 3.117124, 1, 1, 1, 1, 1,
0.3407741, -2.610114, 2.222773, 1, 1, 1, 1, 1,
0.3420606, -0.4829343, 1.827986, 1, 1, 1, 1, 1,
0.3427141, 1.312359, 1.126001, 1, 1, 1, 1, 1,
0.3429574, -0.4175206, 2.536451, 1, 1, 1, 1, 1,
0.3446597, -1.411813, 3.083002, 1, 1, 1, 1, 1,
0.3483545, 1.045408, 0.7306869, 1, 1, 1, 1, 1,
0.350879, -1.844799, 3.018351, 1, 1, 1, 1, 1,
0.3517601, -0.2794372, 2.516177, 1, 1, 1, 1, 1,
0.3539365, 1.004329, 0.4502887, 1, 1, 1, 1, 1,
0.3542605, 0.1795756, 1.660457, 1, 1, 1, 1, 1,
0.3546626, 0.8260973, 0.0742465, 1, 1, 1, 1, 1,
0.3551992, -0.3871458, 1.500313, 1, 1, 1, 1, 1,
0.3577082, -0.4270316, 2.005431, 1, 1, 1, 1, 1,
0.3591501, -0.1367453, 1.05395, 0, 0, 1, 1, 1,
0.3597856, 0.9289557, 0.04991909, 1, 0, 0, 1, 1,
0.3602, -1.853396, 1.116431, 1, 0, 0, 1, 1,
0.3681094, 1.087735, -1.194263, 1, 0, 0, 1, 1,
0.3688787, 0.5811765, -0.06080187, 1, 0, 0, 1, 1,
0.3698707, -1.928818, 1.157843, 1, 0, 0, 1, 1,
0.371224, -0.856531, 3.968114, 0, 0, 0, 1, 1,
0.3744451, 2.00971, -1.818474, 0, 0, 0, 1, 1,
0.3793191, 0.8826222, -1.262044, 0, 0, 0, 1, 1,
0.3858337, -1.861303, 2.910895, 0, 0, 0, 1, 1,
0.3885125, 1.040792, -0.260736, 0, 0, 0, 1, 1,
0.3916266, -0.514039, 2.510197, 0, 0, 0, 1, 1,
0.3940413, 0.5298043, -0.678317, 0, 0, 0, 1, 1,
0.3990047, 0.5324228, 0.8061166, 1, 1, 1, 1, 1,
0.4033014, -1.314499, 1.688295, 1, 1, 1, 1, 1,
0.4041143, 0.2355104, 1.959532, 1, 1, 1, 1, 1,
0.4086678, -0.0130528, 1.67585, 1, 1, 1, 1, 1,
0.408804, -0.3478091, 3.877223, 1, 1, 1, 1, 1,
0.415181, 0.9319932, -0.7873254, 1, 1, 1, 1, 1,
0.4174089, -0.9339669, 1.238568, 1, 1, 1, 1, 1,
0.4183097, -0.4698818, 1.857124, 1, 1, 1, 1, 1,
0.4228204, -1.325664, 2.835815, 1, 1, 1, 1, 1,
0.4279768, -0.8109678, 1.576876, 1, 1, 1, 1, 1,
0.4282416, -0.1650674, 0.326869, 1, 1, 1, 1, 1,
0.4282613, -2.278374, 3.323161, 1, 1, 1, 1, 1,
0.4286827, 2.272317, 1.156655, 1, 1, 1, 1, 1,
0.4288764, 1.837987, -0.03511331, 1, 1, 1, 1, 1,
0.4303088, 0.6069543, 0.5078359, 1, 1, 1, 1, 1,
0.4307946, 0.7647458, 2.268122, 0, 0, 1, 1, 1,
0.4318131, 0.2321681, 1.854728, 1, 0, 0, 1, 1,
0.4423211, 0.3147063, 1.16121, 1, 0, 0, 1, 1,
0.4507599, 0.9850076, 0.08131692, 1, 0, 0, 1, 1,
0.4522948, 1.127744, 2.438909, 1, 0, 0, 1, 1,
0.4571689, -0.7021831, 4.195995, 1, 0, 0, 1, 1,
0.4742718, -1.302199, 3.423727, 0, 0, 0, 1, 1,
0.47517, 0.2401161, 0.3742391, 0, 0, 0, 1, 1,
0.4760503, 0.768636, 3.336865, 0, 0, 0, 1, 1,
0.4765252, -0.7859222, 3.020123, 0, 0, 0, 1, 1,
0.4827906, -2.436044, 2.282591, 0, 0, 0, 1, 1,
0.4856793, -0.9364402, 4.288344, 0, 0, 0, 1, 1,
0.4861144, -1.278911, 2.783962, 0, 0, 0, 1, 1,
0.4870747, 1.835002, -0.9613018, 1, 1, 1, 1, 1,
0.488172, 0.1713646, 0.8088655, 1, 1, 1, 1, 1,
0.490355, 0.3380363, 1.818647, 1, 1, 1, 1, 1,
0.4950356, 1.060674, 1.966341, 1, 1, 1, 1, 1,
0.4955747, 1.25863, 0.3676161, 1, 1, 1, 1, 1,
0.4984055, -0.1527137, 4.917774, 1, 1, 1, 1, 1,
0.5002766, 2.170377, -1.327839, 1, 1, 1, 1, 1,
0.5042673, 0.04989929, 0.3446611, 1, 1, 1, 1, 1,
0.5044807, -0.9782816, 2.548148, 1, 1, 1, 1, 1,
0.5103669, -0.9264293, 2.971161, 1, 1, 1, 1, 1,
0.5156465, -1.260156, 2.573228, 1, 1, 1, 1, 1,
0.519556, -0.7243443, 2.7063, 1, 1, 1, 1, 1,
0.5221162, -0.7598846, 3.149273, 1, 1, 1, 1, 1,
0.5250193, 1.977722, -0.8793973, 1, 1, 1, 1, 1,
0.5257831, 1.278054, -0.3523451, 1, 1, 1, 1, 1,
0.5272931, -0.3393262, 3.513522, 0, 0, 1, 1, 1,
0.5366439, -0.3580643, 3.547381, 1, 0, 0, 1, 1,
0.5385743, -0.8801749, 0.8793734, 1, 0, 0, 1, 1,
0.5398942, -0.1387021, 1.108224, 1, 0, 0, 1, 1,
0.5407427, -0.1216379, 1.200267, 1, 0, 0, 1, 1,
0.5424688, 0.52669, 1.183947, 1, 0, 0, 1, 1,
0.5452835, -0.3095259, 3.415891, 0, 0, 0, 1, 1,
0.5513242, -0.5444615, -0.3963595, 0, 0, 0, 1, 1,
0.5526378, 0.5121059, 0.03242996, 0, 0, 0, 1, 1,
0.5529013, -0.6461495, 2.363051, 0, 0, 0, 1, 1,
0.5553367, -0.4506875, 3.498294, 0, 0, 0, 1, 1,
0.5590231, -1.473093, 2.538524, 0, 0, 0, 1, 1,
0.5596608, -0.3596137, 1.783071, 0, 0, 0, 1, 1,
0.5626791, 1.221472, -0.1140444, 1, 1, 1, 1, 1,
0.5695862, 1.070478, 1.340031, 1, 1, 1, 1, 1,
0.5798418, 0.1222188, 1.532987, 1, 1, 1, 1, 1,
0.5799623, -1.34838, 1.792441, 1, 1, 1, 1, 1,
0.5831745, -0.455009, 1.084742, 1, 1, 1, 1, 1,
0.5924149, -1.354761, 2.834543, 1, 1, 1, 1, 1,
0.5968333, -0.1863481, 2.077116, 1, 1, 1, 1, 1,
0.6024031, -1.839435, 2.171955, 1, 1, 1, 1, 1,
0.6058152, 0.465259, 0.9797971, 1, 1, 1, 1, 1,
0.6087413, -0.3778401, 2.656008, 1, 1, 1, 1, 1,
0.6096, -1.303298, 3.091341, 1, 1, 1, 1, 1,
0.6127191, 0.9311695, -1.334076, 1, 1, 1, 1, 1,
0.6239761, -1.461021, 1.832388, 1, 1, 1, 1, 1,
0.6325785, -0.8169476, 1.899615, 1, 1, 1, 1, 1,
0.6361758, -1.679003, 4.398861, 1, 1, 1, 1, 1,
0.6369076, 0.5166662, 0.324633, 0, 0, 1, 1, 1,
0.6386201, 0.8081452, 1.115805, 1, 0, 0, 1, 1,
0.6498449, 0.8498375, 1.249021, 1, 0, 0, 1, 1,
0.6506095, -0.1738695, 2.208634, 1, 0, 0, 1, 1,
0.6521124, -0.378239, 3.849105, 1, 0, 0, 1, 1,
0.6553597, 0.8933178, 1.232327, 1, 0, 0, 1, 1,
0.6605524, -0.7839624, 2.545372, 0, 0, 0, 1, 1,
0.6656032, 0.885536, 0.6010927, 0, 0, 0, 1, 1,
0.6664859, 1.41819, -1.537601, 0, 0, 0, 1, 1,
0.6702706, 0.04363107, 2.450678, 0, 0, 0, 1, 1,
0.674993, 0.6971339, 2.017107, 0, 0, 0, 1, 1,
0.6756248, -0.9274262, 2.851959, 0, 0, 0, 1, 1,
0.6777488, 0.3376227, -0.2018017, 0, 0, 0, 1, 1,
0.6791503, 0.3413514, 1.589792, 1, 1, 1, 1, 1,
0.6794557, 0.8357792, 0.8339196, 1, 1, 1, 1, 1,
0.6810352, 0.4867265, 1.602047, 1, 1, 1, 1, 1,
0.6836054, 0.2790592, 1.599487, 1, 1, 1, 1, 1,
0.6867012, 0.187923, 1.53521, 1, 1, 1, 1, 1,
0.6877353, 0.3684519, 1.73047, 1, 1, 1, 1, 1,
0.6878111, -1.517767, 1.222873, 1, 1, 1, 1, 1,
0.6927401, 0.2918986, 1.64066, 1, 1, 1, 1, 1,
0.6939173, 2.385385, -0.07874574, 1, 1, 1, 1, 1,
0.6950294, -0.1864761, 1.460024, 1, 1, 1, 1, 1,
0.6957788, 0.08212118, -0.6289994, 1, 1, 1, 1, 1,
0.703227, -0.7888947, 2.235844, 1, 1, 1, 1, 1,
0.7059852, 0.7644259, 0.722401, 1, 1, 1, 1, 1,
0.7080122, -1.24685, 1.943099, 1, 1, 1, 1, 1,
0.7105625, 0.944173, -0.1091735, 1, 1, 1, 1, 1,
0.7106458, -1.426364, 1.659907, 0, 0, 1, 1, 1,
0.7126363, 0.1633278, 0.9371259, 1, 0, 0, 1, 1,
0.7264297, -0.1398895, 1.667155, 1, 0, 0, 1, 1,
0.7384512, 0.969246, 0.3141859, 1, 0, 0, 1, 1,
0.7460493, 0.5702394, 2.095547, 1, 0, 0, 1, 1,
0.7547113, -0.9098527, 2.504442, 1, 0, 0, 1, 1,
0.7566327, -1.597976, 3.471936, 0, 0, 0, 1, 1,
0.7600076, 0.2162436, 0.6650722, 0, 0, 0, 1, 1,
0.7618598, 0.7902371, 0.9093148, 0, 0, 0, 1, 1,
0.7619224, -0.7571821, 2.022084, 0, 0, 0, 1, 1,
0.7636305, 0.6884859, -1.634978, 0, 0, 0, 1, 1,
0.7765149, -0.8812945, 2.904673, 0, 0, 0, 1, 1,
0.7775587, -0.06863221, 2.569404, 0, 0, 0, 1, 1,
0.7786739, 1.698321, 0.003790956, 1, 1, 1, 1, 1,
0.7868525, 0.2259396, 0.9532016, 1, 1, 1, 1, 1,
0.7880181, -0.4535725, 1.98485, 1, 1, 1, 1, 1,
0.7887493, -1.668308, 2.269767, 1, 1, 1, 1, 1,
0.7980128, 0.1460539, 2.93768, 1, 1, 1, 1, 1,
0.7992455, 0.7915865, 0.3746523, 1, 1, 1, 1, 1,
0.8041335, -2.157896, 2.978266, 1, 1, 1, 1, 1,
0.8089681, -0.3710624, 0.817925, 1, 1, 1, 1, 1,
0.8099172, -0.6540139, 1.374095, 1, 1, 1, 1, 1,
0.8104535, -1.788916, 2.597347, 1, 1, 1, 1, 1,
0.8119509, 0.3378376, 1.686505, 1, 1, 1, 1, 1,
0.8139578, 0.301663, 0.8603265, 1, 1, 1, 1, 1,
0.8270413, 0.5822763, 1.891104, 1, 1, 1, 1, 1,
0.840476, 2.596142, 0.3123158, 1, 1, 1, 1, 1,
0.8577323, 0.1517436, 3.55863, 1, 1, 1, 1, 1,
0.8795286, -0.4921496, 1.413105, 0, 0, 1, 1, 1,
0.8828349, -0.6028154, 1.612594, 1, 0, 0, 1, 1,
0.8834584, 0.6304748, 1.741338, 1, 0, 0, 1, 1,
0.884409, -0.217898, -0.358797, 1, 0, 0, 1, 1,
0.8915538, 0.4904423, 1.974951, 1, 0, 0, 1, 1,
0.8935434, -1.012718, 5.041052, 1, 0, 0, 1, 1,
0.8959509, -1.40589, 3.566679, 0, 0, 0, 1, 1,
0.8976799, 0.7911641, 1.132938, 0, 0, 0, 1, 1,
0.903918, -1.14372, 3.24482, 0, 0, 0, 1, 1,
0.9096037, 0.2292462, 1.758349, 0, 0, 0, 1, 1,
0.9113512, 0.2604806, 1.822835, 0, 0, 0, 1, 1,
0.9120122, 0.1365932, 2.1225, 0, 0, 0, 1, 1,
0.9154124, 0.08319353, 2.551193, 0, 0, 0, 1, 1,
0.9165793, 1.004167, 0.5222263, 1, 1, 1, 1, 1,
0.9213987, -1.34333, 2.125916, 1, 1, 1, 1, 1,
0.9274691, 0.6885954, 1.251442, 1, 1, 1, 1, 1,
0.9315166, -1.530998, 3.808544, 1, 1, 1, 1, 1,
0.9328101, -1.158612, 2.702968, 1, 1, 1, 1, 1,
0.9383149, -0.1871697, 2.626342, 1, 1, 1, 1, 1,
0.9470413, 1.342317, 1.017101, 1, 1, 1, 1, 1,
0.9471143, 0.134075, 0.01748271, 1, 1, 1, 1, 1,
0.9655739, -1.237094, 3.782419, 1, 1, 1, 1, 1,
0.9698218, -0.7859146, 2.751925, 1, 1, 1, 1, 1,
0.9704169, 0.8009493, 0.4754342, 1, 1, 1, 1, 1,
0.976694, 0.01052806, 2.323136, 1, 1, 1, 1, 1,
0.9772021, 0.5465041, 2.224718, 1, 1, 1, 1, 1,
0.978814, 0.7777346, 1.48756, 1, 1, 1, 1, 1,
0.9790152, -2.323548, 2.212343, 1, 1, 1, 1, 1,
0.982914, -0.003697571, -0.07590023, 0, 0, 1, 1, 1,
0.9879825, 0.9358936, 0.2284455, 1, 0, 0, 1, 1,
0.9971083, 1.847161, -0.004850081, 1, 0, 0, 1, 1,
1.001674, -2.042352, 1.932664, 1, 0, 0, 1, 1,
1.010961, -0.1417394, 2.834086, 1, 0, 0, 1, 1,
1.02364, -1.039021, 2.260075, 1, 0, 0, 1, 1,
1.025224, -0.8779266, 2.511335, 0, 0, 0, 1, 1,
1.026257, 0.8094873, 0.1838837, 0, 0, 0, 1, 1,
1.027064, -0.1232164, 2.089843, 0, 0, 0, 1, 1,
1.027481, 0.6788915, 2.651766, 0, 0, 0, 1, 1,
1.031168, 1.011894, -0.1730868, 0, 0, 0, 1, 1,
1.031717, 1.189876, -0.153232, 0, 0, 0, 1, 1,
1.038231, 0.02102603, -1.392108, 0, 0, 0, 1, 1,
1.038406, 0.908834, 1.654972, 1, 1, 1, 1, 1,
1.043841, -0.5541807, 1.211329, 1, 1, 1, 1, 1,
1.05167, -0.8622352, 3.592091, 1, 1, 1, 1, 1,
1.052445, -0.6307116, 3.600233, 1, 1, 1, 1, 1,
1.05391, 0.2596928, 1.420757, 1, 1, 1, 1, 1,
1.059691, 0.2523706, 1.663484, 1, 1, 1, 1, 1,
1.062385, -0.208673, 2.288859, 1, 1, 1, 1, 1,
1.062659, 1.596944, 0.9451319, 1, 1, 1, 1, 1,
1.065349, -1.942826, 4.269742, 1, 1, 1, 1, 1,
1.065838, 0.7678186, 1.513778, 1, 1, 1, 1, 1,
1.073789, -0.6879086, 2.550136, 1, 1, 1, 1, 1,
1.076636, -0.1652831, -0.06717201, 1, 1, 1, 1, 1,
1.076787, -0.1486109, 0.8354631, 1, 1, 1, 1, 1,
1.08123, -0.08459593, 2.381735, 1, 1, 1, 1, 1,
1.084159, 1.025712, 2.435444, 1, 1, 1, 1, 1,
1.087521, 1.26532, -0.2156947, 0, 0, 1, 1, 1,
1.087611, -1.011138, 3.025759, 1, 0, 0, 1, 1,
1.097451, -0.1173183, 1.638211, 1, 0, 0, 1, 1,
1.09921, 2.148535, -0.3448247, 1, 0, 0, 1, 1,
1.104669, -0.5757504, 1.97575, 1, 0, 0, 1, 1,
1.113055, -1.473571, 1.787946, 1, 0, 0, 1, 1,
1.115972, 0.1678379, 0.0866667, 0, 0, 0, 1, 1,
1.11674, -0.7275091, 1.979267, 0, 0, 0, 1, 1,
1.12029, -1.837562, 1.156097, 0, 0, 0, 1, 1,
1.122162, -0.9798243, 2.99573, 0, 0, 0, 1, 1,
1.132927, -0.009529287, 2.238012, 0, 0, 0, 1, 1,
1.138665, 1.219959, 0.3362164, 0, 0, 0, 1, 1,
1.142691, -1.302354, 1.33145, 0, 0, 0, 1, 1,
1.150893, -0.1650829, 1.756334, 1, 1, 1, 1, 1,
1.154404, -0.615228, 1.291035, 1, 1, 1, 1, 1,
1.154859, -0.4586927, 1.072874, 1, 1, 1, 1, 1,
1.176136, -0.8245474, 2.969444, 1, 1, 1, 1, 1,
1.188184, -0.6087667, 2.156943, 1, 1, 1, 1, 1,
1.194079, -0.2700079, 1.144009, 1, 1, 1, 1, 1,
1.197091, 0.5023457, 1.030908, 1, 1, 1, 1, 1,
1.198239, 0.02998081, 1.791479, 1, 1, 1, 1, 1,
1.204488, 0.7222147, 1.007951, 1, 1, 1, 1, 1,
1.226763, 0.4688421, 2.350844, 1, 1, 1, 1, 1,
1.234462, -1.088106, 3.749641, 1, 1, 1, 1, 1,
1.239417, -0.7617539, 2.576458, 1, 1, 1, 1, 1,
1.239807, 0.7750507, 0.1150544, 1, 1, 1, 1, 1,
1.247366, -0.7799179, 2.134171, 1, 1, 1, 1, 1,
1.251616, -0.2958688, 2.961491, 1, 1, 1, 1, 1,
1.252966, -0.2658458, 2.162723, 0, 0, 1, 1, 1,
1.261392, 1.013058, 1.303833, 1, 0, 0, 1, 1,
1.261602, 0.6974416, 0.3434518, 1, 0, 0, 1, 1,
1.273575, 0.5529508, 0.04777843, 1, 0, 0, 1, 1,
1.276598, -0.2097999, 0.4643421, 1, 0, 0, 1, 1,
1.288447, -0.6049594, 2.404627, 1, 0, 0, 1, 1,
1.296514, -0.1235847, 2.199993, 0, 0, 0, 1, 1,
1.297059, -1.078513, 2.022974, 0, 0, 0, 1, 1,
1.298952, 1.342964, 0.1389842, 0, 0, 0, 1, 1,
1.306693, -1.072754, 1.597769, 0, 0, 0, 1, 1,
1.310205, 0.5370892, 0.4976417, 0, 0, 0, 1, 1,
1.311295, -1.84979, 2.821974, 0, 0, 0, 1, 1,
1.316069, -0.3145937, 0.4633461, 0, 0, 0, 1, 1,
1.322345, 0.4725772, -0.1655857, 1, 1, 1, 1, 1,
1.324616, 0.1749169, 1.959965, 1, 1, 1, 1, 1,
1.345002, -1.107778, 1.766718, 1, 1, 1, 1, 1,
1.347854, -0.4096196, 2.34807, 1, 1, 1, 1, 1,
1.366073, 0.315082, 1.409456, 1, 1, 1, 1, 1,
1.367231, 1.56754, 1.201976, 1, 1, 1, 1, 1,
1.369113, -0.50566, 2.8477, 1, 1, 1, 1, 1,
1.373566, 0.001789284, 2.070666, 1, 1, 1, 1, 1,
1.382368, 0.86521, 0.4362462, 1, 1, 1, 1, 1,
1.387878, 0.3062195, -0.0453252, 1, 1, 1, 1, 1,
1.388965, -0.6842597, 0.8374422, 1, 1, 1, 1, 1,
1.403948, 0.02906808, 2.628593, 1, 1, 1, 1, 1,
1.410237, 0.1951018, 0.2807288, 1, 1, 1, 1, 1,
1.411439, -1.396335, 0.3712133, 1, 1, 1, 1, 1,
1.428075, -0.5290304, 3.636912, 1, 1, 1, 1, 1,
1.433044, -1.868031, 2.052024, 0, 0, 1, 1, 1,
1.433916, -1.353831, 2.213128, 1, 0, 0, 1, 1,
1.435554, -0.6980072, 0.8584975, 1, 0, 0, 1, 1,
1.438071, 0.0230113, 1.645042, 1, 0, 0, 1, 1,
1.438406, -0.5711454, 0.8576239, 1, 0, 0, 1, 1,
1.442047, -0.9292393, 1.303162, 1, 0, 0, 1, 1,
1.446847, -0.3587913, 2.694154, 0, 0, 0, 1, 1,
1.448035, 0.7459955, 3.802876, 0, 0, 0, 1, 1,
1.449095, -1.98158, 1.577866, 0, 0, 0, 1, 1,
1.48487, 1.200816, 1.562761, 0, 0, 0, 1, 1,
1.495229, 0.7815069, 2.909848, 0, 0, 0, 1, 1,
1.503923, 0.9205942, 2.392195, 0, 0, 0, 1, 1,
1.520569, 0.5348761, 0.6162411, 0, 0, 0, 1, 1,
1.521904, -1.096318, 2.007518, 1, 1, 1, 1, 1,
1.528725, -0.8790652, 1.739372, 1, 1, 1, 1, 1,
1.530295, -0.8705687, 1.494057, 1, 1, 1, 1, 1,
1.545401, 0.7710111, -1.087839, 1, 1, 1, 1, 1,
1.54563, -1.281772, 2.331586, 1, 1, 1, 1, 1,
1.594352, -1.314038, 2.674569, 1, 1, 1, 1, 1,
1.597985, -0.814653, 1.874059, 1, 1, 1, 1, 1,
1.61453, -0.8562412, 2.531851, 1, 1, 1, 1, 1,
1.614604, 0.05448868, 1.386265, 1, 1, 1, 1, 1,
1.621415, -0.3291987, 2.154377, 1, 1, 1, 1, 1,
1.625255, 0.3243318, 0.9988679, 1, 1, 1, 1, 1,
1.640311, 0.4902977, 1.207467, 1, 1, 1, 1, 1,
1.644729, 0.7349123, 2.110254, 1, 1, 1, 1, 1,
1.65912, -1.919897, 2.056679, 1, 1, 1, 1, 1,
1.683974, 1.561815, 1.111457, 1, 1, 1, 1, 1,
1.697852, -1.139475, 1.96934, 0, 0, 1, 1, 1,
1.700263, -1.376019, 2.871867, 1, 0, 0, 1, 1,
1.703473, -0.09448188, 0.8720811, 1, 0, 0, 1, 1,
1.703565, -0.256254, 3.765457, 1, 0, 0, 1, 1,
1.707353, -1.781976, 2.064567, 1, 0, 0, 1, 1,
1.711756, 0.8837487, 1.062141, 1, 0, 0, 1, 1,
1.724572, -0.4704381, 0.9637353, 0, 0, 0, 1, 1,
1.758379, 0.7807734, -0.5147438, 0, 0, 0, 1, 1,
1.761215, 1.228683, 1.720783, 0, 0, 0, 1, 1,
1.762911, 0.1172938, 2.718282, 0, 0, 0, 1, 1,
1.774096, -1.956053, 1.529634, 0, 0, 0, 1, 1,
1.778238, 1.054778, -0.2958584, 0, 0, 0, 1, 1,
1.790018, 0.3882916, 2.359679, 0, 0, 0, 1, 1,
1.791925, -0.1389653, 0.6017251, 1, 1, 1, 1, 1,
1.806296, 0.7129592, -0.64204, 1, 1, 1, 1, 1,
1.820873, 0.6978244, 0.1324229, 1, 1, 1, 1, 1,
1.830261, -0.7722354, 1.573195, 1, 1, 1, 1, 1,
1.831028, -0.8047211, 2.534504, 1, 1, 1, 1, 1,
1.835351, -1.005633, 2.051297, 1, 1, 1, 1, 1,
1.841354, -0.4769398, 3.288224, 1, 1, 1, 1, 1,
1.84659, 1.273305, 0.2919747, 1, 1, 1, 1, 1,
1.85134, 1.400179, -0.1264053, 1, 1, 1, 1, 1,
1.863186, 2.513412, 0.4624959, 1, 1, 1, 1, 1,
1.896075, 0.382815, 1.75454, 1, 1, 1, 1, 1,
1.936623, -0.09471809, 1.556212, 1, 1, 1, 1, 1,
1.969974, 0.6703225, 1.031095, 1, 1, 1, 1, 1,
1.979231, -0.9083226, 3.490891, 1, 1, 1, 1, 1,
1.999998, 0.9203597, -0.3160188, 1, 1, 1, 1, 1,
2.000758, 0.2920234, 2.822909, 0, 0, 1, 1, 1,
2.006595, -0.09837849, 1.340617, 1, 0, 0, 1, 1,
2.056633, -1.746182, 2.318399, 1, 0, 0, 1, 1,
2.118814, 3.016812, -0.2624732, 1, 0, 0, 1, 1,
2.184702, -1.125862, 0.536585, 1, 0, 0, 1, 1,
2.195171, -0.5103803, 1.731668, 1, 0, 0, 1, 1,
2.20553, -1.892302, 2.163251, 0, 0, 0, 1, 1,
2.206646, 0.6886101, 2.716264, 0, 0, 0, 1, 1,
2.261408, 1.941573, 0.9477286, 0, 0, 0, 1, 1,
2.309799, 0.8483213, 2.166215, 0, 0, 0, 1, 1,
2.312012, 0.2596114, 1.447557, 0, 0, 0, 1, 1,
2.315506, -0.3600898, 1.66398, 0, 0, 0, 1, 1,
2.521972, 1.444664, -0.06340054, 0, 0, 0, 1, 1,
2.534607, 0.1549237, 1.937696, 1, 1, 1, 1, 1,
2.565217, -0.7461054, 1.260136, 1, 1, 1, 1, 1,
2.619892, 2.175042, 0.0340619, 1, 1, 1, 1, 1,
2.897834, 0.3255016, 3.387698, 1, 1, 1, 1, 1,
3.404484, 0.3536955, 0.4535255, 1, 1, 1, 1, 1,
3.666703, 0.3801107, 0.874741, 1, 1, 1, 1, 1,
3.911647, 1.124074, 2.00135, 1, 1, 1, 1, 1
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
var radius = 10.28637;
var distance = 36.13045;
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
mvMatrix.translate( -0.6180297, 0.2020268, -0.1787422 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.13045);
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
