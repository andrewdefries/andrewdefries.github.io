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
-3.627954, -0.7504572, -1.49004, 1, 0, 0, 1,
-2.877554, 1.912653, -0.4804317, 1, 0.007843138, 0, 1,
-2.795156, -0.3957515, -2.396489, 1, 0.01176471, 0, 1,
-2.77852, 0.0896677, -1.0156, 1, 0.01960784, 0, 1,
-2.748042, -1.205374, -1.988337, 1, 0.02352941, 0, 1,
-2.671653, -1.391491, -1.323415, 1, 0.03137255, 0, 1,
-2.367423, -0.06226005, -0.6968797, 1, 0.03529412, 0, 1,
-2.364643, 1.16613, -1.091667, 1, 0.04313726, 0, 1,
-2.364192, 0.5925812, -0.8263717, 1, 0.04705882, 0, 1,
-2.334523, -0.2094791, -0.7879885, 1, 0.05490196, 0, 1,
-2.323738, 0.1303888, -1.367202, 1, 0.05882353, 0, 1,
-2.293055, 1.009218, -2.334359, 1, 0.06666667, 0, 1,
-2.237134, 1.502979, -1.057679, 1, 0.07058824, 0, 1,
-2.219208, -0.2387407, -1.209224, 1, 0.07843138, 0, 1,
-2.202374, 0.5362338, -1.473186, 1, 0.08235294, 0, 1,
-2.199838, 1.493391, -0.3051647, 1, 0.09019608, 0, 1,
-2.165454, 0.670772, -1.1306, 1, 0.09411765, 0, 1,
-2.153102, 0.06693178, -1.76123, 1, 0.1019608, 0, 1,
-2.118134, 0.3488248, -1.395766, 1, 0.1098039, 0, 1,
-2.114863, -0.1143019, -0.7461175, 1, 0.1137255, 0, 1,
-2.106717, -0.4590514, -1.254748, 1, 0.1215686, 0, 1,
-2.096557, -0.6665163, -0.4613086, 1, 0.1254902, 0, 1,
-2.058427, 0.4176363, -0.719838, 1, 0.1333333, 0, 1,
-2.050328, -0.8261289, -4.071433, 1, 0.1372549, 0, 1,
-2.048204, -0.04161123, -1.206342, 1, 0.145098, 0, 1,
-2.041358, -0.8164567, -0.9942813, 1, 0.1490196, 0, 1,
-2.034391, 0.3557627, -0.5018297, 1, 0.1568628, 0, 1,
-2.032757, 0.4449861, -2.575561, 1, 0.1607843, 0, 1,
-2.004214, -0.4964788, -3.438781, 1, 0.1686275, 0, 1,
-1.993843, 0.6358491, -1.565426, 1, 0.172549, 0, 1,
-1.990397, -1.209466, -1.594247, 1, 0.1803922, 0, 1,
-1.954791, -0.1784687, -2.364912, 1, 0.1843137, 0, 1,
-1.9279, 0.6487635, -0.2781316, 1, 0.1921569, 0, 1,
-1.924679, 1.414278, -0.6565406, 1, 0.1960784, 0, 1,
-1.91989, 1.055536, -0.3647727, 1, 0.2039216, 0, 1,
-1.915879, -0.4823565, -2.022124, 1, 0.2117647, 0, 1,
-1.865385, 0.5137586, -0.1663645, 1, 0.2156863, 0, 1,
-1.861129, 0.5732287, -0.375879, 1, 0.2235294, 0, 1,
-1.855087, 1.608345, -0.3227766, 1, 0.227451, 0, 1,
-1.85317, -0.8172644, -2.970011, 1, 0.2352941, 0, 1,
-1.845311, 0.5156762, -1.600913, 1, 0.2392157, 0, 1,
-1.842415, 0.6647964, -1.502699, 1, 0.2470588, 0, 1,
-1.824856, 0.4818212, -0.8226849, 1, 0.2509804, 0, 1,
-1.817795, -0.9604867, -1.634963, 1, 0.2588235, 0, 1,
-1.772842, 0.09806326, -2.386648, 1, 0.2627451, 0, 1,
-1.768121, 1.353548, 0.7171654, 1, 0.2705882, 0, 1,
-1.764095, 0.3953972, -0.9023477, 1, 0.2745098, 0, 1,
-1.762022, 0.5868582, -1.497299, 1, 0.282353, 0, 1,
-1.761983, -0.4539716, -0.4751542, 1, 0.2862745, 0, 1,
-1.759463, -2.263606, -2.234869, 1, 0.2941177, 0, 1,
-1.750521, -0.9851249, -2.91944, 1, 0.3019608, 0, 1,
-1.738419, -0.2013262, -0.6474935, 1, 0.3058824, 0, 1,
-1.722875, -0.9141447, -1.317957, 1, 0.3137255, 0, 1,
-1.711164, 1.129871, -1.309058, 1, 0.3176471, 0, 1,
-1.699612, 1.361738, -1.199729, 1, 0.3254902, 0, 1,
-1.681902, -0.6890816, -4.547128, 1, 0.3294118, 0, 1,
-1.670421, 1.148884, -0.7522535, 1, 0.3372549, 0, 1,
-1.661055, -0.2747687, -1.335916, 1, 0.3411765, 0, 1,
-1.592435, 0.7544599, -3.066201, 1, 0.3490196, 0, 1,
-1.574199, -0.5860075, -1.717282, 1, 0.3529412, 0, 1,
-1.560691, -0.09129136, -1.545139, 1, 0.3607843, 0, 1,
-1.55673, -0.4035371, -1.51219, 1, 0.3647059, 0, 1,
-1.552508, 0.01409746, -1.034087, 1, 0.372549, 0, 1,
-1.546016, 2.795389, 0.2030192, 1, 0.3764706, 0, 1,
-1.526239, 1.437391, -1.3153, 1, 0.3843137, 0, 1,
-1.520389, -0.2713516, -0.6027566, 1, 0.3882353, 0, 1,
-1.51974, -1.336435, -2.735096, 1, 0.3960784, 0, 1,
-1.508546, -1.523193, -1.541247, 1, 0.4039216, 0, 1,
-1.505993, -0.1011599, -2.947596, 1, 0.4078431, 0, 1,
-1.492166, 0.01690418, -2.020052, 1, 0.4156863, 0, 1,
-1.489633, 0.3027704, -1.881376, 1, 0.4196078, 0, 1,
-1.488028, 0.6665609, -0.4480525, 1, 0.427451, 0, 1,
-1.484134, 0.785486, -0.8537179, 1, 0.4313726, 0, 1,
-1.481565, -1.057711, -1.911321, 1, 0.4392157, 0, 1,
-1.466778, -0.6822541, -3.432178, 1, 0.4431373, 0, 1,
-1.466725, -0.6930087, -1.360905, 1, 0.4509804, 0, 1,
-1.454472, -0.286782, -2.054145, 1, 0.454902, 0, 1,
-1.446857, -0.887525, -3.769953, 1, 0.4627451, 0, 1,
-1.437851, -1.211614, -1.513801, 1, 0.4666667, 0, 1,
-1.421372, -1.67503, -2.29809, 1, 0.4745098, 0, 1,
-1.413536, 0.4596493, -1.515686, 1, 0.4784314, 0, 1,
-1.402051, -0.3141529, -2.234294, 1, 0.4862745, 0, 1,
-1.398916, -1.054023, -3.148954, 1, 0.4901961, 0, 1,
-1.383468, 0.08246201, -2.478337, 1, 0.4980392, 0, 1,
-1.38012, 1.177978, -1.308209, 1, 0.5058824, 0, 1,
-1.378133, 0.2187334, -1.279847, 1, 0.509804, 0, 1,
-1.374457, 0.6450885, 0.7157544, 1, 0.5176471, 0, 1,
-1.368507, 0.3255286, -2.823459, 1, 0.5215687, 0, 1,
-1.366988, -1.247874, -3.313042, 1, 0.5294118, 0, 1,
-1.366087, 0.8786234, -0.7655343, 1, 0.5333334, 0, 1,
-1.359576, 0.6296755, -3.173489, 1, 0.5411765, 0, 1,
-1.356802, -0.6617611, -4.093292, 1, 0.5450981, 0, 1,
-1.356555, 0.6298034, -1.39614, 1, 0.5529412, 0, 1,
-1.336603, 1.817301, -2.885763, 1, 0.5568628, 0, 1,
-1.322549, 0.3318809, -2.441928, 1, 0.5647059, 0, 1,
-1.321659, 0.9554275, 0.4038093, 1, 0.5686275, 0, 1,
-1.316845, 0.1334202, -3.147193, 1, 0.5764706, 0, 1,
-1.316137, -0.5497611, -3.373946, 1, 0.5803922, 0, 1,
-1.314303, -0.3267507, -1.55824, 1, 0.5882353, 0, 1,
-1.285412, 0.4958471, -0.8176814, 1, 0.5921569, 0, 1,
-1.273257, -0.1757088, -1.887632, 1, 0.6, 0, 1,
-1.266031, 0.4116842, -2.585874, 1, 0.6078432, 0, 1,
-1.265912, -0.6005465, -2.687843, 1, 0.6117647, 0, 1,
-1.264757, -1.464448, -4.566819, 1, 0.6196079, 0, 1,
-1.263996, -1.217634, -2.949775, 1, 0.6235294, 0, 1,
-1.260759, -1.816055, -2.154013, 1, 0.6313726, 0, 1,
-1.257474, -1.814229, -1.68873, 1, 0.6352941, 0, 1,
-1.255255, -0.3797034, -1.216068, 1, 0.6431373, 0, 1,
-1.233079, -0.820317, 0.2670345, 1, 0.6470588, 0, 1,
-1.23254, -1.10963, -3.729858, 1, 0.654902, 0, 1,
-1.203223, -0.1643135, -0.8777779, 1, 0.6588235, 0, 1,
-1.197185, -0.8485452, 0.2265508, 1, 0.6666667, 0, 1,
-1.18782, 1.045892, -1.750483, 1, 0.6705883, 0, 1,
-1.185834, 0.009685476, -1.079285, 1, 0.6784314, 0, 1,
-1.185773, -0.251339, -1.747544, 1, 0.682353, 0, 1,
-1.1841, -1.536075, -3.140924, 1, 0.6901961, 0, 1,
-1.180843, 0.4469107, -2.991109, 1, 0.6941177, 0, 1,
-1.178092, -0.3959881, -2.852051, 1, 0.7019608, 0, 1,
-1.176413, -0.157429, -1.54926, 1, 0.7098039, 0, 1,
-1.169287, -1.024134, -2.507174, 1, 0.7137255, 0, 1,
-1.168457, -1.142677, -1.951689, 1, 0.7215686, 0, 1,
-1.155457, 1.540797, 0.7253743, 1, 0.7254902, 0, 1,
-1.15158, 0.4034637, -0.1071471, 1, 0.7333333, 0, 1,
-1.1513, 1.182847, -1.903466, 1, 0.7372549, 0, 1,
-1.149989, -1.392536, -2.906051, 1, 0.7450981, 0, 1,
-1.144667, 0.4355156, -0.7572109, 1, 0.7490196, 0, 1,
-1.141482, -0.5827653, -1.936779, 1, 0.7568628, 0, 1,
-1.134038, -0.355579, -3.249256, 1, 0.7607843, 0, 1,
-1.130697, -0.07902249, -2.354518, 1, 0.7686275, 0, 1,
-1.120609, -0.7222165, -2.089458, 1, 0.772549, 0, 1,
-1.115182, -0.5512466, -1.328179, 1, 0.7803922, 0, 1,
-1.113452, 0.07777678, -2.007517, 1, 0.7843137, 0, 1,
-1.107496, 1.076686, -0.606791, 1, 0.7921569, 0, 1,
-1.106784, -1.031621, -0.989079, 1, 0.7960784, 0, 1,
-1.102075, -0.8357843, -1.700164, 1, 0.8039216, 0, 1,
-1.094918, -0.2178388, -0.125145, 1, 0.8117647, 0, 1,
-1.093192, -0.7519338, -1.726907, 1, 0.8156863, 0, 1,
-1.091072, -0.2570164, -1.864561, 1, 0.8235294, 0, 1,
-1.090068, -0.1813015, -1.633447, 1, 0.827451, 0, 1,
-1.085972, 0.2599858, -2.113854, 1, 0.8352941, 0, 1,
-1.083544, -0.4511535, -1.116642, 1, 0.8392157, 0, 1,
-1.082323, 1.734413, -1.741587, 1, 0.8470588, 0, 1,
-1.080295, 0.9475866, 2.359469, 1, 0.8509804, 0, 1,
-1.071938, -2.085083, -3.843987, 1, 0.8588235, 0, 1,
-1.070809, 0.07354721, -2.183306, 1, 0.8627451, 0, 1,
-1.064913, -2.064503, -1.373272, 1, 0.8705882, 0, 1,
-1.064209, -0.8644288, -2.883535, 1, 0.8745098, 0, 1,
-1.059619, -0.241963, -1.892834, 1, 0.8823529, 0, 1,
-1.057047, -0.2943294, -1.743237, 1, 0.8862745, 0, 1,
-1.049233, -1.04151, -2.656002, 1, 0.8941177, 0, 1,
-1.045278, -2.682524, -2.56839, 1, 0.8980392, 0, 1,
-1.044543, -0.5789523, -4.153113, 1, 0.9058824, 0, 1,
-1.039387, 0.1970014, -1.516853, 1, 0.9137255, 0, 1,
-1.038221, 0.2543931, -1.074932, 1, 0.9176471, 0, 1,
-1.036328, 0.01426522, -0.991965, 1, 0.9254902, 0, 1,
-1.031379, -0.7302414, -1.722864, 1, 0.9294118, 0, 1,
-1.028388, 0.7624972, -1.935044, 1, 0.9372549, 0, 1,
-1.019403, -1.233201, -2.026524, 1, 0.9411765, 0, 1,
-1.018508, -0.8762577, -3.901052, 1, 0.9490196, 0, 1,
-1.016458, -0.1293843, -0.7446746, 1, 0.9529412, 0, 1,
-1.009241, 0.1865375, -1.656637, 1, 0.9607843, 0, 1,
-1.000344, -1.377361, -4.786981, 1, 0.9647059, 0, 1,
-0.9897006, -0.1520113, -2.818184, 1, 0.972549, 0, 1,
-0.9881924, -1.31776, -1.82124, 1, 0.9764706, 0, 1,
-0.988101, -0.3065621, -2.160075, 1, 0.9843137, 0, 1,
-0.9849133, -0.5859947, -1.74098, 1, 0.9882353, 0, 1,
-0.9812182, 0.256612, -2.548178, 1, 0.9960784, 0, 1,
-0.9782672, -1.447489, -2.784592, 0.9960784, 1, 0, 1,
-0.9742289, -0.8207117, -1.620789, 0.9921569, 1, 0, 1,
-0.9733354, 0.9265444, -1.06812, 0.9843137, 1, 0, 1,
-0.9718487, 0.302998, -1.50127, 0.9803922, 1, 0, 1,
-0.9717686, 1.208919, -0.9813346, 0.972549, 1, 0, 1,
-0.9706037, 0.2351393, -1.613913, 0.9686275, 1, 0, 1,
-0.9685144, -0.7276593, -3.958479, 0.9607843, 1, 0, 1,
-0.9675585, 2.211467, 0.9901282, 0.9568627, 1, 0, 1,
-0.9593363, -0.4006654, -3.052236, 0.9490196, 1, 0, 1,
-0.9505593, -0.2646397, -1.50819, 0.945098, 1, 0, 1,
-0.9486992, -0.3626225, -1.734081, 0.9372549, 1, 0, 1,
-0.9484619, 0.239099, -0.8804565, 0.9333333, 1, 0, 1,
-0.9405503, 0.9905714, -1.14345, 0.9254902, 1, 0, 1,
-0.9397792, 1.452699, 0.5876951, 0.9215686, 1, 0, 1,
-0.939321, -1.306176, -4.203621, 0.9137255, 1, 0, 1,
-0.9334638, -1.162668, -2.089763, 0.9098039, 1, 0, 1,
-0.9300466, 0.07415278, -1.505776, 0.9019608, 1, 0, 1,
-0.9240006, -0.05549793, -2.318442, 0.8941177, 1, 0, 1,
-0.9233623, -0.5907141, -3.452786, 0.8901961, 1, 0, 1,
-0.9189005, -0.4544298, -1.110237, 0.8823529, 1, 0, 1,
-0.9153343, 0.7669032, -1.348433, 0.8784314, 1, 0, 1,
-0.9112346, -1.290711, -2.282051, 0.8705882, 1, 0, 1,
-0.9097345, -1.692181, -1.420928, 0.8666667, 1, 0, 1,
-0.9079303, 1.365896, 3.285191, 0.8588235, 1, 0, 1,
-0.9054086, -1.036803, -2.908638, 0.854902, 1, 0, 1,
-0.9014398, 1.236997, -0.917849, 0.8470588, 1, 0, 1,
-0.8973833, -0.8428283, -0.2672413, 0.8431373, 1, 0, 1,
-0.8895209, -0.246534, -1.646351, 0.8352941, 1, 0, 1,
-0.8886554, 0.5463936, -0.3337988, 0.8313726, 1, 0, 1,
-0.880137, 1.073016, 0.2790118, 0.8235294, 1, 0, 1,
-0.8789927, 0.4272325, -0.03083714, 0.8196079, 1, 0, 1,
-0.8779781, 0.238397, -1.233328, 0.8117647, 1, 0, 1,
-0.8776065, 0.4541159, 0.4529635, 0.8078431, 1, 0, 1,
-0.8655382, 1.426202, -2.005911, 0.8, 1, 0, 1,
-0.8643869, -0.6418692, -2.762893, 0.7921569, 1, 0, 1,
-0.8631976, -0.3956217, -0.860708, 0.7882353, 1, 0, 1,
-0.8523188, 0.07353122, -0.9218376, 0.7803922, 1, 0, 1,
-0.8494843, 0.2645638, -2.999288, 0.7764706, 1, 0, 1,
-0.8475351, 0.6815261, 0.1368469, 0.7686275, 1, 0, 1,
-0.831727, -0.912361, -3.428581, 0.7647059, 1, 0, 1,
-0.8305932, -0.3283455, -3.214678, 0.7568628, 1, 0, 1,
-0.8266264, 1.179369, -1.216397, 0.7529412, 1, 0, 1,
-0.8259523, 0.8759785, -1.055102, 0.7450981, 1, 0, 1,
-0.8208067, -0.3571579, -0.9680113, 0.7411765, 1, 0, 1,
-0.8148329, -2.178385, -1.470281, 0.7333333, 1, 0, 1,
-0.8031892, 0.9709798, -0.4801439, 0.7294118, 1, 0, 1,
-0.8014316, -0.722716, -2.088843, 0.7215686, 1, 0, 1,
-0.7928584, 0.4595893, -1.625054, 0.7176471, 1, 0, 1,
-0.7874817, 0.3244334, 0.2761156, 0.7098039, 1, 0, 1,
-0.7871798, 0.1934886, -1.700806, 0.7058824, 1, 0, 1,
-0.7845289, 0.2829803, -0.7306427, 0.6980392, 1, 0, 1,
-0.7764629, 0.876293, -2.629435, 0.6901961, 1, 0, 1,
-0.7657055, -1.366479, -5.35255, 0.6862745, 1, 0, 1,
-0.7591326, -0.3102326, -1.097754, 0.6784314, 1, 0, 1,
-0.7585722, 0.1727467, -1.186785, 0.6745098, 1, 0, 1,
-0.7575848, -0.2915652, -1.556652, 0.6666667, 1, 0, 1,
-0.754369, -0.1593197, -1.367511, 0.6627451, 1, 0, 1,
-0.7514177, -0.6731549, -1.959849, 0.654902, 1, 0, 1,
-0.7427856, 0.3220376, -0.6875126, 0.6509804, 1, 0, 1,
-0.7413137, -0.8301632, -3.787322, 0.6431373, 1, 0, 1,
-0.7381284, -0.02066611, -1.144726, 0.6392157, 1, 0, 1,
-0.7374892, 1.734075, -0.9584724, 0.6313726, 1, 0, 1,
-0.7367622, -0.3372468, -2.290225, 0.627451, 1, 0, 1,
-0.7364671, 0.4052238, 0.09409662, 0.6196079, 1, 0, 1,
-0.7357448, -2.550049, -3.086952, 0.6156863, 1, 0, 1,
-0.7353005, 0.320921, -1.158725, 0.6078432, 1, 0, 1,
-0.7309619, 0.05178386, -1.531063, 0.6039216, 1, 0, 1,
-0.7288495, -0.3050325, -1.786238, 0.5960785, 1, 0, 1,
-0.7237014, -0.3865887, -1.769413, 0.5882353, 1, 0, 1,
-0.7236329, 1.182082, -1.287151, 0.5843138, 1, 0, 1,
-0.7190126, -0.4669741, -2.666735, 0.5764706, 1, 0, 1,
-0.7171957, -0.3987555, -2.741186, 0.572549, 1, 0, 1,
-0.7133446, -1.788307, -3.953193, 0.5647059, 1, 0, 1,
-0.7130616, -0.4126067, -1.827152, 0.5607843, 1, 0, 1,
-0.7092894, -0.4288233, -1.789889, 0.5529412, 1, 0, 1,
-0.7077705, -1.49957, -2.356918, 0.5490196, 1, 0, 1,
-0.704071, 3.330894, -1.250749, 0.5411765, 1, 0, 1,
-0.7018044, 0.480487, -1.418508, 0.5372549, 1, 0, 1,
-0.6996009, 0.01975099, -2.540521, 0.5294118, 1, 0, 1,
-0.6945658, 1.238231, 1.0054, 0.5254902, 1, 0, 1,
-0.6943542, 0.7262612, -1.186498, 0.5176471, 1, 0, 1,
-0.6904577, -1.091245, -1.746304, 0.5137255, 1, 0, 1,
-0.6895218, 0.2341619, -1.638959, 0.5058824, 1, 0, 1,
-0.6862376, 1.149924, 1.217816, 0.5019608, 1, 0, 1,
-0.6858528, -0.4136771, -1.479026, 0.4941176, 1, 0, 1,
-0.683374, -0.5948534, -1.89363, 0.4862745, 1, 0, 1,
-0.6821886, -0.5819971, -1.962517, 0.4823529, 1, 0, 1,
-0.6807902, 0.3459028, -2.656942, 0.4745098, 1, 0, 1,
-0.6775631, -0.5360701, -1.394795, 0.4705882, 1, 0, 1,
-0.6710513, 1.578421, -0.1906192, 0.4627451, 1, 0, 1,
-0.664284, 1.256179, -1.595941, 0.4588235, 1, 0, 1,
-0.660248, -0.4033844, -3.224723, 0.4509804, 1, 0, 1,
-0.6532925, 0.08095197, -2.962043, 0.4470588, 1, 0, 1,
-0.6461504, 0.8741207, 0.3181829, 0.4392157, 1, 0, 1,
-0.6460597, 0.0508055, 0.7715197, 0.4352941, 1, 0, 1,
-0.6429664, 0.4415636, -0.5147731, 0.427451, 1, 0, 1,
-0.6427065, -1.183361, -1.315028, 0.4235294, 1, 0, 1,
-0.6361734, -0.262884, -3.092218, 0.4156863, 1, 0, 1,
-0.6273606, 0.1597634, -1.752408, 0.4117647, 1, 0, 1,
-0.6246963, -0.9752252, -4.294141, 0.4039216, 1, 0, 1,
-0.6237602, 1.077931, -0.467453, 0.3960784, 1, 0, 1,
-0.621314, -1.231521, -2.777195, 0.3921569, 1, 0, 1,
-0.6211607, -1.074769, -1.078038, 0.3843137, 1, 0, 1,
-0.6110857, -0.3259713, -2.4436, 0.3803922, 1, 0, 1,
-0.6062216, 0.5695403, -0.2608006, 0.372549, 1, 0, 1,
-0.6059447, -1.124405, -1.649287, 0.3686275, 1, 0, 1,
-0.594565, 0.122755, -0.3284882, 0.3607843, 1, 0, 1,
-0.5928239, 0.1321924, -0.9015319, 0.3568628, 1, 0, 1,
-0.5913816, -0.5278735, -1.277201, 0.3490196, 1, 0, 1,
-0.5885538, 0.3272228, -1.417362, 0.345098, 1, 0, 1,
-0.5850477, -0.8292673, -1.748718, 0.3372549, 1, 0, 1,
-0.5832885, 2.136268, -0.7760398, 0.3333333, 1, 0, 1,
-0.5823016, -1.608097, -1.293423, 0.3254902, 1, 0, 1,
-0.5747174, -0.2872311, -1.694497, 0.3215686, 1, 0, 1,
-0.5728869, -0.5588176, -3.551573, 0.3137255, 1, 0, 1,
-0.569168, -0.4199934, -3.061219, 0.3098039, 1, 0, 1,
-0.5636951, -0.7600847, -2.241026, 0.3019608, 1, 0, 1,
-0.5630841, -1.448885, -2.640779, 0.2941177, 1, 0, 1,
-0.5630839, 0.6316163, -1.249818, 0.2901961, 1, 0, 1,
-0.5624731, -1.215373, -3.390115, 0.282353, 1, 0, 1,
-0.5607543, 0.4643638, 0.6616711, 0.2784314, 1, 0, 1,
-0.559602, -1.831059, -2.842403, 0.2705882, 1, 0, 1,
-0.5574602, 1.261909, -2.339788, 0.2666667, 1, 0, 1,
-0.5572196, -0.1083901, -2.274282, 0.2588235, 1, 0, 1,
-0.5547385, 1.450553, -0.8408409, 0.254902, 1, 0, 1,
-0.5547203, 1.435212, -0.2951414, 0.2470588, 1, 0, 1,
-0.5436258, 0.6342756, 0.8015884, 0.2431373, 1, 0, 1,
-0.5411771, 1.077729, 1.663295, 0.2352941, 1, 0, 1,
-0.5377541, -1.507851, -2.825955, 0.2313726, 1, 0, 1,
-0.5256589, -1.472584, -1.511353, 0.2235294, 1, 0, 1,
-0.5237194, 0.9033642, -2.15977, 0.2196078, 1, 0, 1,
-0.5225972, 1.315005, 0.08638907, 0.2117647, 1, 0, 1,
-0.520029, -0.9002242, -1.401754, 0.2078431, 1, 0, 1,
-0.5175989, -0.1523352, -2.209438, 0.2, 1, 0, 1,
-0.5158911, 0.2704442, -1.597255, 0.1921569, 1, 0, 1,
-0.5144507, -1.123788, -1.587889, 0.1882353, 1, 0, 1,
-0.5113404, -1.193946, -4.183126, 0.1803922, 1, 0, 1,
-0.5111448, 0.180982, -2.977117, 0.1764706, 1, 0, 1,
-0.5029886, 0.089037, -0.9264759, 0.1686275, 1, 0, 1,
-0.4970126, -1.597517, -3.165399, 0.1647059, 1, 0, 1,
-0.4956741, 1.484811, -1.374476, 0.1568628, 1, 0, 1,
-0.4922295, -1.641946, -3.476097, 0.1529412, 1, 0, 1,
-0.4912372, -1.295547, -3.734393, 0.145098, 1, 0, 1,
-0.4902069, 0.3052881, -2.098602, 0.1411765, 1, 0, 1,
-0.4872777, 0.1106317, -2.493025, 0.1333333, 1, 0, 1,
-0.4835826, 1.05113, 0.4763918, 0.1294118, 1, 0, 1,
-0.4820119, -0.8472284, -4.077965, 0.1215686, 1, 0, 1,
-0.4753781, -1.821063, -4.265643, 0.1176471, 1, 0, 1,
-0.4753643, 1.407529, 0.6589994, 0.1098039, 1, 0, 1,
-0.4640976, -1.147684, -1.683161, 0.1058824, 1, 0, 1,
-0.4634451, -0.128636, -4.170573, 0.09803922, 1, 0, 1,
-0.4631036, -0.3365571, -0.8659263, 0.09019608, 1, 0, 1,
-0.4610909, -0.6795052, -2.878709, 0.08627451, 1, 0, 1,
-0.4515248, 0.8150635, -1.516088, 0.07843138, 1, 0, 1,
-0.4386838, 0.1631145, -2.244125, 0.07450981, 1, 0, 1,
-0.4300078, 0.5005148, -2.179461, 0.06666667, 1, 0, 1,
-0.4285684, 0.5603142, -0.4242901, 0.0627451, 1, 0, 1,
-0.4273201, 1.776979, -1.914821, 0.05490196, 1, 0, 1,
-0.4166198, 0.2271993, -0.5673286, 0.05098039, 1, 0, 1,
-0.4160116, -0.7895333, -1.093851, 0.04313726, 1, 0, 1,
-0.4134232, -0.5434976, -3.42254, 0.03921569, 1, 0, 1,
-0.409909, -0.2931818, -2.103503, 0.03137255, 1, 0, 1,
-0.4094532, -0.04806294, -1.365492, 0.02745098, 1, 0, 1,
-0.4083919, -0.3073226, -2.365569, 0.01960784, 1, 0, 1,
-0.4063438, -2.174546, -2.155346, 0.01568628, 1, 0, 1,
-0.4057712, -2.195789, -5.206956, 0.007843138, 1, 0, 1,
-0.4040056, -1.476886, -2.18091, 0.003921569, 1, 0, 1,
-0.3980922, -1.696791, -1.736581, 0, 1, 0.003921569, 1,
-0.3946715, -0.02604144, -1.181517, 0, 1, 0.01176471, 1,
-0.3937393, 0.310242, -0.9827458, 0, 1, 0.01568628, 1,
-0.3903128, 0.5480803, -0.839991, 0, 1, 0.02352941, 1,
-0.3829883, -0.06591186, -1.414396, 0, 1, 0.02745098, 1,
-0.3801009, -0.1135391, -1.068651, 0, 1, 0.03529412, 1,
-0.3792443, -0.3230069, -2.920101, 0, 1, 0.03921569, 1,
-0.3733748, -2.0656, -1.821838, 0, 1, 0.04705882, 1,
-0.373029, 0.5298791, -1.663064, 0, 1, 0.05098039, 1,
-0.3700383, -0.9124405, -4.479065, 0, 1, 0.05882353, 1,
-0.3689079, 0.05646475, -1.892214, 0, 1, 0.0627451, 1,
-0.367051, 0.1910413, 0.8935504, 0, 1, 0.07058824, 1,
-0.3662268, 0.1136272, -2.139778, 0, 1, 0.07450981, 1,
-0.3661019, -0.1477289, -1.570082, 0, 1, 0.08235294, 1,
-0.3639669, 1.247006, 0.1381991, 0, 1, 0.08627451, 1,
-0.3635564, 0.3395013, 1.621452, 0, 1, 0.09411765, 1,
-0.3575927, 2.041859, -1.148278, 0, 1, 0.1019608, 1,
-0.3570744, 0.2470168, 0.1251172, 0, 1, 0.1058824, 1,
-0.357058, 0.225766, -2.094055, 0, 1, 0.1137255, 1,
-0.3558142, 0.3329608, -1.180795, 0, 1, 0.1176471, 1,
-0.3548577, -0.2484917, -3.348413, 0, 1, 0.1254902, 1,
-0.3542718, 0.502701, -0.4477863, 0, 1, 0.1294118, 1,
-0.3539534, 0.5349265, -0.3242977, 0, 1, 0.1372549, 1,
-0.3490666, 0.3404693, -1.161059, 0, 1, 0.1411765, 1,
-0.3455854, -0.7160344, -2.214528, 0, 1, 0.1490196, 1,
-0.3365906, -1.549583, -2.028654, 0, 1, 0.1529412, 1,
-0.3360798, 2.053178, -0.4232131, 0, 1, 0.1607843, 1,
-0.3333122, 0.04942004, -0.2415618, 0, 1, 0.1647059, 1,
-0.3292834, -0.776547, -2.937222, 0, 1, 0.172549, 1,
-0.3272448, 0.4231118, -1.094348, 0, 1, 0.1764706, 1,
-0.3268857, 0.696265, 0.3149688, 0, 1, 0.1843137, 1,
-0.3265341, -0.2008127, -1.469659, 0, 1, 0.1882353, 1,
-0.3172231, -0.2660317, -2.730936, 0, 1, 0.1960784, 1,
-0.3142982, 1.069605, -0.5555271, 0, 1, 0.2039216, 1,
-0.3122983, -0.4822834, -1.310185, 0, 1, 0.2078431, 1,
-0.309326, -0.6755333, -2.563442, 0, 1, 0.2156863, 1,
-0.2980551, 1.323651, -1.121881, 0, 1, 0.2196078, 1,
-0.2972642, 0.4328093, -1.870139, 0, 1, 0.227451, 1,
-0.295331, -1.09978, -2.111328, 0, 1, 0.2313726, 1,
-0.2917159, -0.3898634, -1.492339, 0, 1, 0.2392157, 1,
-0.2875435, -1.241016, -2.677936, 0, 1, 0.2431373, 1,
-0.2860177, 1.868093, -0.3026624, 0, 1, 0.2509804, 1,
-0.2857234, 0.1708152, -0.01384145, 0, 1, 0.254902, 1,
-0.2847849, 2.194207, 0.7091554, 0, 1, 0.2627451, 1,
-0.2837248, 0.06635682, -2.714072, 0, 1, 0.2666667, 1,
-0.2811979, 0.5024116, -1.26898, 0, 1, 0.2745098, 1,
-0.2807966, -0.2781303, -1.177237, 0, 1, 0.2784314, 1,
-0.2782237, 0.3797971, 1.265005, 0, 1, 0.2862745, 1,
-0.2748477, -2.226943, -5.52072, 0, 1, 0.2901961, 1,
-0.2736192, -0.6481045, -3.857924, 0, 1, 0.2980392, 1,
-0.2701166, 0.5454532, 0.4997485, 0, 1, 0.3058824, 1,
-0.2661027, -1.08299, -2.495754, 0, 1, 0.3098039, 1,
-0.2659255, -0.3528753, -2.501948, 0, 1, 0.3176471, 1,
-0.2649248, -0.3448606, -3.13007, 0, 1, 0.3215686, 1,
-0.2637108, 1.003581, -0.352388, 0, 1, 0.3294118, 1,
-0.2593949, 0.3954699, -1.321893, 0, 1, 0.3333333, 1,
-0.2587143, -0.9544781, -4.340827, 0, 1, 0.3411765, 1,
-0.252541, 0.9416149, -1.036209, 0, 1, 0.345098, 1,
-0.252444, 0.01488631, -3.567777, 0, 1, 0.3529412, 1,
-0.2521445, 0.1216902, 0.3017331, 0, 1, 0.3568628, 1,
-0.2513925, -0.7360333, -2.677561, 0, 1, 0.3647059, 1,
-0.2489152, 0.3065371, -2.0368, 0, 1, 0.3686275, 1,
-0.2437336, 0.1549412, -1.972685, 0, 1, 0.3764706, 1,
-0.2412093, 0.7008922, -0.9195125, 0, 1, 0.3803922, 1,
-0.2394048, -0.6156582, -3.033249, 0, 1, 0.3882353, 1,
-0.2371014, 0.5940008, 0.09769809, 0, 1, 0.3921569, 1,
-0.2345805, 0.4119788, 0.02306238, 0, 1, 0.4, 1,
-0.2341491, -0.1244686, -3.148582, 0, 1, 0.4078431, 1,
-0.2301174, 0.7641879, -0.02611979, 0, 1, 0.4117647, 1,
-0.2268788, -1.276431, -1.951902, 0, 1, 0.4196078, 1,
-0.2203241, -1.259396, -2.477792, 0, 1, 0.4235294, 1,
-0.2137478, 0.9780439, -1.753329, 0, 1, 0.4313726, 1,
-0.2136565, -2.591753, -2.340944, 0, 1, 0.4352941, 1,
-0.2091522, -0.6357237, -2.250768, 0, 1, 0.4431373, 1,
-0.2023955, -0.4055136, -3.373471, 0, 1, 0.4470588, 1,
-0.2021851, 2.179629, -0.7430038, 0, 1, 0.454902, 1,
-0.1965858, -0.5852572, -3.89365, 0, 1, 0.4588235, 1,
-0.1915894, -0.6261243, -2.505992, 0, 1, 0.4666667, 1,
-0.1903423, -0.5784481, -2.299442, 0, 1, 0.4705882, 1,
-0.1880989, 0.7909408, 2.031908, 0, 1, 0.4784314, 1,
-0.1871117, -0.4605846, -4.311382, 0, 1, 0.4823529, 1,
-0.1868701, -0.7468864, -2.509504, 0, 1, 0.4901961, 1,
-0.1830178, -0.2919227, -4.474039, 0, 1, 0.4941176, 1,
-0.1766499, 0.2027106, -1.097235, 0, 1, 0.5019608, 1,
-0.1754386, -0.7678367, -2.869555, 0, 1, 0.509804, 1,
-0.1752744, -0.238135, -2.000911, 0, 1, 0.5137255, 1,
-0.1679363, 0.03385304, -1.685427, 0, 1, 0.5215687, 1,
-0.1643696, -1.422639, -1.048674, 0, 1, 0.5254902, 1,
-0.1626431, 0.863195, -0.942179, 0, 1, 0.5333334, 1,
-0.1592842, -0.7555466, -2.342529, 0, 1, 0.5372549, 1,
-0.1570684, 1.476329, -0.9106142, 0, 1, 0.5450981, 1,
-0.1554471, -0.4235545, -3.508448, 0, 1, 0.5490196, 1,
-0.150258, -1.717003, -3.1063, 0, 1, 0.5568628, 1,
-0.1497869, -0.1683782, -0.1762742, 0, 1, 0.5607843, 1,
-0.1466079, -0.4170879, -1.82184, 0, 1, 0.5686275, 1,
-0.1442581, 0.8975533, 0.4852213, 0, 1, 0.572549, 1,
-0.1441942, 0.6577294, -1.056457, 0, 1, 0.5803922, 1,
-0.1439515, 1.319408, -0.8946989, 0, 1, 0.5843138, 1,
-0.1437301, -1.13314, -3.23726, 0, 1, 0.5921569, 1,
-0.1372263, 0.04906769, -1.394457, 0, 1, 0.5960785, 1,
-0.1350984, -1.336657, -2.727835, 0, 1, 0.6039216, 1,
-0.1283377, -0.4831074, -2.860002, 0, 1, 0.6117647, 1,
-0.1264367, 1.585695, 0.9794166, 0, 1, 0.6156863, 1,
-0.1262566, 0.2116805, 1.023147, 0, 1, 0.6235294, 1,
-0.1258513, -1.912441, -1.675151, 0, 1, 0.627451, 1,
-0.1178279, 0.1839263, -1.081279, 0, 1, 0.6352941, 1,
-0.1160144, 0.05772224, -1.800725, 0, 1, 0.6392157, 1,
-0.115626, 0.7394411, 0.871034, 0, 1, 0.6470588, 1,
-0.1141308, -0.4248322, -4.052319, 0, 1, 0.6509804, 1,
-0.1080414, 2.07432, 0.2687629, 0, 1, 0.6588235, 1,
-0.1057259, 1.496072, -0.268694, 0, 1, 0.6627451, 1,
-0.1049855, 0.6293322, 0.8485225, 0, 1, 0.6705883, 1,
-0.1003216, 1.105744, -0.3716975, 0, 1, 0.6745098, 1,
-0.1003114, -0.7526002, -0.01632519, 0, 1, 0.682353, 1,
-0.09949043, 0.3690447, -1.925388, 0, 1, 0.6862745, 1,
-0.09426205, -1.562353, -2.695821, 0, 1, 0.6941177, 1,
-0.09039196, 0.3113488, 2.187294, 0, 1, 0.7019608, 1,
-0.08774211, 0.05491014, -0.2587178, 0, 1, 0.7058824, 1,
-0.08546922, -1.618352, -1.320059, 0, 1, 0.7137255, 1,
-0.08359987, 0.6603816, 0.6075016, 0, 1, 0.7176471, 1,
-0.08137281, 1.334629, -3.181941, 0, 1, 0.7254902, 1,
-0.08103482, 0.2182655, 0.1482764, 0, 1, 0.7294118, 1,
-0.0760133, 1.041232, 0.395861, 0, 1, 0.7372549, 1,
-0.07526007, -1.09066, -2.464637, 0, 1, 0.7411765, 1,
-0.07309513, 0.427095, -1.447968, 0, 1, 0.7490196, 1,
-0.07072689, 0.02288486, -0.372597, 0, 1, 0.7529412, 1,
-0.06821306, 0.2982138, -1.113099, 0, 1, 0.7607843, 1,
-0.06778214, -0.9673043, -2.736076, 0, 1, 0.7647059, 1,
-0.06698819, 1.3432, 0.1108653, 0, 1, 0.772549, 1,
-0.06521713, -0.08844759, -2.247429, 0, 1, 0.7764706, 1,
-0.06474739, 0.6778469, 0.2069834, 0, 1, 0.7843137, 1,
-0.05932317, -0.8724591, -3.71641, 0, 1, 0.7882353, 1,
-0.05536001, -0.3224007, -3.762477, 0, 1, 0.7960784, 1,
-0.05474598, 0.6509512, -0.4064089, 0, 1, 0.8039216, 1,
-0.05386193, -0.4437521, -3.996752, 0, 1, 0.8078431, 1,
-0.05096967, -0.1355451, -2.811171, 0, 1, 0.8156863, 1,
-0.05044279, 0.2654362, -0.05887657, 0, 1, 0.8196079, 1,
-0.04933477, 0.5262428, -0.7648695, 0, 1, 0.827451, 1,
-0.0489345, -0.01137043, -2.221326, 0, 1, 0.8313726, 1,
-0.0411581, -0.2660486, -4.98466, 0, 1, 0.8392157, 1,
-0.03875651, 1.185328, -0.5905443, 0, 1, 0.8431373, 1,
-0.03703067, -2.18653, -3.171007, 0, 1, 0.8509804, 1,
-0.03223624, 1.380861, -0.8173436, 0, 1, 0.854902, 1,
-0.0306322, 0.5978246, 0.3329414, 0, 1, 0.8627451, 1,
-0.02865303, 0.007503956, -0.4828899, 0, 1, 0.8666667, 1,
-0.02775653, -1.42275, -4.075986, 0, 1, 0.8745098, 1,
-0.02536371, 2.265689, 1.272773, 0, 1, 0.8784314, 1,
-0.02311545, -1.838711, -3.42177, 0, 1, 0.8862745, 1,
-0.01923622, 1.441274, 0.2764345, 0, 1, 0.8901961, 1,
-0.01562943, -0.6891, -4.368008, 0, 1, 0.8980392, 1,
-0.01241178, -1.55289, -3.895244, 0, 1, 0.9058824, 1,
-0.01212785, 0.4533796, -1.50627, 0, 1, 0.9098039, 1,
-0.01012851, 0.3914331, -1.330356, 0, 1, 0.9176471, 1,
-0.009643111, 0.001064647, -2.553488, 0, 1, 0.9215686, 1,
-0.008301875, 1.989406, -0.1380296, 0, 1, 0.9294118, 1,
-0.006890263, -0.1556292, -3.916364, 0, 1, 0.9333333, 1,
-0.003572175, -0.6022938, -3.764508, 0, 1, 0.9411765, 1,
-0.003185487, 0.720479, -0.4559935, 0, 1, 0.945098, 1,
0.001114564, 1.12918, 0.4712211, 0, 1, 0.9529412, 1,
0.003134354, 0.03373956, -1.637854, 0, 1, 0.9568627, 1,
0.003564482, 0.3412792, -0.07169114, 0, 1, 0.9647059, 1,
0.005400775, -0.4113424, 2.05566, 0, 1, 0.9686275, 1,
0.01008814, 1.373194, 0.1462923, 0, 1, 0.9764706, 1,
0.01047535, 0.414414, 0.05659996, 0, 1, 0.9803922, 1,
0.01341476, 0.6339294, 1.668275, 0, 1, 0.9882353, 1,
0.01440863, 0.2140034, 0.9143155, 0, 1, 0.9921569, 1,
0.01482786, 0.7070565, -2.578056, 0, 1, 1, 1,
0.01694714, 0.4028168, 0.9088321, 0, 0.9921569, 1, 1,
0.01978071, -0.6989077, 3.470646, 0, 0.9882353, 1, 1,
0.02628482, 2.11116, 2.10727, 0, 0.9803922, 1, 1,
0.02949936, 0.1085579, -0.1960008, 0, 0.9764706, 1, 1,
0.03175713, 0.2995692, -0.8281934, 0, 0.9686275, 1, 1,
0.03318937, -1.103594, 3.408817, 0, 0.9647059, 1, 1,
0.040427, -0.9193298, 3.106264, 0, 0.9568627, 1, 1,
0.04387166, 0.3431205, 1.072067, 0, 0.9529412, 1, 1,
0.04921151, 0.6865143, -0.08053304, 0, 0.945098, 1, 1,
0.05291866, 0.9761328, 0.6491868, 0, 0.9411765, 1, 1,
0.05472277, -0.2528377, 4.083856, 0, 0.9333333, 1, 1,
0.05566043, -0.08354659, 2.212249, 0, 0.9294118, 1, 1,
0.05812119, 0.3218452, 0.03534919, 0, 0.9215686, 1, 1,
0.05815649, 0.2558552, 0.7221826, 0, 0.9176471, 1, 1,
0.06274115, 1.210117, 1.906575, 0, 0.9098039, 1, 1,
0.06534456, 1.490605, -0.02808355, 0, 0.9058824, 1, 1,
0.07062016, 0.3072737, 0.9281033, 0, 0.8980392, 1, 1,
0.07249162, 0.132612, 0.4010183, 0, 0.8901961, 1, 1,
0.07300973, 0.4176347, 2.238439, 0, 0.8862745, 1, 1,
0.07724306, -1.372813, 2.102769, 0, 0.8784314, 1, 1,
0.0787854, 0.4865143, 1.670457, 0, 0.8745098, 1, 1,
0.07973965, -0.3881215, 3.712911, 0, 0.8666667, 1, 1,
0.08060253, -1.751089, 2.762028, 0, 0.8627451, 1, 1,
0.08102043, 1.686997, -1.299944, 0, 0.854902, 1, 1,
0.08168533, -1.618525, 3.334923, 0, 0.8509804, 1, 1,
0.08422156, 0.5805061, 0.5339358, 0, 0.8431373, 1, 1,
0.08428048, -1.621636, 3.998842, 0, 0.8392157, 1, 1,
0.08752958, 1.994988, -0.781601, 0, 0.8313726, 1, 1,
0.09680645, -0.9044521, 3.343271, 0, 0.827451, 1, 1,
0.0974243, -0.1354833, 1.929896, 0, 0.8196079, 1, 1,
0.1020914, -0.7848423, 3.341052, 0, 0.8156863, 1, 1,
0.1021033, -0.4793152, 2.263643, 0, 0.8078431, 1, 1,
0.1045729, 0.773623, 0.8600468, 0, 0.8039216, 1, 1,
0.1068697, -0.5523362, 2.19821, 0, 0.7960784, 1, 1,
0.1069255, 1.984566, 0.2688945, 0, 0.7882353, 1, 1,
0.1094428, 1.194747, -0.3187081, 0, 0.7843137, 1, 1,
0.1105473, -0.1659391, 3.146319, 0, 0.7764706, 1, 1,
0.1151456, -0.6706151, 3.456794, 0, 0.772549, 1, 1,
0.1197776, 0.1592682, 0.3631687, 0, 0.7647059, 1, 1,
0.121172, -0.08051659, 1.234868, 0, 0.7607843, 1, 1,
0.1218757, 0.7043503, 0.7678264, 0, 0.7529412, 1, 1,
0.1252924, 0.4800843, -0.8771768, 0, 0.7490196, 1, 1,
0.1281464, 0.1421041, 2.13307, 0, 0.7411765, 1, 1,
0.1285914, 1.091392, -0.2594185, 0, 0.7372549, 1, 1,
0.1367314, -0.1891826, 2.312846, 0, 0.7294118, 1, 1,
0.1369848, -0.6817241, 2.666378, 0, 0.7254902, 1, 1,
0.1377655, 1.215708, 1.614807, 0, 0.7176471, 1, 1,
0.1381973, -0.2776573, 3.795235, 0, 0.7137255, 1, 1,
0.1419163, 0.7486518, -0.4050142, 0, 0.7058824, 1, 1,
0.1441671, -1.586489, 3.781065, 0, 0.6980392, 1, 1,
0.1449067, 1.246154, -1.155249, 0, 0.6941177, 1, 1,
0.1495752, 0.55353, 1.019963, 0, 0.6862745, 1, 1,
0.1510441, -1.294633, 1.647518, 0, 0.682353, 1, 1,
0.1562513, 1.819183, -1.205389, 0, 0.6745098, 1, 1,
0.1589078, 0.3529823, 0.3446885, 0, 0.6705883, 1, 1,
0.161422, 0.7627109, -0.04447213, 0, 0.6627451, 1, 1,
0.1620445, 1.604929, 0.4878393, 0, 0.6588235, 1, 1,
0.1640911, 0.1818198, -0.005880036, 0, 0.6509804, 1, 1,
0.1685264, 0.8630881, 0.4215512, 0, 0.6470588, 1, 1,
0.1689454, -1.592787, 2.839646, 0, 0.6392157, 1, 1,
0.1722619, -1.421069, 1.905435, 0, 0.6352941, 1, 1,
0.1743684, 0.8523656, -0.06370135, 0, 0.627451, 1, 1,
0.1748277, -0.2325338, 2.977679, 0, 0.6235294, 1, 1,
0.175849, -0.3355851, 4.095563, 0, 0.6156863, 1, 1,
0.1762241, -0.7937002, 3.087225, 0, 0.6117647, 1, 1,
0.1774613, -1.438116, 2.3795, 0, 0.6039216, 1, 1,
0.1841299, 1.244542, 0.003252364, 0, 0.5960785, 1, 1,
0.1900468, -0.5547134, 2.99456, 0, 0.5921569, 1, 1,
0.1936779, -0.9841594, 2.089337, 0, 0.5843138, 1, 1,
0.1957179, 0.1095213, 0.6780441, 0, 0.5803922, 1, 1,
0.1964246, 0.2967746, -0.009486685, 0, 0.572549, 1, 1,
0.198378, -0.1334703, 0.7777882, 0, 0.5686275, 1, 1,
0.2000279, 1.135654, 2.017283, 0, 0.5607843, 1, 1,
0.2001694, 1.030127, 0.719032, 0, 0.5568628, 1, 1,
0.2029689, -0.9793647, 3.599241, 0, 0.5490196, 1, 1,
0.2081848, 1.453338, 0.005299117, 0, 0.5450981, 1, 1,
0.2084829, -0.7279675, 3.329107, 0, 0.5372549, 1, 1,
0.2165101, 1.169993, -1.809137, 0, 0.5333334, 1, 1,
0.2209393, 1.00317, 0.5553643, 0, 0.5254902, 1, 1,
0.2217908, -1.713159, 1.670227, 0, 0.5215687, 1, 1,
0.2279617, 2.191456, 1.935637, 0, 0.5137255, 1, 1,
0.2289148, 0.9147068, 0.07141496, 0, 0.509804, 1, 1,
0.2322217, 0.6382671, 0.1456543, 0, 0.5019608, 1, 1,
0.2328824, -0.1616732, 0.9788827, 0, 0.4941176, 1, 1,
0.2410406, -0.5231118, 2.323764, 0, 0.4901961, 1, 1,
0.2446392, -0.5502788, 3.91491, 0, 0.4823529, 1, 1,
0.2495728, -1.522418, 2.679969, 0, 0.4784314, 1, 1,
0.249875, -0.45376, 0.8157414, 0, 0.4705882, 1, 1,
0.2500962, 0.561633, 1.045478, 0, 0.4666667, 1, 1,
0.2513732, 0.2611395, 1.842762, 0, 0.4588235, 1, 1,
0.2537197, 0.7563918, 0.9743887, 0, 0.454902, 1, 1,
0.2539106, -0.2479841, 3.567287, 0, 0.4470588, 1, 1,
0.2558172, -0.9681667, 4.055584, 0, 0.4431373, 1, 1,
0.2570251, 1.557979, -0.7419939, 0, 0.4352941, 1, 1,
0.2619594, 0.8139669, 0.05424272, 0, 0.4313726, 1, 1,
0.262819, -0.1646657, 3.487029, 0, 0.4235294, 1, 1,
0.2678051, -0.7540622, 1.803373, 0, 0.4196078, 1, 1,
0.2702163, -0.9631902, 3.906726, 0, 0.4117647, 1, 1,
0.2717758, 0.4021456, 0.8919879, 0, 0.4078431, 1, 1,
0.2765152, -0.02397448, 1.677047, 0, 0.4, 1, 1,
0.2805237, -1.227903, 2.461029, 0, 0.3921569, 1, 1,
0.2806962, -1.566285, 4.077437, 0, 0.3882353, 1, 1,
0.2845113, -0.6049614, 3.261212, 0, 0.3803922, 1, 1,
0.2858648, -0.6630967, 3.826194, 0, 0.3764706, 1, 1,
0.2870979, 1.945917, -2.036677, 0, 0.3686275, 1, 1,
0.2898005, -0.8193943, 2.724461, 0, 0.3647059, 1, 1,
0.290614, 0.9047936, -0.6556762, 0, 0.3568628, 1, 1,
0.2916436, 0.8692616, 0.2602817, 0, 0.3529412, 1, 1,
0.2942277, 0.388073, 0.4316809, 0, 0.345098, 1, 1,
0.2945524, 0.1993577, 1.39208, 0, 0.3411765, 1, 1,
0.3002541, -0.4928186, 1.129523, 0, 0.3333333, 1, 1,
0.3045513, -0.2618509, 2.911121, 0, 0.3294118, 1, 1,
0.305977, -0.6553225, 3.660684, 0, 0.3215686, 1, 1,
0.306528, 0.367969, 2.568565, 0, 0.3176471, 1, 1,
0.3108808, 0.705246, 0.6270483, 0, 0.3098039, 1, 1,
0.3181722, 0.9918901, 0.631506, 0, 0.3058824, 1, 1,
0.3196297, -0.9385686, 1.819222, 0, 0.2980392, 1, 1,
0.3236768, 0.1938581, 1.371809, 0, 0.2901961, 1, 1,
0.3270165, -0.5830055, 2.421563, 0, 0.2862745, 1, 1,
0.3276273, 0.1190378, 1.787005, 0, 0.2784314, 1, 1,
0.3292929, 0.09817666, -0.5329266, 0, 0.2745098, 1, 1,
0.3348702, -0.1026335, 0.7798364, 0, 0.2666667, 1, 1,
0.335321, 1.624101, 0.1170398, 0, 0.2627451, 1, 1,
0.3377416, 0.7632164, -0.868282, 0, 0.254902, 1, 1,
0.3533712, 1.472341, -0.707891, 0, 0.2509804, 1, 1,
0.357569, 0.8224142, -0.7062777, 0, 0.2431373, 1, 1,
0.3580401, -1.058839, -0.4817153, 0, 0.2392157, 1, 1,
0.3586288, -0.9387898, 3.038188, 0, 0.2313726, 1, 1,
0.3650385, -1.381697, 1.927555, 0, 0.227451, 1, 1,
0.3671758, 0.568871, 0.2778657, 0, 0.2196078, 1, 1,
0.3701499, 1.097684, -0.02399757, 0, 0.2156863, 1, 1,
0.3714088, 0.9755344, -2.511591, 0, 0.2078431, 1, 1,
0.3715913, 0.3386754, 2.212434, 0, 0.2039216, 1, 1,
0.3795819, 0.3364819, 0.7955984, 0, 0.1960784, 1, 1,
0.3841493, 0.9226151, 0.6036108, 0, 0.1882353, 1, 1,
0.3849131, 0.3830099, -0.6881078, 0, 0.1843137, 1, 1,
0.3862074, -0.7755188, 1.548525, 0, 0.1764706, 1, 1,
0.3886904, -0.270017, 1.458355, 0, 0.172549, 1, 1,
0.3890238, 0.1898735, 1.66443, 0, 0.1647059, 1, 1,
0.3912192, 0.7120029, -0.8278435, 0, 0.1607843, 1, 1,
0.3917279, 0.9922773, -1.03168, 0, 0.1529412, 1, 1,
0.3939975, -0.3826779, 1.294699, 0, 0.1490196, 1, 1,
0.3946247, 0.4146386, -0.7153021, 0, 0.1411765, 1, 1,
0.4140539, 0.4043459, 2.124732, 0, 0.1372549, 1, 1,
0.4154638, 0.4827228, 1.583286, 0, 0.1294118, 1, 1,
0.4194807, -0.1536999, 1.879756, 0, 0.1254902, 1, 1,
0.4303594, -0.6576653, 3.159685, 0, 0.1176471, 1, 1,
0.43063, 0.3002562, 1.461887, 0, 0.1137255, 1, 1,
0.4322824, 0.8921863, -0.1503896, 0, 0.1058824, 1, 1,
0.4373868, 1.35779, 1.432385, 0, 0.09803922, 1, 1,
0.4409144, 1.133418, 1.960661, 0, 0.09411765, 1, 1,
0.4416071, 0.1477722, 1.00433, 0, 0.08627451, 1, 1,
0.4427744, -1.988999, 3.144614, 0, 0.08235294, 1, 1,
0.44783, -0.634613, 2.711898, 0, 0.07450981, 1, 1,
0.4532144, -0.8079527, 2.364838, 0, 0.07058824, 1, 1,
0.4550664, -0.9116009, 2.875075, 0, 0.0627451, 1, 1,
0.4586099, 0.2193734, 1.189629, 0, 0.05882353, 1, 1,
0.459958, -2.269739, 4.58205, 0, 0.05098039, 1, 1,
0.4604959, -1.107481, 2.373506, 0, 0.04705882, 1, 1,
0.4605308, -0.4064552, 2.291536, 0, 0.03921569, 1, 1,
0.4709285, 1.889734, -1.26755, 0, 0.03529412, 1, 1,
0.4727387, -0.4008683, 2.000804, 0, 0.02745098, 1, 1,
0.4729064, 0.482421, 1.778272, 0, 0.02352941, 1, 1,
0.4765555, 0.3693073, 2.144335, 0, 0.01568628, 1, 1,
0.4820776, -0.1563396, 3.132703, 0, 0.01176471, 1, 1,
0.484765, -0.653707, 2.521439, 0, 0.003921569, 1, 1,
0.4911651, -0.6747261, 1.893655, 0.003921569, 0, 1, 1,
0.4920101, -0.94648, 2.534346, 0.007843138, 0, 1, 1,
0.4931866, -1.560873, 2.423805, 0.01568628, 0, 1, 1,
0.4956038, 1.375347, -2.20471, 0.01960784, 0, 1, 1,
0.4976321, 0.01776022, 2.707499, 0.02745098, 0, 1, 1,
0.5002534, 0.1325809, 1.42403, 0.03137255, 0, 1, 1,
0.5045848, -0.7954179, 3.090996, 0.03921569, 0, 1, 1,
0.5072964, -1.285779, 3.21541, 0.04313726, 0, 1, 1,
0.5078774, 0.4072638, -0.224423, 0.05098039, 0, 1, 1,
0.5103762, -0.5104604, 1.923595, 0.05490196, 0, 1, 1,
0.5145022, -0.3028997, 1.068205, 0.0627451, 0, 1, 1,
0.51574, -1.606659, 3.6675, 0.06666667, 0, 1, 1,
0.5166661, -0.4824277, 3.286616, 0.07450981, 0, 1, 1,
0.5217502, -0.7899458, 4.186505, 0.07843138, 0, 1, 1,
0.5232354, -0.5322844, 2.741705, 0.08627451, 0, 1, 1,
0.5250379, 0.2355837, 1.613432, 0.09019608, 0, 1, 1,
0.525762, 0.1924782, 2.727106, 0.09803922, 0, 1, 1,
0.5266012, -1.638472, 1.697448, 0.1058824, 0, 1, 1,
0.5327229, 1.137726, 0.04364815, 0.1098039, 0, 1, 1,
0.5376166, -1.838271, 4.263426, 0.1176471, 0, 1, 1,
0.5385837, -0.0002633973, 1.647028, 0.1215686, 0, 1, 1,
0.5401989, 0.340619, 1.416767, 0.1294118, 0, 1, 1,
0.5423239, -0.4655837, 3.375824, 0.1333333, 0, 1, 1,
0.5426539, 0.744856, 0.2433121, 0.1411765, 0, 1, 1,
0.5447036, -1.743413, 3.907728, 0.145098, 0, 1, 1,
0.5463518, -1.187423, 2.962798, 0.1529412, 0, 1, 1,
0.5516808, -0.8134474, 0.5040995, 0.1568628, 0, 1, 1,
0.5576004, -0.1206556, 0.5182527, 0.1647059, 0, 1, 1,
0.5578315, 1.979095, 1.341267, 0.1686275, 0, 1, 1,
0.5581513, -0.007828352, 3.484728, 0.1764706, 0, 1, 1,
0.5586085, 0.1506098, 2.521801, 0.1803922, 0, 1, 1,
0.5634328, -0.06641088, 2.445705, 0.1882353, 0, 1, 1,
0.5699522, 0.4304677, 0.9896168, 0.1921569, 0, 1, 1,
0.5740713, 0.7068446, 2.13142, 0.2, 0, 1, 1,
0.5744432, -0.185257, 0.9952634, 0.2078431, 0, 1, 1,
0.5773574, 0.3241449, 1.057337, 0.2117647, 0, 1, 1,
0.5783203, 0.3401993, 1.698449, 0.2196078, 0, 1, 1,
0.5783427, 1.915497, -1.054188, 0.2235294, 0, 1, 1,
0.5818541, -1.481571, 2.867158, 0.2313726, 0, 1, 1,
0.5841925, -0.7432565, 1.90196, 0.2352941, 0, 1, 1,
0.5849075, 0.04038408, 2.18421, 0.2431373, 0, 1, 1,
0.5882939, -0.9779328, 1.555187, 0.2470588, 0, 1, 1,
0.5900854, 1.527653, 0.2403045, 0.254902, 0, 1, 1,
0.590147, 0.3284945, 0.8314159, 0.2588235, 0, 1, 1,
0.5933773, -2.2537, 3.730806, 0.2666667, 0, 1, 1,
0.5939438, 0.9482964, 0.6647389, 0.2705882, 0, 1, 1,
0.6015372, -0.8968793, 0.06099769, 0.2784314, 0, 1, 1,
0.6034685, -1.828655, 3.149822, 0.282353, 0, 1, 1,
0.6068326, -1.793244, 2.30108, 0.2901961, 0, 1, 1,
0.6187952, 1.87249, 0.1026719, 0.2941177, 0, 1, 1,
0.6199923, 0.537275, 0.008517898, 0.3019608, 0, 1, 1,
0.629024, 1.498186, 0.5055154, 0.3098039, 0, 1, 1,
0.6323824, -0.9170408, 3.427823, 0.3137255, 0, 1, 1,
0.6329624, -3.026849, 2.93029, 0.3215686, 0, 1, 1,
0.6352053, -1.25556, 3.194698, 0.3254902, 0, 1, 1,
0.6382564, 0.7648134, 1.762722, 0.3333333, 0, 1, 1,
0.6388605, -0.3381958, 3.287618, 0.3372549, 0, 1, 1,
0.6393745, -1.478938, 2.3174, 0.345098, 0, 1, 1,
0.6422798, 0.9120818, -0.5768092, 0.3490196, 0, 1, 1,
0.6557021, 2.401284, 1.829118, 0.3568628, 0, 1, 1,
0.6622165, 1.261409, -1.138387, 0.3607843, 0, 1, 1,
0.6641051, 1.166953, 1.474957, 0.3686275, 0, 1, 1,
0.6652804, -0.9977447, 4.274143, 0.372549, 0, 1, 1,
0.6672109, 0.1744944, 1.302119, 0.3803922, 0, 1, 1,
0.668422, -0.1841513, 3.164794, 0.3843137, 0, 1, 1,
0.673451, 0.27875, 1.044757, 0.3921569, 0, 1, 1,
0.6845943, -1.561649, 2.666005, 0.3960784, 0, 1, 1,
0.6907551, 1.370862, 0.5230224, 0.4039216, 0, 1, 1,
0.695437, -0.8782054, 5.033549, 0.4117647, 0, 1, 1,
0.7027991, 0.4251094, 0.7947811, 0.4156863, 0, 1, 1,
0.7032832, -1.244628, 1.406833, 0.4235294, 0, 1, 1,
0.7100727, -1.201326, 3.55114, 0.427451, 0, 1, 1,
0.7101988, 1.800273, 0.8268998, 0.4352941, 0, 1, 1,
0.7147062, 1.502678, 0.8757862, 0.4392157, 0, 1, 1,
0.7169985, 1.378849, -1.377367, 0.4470588, 0, 1, 1,
0.7185127, -0.06562981, 1.891878, 0.4509804, 0, 1, 1,
0.7200118, -0.4911915, 0.6103026, 0.4588235, 0, 1, 1,
0.7231308, 1.579762, -1.611784, 0.4627451, 0, 1, 1,
0.7282996, -0.7058105, 2.644511, 0.4705882, 0, 1, 1,
0.7290177, -0.03282391, 1.199201, 0.4745098, 0, 1, 1,
0.7311576, -0.4051526, 1.681033, 0.4823529, 0, 1, 1,
0.7337674, 0.2472072, -0.5739499, 0.4862745, 0, 1, 1,
0.7351454, -0.5930017, 2.324244, 0.4941176, 0, 1, 1,
0.738027, -2.29707, 3.35848, 0.5019608, 0, 1, 1,
0.7396958, -0.3804831, 3.512005, 0.5058824, 0, 1, 1,
0.7426913, 0.1436084, 0.8265759, 0.5137255, 0, 1, 1,
0.7451242, -0.7391682, 3.298901, 0.5176471, 0, 1, 1,
0.7454242, 0.04000628, 0.6839652, 0.5254902, 0, 1, 1,
0.7519776, -0.4745162, 1.688101, 0.5294118, 0, 1, 1,
0.75393, -2.634807, 2.360579, 0.5372549, 0, 1, 1,
0.7542168, -0.7219189, 3.907022, 0.5411765, 0, 1, 1,
0.7594555, -0.4085224, 0.4530366, 0.5490196, 0, 1, 1,
0.762821, 0.4409579, 1.093001, 0.5529412, 0, 1, 1,
0.7646574, -0.2156484, 1.599788, 0.5607843, 0, 1, 1,
0.7663432, 1.507224, 1.468332, 0.5647059, 0, 1, 1,
0.7680814, -0.447735, 4.03164, 0.572549, 0, 1, 1,
0.7708014, 0.09522031, 2.045865, 0.5764706, 0, 1, 1,
0.7712299, -1.287113, 2.915351, 0.5843138, 0, 1, 1,
0.773016, 0.3823674, -0.05139402, 0.5882353, 0, 1, 1,
0.7738861, 1.778031, -0.543551, 0.5960785, 0, 1, 1,
0.7790861, 0.05159464, 0.3589877, 0.6039216, 0, 1, 1,
0.7833863, 0.29041, 1.469902, 0.6078432, 0, 1, 1,
0.7842209, -0.5427938, 2.483853, 0.6156863, 0, 1, 1,
0.7849529, 0.2718224, 0.9525515, 0.6196079, 0, 1, 1,
0.7978495, 1.461971, 0.02113358, 0.627451, 0, 1, 1,
0.7978919, -0.717199, 1.978625, 0.6313726, 0, 1, 1,
0.801591, -1.727558, 4.490681, 0.6392157, 0, 1, 1,
0.8019971, 1.28043, 0.2343078, 0.6431373, 0, 1, 1,
0.8074068, -0.05397087, 1.912867, 0.6509804, 0, 1, 1,
0.811018, 0.5814476, 1.636467, 0.654902, 0, 1, 1,
0.8165573, 0.4561788, -0.2117718, 0.6627451, 0, 1, 1,
0.8217816, 0.9855261, -0.01337873, 0.6666667, 0, 1, 1,
0.8252218, 1.287717, -1.020091, 0.6745098, 0, 1, 1,
0.8254205, -1.163573, 1.230758, 0.6784314, 0, 1, 1,
0.8258022, 1.710727, -0.9176775, 0.6862745, 0, 1, 1,
0.8275527, -0.4310807, 0.7869162, 0.6901961, 0, 1, 1,
0.8290489, -1.526732, 2.052791, 0.6980392, 0, 1, 1,
0.8318701, -0.4687478, 2.725173, 0.7058824, 0, 1, 1,
0.8404295, 1.75029, 0.4385835, 0.7098039, 0, 1, 1,
0.8469524, -0.4502072, 1.417091, 0.7176471, 0, 1, 1,
0.8486782, 0.6772783, 0.1923324, 0.7215686, 0, 1, 1,
0.8516814, 1.494111, -1.046153, 0.7294118, 0, 1, 1,
0.854596, -1.904607, 3.549351, 0.7333333, 0, 1, 1,
0.8548775, -0.1690509, 3.529878, 0.7411765, 0, 1, 1,
0.8601374, 0.7631474, 0.6346481, 0.7450981, 0, 1, 1,
0.8619184, -0.2006788, 1.549457, 0.7529412, 0, 1, 1,
0.8648176, -1.076486, 1.561514, 0.7568628, 0, 1, 1,
0.8697594, -2.857281, 2.096663, 0.7647059, 0, 1, 1,
0.8698462, -0.5753819, 1.550072, 0.7686275, 0, 1, 1,
0.8708175, 1.058337, 0.4197835, 0.7764706, 0, 1, 1,
0.8710882, 0.1028751, 0.7465802, 0.7803922, 0, 1, 1,
0.8751031, 0.2735727, 0.632948, 0.7882353, 0, 1, 1,
0.8837098, 0.4304866, -0.3725997, 0.7921569, 0, 1, 1,
0.8844346, 0.02370313, 2.779258, 0.8, 0, 1, 1,
0.8853009, 0.9722167, -0.9001813, 0.8078431, 0, 1, 1,
0.8890178, -0.3543004, -0.4153981, 0.8117647, 0, 1, 1,
0.8916417, -1.697133, 0.1804748, 0.8196079, 0, 1, 1,
0.9025338, 0.9342517, 0.6931573, 0.8235294, 0, 1, 1,
0.9039333, 0.4369251, 0.3580489, 0.8313726, 0, 1, 1,
0.9040774, 0.3287154, 1.577657, 0.8352941, 0, 1, 1,
0.9066762, -1.009682, 1.562232, 0.8431373, 0, 1, 1,
0.9101924, 1.040475, -0.05354464, 0.8470588, 0, 1, 1,
0.9121703, 2.80322, 0.001346911, 0.854902, 0, 1, 1,
0.9229998, -1.102687, 0.853334, 0.8588235, 0, 1, 1,
0.9230313, -0.3443361, 1.926661, 0.8666667, 0, 1, 1,
0.9266502, 0.3235033, 3.273463, 0.8705882, 0, 1, 1,
0.9316815, -0.8391798, 2.32661, 0.8784314, 0, 1, 1,
0.9337557, -0.07141234, 0.8498136, 0.8823529, 0, 1, 1,
0.9339146, -0.4832197, 0.6608173, 0.8901961, 0, 1, 1,
0.9376654, 0.7640018, 3.63493, 0.8941177, 0, 1, 1,
0.9390802, 1.796765, 2.14197, 0.9019608, 0, 1, 1,
0.9410322, 0.5265479, 1.241447, 0.9098039, 0, 1, 1,
0.9415724, 1.629913, 1.524494, 0.9137255, 0, 1, 1,
0.9427799, -0.7467417, 2.131918, 0.9215686, 0, 1, 1,
0.9477636, -1.386153, 1.706724, 0.9254902, 0, 1, 1,
0.9519177, -1.935114, 1.990511, 0.9333333, 0, 1, 1,
0.9537653, -0.8684631, 2.203047, 0.9372549, 0, 1, 1,
0.9550256, -1.567163, 1.461891, 0.945098, 0, 1, 1,
0.9603117, 1.123862, 1.208438, 0.9490196, 0, 1, 1,
0.9621018, 0.7548233, -0.5104465, 0.9568627, 0, 1, 1,
0.9746154, -0.9288237, 0.608047, 0.9607843, 0, 1, 1,
0.9791505, 0.314748, 0.6967857, 0.9686275, 0, 1, 1,
0.9840961, -0.1546925, 1.652115, 0.972549, 0, 1, 1,
0.9871268, -0.8584259, 1.895659, 0.9803922, 0, 1, 1,
0.9970646, 1.640255, 0.2860578, 0.9843137, 0, 1, 1,
1.006131, 0.5020967, 1.4893, 0.9921569, 0, 1, 1,
1.00946, 2.315869, 0.8019096, 0.9960784, 0, 1, 1,
1.012691, 1.834266, -0.7269564, 1, 0, 0.9960784, 1,
1.015104, 0.8116531, 1.560178, 1, 0, 0.9882353, 1,
1.015189, -1.299855, 2.745017, 1, 0, 0.9843137, 1,
1.0216, -0.1838627, 1.831889, 1, 0, 0.9764706, 1,
1.02998, 0.9681955, 0.2618566, 1, 0, 0.972549, 1,
1.030859, -1.533393, 1.233326, 1, 0, 0.9647059, 1,
1.031163, -0.1607285, -0.3582155, 1, 0, 0.9607843, 1,
1.034214, -0.7070925, 2.653422, 1, 0, 0.9529412, 1,
1.038649, 0.118214, 1.847591, 1, 0, 0.9490196, 1,
1.041406, -0.1240292, 1.149057, 1, 0, 0.9411765, 1,
1.043702, -1.466399, 4.428509, 1, 0, 0.9372549, 1,
1.045012, -0.1215915, 2.952598, 1, 0, 0.9294118, 1,
1.047815, -0.1438318, 3.146432, 1, 0, 0.9254902, 1,
1.048047, -0.9233173, 1.189595, 1, 0, 0.9176471, 1,
1.052359, -0.7735927, 0.6416262, 1, 0, 0.9137255, 1,
1.054969, 0.07842916, 0.1916748, 1, 0, 0.9058824, 1,
1.055821, 0.3967594, -0.4193866, 1, 0, 0.9019608, 1,
1.06717, 1.126029, -0.6886718, 1, 0, 0.8941177, 1,
1.069772, 0.6761102, 0.7178081, 1, 0, 0.8862745, 1,
1.07083, 0.4498719, 0.9248664, 1, 0, 0.8823529, 1,
1.075547, -0.3160786, 2.944969, 1, 0, 0.8745098, 1,
1.079938, 0.2033868, 1.662448, 1, 0, 0.8705882, 1,
1.081912, 1.490303, 2.350836, 1, 0, 0.8627451, 1,
1.082885, -1.830806, 1.385361, 1, 0, 0.8588235, 1,
1.087997, 0.9070391, 2.192832, 1, 0, 0.8509804, 1,
1.095961, -0.8759577, 2.620585, 1, 0, 0.8470588, 1,
1.096833, -0.5922177, 0.4973091, 1, 0, 0.8392157, 1,
1.102793, -0.1646555, 1.352422, 1, 0, 0.8352941, 1,
1.119661, 1.07031, 1.753929, 1, 0, 0.827451, 1,
1.119748, -1.337984, 1.14584, 1, 0, 0.8235294, 1,
1.124383, 0.1963942, 1.285883, 1, 0, 0.8156863, 1,
1.125018, 2.061483, 0.2180582, 1, 0, 0.8117647, 1,
1.133177, -0.2969028, 2.233556, 1, 0, 0.8039216, 1,
1.137281, 0.03393387, 0.5830472, 1, 0, 0.7960784, 1,
1.146106, 0.3393897, -0.8884016, 1, 0, 0.7921569, 1,
1.147464, 0.544499, 1.776465, 1, 0, 0.7843137, 1,
1.150229, 1.89436, 1.70911, 1, 0, 0.7803922, 1,
1.156747, -0.4093306, 0.3958929, 1, 0, 0.772549, 1,
1.164085, -0.5961547, 2.496919, 1, 0, 0.7686275, 1,
1.172657, -0.2167714, 0.9762473, 1, 0, 0.7607843, 1,
1.177046, -0.0677577, 1.68549, 1, 0, 0.7568628, 1,
1.185349, 1.529188, 1.573621, 1, 0, 0.7490196, 1,
1.193539, -0.3490524, 1.212682, 1, 0, 0.7450981, 1,
1.195022, -1.038168, 3.92761, 1, 0, 0.7372549, 1,
1.20361, 0.8689892, 1.90475, 1, 0, 0.7333333, 1,
1.205826, 0.01118065, -0.1392013, 1, 0, 0.7254902, 1,
1.207045, -1.804854, 2.809091, 1, 0, 0.7215686, 1,
1.209699, -0.9230682, 0.4452439, 1, 0, 0.7137255, 1,
1.216251, -0.07767863, 2.145209, 1, 0, 0.7098039, 1,
1.216453, -0.6742522, 3.431956, 1, 0, 0.7019608, 1,
1.217755, 0.1366026, 0.2947287, 1, 0, 0.6941177, 1,
1.221273, 0.7073828, -1.06829, 1, 0, 0.6901961, 1,
1.226511, 0.2053271, 2.081416, 1, 0, 0.682353, 1,
1.227093, 0.8284222, -0.3427621, 1, 0, 0.6784314, 1,
1.230347, -0.2942636, 2.253411, 1, 0, 0.6705883, 1,
1.233969, -0.4153266, 2.010455, 1, 0, 0.6666667, 1,
1.262269, -0.03394391, 0.865181, 1, 0, 0.6588235, 1,
1.262829, -1.03058, 0.6898993, 1, 0, 0.654902, 1,
1.266419, 0.3643645, -0.4850125, 1, 0, 0.6470588, 1,
1.27174, -0.6365878, 1.830841, 1, 0, 0.6431373, 1,
1.278735, -0.07900619, 0.1882974, 1, 0, 0.6352941, 1,
1.281063, -0.7358832, 1.842236, 1, 0, 0.6313726, 1,
1.281661, 1.590341, 0.9678594, 1, 0, 0.6235294, 1,
1.301508, -1.667506, -0.9030777, 1, 0, 0.6196079, 1,
1.306215, 0.7708752, 1.403275, 1, 0, 0.6117647, 1,
1.307542, 0.4406429, 1.797777, 1, 0, 0.6078432, 1,
1.320571, 0.6168952, 0.3724702, 1, 0, 0.6, 1,
1.323037, -0.3069429, 0.9899709, 1, 0, 0.5921569, 1,
1.327625, -0.3654282, -1.187292, 1, 0, 0.5882353, 1,
1.335133, 0.1697827, 0.728167, 1, 0, 0.5803922, 1,
1.352158, 0.9396123, 0.4564753, 1, 0, 0.5764706, 1,
1.352668, -0.4113683, 0.9362915, 1, 0, 0.5686275, 1,
1.356904, -0.6570185, 3.062449, 1, 0, 0.5647059, 1,
1.361046, 0.06977183, 0.5527813, 1, 0, 0.5568628, 1,
1.362453, 0.4715627, 0.1332027, 1, 0, 0.5529412, 1,
1.3648, 0.8763477, 2.502234, 1, 0, 0.5450981, 1,
1.370497, -0.1478954, 3.022798, 1, 0, 0.5411765, 1,
1.370692, 0.6466945, 1.203881, 1, 0, 0.5333334, 1,
1.373678, -1.865176, 1.29785, 1, 0, 0.5294118, 1,
1.373762, 0.7766026, 0.2519966, 1, 0, 0.5215687, 1,
1.38662, 1.03281, 2.332662, 1, 0, 0.5176471, 1,
1.393626, 1.833082, 1.352598, 1, 0, 0.509804, 1,
1.394286, 0.4435116, 1.997577, 1, 0, 0.5058824, 1,
1.405966, -1.095813, 3.233173, 1, 0, 0.4980392, 1,
1.406738, -1.084816, 1.630164, 1, 0, 0.4901961, 1,
1.420828, 1.838246, 1.337562, 1, 0, 0.4862745, 1,
1.423279, 0.1791039, 0.6016498, 1, 0, 0.4784314, 1,
1.423946, 0.5169895, 1.844761, 1, 0, 0.4745098, 1,
1.43095, -2.646446, 3.842512, 1, 0, 0.4666667, 1,
1.441486, -0.8016304, 3.528047, 1, 0, 0.4627451, 1,
1.442941, 0.3774432, 0.5081196, 1, 0, 0.454902, 1,
1.446426, 0.4750394, 0.5926276, 1, 0, 0.4509804, 1,
1.447746, 0.59855, 0.9557989, 1, 0, 0.4431373, 1,
1.450144, -0.2367869, 0.5657781, 1, 0, 0.4392157, 1,
1.452566, -0.8705491, 2.806525, 1, 0, 0.4313726, 1,
1.461854, -0.7087984, 2.447252, 1, 0, 0.427451, 1,
1.464838, -0.5125337, 2.32495, 1, 0, 0.4196078, 1,
1.464846, 1.018993, 1.478361, 1, 0, 0.4156863, 1,
1.467476, -1.041374, 2.807462, 1, 0, 0.4078431, 1,
1.47105, -0.9698554, 1.866863, 1, 0, 0.4039216, 1,
1.474326, -0.8022722, 1.415371, 1, 0, 0.3960784, 1,
1.477667, -1.202364, 0.4731705, 1, 0, 0.3882353, 1,
1.488265, 0.1637694, 1.763865, 1, 0, 0.3843137, 1,
1.490306, -1.415961, 3.217672, 1, 0, 0.3764706, 1,
1.495586, -0.256813, 1.155378, 1, 0, 0.372549, 1,
1.505728, -1.220648, 3.568375, 1, 0, 0.3647059, 1,
1.518366, 1.899565, 1.487008, 1, 0, 0.3607843, 1,
1.518413, 1.111775, 0.01512951, 1, 0, 0.3529412, 1,
1.523177, 0.7178636, 1.729703, 1, 0, 0.3490196, 1,
1.529714, -1.239229, 3.937951, 1, 0, 0.3411765, 1,
1.545423, 0.1845658, 1.948056, 1, 0, 0.3372549, 1,
1.554312, -0.5109631, 2.199558, 1, 0, 0.3294118, 1,
1.562862, -0.7660196, 2.554157, 1, 0, 0.3254902, 1,
1.56386, 0.7396089, 1.163566, 1, 0, 0.3176471, 1,
1.564697, -0.8659805, 3.882013, 1, 0, 0.3137255, 1,
1.567349, 1.44418, 0.8558796, 1, 0, 0.3058824, 1,
1.573112, 0.4181884, 1.045506, 1, 0, 0.2980392, 1,
1.580583, -0.2140953, 2.32897, 1, 0, 0.2941177, 1,
1.585542, -0.4556945, 3.156727, 1, 0, 0.2862745, 1,
1.592054, 0.5309474, -0.6747199, 1, 0, 0.282353, 1,
1.607081, 0.2680102, 0.9118234, 1, 0, 0.2745098, 1,
1.64183, -1.705078, 2.723359, 1, 0, 0.2705882, 1,
1.659054, 0.5971915, 1.50961, 1, 0, 0.2627451, 1,
1.665831, 0.2218795, 1.935924, 1, 0, 0.2588235, 1,
1.674511, 0.3290015, 0.5341572, 1, 0, 0.2509804, 1,
1.704429, 0.06137539, 0.7671746, 1, 0, 0.2470588, 1,
1.719578, -1.176974, 2.763997, 1, 0, 0.2392157, 1,
1.720444, -0.8266877, 1.116766, 1, 0, 0.2352941, 1,
1.754116, 0.4029556, -1.373219, 1, 0, 0.227451, 1,
1.758255, -1.280657, 2.391117, 1, 0, 0.2235294, 1,
1.76845, -0.4237729, 1.6773, 1, 0, 0.2156863, 1,
1.776291, 1.260293, 1.316306, 1, 0, 0.2117647, 1,
1.820581, -0.5299312, 2.888824, 1, 0, 0.2039216, 1,
1.826492, 1.115056, 1.386657, 1, 0, 0.1960784, 1,
1.858816, 0.4910852, 1.533095, 1, 0, 0.1921569, 1,
1.861537, -0.5007389, 1.704578, 1, 0, 0.1843137, 1,
1.862344, 1.017912, 2.679058, 1, 0, 0.1803922, 1,
1.87104, 0.2970897, 2.779852, 1, 0, 0.172549, 1,
1.888308, -1.784252, 3.832224, 1, 0, 0.1686275, 1,
1.890686, -1.013585, 2.189509, 1, 0, 0.1607843, 1,
1.898859, 2.118118, 2.959291, 1, 0, 0.1568628, 1,
1.907034, -1.554757, 0.1171663, 1, 0, 0.1490196, 1,
1.909292, -1.078247, 1.792695, 1, 0, 0.145098, 1,
1.910795, -1.530898, 2.476571, 1, 0, 0.1372549, 1,
1.982653, 1.757338, 0.8874367, 1, 0, 0.1333333, 1,
1.98817, 1.114302, 1.760316, 1, 0, 0.1254902, 1,
1.988359, 0.1400015, 1.619699, 1, 0, 0.1215686, 1,
2.006626, -1.45464, 1.203201, 1, 0, 0.1137255, 1,
2.019488, -1.883559, 1.401769, 1, 0, 0.1098039, 1,
2.032516, -1.490667, 2.66765, 1, 0, 0.1019608, 1,
2.066934, 1.53238, 2.167539, 1, 0, 0.09411765, 1,
2.07009, -0.9733713, 2.577685, 1, 0, 0.09019608, 1,
2.085378, 0.7566552, 1.486941, 1, 0, 0.08235294, 1,
2.099009, -0.1230382, 3.290691, 1, 0, 0.07843138, 1,
2.099396, 0.3317771, -0.8867236, 1, 0, 0.07058824, 1,
2.116506, 0.1107746, 1.754329, 1, 0, 0.06666667, 1,
2.124373, -0.1789573, 2.019861, 1, 0, 0.05882353, 1,
2.146749, -1.676891, 3.717571, 1, 0, 0.05490196, 1,
2.179563, 1.355887, 1.756647, 1, 0, 0.04705882, 1,
2.191582, 0.9019367, 0.4236261, 1, 0, 0.04313726, 1,
2.246107, 1.627802, 0.4696221, 1, 0, 0.03529412, 1,
2.253896, -0.06088055, 1.14299, 1, 0, 0.03137255, 1,
2.282339, 1.24243, 2.633616, 1, 0, 0.02352941, 1,
2.464193, 3.340604, 1.329174, 1, 0, 0.01960784, 1,
2.507769, 1.336044, 2.003817, 1, 0, 0.01176471, 1,
3.130127, 0.4491043, 1.483608, 1, 0, 0.007843138, 1
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
-0.2489136, -4.106132, -7.309668, 0, -0.5, 0.5, 0.5,
-0.2489136, -4.106132, -7.309668, 1, -0.5, 0.5, 0.5,
-0.2489136, -4.106132, -7.309668, 1, 1.5, 0.5, 0.5,
-0.2489136, -4.106132, -7.309668, 0, 1.5, 0.5, 0.5
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
-4.773448, 0.1568775, -7.309668, 0, -0.5, 0.5, 0.5,
-4.773448, 0.1568775, -7.309668, 1, -0.5, 0.5, 0.5,
-4.773448, 0.1568775, -7.309668, 1, 1.5, 0.5, 0.5,
-4.773448, 0.1568775, -7.309668, 0, 1.5, 0.5, 0.5
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
-4.773448, -4.106132, -0.2435853, 0, -0.5, 0.5, 0.5,
-4.773448, -4.106132, -0.2435853, 1, -0.5, 0.5, 0.5,
-4.773448, -4.106132, -0.2435853, 1, 1.5, 0.5, 0.5,
-4.773448, -4.106132, -0.2435853, 0, 1.5, 0.5, 0.5
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
-3, -3.12236, -5.679034,
3, -3.12236, -5.679034,
-3, -3.12236, -5.679034,
-3, -3.286323, -5.950806,
-2, -3.12236, -5.679034,
-2, -3.286323, -5.950806,
-1, -3.12236, -5.679034,
-1, -3.286323, -5.950806,
0, -3.12236, -5.679034,
0, -3.286323, -5.950806,
1, -3.12236, -5.679034,
1, -3.286323, -5.950806,
2, -3.12236, -5.679034,
2, -3.286323, -5.950806,
3, -3.12236, -5.679034,
3, -3.286323, -5.950806
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
-3, -3.614246, -6.494351, 0, -0.5, 0.5, 0.5,
-3, -3.614246, -6.494351, 1, -0.5, 0.5, 0.5,
-3, -3.614246, -6.494351, 1, 1.5, 0.5, 0.5,
-3, -3.614246, -6.494351, 0, 1.5, 0.5, 0.5,
-2, -3.614246, -6.494351, 0, -0.5, 0.5, 0.5,
-2, -3.614246, -6.494351, 1, -0.5, 0.5, 0.5,
-2, -3.614246, -6.494351, 1, 1.5, 0.5, 0.5,
-2, -3.614246, -6.494351, 0, 1.5, 0.5, 0.5,
-1, -3.614246, -6.494351, 0, -0.5, 0.5, 0.5,
-1, -3.614246, -6.494351, 1, -0.5, 0.5, 0.5,
-1, -3.614246, -6.494351, 1, 1.5, 0.5, 0.5,
-1, -3.614246, -6.494351, 0, 1.5, 0.5, 0.5,
0, -3.614246, -6.494351, 0, -0.5, 0.5, 0.5,
0, -3.614246, -6.494351, 1, -0.5, 0.5, 0.5,
0, -3.614246, -6.494351, 1, 1.5, 0.5, 0.5,
0, -3.614246, -6.494351, 0, 1.5, 0.5, 0.5,
1, -3.614246, -6.494351, 0, -0.5, 0.5, 0.5,
1, -3.614246, -6.494351, 1, -0.5, 0.5, 0.5,
1, -3.614246, -6.494351, 1, 1.5, 0.5, 0.5,
1, -3.614246, -6.494351, 0, 1.5, 0.5, 0.5,
2, -3.614246, -6.494351, 0, -0.5, 0.5, 0.5,
2, -3.614246, -6.494351, 1, -0.5, 0.5, 0.5,
2, -3.614246, -6.494351, 1, 1.5, 0.5, 0.5,
2, -3.614246, -6.494351, 0, 1.5, 0.5, 0.5,
3, -3.614246, -6.494351, 0, -0.5, 0.5, 0.5,
3, -3.614246, -6.494351, 1, -0.5, 0.5, 0.5,
3, -3.614246, -6.494351, 1, 1.5, 0.5, 0.5,
3, -3.614246, -6.494351, 0, 1.5, 0.5, 0.5
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
-3.729325, -3, -5.679034,
-3.729325, 3, -5.679034,
-3.729325, -3, -5.679034,
-3.903346, -3, -5.950806,
-3.729325, -2, -5.679034,
-3.903346, -2, -5.950806,
-3.729325, -1, -5.679034,
-3.903346, -1, -5.950806,
-3.729325, 0, -5.679034,
-3.903346, 0, -5.950806,
-3.729325, 1, -5.679034,
-3.903346, 1, -5.950806,
-3.729325, 2, -5.679034,
-3.903346, 2, -5.950806,
-3.729325, 3, -5.679034,
-3.903346, 3, -5.950806
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
-4.251387, -3, -6.494351, 0, -0.5, 0.5, 0.5,
-4.251387, -3, -6.494351, 1, -0.5, 0.5, 0.5,
-4.251387, -3, -6.494351, 1, 1.5, 0.5, 0.5,
-4.251387, -3, -6.494351, 0, 1.5, 0.5, 0.5,
-4.251387, -2, -6.494351, 0, -0.5, 0.5, 0.5,
-4.251387, -2, -6.494351, 1, -0.5, 0.5, 0.5,
-4.251387, -2, -6.494351, 1, 1.5, 0.5, 0.5,
-4.251387, -2, -6.494351, 0, 1.5, 0.5, 0.5,
-4.251387, -1, -6.494351, 0, -0.5, 0.5, 0.5,
-4.251387, -1, -6.494351, 1, -0.5, 0.5, 0.5,
-4.251387, -1, -6.494351, 1, 1.5, 0.5, 0.5,
-4.251387, -1, -6.494351, 0, 1.5, 0.5, 0.5,
-4.251387, 0, -6.494351, 0, -0.5, 0.5, 0.5,
-4.251387, 0, -6.494351, 1, -0.5, 0.5, 0.5,
-4.251387, 0, -6.494351, 1, 1.5, 0.5, 0.5,
-4.251387, 0, -6.494351, 0, 1.5, 0.5, 0.5,
-4.251387, 1, -6.494351, 0, -0.5, 0.5, 0.5,
-4.251387, 1, -6.494351, 1, -0.5, 0.5, 0.5,
-4.251387, 1, -6.494351, 1, 1.5, 0.5, 0.5,
-4.251387, 1, -6.494351, 0, 1.5, 0.5, 0.5,
-4.251387, 2, -6.494351, 0, -0.5, 0.5, 0.5,
-4.251387, 2, -6.494351, 1, -0.5, 0.5, 0.5,
-4.251387, 2, -6.494351, 1, 1.5, 0.5, 0.5,
-4.251387, 2, -6.494351, 0, 1.5, 0.5, 0.5,
-4.251387, 3, -6.494351, 0, -0.5, 0.5, 0.5,
-4.251387, 3, -6.494351, 1, -0.5, 0.5, 0.5,
-4.251387, 3, -6.494351, 1, 1.5, 0.5, 0.5,
-4.251387, 3, -6.494351, 0, 1.5, 0.5, 0.5
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
-3.729325, -3.12236, -4,
-3.729325, -3.12236, 4,
-3.729325, -3.12236, -4,
-3.903346, -3.286323, -4,
-3.729325, -3.12236, -2,
-3.903346, -3.286323, -2,
-3.729325, -3.12236, 0,
-3.903346, -3.286323, 0,
-3.729325, -3.12236, 2,
-3.903346, -3.286323, 2,
-3.729325, -3.12236, 4,
-3.903346, -3.286323, 4
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
-4.251387, -3.614246, -4, 0, -0.5, 0.5, 0.5,
-4.251387, -3.614246, -4, 1, -0.5, 0.5, 0.5,
-4.251387, -3.614246, -4, 1, 1.5, 0.5, 0.5,
-4.251387, -3.614246, -4, 0, 1.5, 0.5, 0.5,
-4.251387, -3.614246, -2, 0, -0.5, 0.5, 0.5,
-4.251387, -3.614246, -2, 1, -0.5, 0.5, 0.5,
-4.251387, -3.614246, -2, 1, 1.5, 0.5, 0.5,
-4.251387, -3.614246, -2, 0, 1.5, 0.5, 0.5,
-4.251387, -3.614246, 0, 0, -0.5, 0.5, 0.5,
-4.251387, -3.614246, 0, 1, -0.5, 0.5, 0.5,
-4.251387, -3.614246, 0, 1, 1.5, 0.5, 0.5,
-4.251387, -3.614246, 0, 0, 1.5, 0.5, 0.5,
-4.251387, -3.614246, 2, 0, -0.5, 0.5, 0.5,
-4.251387, -3.614246, 2, 1, -0.5, 0.5, 0.5,
-4.251387, -3.614246, 2, 1, 1.5, 0.5, 0.5,
-4.251387, -3.614246, 2, 0, 1.5, 0.5, 0.5,
-4.251387, -3.614246, 4, 0, -0.5, 0.5, 0.5,
-4.251387, -3.614246, 4, 1, -0.5, 0.5, 0.5,
-4.251387, -3.614246, 4, 1, 1.5, 0.5, 0.5,
-4.251387, -3.614246, 4, 0, 1.5, 0.5, 0.5
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
-3.729325, -3.12236, -5.679034,
-3.729325, 3.436116, -5.679034,
-3.729325, -3.12236, 5.191863,
-3.729325, 3.436116, 5.191863,
-3.729325, -3.12236, -5.679034,
-3.729325, -3.12236, 5.191863,
-3.729325, 3.436116, -5.679034,
-3.729325, 3.436116, 5.191863,
-3.729325, -3.12236, -5.679034,
3.231498, -3.12236, -5.679034,
-3.729325, -3.12236, 5.191863,
3.231498, -3.12236, 5.191863,
-3.729325, 3.436116, -5.679034,
3.231498, 3.436116, -5.679034,
-3.729325, 3.436116, 5.191863,
3.231498, 3.436116, 5.191863,
3.231498, -3.12236, -5.679034,
3.231498, 3.436116, -5.679034,
3.231498, -3.12236, 5.191863,
3.231498, 3.436116, 5.191863,
3.231498, -3.12236, -5.679034,
3.231498, -3.12236, 5.191863,
3.231498, 3.436116, -5.679034,
3.231498, 3.436116, 5.191863
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
var radius = 7.731535;
var distance = 34.39847;
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
mvMatrix.translate( 0.2489136, -0.1568775, 0.2435853 );
mvMatrix.scale( 1.200934, 1.274608, 0.7689786 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.39847);
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
Metalaxyl<-read.table("Metalaxyl.xyz")
```

```
## Error in read.table("Metalaxyl.xyz"): no lines available in input
```

```r
x<-Metalaxyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Metalaxyl' not found
```

```r
y<-Metalaxyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Metalaxyl' not found
```

```r
z<-Metalaxyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Metalaxyl' not found
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
-3.627954, -0.7504572, -1.49004, 0, 0, 1, 1, 1,
-2.877554, 1.912653, -0.4804317, 1, 0, 0, 1, 1,
-2.795156, -0.3957515, -2.396489, 1, 0, 0, 1, 1,
-2.77852, 0.0896677, -1.0156, 1, 0, 0, 1, 1,
-2.748042, -1.205374, -1.988337, 1, 0, 0, 1, 1,
-2.671653, -1.391491, -1.323415, 1, 0, 0, 1, 1,
-2.367423, -0.06226005, -0.6968797, 0, 0, 0, 1, 1,
-2.364643, 1.16613, -1.091667, 0, 0, 0, 1, 1,
-2.364192, 0.5925812, -0.8263717, 0, 0, 0, 1, 1,
-2.334523, -0.2094791, -0.7879885, 0, 0, 0, 1, 1,
-2.323738, 0.1303888, -1.367202, 0, 0, 0, 1, 1,
-2.293055, 1.009218, -2.334359, 0, 0, 0, 1, 1,
-2.237134, 1.502979, -1.057679, 0, 0, 0, 1, 1,
-2.219208, -0.2387407, -1.209224, 1, 1, 1, 1, 1,
-2.202374, 0.5362338, -1.473186, 1, 1, 1, 1, 1,
-2.199838, 1.493391, -0.3051647, 1, 1, 1, 1, 1,
-2.165454, 0.670772, -1.1306, 1, 1, 1, 1, 1,
-2.153102, 0.06693178, -1.76123, 1, 1, 1, 1, 1,
-2.118134, 0.3488248, -1.395766, 1, 1, 1, 1, 1,
-2.114863, -0.1143019, -0.7461175, 1, 1, 1, 1, 1,
-2.106717, -0.4590514, -1.254748, 1, 1, 1, 1, 1,
-2.096557, -0.6665163, -0.4613086, 1, 1, 1, 1, 1,
-2.058427, 0.4176363, -0.719838, 1, 1, 1, 1, 1,
-2.050328, -0.8261289, -4.071433, 1, 1, 1, 1, 1,
-2.048204, -0.04161123, -1.206342, 1, 1, 1, 1, 1,
-2.041358, -0.8164567, -0.9942813, 1, 1, 1, 1, 1,
-2.034391, 0.3557627, -0.5018297, 1, 1, 1, 1, 1,
-2.032757, 0.4449861, -2.575561, 1, 1, 1, 1, 1,
-2.004214, -0.4964788, -3.438781, 0, 0, 1, 1, 1,
-1.993843, 0.6358491, -1.565426, 1, 0, 0, 1, 1,
-1.990397, -1.209466, -1.594247, 1, 0, 0, 1, 1,
-1.954791, -0.1784687, -2.364912, 1, 0, 0, 1, 1,
-1.9279, 0.6487635, -0.2781316, 1, 0, 0, 1, 1,
-1.924679, 1.414278, -0.6565406, 1, 0, 0, 1, 1,
-1.91989, 1.055536, -0.3647727, 0, 0, 0, 1, 1,
-1.915879, -0.4823565, -2.022124, 0, 0, 0, 1, 1,
-1.865385, 0.5137586, -0.1663645, 0, 0, 0, 1, 1,
-1.861129, 0.5732287, -0.375879, 0, 0, 0, 1, 1,
-1.855087, 1.608345, -0.3227766, 0, 0, 0, 1, 1,
-1.85317, -0.8172644, -2.970011, 0, 0, 0, 1, 1,
-1.845311, 0.5156762, -1.600913, 0, 0, 0, 1, 1,
-1.842415, 0.6647964, -1.502699, 1, 1, 1, 1, 1,
-1.824856, 0.4818212, -0.8226849, 1, 1, 1, 1, 1,
-1.817795, -0.9604867, -1.634963, 1, 1, 1, 1, 1,
-1.772842, 0.09806326, -2.386648, 1, 1, 1, 1, 1,
-1.768121, 1.353548, 0.7171654, 1, 1, 1, 1, 1,
-1.764095, 0.3953972, -0.9023477, 1, 1, 1, 1, 1,
-1.762022, 0.5868582, -1.497299, 1, 1, 1, 1, 1,
-1.761983, -0.4539716, -0.4751542, 1, 1, 1, 1, 1,
-1.759463, -2.263606, -2.234869, 1, 1, 1, 1, 1,
-1.750521, -0.9851249, -2.91944, 1, 1, 1, 1, 1,
-1.738419, -0.2013262, -0.6474935, 1, 1, 1, 1, 1,
-1.722875, -0.9141447, -1.317957, 1, 1, 1, 1, 1,
-1.711164, 1.129871, -1.309058, 1, 1, 1, 1, 1,
-1.699612, 1.361738, -1.199729, 1, 1, 1, 1, 1,
-1.681902, -0.6890816, -4.547128, 1, 1, 1, 1, 1,
-1.670421, 1.148884, -0.7522535, 0, 0, 1, 1, 1,
-1.661055, -0.2747687, -1.335916, 1, 0, 0, 1, 1,
-1.592435, 0.7544599, -3.066201, 1, 0, 0, 1, 1,
-1.574199, -0.5860075, -1.717282, 1, 0, 0, 1, 1,
-1.560691, -0.09129136, -1.545139, 1, 0, 0, 1, 1,
-1.55673, -0.4035371, -1.51219, 1, 0, 0, 1, 1,
-1.552508, 0.01409746, -1.034087, 0, 0, 0, 1, 1,
-1.546016, 2.795389, 0.2030192, 0, 0, 0, 1, 1,
-1.526239, 1.437391, -1.3153, 0, 0, 0, 1, 1,
-1.520389, -0.2713516, -0.6027566, 0, 0, 0, 1, 1,
-1.51974, -1.336435, -2.735096, 0, 0, 0, 1, 1,
-1.508546, -1.523193, -1.541247, 0, 0, 0, 1, 1,
-1.505993, -0.1011599, -2.947596, 0, 0, 0, 1, 1,
-1.492166, 0.01690418, -2.020052, 1, 1, 1, 1, 1,
-1.489633, 0.3027704, -1.881376, 1, 1, 1, 1, 1,
-1.488028, 0.6665609, -0.4480525, 1, 1, 1, 1, 1,
-1.484134, 0.785486, -0.8537179, 1, 1, 1, 1, 1,
-1.481565, -1.057711, -1.911321, 1, 1, 1, 1, 1,
-1.466778, -0.6822541, -3.432178, 1, 1, 1, 1, 1,
-1.466725, -0.6930087, -1.360905, 1, 1, 1, 1, 1,
-1.454472, -0.286782, -2.054145, 1, 1, 1, 1, 1,
-1.446857, -0.887525, -3.769953, 1, 1, 1, 1, 1,
-1.437851, -1.211614, -1.513801, 1, 1, 1, 1, 1,
-1.421372, -1.67503, -2.29809, 1, 1, 1, 1, 1,
-1.413536, 0.4596493, -1.515686, 1, 1, 1, 1, 1,
-1.402051, -0.3141529, -2.234294, 1, 1, 1, 1, 1,
-1.398916, -1.054023, -3.148954, 1, 1, 1, 1, 1,
-1.383468, 0.08246201, -2.478337, 1, 1, 1, 1, 1,
-1.38012, 1.177978, -1.308209, 0, 0, 1, 1, 1,
-1.378133, 0.2187334, -1.279847, 1, 0, 0, 1, 1,
-1.374457, 0.6450885, 0.7157544, 1, 0, 0, 1, 1,
-1.368507, 0.3255286, -2.823459, 1, 0, 0, 1, 1,
-1.366988, -1.247874, -3.313042, 1, 0, 0, 1, 1,
-1.366087, 0.8786234, -0.7655343, 1, 0, 0, 1, 1,
-1.359576, 0.6296755, -3.173489, 0, 0, 0, 1, 1,
-1.356802, -0.6617611, -4.093292, 0, 0, 0, 1, 1,
-1.356555, 0.6298034, -1.39614, 0, 0, 0, 1, 1,
-1.336603, 1.817301, -2.885763, 0, 0, 0, 1, 1,
-1.322549, 0.3318809, -2.441928, 0, 0, 0, 1, 1,
-1.321659, 0.9554275, 0.4038093, 0, 0, 0, 1, 1,
-1.316845, 0.1334202, -3.147193, 0, 0, 0, 1, 1,
-1.316137, -0.5497611, -3.373946, 1, 1, 1, 1, 1,
-1.314303, -0.3267507, -1.55824, 1, 1, 1, 1, 1,
-1.285412, 0.4958471, -0.8176814, 1, 1, 1, 1, 1,
-1.273257, -0.1757088, -1.887632, 1, 1, 1, 1, 1,
-1.266031, 0.4116842, -2.585874, 1, 1, 1, 1, 1,
-1.265912, -0.6005465, -2.687843, 1, 1, 1, 1, 1,
-1.264757, -1.464448, -4.566819, 1, 1, 1, 1, 1,
-1.263996, -1.217634, -2.949775, 1, 1, 1, 1, 1,
-1.260759, -1.816055, -2.154013, 1, 1, 1, 1, 1,
-1.257474, -1.814229, -1.68873, 1, 1, 1, 1, 1,
-1.255255, -0.3797034, -1.216068, 1, 1, 1, 1, 1,
-1.233079, -0.820317, 0.2670345, 1, 1, 1, 1, 1,
-1.23254, -1.10963, -3.729858, 1, 1, 1, 1, 1,
-1.203223, -0.1643135, -0.8777779, 1, 1, 1, 1, 1,
-1.197185, -0.8485452, 0.2265508, 1, 1, 1, 1, 1,
-1.18782, 1.045892, -1.750483, 0, 0, 1, 1, 1,
-1.185834, 0.009685476, -1.079285, 1, 0, 0, 1, 1,
-1.185773, -0.251339, -1.747544, 1, 0, 0, 1, 1,
-1.1841, -1.536075, -3.140924, 1, 0, 0, 1, 1,
-1.180843, 0.4469107, -2.991109, 1, 0, 0, 1, 1,
-1.178092, -0.3959881, -2.852051, 1, 0, 0, 1, 1,
-1.176413, -0.157429, -1.54926, 0, 0, 0, 1, 1,
-1.169287, -1.024134, -2.507174, 0, 0, 0, 1, 1,
-1.168457, -1.142677, -1.951689, 0, 0, 0, 1, 1,
-1.155457, 1.540797, 0.7253743, 0, 0, 0, 1, 1,
-1.15158, 0.4034637, -0.1071471, 0, 0, 0, 1, 1,
-1.1513, 1.182847, -1.903466, 0, 0, 0, 1, 1,
-1.149989, -1.392536, -2.906051, 0, 0, 0, 1, 1,
-1.144667, 0.4355156, -0.7572109, 1, 1, 1, 1, 1,
-1.141482, -0.5827653, -1.936779, 1, 1, 1, 1, 1,
-1.134038, -0.355579, -3.249256, 1, 1, 1, 1, 1,
-1.130697, -0.07902249, -2.354518, 1, 1, 1, 1, 1,
-1.120609, -0.7222165, -2.089458, 1, 1, 1, 1, 1,
-1.115182, -0.5512466, -1.328179, 1, 1, 1, 1, 1,
-1.113452, 0.07777678, -2.007517, 1, 1, 1, 1, 1,
-1.107496, 1.076686, -0.606791, 1, 1, 1, 1, 1,
-1.106784, -1.031621, -0.989079, 1, 1, 1, 1, 1,
-1.102075, -0.8357843, -1.700164, 1, 1, 1, 1, 1,
-1.094918, -0.2178388, -0.125145, 1, 1, 1, 1, 1,
-1.093192, -0.7519338, -1.726907, 1, 1, 1, 1, 1,
-1.091072, -0.2570164, -1.864561, 1, 1, 1, 1, 1,
-1.090068, -0.1813015, -1.633447, 1, 1, 1, 1, 1,
-1.085972, 0.2599858, -2.113854, 1, 1, 1, 1, 1,
-1.083544, -0.4511535, -1.116642, 0, 0, 1, 1, 1,
-1.082323, 1.734413, -1.741587, 1, 0, 0, 1, 1,
-1.080295, 0.9475866, 2.359469, 1, 0, 0, 1, 1,
-1.071938, -2.085083, -3.843987, 1, 0, 0, 1, 1,
-1.070809, 0.07354721, -2.183306, 1, 0, 0, 1, 1,
-1.064913, -2.064503, -1.373272, 1, 0, 0, 1, 1,
-1.064209, -0.8644288, -2.883535, 0, 0, 0, 1, 1,
-1.059619, -0.241963, -1.892834, 0, 0, 0, 1, 1,
-1.057047, -0.2943294, -1.743237, 0, 0, 0, 1, 1,
-1.049233, -1.04151, -2.656002, 0, 0, 0, 1, 1,
-1.045278, -2.682524, -2.56839, 0, 0, 0, 1, 1,
-1.044543, -0.5789523, -4.153113, 0, 0, 0, 1, 1,
-1.039387, 0.1970014, -1.516853, 0, 0, 0, 1, 1,
-1.038221, 0.2543931, -1.074932, 1, 1, 1, 1, 1,
-1.036328, 0.01426522, -0.991965, 1, 1, 1, 1, 1,
-1.031379, -0.7302414, -1.722864, 1, 1, 1, 1, 1,
-1.028388, 0.7624972, -1.935044, 1, 1, 1, 1, 1,
-1.019403, -1.233201, -2.026524, 1, 1, 1, 1, 1,
-1.018508, -0.8762577, -3.901052, 1, 1, 1, 1, 1,
-1.016458, -0.1293843, -0.7446746, 1, 1, 1, 1, 1,
-1.009241, 0.1865375, -1.656637, 1, 1, 1, 1, 1,
-1.000344, -1.377361, -4.786981, 1, 1, 1, 1, 1,
-0.9897006, -0.1520113, -2.818184, 1, 1, 1, 1, 1,
-0.9881924, -1.31776, -1.82124, 1, 1, 1, 1, 1,
-0.988101, -0.3065621, -2.160075, 1, 1, 1, 1, 1,
-0.9849133, -0.5859947, -1.74098, 1, 1, 1, 1, 1,
-0.9812182, 0.256612, -2.548178, 1, 1, 1, 1, 1,
-0.9782672, -1.447489, -2.784592, 1, 1, 1, 1, 1,
-0.9742289, -0.8207117, -1.620789, 0, 0, 1, 1, 1,
-0.9733354, 0.9265444, -1.06812, 1, 0, 0, 1, 1,
-0.9718487, 0.302998, -1.50127, 1, 0, 0, 1, 1,
-0.9717686, 1.208919, -0.9813346, 1, 0, 0, 1, 1,
-0.9706037, 0.2351393, -1.613913, 1, 0, 0, 1, 1,
-0.9685144, -0.7276593, -3.958479, 1, 0, 0, 1, 1,
-0.9675585, 2.211467, 0.9901282, 0, 0, 0, 1, 1,
-0.9593363, -0.4006654, -3.052236, 0, 0, 0, 1, 1,
-0.9505593, -0.2646397, -1.50819, 0, 0, 0, 1, 1,
-0.9486992, -0.3626225, -1.734081, 0, 0, 0, 1, 1,
-0.9484619, 0.239099, -0.8804565, 0, 0, 0, 1, 1,
-0.9405503, 0.9905714, -1.14345, 0, 0, 0, 1, 1,
-0.9397792, 1.452699, 0.5876951, 0, 0, 0, 1, 1,
-0.939321, -1.306176, -4.203621, 1, 1, 1, 1, 1,
-0.9334638, -1.162668, -2.089763, 1, 1, 1, 1, 1,
-0.9300466, 0.07415278, -1.505776, 1, 1, 1, 1, 1,
-0.9240006, -0.05549793, -2.318442, 1, 1, 1, 1, 1,
-0.9233623, -0.5907141, -3.452786, 1, 1, 1, 1, 1,
-0.9189005, -0.4544298, -1.110237, 1, 1, 1, 1, 1,
-0.9153343, 0.7669032, -1.348433, 1, 1, 1, 1, 1,
-0.9112346, -1.290711, -2.282051, 1, 1, 1, 1, 1,
-0.9097345, -1.692181, -1.420928, 1, 1, 1, 1, 1,
-0.9079303, 1.365896, 3.285191, 1, 1, 1, 1, 1,
-0.9054086, -1.036803, -2.908638, 1, 1, 1, 1, 1,
-0.9014398, 1.236997, -0.917849, 1, 1, 1, 1, 1,
-0.8973833, -0.8428283, -0.2672413, 1, 1, 1, 1, 1,
-0.8895209, -0.246534, -1.646351, 1, 1, 1, 1, 1,
-0.8886554, 0.5463936, -0.3337988, 1, 1, 1, 1, 1,
-0.880137, 1.073016, 0.2790118, 0, 0, 1, 1, 1,
-0.8789927, 0.4272325, -0.03083714, 1, 0, 0, 1, 1,
-0.8779781, 0.238397, -1.233328, 1, 0, 0, 1, 1,
-0.8776065, 0.4541159, 0.4529635, 1, 0, 0, 1, 1,
-0.8655382, 1.426202, -2.005911, 1, 0, 0, 1, 1,
-0.8643869, -0.6418692, -2.762893, 1, 0, 0, 1, 1,
-0.8631976, -0.3956217, -0.860708, 0, 0, 0, 1, 1,
-0.8523188, 0.07353122, -0.9218376, 0, 0, 0, 1, 1,
-0.8494843, 0.2645638, -2.999288, 0, 0, 0, 1, 1,
-0.8475351, 0.6815261, 0.1368469, 0, 0, 0, 1, 1,
-0.831727, -0.912361, -3.428581, 0, 0, 0, 1, 1,
-0.8305932, -0.3283455, -3.214678, 0, 0, 0, 1, 1,
-0.8266264, 1.179369, -1.216397, 0, 0, 0, 1, 1,
-0.8259523, 0.8759785, -1.055102, 1, 1, 1, 1, 1,
-0.8208067, -0.3571579, -0.9680113, 1, 1, 1, 1, 1,
-0.8148329, -2.178385, -1.470281, 1, 1, 1, 1, 1,
-0.8031892, 0.9709798, -0.4801439, 1, 1, 1, 1, 1,
-0.8014316, -0.722716, -2.088843, 1, 1, 1, 1, 1,
-0.7928584, 0.4595893, -1.625054, 1, 1, 1, 1, 1,
-0.7874817, 0.3244334, 0.2761156, 1, 1, 1, 1, 1,
-0.7871798, 0.1934886, -1.700806, 1, 1, 1, 1, 1,
-0.7845289, 0.2829803, -0.7306427, 1, 1, 1, 1, 1,
-0.7764629, 0.876293, -2.629435, 1, 1, 1, 1, 1,
-0.7657055, -1.366479, -5.35255, 1, 1, 1, 1, 1,
-0.7591326, -0.3102326, -1.097754, 1, 1, 1, 1, 1,
-0.7585722, 0.1727467, -1.186785, 1, 1, 1, 1, 1,
-0.7575848, -0.2915652, -1.556652, 1, 1, 1, 1, 1,
-0.754369, -0.1593197, -1.367511, 1, 1, 1, 1, 1,
-0.7514177, -0.6731549, -1.959849, 0, 0, 1, 1, 1,
-0.7427856, 0.3220376, -0.6875126, 1, 0, 0, 1, 1,
-0.7413137, -0.8301632, -3.787322, 1, 0, 0, 1, 1,
-0.7381284, -0.02066611, -1.144726, 1, 0, 0, 1, 1,
-0.7374892, 1.734075, -0.9584724, 1, 0, 0, 1, 1,
-0.7367622, -0.3372468, -2.290225, 1, 0, 0, 1, 1,
-0.7364671, 0.4052238, 0.09409662, 0, 0, 0, 1, 1,
-0.7357448, -2.550049, -3.086952, 0, 0, 0, 1, 1,
-0.7353005, 0.320921, -1.158725, 0, 0, 0, 1, 1,
-0.7309619, 0.05178386, -1.531063, 0, 0, 0, 1, 1,
-0.7288495, -0.3050325, -1.786238, 0, 0, 0, 1, 1,
-0.7237014, -0.3865887, -1.769413, 0, 0, 0, 1, 1,
-0.7236329, 1.182082, -1.287151, 0, 0, 0, 1, 1,
-0.7190126, -0.4669741, -2.666735, 1, 1, 1, 1, 1,
-0.7171957, -0.3987555, -2.741186, 1, 1, 1, 1, 1,
-0.7133446, -1.788307, -3.953193, 1, 1, 1, 1, 1,
-0.7130616, -0.4126067, -1.827152, 1, 1, 1, 1, 1,
-0.7092894, -0.4288233, -1.789889, 1, 1, 1, 1, 1,
-0.7077705, -1.49957, -2.356918, 1, 1, 1, 1, 1,
-0.704071, 3.330894, -1.250749, 1, 1, 1, 1, 1,
-0.7018044, 0.480487, -1.418508, 1, 1, 1, 1, 1,
-0.6996009, 0.01975099, -2.540521, 1, 1, 1, 1, 1,
-0.6945658, 1.238231, 1.0054, 1, 1, 1, 1, 1,
-0.6943542, 0.7262612, -1.186498, 1, 1, 1, 1, 1,
-0.6904577, -1.091245, -1.746304, 1, 1, 1, 1, 1,
-0.6895218, 0.2341619, -1.638959, 1, 1, 1, 1, 1,
-0.6862376, 1.149924, 1.217816, 1, 1, 1, 1, 1,
-0.6858528, -0.4136771, -1.479026, 1, 1, 1, 1, 1,
-0.683374, -0.5948534, -1.89363, 0, 0, 1, 1, 1,
-0.6821886, -0.5819971, -1.962517, 1, 0, 0, 1, 1,
-0.6807902, 0.3459028, -2.656942, 1, 0, 0, 1, 1,
-0.6775631, -0.5360701, -1.394795, 1, 0, 0, 1, 1,
-0.6710513, 1.578421, -0.1906192, 1, 0, 0, 1, 1,
-0.664284, 1.256179, -1.595941, 1, 0, 0, 1, 1,
-0.660248, -0.4033844, -3.224723, 0, 0, 0, 1, 1,
-0.6532925, 0.08095197, -2.962043, 0, 0, 0, 1, 1,
-0.6461504, 0.8741207, 0.3181829, 0, 0, 0, 1, 1,
-0.6460597, 0.0508055, 0.7715197, 0, 0, 0, 1, 1,
-0.6429664, 0.4415636, -0.5147731, 0, 0, 0, 1, 1,
-0.6427065, -1.183361, -1.315028, 0, 0, 0, 1, 1,
-0.6361734, -0.262884, -3.092218, 0, 0, 0, 1, 1,
-0.6273606, 0.1597634, -1.752408, 1, 1, 1, 1, 1,
-0.6246963, -0.9752252, -4.294141, 1, 1, 1, 1, 1,
-0.6237602, 1.077931, -0.467453, 1, 1, 1, 1, 1,
-0.621314, -1.231521, -2.777195, 1, 1, 1, 1, 1,
-0.6211607, -1.074769, -1.078038, 1, 1, 1, 1, 1,
-0.6110857, -0.3259713, -2.4436, 1, 1, 1, 1, 1,
-0.6062216, 0.5695403, -0.2608006, 1, 1, 1, 1, 1,
-0.6059447, -1.124405, -1.649287, 1, 1, 1, 1, 1,
-0.594565, 0.122755, -0.3284882, 1, 1, 1, 1, 1,
-0.5928239, 0.1321924, -0.9015319, 1, 1, 1, 1, 1,
-0.5913816, -0.5278735, -1.277201, 1, 1, 1, 1, 1,
-0.5885538, 0.3272228, -1.417362, 1, 1, 1, 1, 1,
-0.5850477, -0.8292673, -1.748718, 1, 1, 1, 1, 1,
-0.5832885, 2.136268, -0.7760398, 1, 1, 1, 1, 1,
-0.5823016, -1.608097, -1.293423, 1, 1, 1, 1, 1,
-0.5747174, -0.2872311, -1.694497, 0, 0, 1, 1, 1,
-0.5728869, -0.5588176, -3.551573, 1, 0, 0, 1, 1,
-0.569168, -0.4199934, -3.061219, 1, 0, 0, 1, 1,
-0.5636951, -0.7600847, -2.241026, 1, 0, 0, 1, 1,
-0.5630841, -1.448885, -2.640779, 1, 0, 0, 1, 1,
-0.5630839, 0.6316163, -1.249818, 1, 0, 0, 1, 1,
-0.5624731, -1.215373, -3.390115, 0, 0, 0, 1, 1,
-0.5607543, 0.4643638, 0.6616711, 0, 0, 0, 1, 1,
-0.559602, -1.831059, -2.842403, 0, 0, 0, 1, 1,
-0.5574602, 1.261909, -2.339788, 0, 0, 0, 1, 1,
-0.5572196, -0.1083901, -2.274282, 0, 0, 0, 1, 1,
-0.5547385, 1.450553, -0.8408409, 0, 0, 0, 1, 1,
-0.5547203, 1.435212, -0.2951414, 0, 0, 0, 1, 1,
-0.5436258, 0.6342756, 0.8015884, 1, 1, 1, 1, 1,
-0.5411771, 1.077729, 1.663295, 1, 1, 1, 1, 1,
-0.5377541, -1.507851, -2.825955, 1, 1, 1, 1, 1,
-0.5256589, -1.472584, -1.511353, 1, 1, 1, 1, 1,
-0.5237194, 0.9033642, -2.15977, 1, 1, 1, 1, 1,
-0.5225972, 1.315005, 0.08638907, 1, 1, 1, 1, 1,
-0.520029, -0.9002242, -1.401754, 1, 1, 1, 1, 1,
-0.5175989, -0.1523352, -2.209438, 1, 1, 1, 1, 1,
-0.5158911, 0.2704442, -1.597255, 1, 1, 1, 1, 1,
-0.5144507, -1.123788, -1.587889, 1, 1, 1, 1, 1,
-0.5113404, -1.193946, -4.183126, 1, 1, 1, 1, 1,
-0.5111448, 0.180982, -2.977117, 1, 1, 1, 1, 1,
-0.5029886, 0.089037, -0.9264759, 1, 1, 1, 1, 1,
-0.4970126, -1.597517, -3.165399, 1, 1, 1, 1, 1,
-0.4956741, 1.484811, -1.374476, 1, 1, 1, 1, 1,
-0.4922295, -1.641946, -3.476097, 0, 0, 1, 1, 1,
-0.4912372, -1.295547, -3.734393, 1, 0, 0, 1, 1,
-0.4902069, 0.3052881, -2.098602, 1, 0, 0, 1, 1,
-0.4872777, 0.1106317, -2.493025, 1, 0, 0, 1, 1,
-0.4835826, 1.05113, 0.4763918, 1, 0, 0, 1, 1,
-0.4820119, -0.8472284, -4.077965, 1, 0, 0, 1, 1,
-0.4753781, -1.821063, -4.265643, 0, 0, 0, 1, 1,
-0.4753643, 1.407529, 0.6589994, 0, 0, 0, 1, 1,
-0.4640976, -1.147684, -1.683161, 0, 0, 0, 1, 1,
-0.4634451, -0.128636, -4.170573, 0, 0, 0, 1, 1,
-0.4631036, -0.3365571, -0.8659263, 0, 0, 0, 1, 1,
-0.4610909, -0.6795052, -2.878709, 0, 0, 0, 1, 1,
-0.4515248, 0.8150635, -1.516088, 0, 0, 0, 1, 1,
-0.4386838, 0.1631145, -2.244125, 1, 1, 1, 1, 1,
-0.4300078, 0.5005148, -2.179461, 1, 1, 1, 1, 1,
-0.4285684, 0.5603142, -0.4242901, 1, 1, 1, 1, 1,
-0.4273201, 1.776979, -1.914821, 1, 1, 1, 1, 1,
-0.4166198, 0.2271993, -0.5673286, 1, 1, 1, 1, 1,
-0.4160116, -0.7895333, -1.093851, 1, 1, 1, 1, 1,
-0.4134232, -0.5434976, -3.42254, 1, 1, 1, 1, 1,
-0.409909, -0.2931818, -2.103503, 1, 1, 1, 1, 1,
-0.4094532, -0.04806294, -1.365492, 1, 1, 1, 1, 1,
-0.4083919, -0.3073226, -2.365569, 1, 1, 1, 1, 1,
-0.4063438, -2.174546, -2.155346, 1, 1, 1, 1, 1,
-0.4057712, -2.195789, -5.206956, 1, 1, 1, 1, 1,
-0.4040056, -1.476886, -2.18091, 1, 1, 1, 1, 1,
-0.3980922, -1.696791, -1.736581, 1, 1, 1, 1, 1,
-0.3946715, -0.02604144, -1.181517, 1, 1, 1, 1, 1,
-0.3937393, 0.310242, -0.9827458, 0, 0, 1, 1, 1,
-0.3903128, 0.5480803, -0.839991, 1, 0, 0, 1, 1,
-0.3829883, -0.06591186, -1.414396, 1, 0, 0, 1, 1,
-0.3801009, -0.1135391, -1.068651, 1, 0, 0, 1, 1,
-0.3792443, -0.3230069, -2.920101, 1, 0, 0, 1, 1,
-0.3733748, -2.0656, -1.821838, 1, 0, 0, 1, 1,
-0.373029, 0.5298791, -1.663064, 0, 0, 0, 1, 1,
-0.3700383, -0.9124405, -4.479065, 0, 0, 0, 1, 1,
-0.3689079, 0.05646475, -1.892214, 0, 0, 0, 1, 1,
-0.367051, 0.1910413, 0.8935504, 0, 0, 0, 1, 1,
-0.3662268, 0.1136272, -2.139778, 0, 0, 0, 1, 1,
-0.3661019, -0.1477289, -1.570082, 0, 0, 0, 1, 1,
-0.3639669, 1.247006, 0.1381991, 0, 0, 0, 1, 1,
-0.3635564, 0.3395013, 1.621452, 1, 1, 1, 1, 1,
-0.3575927, 2.041859, -1.148278, 1, 1, 1, 1, 1,
-0.3570744, 0.2470168, 0.1251172, 1, 1, 1, 1, 1,
-0.357058, 0.225766, -2.094055, 1, 1, 1, 1, 1,
-0.3558142, 0.3329608, -1.180795, 1, 1, 1, 1, 1,
-0.3548577, -0.2484917, -3.348413, 1, 1, 1, 1, 1,
-0.3542718, 0.502701, -0.4477863, 1, 1, 1, 1, 1,
-0.3539534, 0.5349265, -0.3242977, 1, 1, 1, 1, 1,
-0.3490666, 0.3404693, -1.161059, 1, 1, 1, 1, 1,
-0.3455854, -0.7160344, -2.214528, 1, 1, 1, 1, 1,
-0.3365906, -1.549583, -2.028654, 1, 1, 1, 1, 1,
-0.3360798, 2.053178, -0.4232131, 1, 1, 1, 1, 1,
-0.3333122, 0.04942004, -0.2415618, 1, 1, 1, 1, 1,
-0.3292834, -0.776547, -2.937222, 1, 1, 1, 1, 1,
-0.3272448, 0.4231118, -1.094348, 1, 1, 1, 1, 1,
-0.3268857, 0.696265, 0.3149688, 0, 0, 1, 1, 1,
-0.3265341, -0.2008127, -1.469659, 1, 0, 0, 1, 1,
-0.3172231, -0.2660317, -2.730936, 1, 0, 0, 1, 1,
-0.3142982, 1.069605, -0.5555271, 1, 0, 0, 1, 1,
-0.3122983, -0.4822834, -1.310185, 1, 0, 0, 1, 1,
-0.309326, -0.6755333, -2.563442, 1, 0, 0, 1, 1,
-0.2980551, 1.323651, -1.121881, 0, 0, 0, 1, 1,
-0.2972642, 0.4328093, -1.870139, 0, 0, 0, 1, 1,
-0.295331, -1.09978, -2.111328, 0, 0, 0, 1, 1,
-0.2917159, -0.3898634, -1.492339, 0, 0, 0, 1, 1,
-0.2875435, -1.241016, -2.677936, 0, 0, 0, 1, 1,
-0.2860177, 1.868093, -0.3026624, 0, 0, 0, 1, 1,
-0.2857234, 0.1708152, -0.01384145, 0, 0, 0, 1, 1,
-0.2847849, 2.194207, 0.7091554, 1, 1, 1, 1, 1,
-0.2837248, 0.06635682, -2.714072, 1, 1, 1, 1, 1,
-0.2811979, 0.5024116, -1.26898, 1, 1, 1, 1, 1,
-0.2807966, -0.2781303, -1.177237, 1, 1, 1, 1, 1,
-0.2782237, 0.3797971, 1.265005, 1, 1, 1, 1, 1,
-0.2748477, -2.226943, -5.52072, 1, 1, 1, 1, 1,
-0.2736192, -0.6481045, -3.857924, 1, 1, 1, 1, 1,
-0.2701166, 0.5454532, 0.4997485, 1, 1, 1, 1, 1,
-0.2661027, -1.08299, -2.495754, 1, 1, 1, 1, 1,
-0.2659255, -0.3528753, -2.501948, 1, 1, 1, 1, 1,
-0.2649248, -0.3448606, -3.13007, 1, 1, 1, 1, 1,
-0.2637108, 1.003581, -0.352388, 1, 1, 1, 1, 1,
-0.2593949, 0.3954699, -1.321893, 1, 1, 1, 1, 1,
-0.2587143, -0.9544781, -4.340827, 1, 1, 1, 1, 1,
-0.252541, 0.9416149, -1.036209, 1, 1, 1, 1, 1,
-0.252444, 0.01488631, -3.567777, 0, 0, 1, 1, 1,
-0.2521445, 0.1216902, 0.3017331, 1, 0, 0, 1, 1,
-0.2513925, -0.7360333, -2.677561, 1, 0, 0, 1, 1,
-0.2489152, 0.3065371, -2.0368, 1, 0, 0, 1, 1,
-0.2437336, 0.1549412, -1.972685, 1, 0, 0, 1, 1,
-0.2412093, 0.7008922, -0.9195125, 1, 0, 0, 1, 1,
-0.2394048, -0.6156582, -3.033249, 0, 0, 0, 1, 1,
-0.2371014, 0.5940008, 0.09769809, 0, 0, 0, 1, 1,
-0.2345805, 0.4119788, 0.02306238, 0, 0, 0, 1, 1,
-0.2341491, -0.1244686, -3.148582, 0, 0, 0, 1, 1,
-0.2301174, 0.7641879, -0.02611979, 0, 0, 0, 1, 1,
-0.2268788, -1.276431, -1.951902, 0, 0, 0, 1, 1,
-0.2203241, -1.259396, -2.477792, 0, 0, 0, 1, 1,
-0.2137478, 0.9780439, -1.753329, 1, 1, 1, 1, 1,
-0.2136565, -2.591753, -2.340944, 1, 1, 1, 1, 1,
-0.2091522, -0.6357237, -2.250768, 1, 1, 1, 1, 1,
-0.2023955, -0.4055136, -3.373471, 1, 1, 1, 1, 1,
-0.2021851, 2.179629, -0.7430038, 1, 1, 1, 1, 1,
-0.1965858, -0.5852572, -3.89365, 1, 1, 1, 1, 1,
-0.1915894, -0.6261243, -2.505992, 1, 1, 1, 1, 1,
-0.1903423, -0.5784481, -2.299442, 1, 1, 1, 1, 1,
-0.1880989, 0.7909408, 2.031908, 1, 1, 1, 1, 1,
-0.1871117, -0.4605846, -4.311382, 1, 1, 1, 1, 1,
-0.1868701, -0.7468864, -2.509504, 1, 1, 1, 1, 1,
-0.1830178, -0.2919227, -4.474039, 1, 1, 1, 1, 1,
-0.1766499, 0.2027106, -1.097235, 1, 1, 1, 1, 1,
-0.1754386, -0.7678367, -2.869555, 1, 1, 1, 1, 1,
-0.1752744, -0.238135, -2.000911, 1, 1, 1, 1, 1,
-0.1679363, 0.03385304, -1.685427, 0, 0, 1, 1, 1,
-0.1643696, -1.422639, -1.048674, 1, 0, 0, 1, 1,
-0.1626431, 0.863195, -0.942179, 1, 0, 0, 1, 1,
-0.1592842, -0.7555466, -2.342529, 1, 0, 0, 1, 1,
-0.1570684, 1.476329, -0.9106142, 1, 0, 0, 1, 1,
-0.1554471, -0.4235545, -3.508448, 1, 0, 0, 1, 1,
-0.150258, -1.717003, -3.1063, 0, 0, 0, 1, 1,
-0.1497869, -0.1683782, -0.1762742, 0, 0, 0, 1, 1,
-0.1466079, -0.4170879, -1.82184, 0, 0, 0, 1, 1,
-0.1442581, 0.8975533, 0.4852213, 0, 0, 0, 1, 1,
-0.1441942, 0.6577294, -1.056457, 0, 0, 0, 1, 1,
-0.1439515, 1.319408, -0.8946989, 0, 0, 0, 1, 1,
-0.1437301, -1.13314, -3.23726, 0, 0, 0, 1, 1,
-0.1372263, 0.04906769, -1.394457, 1, 1, 1, 1, 1,
-0.1350984, -1.336657, -2.727835, 1, 1, 1, 1, 1,
-0.1283377, -0.4831074, -2.860002, 1, 1, 1, 1, 1,
-0.1264367, 1.585695, 0.9794166, 1, 1, 1, 1, 1,
-0.1262566, 0.2116805, 1.023147, 1, 1, 1, 1, 1,
-0.1258513, -1.912441, -1.675151, 1, 1, 1, 1, 1,
-0.1178279, 0.1839263, -1.081279, 1, 1, 1, 1, 1,
-0.1160144, 0.05772224, -1.800725, 1, 1, 1, 1, 1,
-0.115626, 0.7394411, 0.871034, 1, 1, 1, 1, 1,
-0.1141308, -0.4248322, -4.052319, 1, 1, 1, 1, 1,
-0.1080414, 2.07432, 0.2687629, 1, 1, 1, 1, 1,
-0.1057259, 1.496072, -0.268694, 1, 1, 1, 1, 1,
-0.1049855, 0.6293322, 0.8485225, 1, 1, 1, 1, 1,
-0.1003216, 1.105744, -0.3716975, 1, 1, 1, 1, 1,
-0.1003114, -0.7526002, -0.01632519, 1, 1, 1, 1, 1,
-0.09949043, 0.3690447, -1.925388, 0, 0, 1, 1, 1,
-0.09426205, -1.562353, -2.695821, 1, 0, 0, 1, 1,
-0.09039196, 0.3113488, 2.187294, 1, 0, 0, 1, 1,
-0.08774211, 0.05491014, -0.2587178, 1, 0, 0, 1, 1,
-0.08546922, -1.618352, -1.320059, 1, 0, 0, 1, 1,
-0.08359987, 0.6603816, 0.6075016, 1, 0, 0, 1, 1,
-0.08137281, 1.334629, -3.181941, 0, 0, 0, 1, 1,
-0.08103482, 0.2182655, 0.1482764, 0, 0, 0, 1, 1,
-0.0760133, 1.041232, 0.395861, 0, 0, 0, 1, 1,
-0.07526007, -1.09066, -2.464637, 0, 0, 0, 1, 1,
-0.07309513, 0.427095, -1.447968, 0, 0, 0, 1, 1,
-0.07072689, 0.02288486, -0.372597, 0, 0, 0, 1, 1,
-0.06821306, 0.2982138, -1.113099, 0, 0, 0, 1, 1,
-0.06778214, -0.9673043, -2.736076, 1, 1, 1, 1, 1,
-0.06698819, 1.3432, 0.1108653, 1, 1, 1, 1, 1,
-0.06521713, -0.08844759, -2.247429, 1, 1, 1, 1, 1,
-0.06474739, 0.6778469, 0.2069834, 1, 1, 1, 1, 1,
-0.05932317, -0.8724591, -3.71641, 1, 1, 1, 1, 1,
-0.05536001, -0.3224007, -3.762477, 1, 1, 1, 1, 1,
-0.05474598, 0.6509512, -0.4064089, 1, 1, 1, 1, 1,
-0.05386193, -0.4437521, -3.996752, 1, 1, 1, 1, 1,
-0.05096967, -0.1355451, -2.811171, 1, 1, 1, 1, 1,
-0.05044279, 0.2654362, -0.05887657, 1, 1, 1, 1, 1,
-0.04933477, 0.5262428, -0.7648695, 1, 1, 1, 1, 1,
-0.0489345, -0.01137043, -2.221326, 1, 1, 1, 1, 1,
-0.0411581, -0.2660486, -4.98466, 1, 1, 1, 1, 1,
-0.03875651, 1.185328, -0.5905443, 1, 1, 1, 1, 1,
-0.03703067, -2.18653, -3.171007, 1, 1, 1, 1, 1,
-0.03223624, 1.380861, -0.8173436, 0, 0, 1, 1, 1,
-0.0306322, 0.5978246, 0.3329414, 1, 0, 0, 1, 1,
-0.02865303, 0.007503956, -0.4828899, 1, 0, 0, 1, 1,
-0.02775653, -1.42275, -4.075986, 1, 0, 0, 1, 1,
-0.02536371, 2.265689, 1.272773, 1, 0, 0, 1, 1,
-0.02311545, -1.838711, -3.42177, 1, 0, 0, 1, 1,
-0.01923622, 1.441274, 0.2764345, 0, 0, 0, 1, 1,
-0.01562943, -0.6891, -4.368008, 0, 0, 0, 1, 1,
-0.01241178, -1.55289, -3.895244, 0, 0, 0, 1, 1,
-0.01212785, 0.4533796, -1.50627, 0, 0, 0, 1, 1,
-0.01012851, 0.3914331, -1.330356, 0, 0, 0, 1, 1,
-0.009643111, 0.001064647, -2.553488, 0, 0, 0, 1, 1,
-0.008301875, 1.989406, -0.1380296, 0, 0, 0, 1, 1,
-0.006890263, -0.1556292, -3.916364, 1, 1, 1, 1, 1,
-0.003572175, -0.6022938, -3.764508, 1, 1, 1, 1, 1,
-0.003185487, 0.720479, -0.4559935, 1, 1, 1, 1, 1,
0.001114564, 1.12918, 0.4712211, 1, 1, 1, 1, 1,
0.003134354, 0.03373956, -1.637854, 1, 1, 1, 1, 1,
0.003564482, 0.3412792, -0.07169114, 1, 1, 1, 1, 1,
0.005400775, -0.4113424, 2.05566, 1, 1, 1, 1, 1,
0.01008814, 1.373194, 0.1462923, 1, 1, 1, 1, 1,
0.01047535, 0.414414, 0.05659996, 1, 1, 1, 1, 1,
0.01341476, 0.6339294, 1.668275, 1, 1, 1, 1, 1,
0.01440863, 0.2140034, 0.9143155, 1, 1, 1, 1, 1,
0.01482786, 0.7070565, -2.578056, 1, 1, 1, 1, 1,
0.01694714, 0.4028168, 0.9088321, 1, 1, 1, 1, 1,
0.01978071, -0.6989077, 3.470646, 1, 1, 1, 1, 1,
0.02628482, 2.11116, 2.10727, 1, 1, 1, 1, 1,
0.02949936, 0.1085579, -0.1960008, 0, 0, 1, 1, 1,
0.03175713, 0.2995692, -0.8281934, 1, 0, 0, 1, 1,
0.03318937, -1.103594, 3.408817, 1, 0, 0, 1, 1,
0.040427, -0.9193298, 3.106264, 1, 0, 0, 1, 1,
0.04387166, 0.3431205, 1.072067, 1, 0, 0, 1, 1,
0.04921151, 0.6865143, -0.08053304, 1, 0, 0, 1, 1,
0.05291866, 0.9761328, 0.6491868, 0, 0, 0, 1, 1,
0.05472277, -0.2528377, 4.083856, 0, 0, 0, 1, 1,
0.05566043, -0.08354659, 2.212249, 0, 0, 0, 1, 1,
0.05812119, 0.3218452, 0.03534919, 0, 0, 0, 1, 1,
0.05815649, 0.2558552, 0.7221826, 0, 0, 0, 1, 1,
0.06274115, 1.210117, 1.906575, 0, 0, 0, 1, 1,
0.06534456, 1.490605, -0.02808355, 0, 0, 0, 1, 1,
0.07062016, 0.3072737, 0.9281033, 1, 1, 1, 1, 1,
0.07249162, 0.132612, 0.4010183, 1, 1, 1, 1, 1,
0.07300973, 0.4176347, 2.238439, 1, 1, 1, 1, 1,
0.07724306, -1.372813, 2.102769, 1, 1, 1, 1, 1,
0.0787854, 0.4865143, 1.670457, 1, 1, 1, 1, 1,
0.07973965, -0.3881215, 3.712911, 1, 1, 1, 1, 1,
0.08060253, -1.751089, 2.762028, 1, 1, 1, 1, 1,
0.08102043, 1.686997, -1.299944, 1, 1, 1, 1, 1,
0.08168533, -1.618525, 3.334923, 1, 1, 1, 1, 1,
0.08422156, 0.5805061, 0.5339358, 1, 1, 1, 1, 1,
0.08428048, -1.621636, 3.998842, 1, 1, 1, 1, 1,
0.08752958, 1.994988, -0.781601, 1, 1, 1, 1, 1,
0.09680645, -0.9044521, 3.343271, 1, 1, 1, 1, 1,
0.0974243, -0.1354833, 1.929896, 1, 1, 1, 1, 1,
0.1020914, -0.7848423, 3.341052, 1, 1, 1, 1, 1,
0.1021033, -0.4793152, 2.263643, 0, 0, 1, 1, 1,
0.1045729, 0.773623, 0.8600468, 1, 0, 0, 1, 1,
0.1068697, -0.5523362, 2.19821, 1, 0, 0, 1, 1,
0.1069255, 1.984566, 0.2688945, 1, 0, 0, 1, 1,
0.1094428, 1.194747, -0.3187081, 1, 0, 0, 1, 1,
0.1105473, -0.1659391, 3.146319, 1, 0, 0, 1, 1,
0.1151456, -0.6706151, 3.456794, 0, 0, 0, 1, 1,
0.1197776, 0.1592682, 0.3631687, 0, 0, 0, 1, 1,
0.121172, -0.08051659, 1.234868, 0, 0, 0, 1, 1,
0.1218757, 0.7043503, 0.7678264, 0, 0, 0, 1, 1,
0.1252924, 0.4800843, -0.8771768, 0, 0, 0, 1, 1,
0.1281464, 0.1421041, 2.13307, 0, 0, 0, 1, 1,
0.1285914, 1.091392, -0.2594185, 0, 0, 0, 1, 1,
0.1367314, -0.1891826, 2.312846, 1, 1, 1, 1, 1,
0.1369848, -0.6817241, 2.666378, 1, 1, 1, 1, 1,
0.1377655, 1.215708, 1.614807, 1, 1, 1, 1, 1,
0.1381973, -0.2776573, 3.795235, 1, 1, 1, 1, 1,
0.1419163, 0.7486518, -0.4050142, 1, 1, 1, 1, 1,
0.1441671, -1.586489, 3.781065, 1, 1, 1, 1, 1,
0.1449067, 1.246154, -1.155249, 1, 1, 1, 1, 1,
0.1495752, 0.55353, 1.019963, 1, 1, 1, 1, 1,
0.1510441, -1.294633, 1.647518, 1, 1, 1, 1, 1,
0.1562513, 1.819183, -1.205389, 1, 1, 1, 1, 1,
0.1589078, 0.3529823, 0.3446885, 1, 1, 1, 1, 1,
0.161422, 0.7627109, -0.04447213, 1, 1, 1, 1, 1,
0.1620445, 1.604929, 0.4878393, 1, 1, 1, 1, 1,
0.1640911, 0.1818198, -0.005880036, 1, 1, 1, 1, 1,
0.1685264, 0.8630881, 0.4215512, 1, 1, 1, 1, 1,
0.1689454, -1.592787, 2.839646, 0, 0, 1, 1, 1,
0.1722619, -1.421069, 1.905435, 1, 0, 0, 1, 1,
0.1743684, 0.8523656, -0.06370135, 1, 0, 0, 1, 1,
0.1748277, -0.2325338, 2.977679, 1, 0, 0, 1, 1,
0.175849, -0.3355851, 4.095563, 1, 0, 0, 1, 1,
0.1762241, -0.7937002, 3.087225, 1, 0, 0, 1, 1,
0.1774613, -1.438116, 2.3795, 0, 0, 0, 1, 1,
0.1841299, 1.244542, 0.003252364, 0, 0, 0, 1, 1,
0.1900468, -0.5547134, 2.99456, 0, 0, 0, 1, 1,
0.1936779, -0.9841594, 2.089337, 0, 0, 0, 1, 1,
0.1957179, 0.1095213, 0.6780441, 0, 0, 0, 1, 1,
0.1964246, 0.2967746, -0.009486685, 0, 0, 0, 1, 1,
0.198378, -0.1334703, 0.7777882, 0, 0, 0, 1, 1,
0.2000279, 1.135654, 2.017283, 1, 1, 1, 1, 1,
0.2001694, 1.030127, 0.719032, 1, 1, 1, 1, 1,
0.2029689, -0.9793647, 3.599241, 1, 1, 1, 1, 1,
0.2081848, 1.453338, 0.005299117, 1, 1, 1, 1, 1,
0.2084829, -0.7279675, 3.329107, 1, 1, 1, 1, 1,
0.2165101, 1.169993, -1.809137, 1, 1, 1, 1, 1,
0.2209393, 1.00317, 0.5553643, 1, 1, 1, 1, 1,
0.2217908, -1.713159, 1.670227, 1, 1, 1, 1, 1,
0.2279617, 2.191456, 1.935637, 1, 1, 1, 1, 1,
0.2289148, 0.9147068, 0.07141496, 1, 1, 1, 1, 1,
0.2322217, 0.6382671, 0.1456543, 1, 1, 1, 1, 1,
0.2328824, -0.1616732, 0.9788827, 1, 1, 1, 1, 1,
0.2410406, -0.5231118, 2.323764, 1, 1, 1, 1, 1,
0.2446392, -0.5502788, 3.91491, 1, 1, 1, 1, 1,
0.2495728, -1.522418, 2.679969, 1, 1, 1, 1, 1,
0.249875, -0.45376, 0.8157414, 0, 0, 1, 1, 1,
0.2500962, 0.561633, 1.045478, 1, 0, 0, 1, 1,
0.2513732, 0.2611395, 1.842762, 1, 0, 0, 1, 1,
0.2537197, 0.7563918, 0.9743887, 1, 0, 0, 1, 1,
0.2539106, -0.2479841, 3.567287, 1, 0, 0, 1, 1,
0.2558172, -0.9681667, 4.055584, 1, 0, 0, 1, 1,
0.2570251, 1.557979, -0.7419939, 0, 0, 0, 1, 1,
0.2619594, 0.8139669, 0.05424272, 0, 0, 0, 1, 1,
0.262819, -0.1646657, 3.487029, 0, 0, 0, 1, 1,
0.2678051, -0.7540622, 1.803373, 0, 0, 0, 1, 1,
0.2702163, -0.9631902, 3.906726, 0, 0, 0, 1, 1,
0.2717758, 0.4021456, 0.8919879, 0, 0, 0, 1, 1,
0.2765152, -0.02397448, 1.677047, 0, 0, 0, 1, 1,
0.2805237, -1.227903, 2.461029, 1, 1, 1, 1, 1,
0.2806962, -1.566285, 4.077437, 1, 1, 1, 1, 1,
0.2845113, -0.6049614, 3.261212, 1, 1, 1, 1, 1,
0.2858648, -0.6630967, 3.826194, 1, 1, 1, 1, 1,
0.2870979, 1.945917, -2.036677, 1, 1, 1, 1, 1,
0.2898005, -0.8193943, 2.724461, 1, 1, 1, 1, 1,
0.290614, 0.9047936, -0.6556762, 1, 1, 1, 1, 1,
0.2916436, 0.8692616, 0.2602817, 1, 1, 1, 1, 1,
0.2942277, 0.388073, 0.4316809, 1, 1, 1, 1, 1,
0.2945524, 0.1993577, 1.39208, 1, 1, 1, 1, 1,
0.3002541, -0.4928186, 1.129523, 1, 1, 1, 1, 1,
0.3045513, -0.2618509, 2.911121, 1, 1, 1, 1, 1,
0.305977, -0.6553225, 3.660684, 1, 1, 1, 1, 1,
0.306528, 0.367969, 2.568565, 1, 1, 1, 1, 1,
0.3108808, 0.705246, 0.6270483, 1, 1, 1, 1, 1,
0.3181722, 0.9918901, 0.631506, 0, 0, 1, 1, 1,
0.3196297, -0.9385686, 1.819222, 1, 0, 0, 1, 1,
0.3236768, 0.1938581, 1.371809, 1, 0, 0, 1, 1,
0.3270165, -0.5830055, 2.421563, 1, 0, 0, 1, 1,
0.3276273, 0.1190378, 1.787005, 1, 0, 0, 1, 1,
0.3292929, 0.09817666, -0.5329266, 1, 0, 0, 1, 1,
0.3348702, -0.1026335, 0.7798364, 0, 0, 0, 1, 1,
0.335321, 1.624101, 0.1170398, 0, 0, 0, 1, 1,
0.3377416, 0.7632164, -0.868282, 0, 0, 0, 1, 1,
0.3533712, 1.472341, -0.707891, 0, 0, 0, 1, 1,
0.357569, 0.8224142, -0.7062777, 0, 0, 0, 1, 1,
0.3580401, -1.058839, -0.4817153, 0, 0, 0, 1, 1,
0.3586288, -0.9387898, 3.038188, 0, 0, 0, 1, 1,
0.3650385, -1.381697, 1.927555, 1, 1, 1, 1, 1,
0.3671758, 0.568871, 0.2778657, 1, 1, 1, 1, 1,
0.3701499, 1.097684, -0.02399757, 1, 1, 1, 1, 1,
0.3714088, 0.9755344, -2.511591, 1, 1, 1, 1, 1,
0.3715913, 0.3386754, 2.212434, 1, 1, 1, 1, 1,
0.3795819, 0.3364819, 0.7955984, 1, 1, 1, 1, 1,
0.3841493, 0.9226151, 0.6036108, 1, 1, 1, 1, 1,
0.3849131, 0.3830099, -0.6881078, 1, 1, 1, 1, 1,
0.3862074, -0.7755188, 1.548525, 1, 1, 1, 1, 1,
0.3886904, -0.270017, 1.458355, 1, 1, 1, 1, 1,
0.3890238, 0.1898735, 1.66443, 1, 1, 1, 1, 1,
0.3912192, 0.7120029, -0.8278435, 1, 1, 1, 1, 1,
0.3917279, 0.9922773, -1.03168, 1, 1, 1, 1, 1,
0.3939975, -0.3826779, 1.294699, 1, 1, 1, 1, 1,
0.3946247, 0.4146386, -0.7153021, 1, 1, 1, 1, 1,
0.4140539, 0.4043459, 2.124732, 0, 0, 1, 1, 1,
0.4154638, 0.4827228, 1.583286, 1, 0, 0, 1, 1,
0.4194807, -0.1536999, 1.879756, 1, 0, 0, 1, 1,
0.4303594, -0.6576653, 3.159685, 1, 0, 0, 1, 1,
0.43063, 0.3002562, 1.461887, 1, 0, 0, 1, 1,
0.4322824, 0.8921863, -0.1503896, 1, 0, 0, 1, 1,
0.4373868, 1.35779, 1.432385, 0, 0, 0, 1, 1,
0.4409144, 1.133418, 1.960661, 0, 0, 0, 1, 1,
0.4416071, 0.1477722, 1.00433, 0, 0, 0, 1, 1,
0.4427744, -1.988999, 3.144614, 0, 0, 0, 1, 1,
0.44783, -0.634613, 2.711898, 0, 0, 0, 1, 1,
0.4532144, -0.8079527, 2.364838, 0, 0, 0, 1, 1,
0.4550664, -0.9116009, 2.875075, 0, 0, 0, 1, 1,
0.4586099, 0.2193734, 1.189629, 1, 1, 1, 1, 1,
0.459958, -2.269739, 4.58205, 1, 1, 1, 1, 1,
0.4604959, -1.107481, 2.373506, 1, 1, 1, 1, 1,
0.4605308, -0.4064552, 2.291536, 1, 1, 1, 1, 1,
0.4709285, 1.889734, -1.26755, 1, 1, 1, 1, 1,
0.4727387, -0.4008683, 2.000804, 1, 1, 1, 1, 1,
0.4729064, 0.482421, 1.778272, 1, 1, 1, 1, 1,
0.4765555, 0.3693073, 2.144335, 1, 1, 1, 1, 1,
0.4820776, -0.1563396, 3.132703, 1, 1, 1, 1, 1,
0.484765, -0.653707, 2.521439, 1, 1, 1, 1, 1,
0.4911651, -0.6747261, 1.893655, 1, 1, 1, 1, 1,
0.4920101, -0.94648, 2.534346, 1, 1, 1, 1, 1,
0.4931866, -1.560873, 2.423805, 1, 1, 1, 1, 1,
0.4956038, 1.375347, -2.20471, 1, 1, 1, 1, 1,
0.4976321, 0.01776022, 2.707499, 1, 1, 1, 1, 1,
0.5002534, 0.1325809, 1.42403, 0, 0, 1, 1, 1,
0.5045848, -0.7954179, 3.090996, 1, 0, 0, 1, 1,
0.5072964, -1.285779, 3.21541, 1, 0, 0, 1, 1,
0.5078774, 0.4072638, -0.224423, 1, 0, 0, 1, 1,
0.5103762, -0.5104604, 1.923595, 1, 0, 0, 1, 1,
0.5145022, -0.3028997, 1.068205, 1, 0, 0, 1, 1,
0.51574, -1.606659, 3.6675, 0, 0, 0, 1, 1,
0.5166661, -0.4824277, 3.286616, 0, 0, 0, 1, 1,
0.5217502, -0.7899458, 4.186505, 0, 0, 0, 1, 1,
0.5232354, -0.5322844, 2.741705, 0, 0, 0, 1, 1,
0.5250379, 0.2355837, 1.613432, 0, 0, 0, 1, 1,
0.525762, 0.1924782, 2.727106, 0, 0, 0, 1, 1,
0.5266012, -1.638472, 1.697448, 0, 0, 0, 1, 1,
0.5327229, 1.137726, 0.04364815, 1, 1, 1, 1, 1,
0.5376166, -1.838271, 4.263426, 1, 1, 1, 1, 1,
0.5385837, -0.0002633973, 1.647028, 1, 1, 1, 1, 1,
0.5401989, 0.340619, 1.416767, 1, 1, 1, 1, 1,
0.5423239, -0.4655837, 3.375824, 1, 1, 1, 1, 1,
0.5426539, 0.744856, 0.2433121, 1, 1, 1, 1, 1,
0.5447036, -1.743413, 3.907728, 1, 1, 1, 1, 1,
0.5463518, -1.187423, 2.962798, 1, 1, 1, 1, 1,
0.5516808, -0.8134474, 0.5040995, 1, 1, 1, 1, 1,
0.5576004, -0.1206556, 0.5182527, 1, 1, 1, 1, 1,
0.5578315, 1.979095, 1.341267, 1, 1, 1, 1, 1,
0.5581513, -0.007828352, 3.484728, 1, 1, 1, 1, 1,
0.5586085, 0.1506098, 2.521801, 1, 1, 1, 1, 1,
0.5634328, -0.06641088, 2.445705, 1, 1, 1, 1, 1,
0.5699522, 0.4304677, 0.9896168, 1, 1, 1, 1, 1,
0.5740713, 0.7068446, 2.13142, 0, 0, 1, 1, 1,
0.5744432, -0.185257, 0.9952634, 1, 0, 0, 1, 1,
0.5773574, 0.3241449, 1.057337, 1, 0, 0, 1, 1,
0.5783203, 0.3401993, 1.698449, 1, 0, 0, 1, 1,
0.5783427, 1.915497, -1.054188, 1, 0, 0, 1, 1,
0.5818541, -1.481571, 2.867158, 1, 0, 0, 1, 1,
0.5841925, -0.7432565, 1.90196, 0, 0, 0, 1, 1,
0.5849075, 0.04038408, 2.18421, 0, 0, 0, 1, 1,
0.5882939, -0.9779328, 1.555187, 0, 0, 0, 1, 1,
0.5900854, 1.527653, 0.2403045, 0, 0, 0, 1, 1,
0.590147, 0.3284945, 0.8314159, 0, 0, 0, 1, 1,
0.5933773, -2.2537, 3.730806, 0, 0, 0, 1, 1,
0.5939438, 0.9482964, 0.6647389, 0, 0, 0, 1, 1,
0.6015372, -0.8968793, 0.06099769, 1, 1, 1, 1, 1,
0.6034685, -1.828655, 3.149822, 1, 1, 1, 1, 1,
0.6068326, -1.793244, 2.30108, 1, 1, 1, 1, 1,
0.6187952, 1.87249, 0.1026719, 1, 1, 1, 1, 1,
0.6199923, 0.537275, 0.008517898, 1, 1, 1, 1, 1,
0.629024, 1.498186, 0.5055154, 1, 1, 1, 1, 1,
0.6323824, -0.9170408, 3.427823, 1, 1, 1, 1, 1,
0.6329624, -3.026849, 2.93029, 1, 1, 1, 1, 1,
0.6352053, -1.25556, 3.194698, 1, 1, 1, 1, 1,
0.6382564, 0.7648134, 1.762722, 1, 1, 1, 1, 1,
0.6388605, -0.3381958, 3.287618, 1, 1, 1, 1, 1,
0.6393745, -1.478938, 2.3174, 1, 1, 1, 1, 1,
0.6422798, 0.9120818, -0.5768092, 1, 1, 1, 1, 1,
0.6557021, 2.401284, 1.829118, 1, 1, 1, 1, 1,
0.6622165, 1.261409, -1.138387, 1, 1, 1, 1, 1,
0.6641051, 1.166953, 1.474957, 0, 0, 1, 1, 1,
0.6652804, -0.9977447, 4.274143, 1, 0, 0, 1, 1,
0.6672109, 0.1744944, 1.302119, 1, 0, 0, 1, 1,
0.668422, -0.1841513, 3.164794, 1, 0, 0, 1, 1,
0.673451, 0.27875, 1.044757, 1, 0, 0, 1, 1,
0.6845943, -1.561649, 2.666005, 1, 0, 0, 1, 1,
0.6907551, 1.370862, 0.5230224, 0, 0, 0, 1, 1,
0.695437, -0.8782054, 5.033549, 0, 0, 0, 1, 1,
0.7027991, 0.4251094, 0.7947811, 0, 0, 0, 1, 1,
0.7032832, -1.244628, 1.406833, 0, 0, 0, 1, 1,
0.7100727, -1.201326, 3.55114, 0, 0, 0, 1, 1,
0.7101988, 1.800273, 0.8268998, 0, 0, 0, 1, 1,
0.7147062, 1.502678, 0.8757862, 0, 0, 0, 1, 1,
0.7169985, 1.378849, -1.377367, 1, 1, 1, 1, 1,
0.7185127, -0.06562981, 1.891878, 1, 1, 1, 1, 1,
0.7200118, -0.4911915, 0.6103026, 1, 1, 1, 1, 1,
0.7231308, 1.579762, -1.611784, 1, 1, 1, 1, 1,
0.7282996, -0.7058105, 2.644511, 1, 1, 1, 1, 1,
0.7290177, -0.03282391, 1.199201, 1, 1, 1, 1, 1,
0.7311576, -0.4051526, 1.681033, 1, 1, 1, 1, 1,
0.7337674, 0.2472072, -0.5739499, 1, 1, 1, 1, 1,
0.7351454, -0.5930017, 2.324244, 1, 1, 1, 1, 1,
0.738027, -2.29707, 3.35848, 1, 1, 1, 1, 1,
0.7396958, -0.3804831, 3.512005, 1, 1, 1, 1, 1,
0.7426913, 0.1436084, 0.8265759, 1, 1, 1, 1, 1,
0.7451242, -0.7391682, 3.298901, 1, 1, 1, 1, 1,
0.7454242, 0.04000628, 0.6839652, 1, 1, 1, 1, 1,
0.7519776, -0.4745162, 1.688101, 1, 1, 1, 1, 1,
0.75393, -2.634807, 2.360579, 0, 0, 1, 1, 1,
0.7542168, -0.7219189, 3.907022, 1, 0, 0, 1, 1,
0.7594555, -0.4085224, 0.4530366, 1, 0, 0, 1, 1,
0.762821, 0.4409579, 1.093001, 1, 0, 0, 1, 1,
0.7646574, -0.2156484, 1.599788, 1, 0, 0, 1, 1,
0.7663432, 1.507224, 1.468332, 1, 0, 0, 1, 1,
0.7680814, -0.447735, 4.03164, 0, 0, 0, 1, 1,
0.7708014, 0.09522031, 2.045865, 0, 0, 0, 1, 1,
0.7712299, -1.287113, 2.915351, 0, 0, 0, 1, 1,
0.773016, 0.3823674, -0.05139402, 0, 0, 0, 1, 1,
0.7738861, 1.778031, -0.543551, 0, 0, 0, 1, 1,
0.7790861, 0.05159464, 0.3589877, 0, 0, 0, 1, 1,
0.7833863, 0.29041, 1.469902, 0, 0, 0, 1, 1,
0.7842209, -0.5427938, 2.483853, 1, 1, 1, 1, 1,
0.7849529, 0.2718224, 0.9525515, 1, 1, 1, 1, 1,
0.7978495, 1.461971, 0.02113358, 1, 1, 1, 1, 1,
0.7978919, -0.717199, 1.978625, 1, 1, 1, 1, 1,
0.801591, -1.727558, 4.490681, 1, 1, 1, 1, 1,
0.8019971, 1.28043, 0.2343078, 1, 1, 1, 1, 1,
0.8074068, -0.05397087, 1.912867, 1, 1, 1, 1, 1,
0.811018, 0.5814476, 1.636467, 1, 1, 1, 1, 1,
0.8165573, 0.4561788, -0.2117718, 1, 1, 1, 1, 1,
0.8217816, 0.9855261, -0.01337873, 1, 1, 1, 1, 1,
0.8252218, 1.287717, -1.020091, 1, 1, 1, 1, 1,
0.8254205, -1.163573, 1.230758, 1, 1, 1, 1, 1,
0.8258022, 1.710727, -0.9176775, 1, 1, 1, 1, 1,
0.8275527, -0.4310807, 0.7869162, 1, 1, 1, 1, 1,
0.8290489, -1.526732, 2.052791, 1, 1, 1, 1, 1,
0.8318701, -0.4687478, 2.725173, 0, 0, 1, 1, 1,
0.8404295, 1.75029, 0.4385835, 1, 0, 0, 1, 1,
0.8469524, -0.4502072, 1.417091, 1, 0, 0, 1, 1,
0.8486782, 0.6772783, 0.1923324, 1, 0, 0, 1, 1,
0.8516814, 1.494111, -1.046153, 1, 0, 0, 1, 1,
0.854596, -1.904607, 3.549351, 1, 0, 0, 1, 1,
0.8548775, -0.1690509, 3.529878, 0, 0, 0, 1, 1,
0.8601374, 0.7631474, 0.6346481, 0, 0, 0, 1, 1,
0.8619184, -0.2006788, 1.549457, 0, 0, 0, 1, 1,
0.8648176, -1.076486, 1.561514, 0, 0, 0, 1, 1,
0.8697594, -2.857281, 2.096663, 0, 0, 0, 1, 1,
0.8698462, -0.5753819, 1.550072, 0, 0, 0, 1, 1,
0.8708175, 1.058337, 0.4197835, 0, 0, 0, 1, 1,
0.8710882, 0.1028751, 0.7465802, 1, 1, 1, 1, 1,
0.8751031, 0.2735727, 0.632948, 1, 1, 1, 1, 1,
0.8837098, 0.4304866, -0.3725997, 1, 1, 1, 1, 1,
0.8844346, 0.02370313, 2.779258, 1, 1, 1, 1, 1,
0.8853009, 0.9722167, -0.9001813, 1, 1, 1, 1, 1,
0.8890178, -0.3543004, -0.4153981, 1, 1, 1, 1, 1,
0.8916417, -1.697133, 0.1804748, 1, 1, 1, 1, 1,
0.9025338, 0.9342517, 0.6931573, 1, 1, 1, 1, 1,
0.9039333, 0.4369251, 0.3580489, 1, 1, 1, 1, 1,
0.9040774, 0.3287154, 1.577657, 1, 1, 1, 1, 1,
0.9066762, -1.009682, 1.562232, 1, 1, 1, 1, 1,
0.9101924, 1.040475, -0.05354464, 1, 1, 1, 1, 1,
0.9121703, 2.80322, 0.001346911, 1, 1, 1, 1, 1,
0.9229998, -1.102687, 0.853334, 1, 1, 1, 1, 1,
0.9230313, -0.3443361, 1.926661, 1, 1, 1, 1, 1,
0.9266502, 0.3235033, 3.273463, 0, 0, 1, 1, 1,
0.9316815, -0.8391798, 2.32661, 1, 0, 0, 1, 1,
0.9337557, -0.07141234, 0.8498136, 1, 0, 0, 1, 1,
0.9339146, -0.4832197, 0.6608173, 1, 0, 0, 1, 1,
0.9376654, 0.7640018, 3.63493, 1, 0, 0, 1, 1,
0.9390802, 1.796765, 2.14197, 1, 0, 0, 1, 1,
0.9410322, 0.5265479, 1.241447, 0, 0, 0, 1, 1,
0.9415724, 1.629913, 1.524494, 0, 0, 0, 1, 1,
0.9427799, -0.7467417, 2.131918, 0, 0, 0, 1, 1,
0.9477636, -1.386153, 1.706724, 0, 0, 0, 1, 1,
0.9519177, -1.935114, 1.990511, 0, 0, 0, 1, 1,
0.9537653, -0.8684631, 2.203047, 0, 0, 0, 1, 1,
0.9550256, -1.567163, 1.461891, 0, 0, 0, 1, 1,
0.9603117, 1.123862, 1.208438, 1, 1, 1, 1, 1,
0.9621018, 0.7548233, -0.5104465, 1, 1, 1, 1, 1,
0.9746154, -0.9288237, 0.608047, 1, 1, 1, 1, 1,
0.9791505, 0.314748, 0.6967857, 1, 1, 1, 1, 1,
0.9840961, -0.1546925, 1.652115, 1, 1, 1, 1, 1,
0.9871268, -0.8584259, 1.895659, 1, 1, 1, 1, 1,
0.9970646, 1.640255, 0.2860578, 1, 1, 1, 1, 1,
1.006131, 0.5020967, 1.4893, 1, 1, 1, 1, 1,
1.00946, 2.315869, 0.8019096, 1, 1, 1, 1, 1,
1.012691, 1.834266, -0.7269564, 1, 1, 1, 1, 1,
1.015104, 0.8116531, 1.560178, 1, 1, 1, 1, 1,
1.015189, -1.299855, 2.745017, 1, 1, 1, 1, 1,
1.0216, -0.1838627, 1.831889, 1, 1, 1, 1, 1,
1.02998, 0.9681955, 0.2618566, 1, 1, 1, 1, 1,
1.030859, -1.533393, 1.233326, 1, 1, 1, 1, 1,
1.031163, -0.1607285, -0.3582155, 0, 0, 1, 1, 1,
1.034214, -0.7070925, 2.653422, 1, 0, 0, 1, 1,
1.038649, 0.118214, 1.847591, 1, 0, 0, 1, 1,
1.041406, -0.1240292, 1.149057, 1, 0, 0, 1, 1,
1.043702, -1.466399, 4.428509, 1, 0, 0, 1, 1,
1.045012, -0.1215915, 2.952598, 1, 0, 0, 1, 1,
1.047815, -0.1438318, 3.146432, 0, 0, 0, 1, 1,
1.048047, -0.9233173, 1.189595, 0, 0, 0, 1, 1,
1.052359, -0.7735927, 0.6416262, 0, 0, 0, 1, 1,
1.054969, 0.07842916, 0.1916748, 0, 0, 0, 1, 1,
1.055821, 0.3967594, -0.4193866, 0, 0, 0, 1, 1,
1.06717, 1.126029, -0.6886718, 0, 0, 0, 1, 1,
1.069772, 0.6761102, 0.7178081, 0, 0, 0, 1, 1,
1.07083, 0.4498719, 0.9248664, 1, 1, 1, 1, 1,
1.075547, -0.3160786, 2.944969, 1, 1, 1, 1, 1,
1.079938, 0.2033868, 1.662448, 1, 1, 1, 1, 1,
1.081912, 1.490303, 2.350836, 1, 1, 1, 1, 1,
1.082885, -1.830806, 1.385361, 1, 1, 1, 1, 1,
1.087997, 0.9070391, 2.192832, 1, 1, 1, 1, 1,
1.095961, -0.8759577, 2.620585, 1, 1, 1, 1, 1,
1.096833, -0.5922177, 0.4973091, 1, 1, 1, 1, 1,
1.102793, -0.1646555, 1.352422, 1, 1, 1, 1, 1,
1.119661, 1.07031, 1.753929, 1, 1, 1, 1, 1,
1.119748, -1.337984, 1.14584, 1, 1, 1, 1, 1,
1.124383, 0.1963942, 1.285883, 1, 1, 1, 1, 1,
1.125018, 2.061483, 0.2180582, 1, 1, 1, 1, 1,
1.133177, -0.2969028, 2.233556, 1, 1, 1, 1, 1,
1.137281, 0.03393387, 0.5830472, 1, 1, 1, 1, 1,
1.146106, 0.3393897, -0.8884016, 0, 0, 1, 1, 1,
1.147464, 0.544499, 1.776465, 1, 0, 0, 1, 1,
1.150229, 1.89436, 1.70911, 1, 0, 0, 1, 1,
1.156747, -0.4093306, 0.3958929, 1, 0, 0, 1, 1,
1.164085, -0.5961547, 2.496919, 1, 0, 0, 1, 1,
1.172657, -0.2167714, 0.9762473, 1, 0, 0, 1, 1,
1.177046, -0.0677577, 1.68549, 0, 0, 0, 1, 1,
1.185349, 1.529188, 1.573621, 0, 0, 0, 1, 1,
1.193539, -0.3490524, 1.212682, 0, 0, 0, 1, 1,
1.195022, -1.038168, 3.92761, 0, 0, 0, 1, 1,
1.20361, 0.8689892, 1.90475, 0, 0, 0, 1, 1,
1.205826, 0.01118065, -0.1392013, 0, 0, 0, 1, 1,
1.207045, -1.804854, 2.809091, 0, 0, 0, 1, 1,
1.209699, -0.9230682, 0.4452439, 1, 1, 1, 1, 1,
1.216251, -0.07767863, 2.145209, 1, 1, 1, 1, 1,
1.216453, -0.6742522, 3.431956, 1, 1, 1, 1, 1,
1.217755, 0.1366026, 0.2947287, 1, 1, 1, 1, 1,
1.221273, 0.7073828, -1.06829, 1, 1, 1, 1, 1,
1.226511, 0.2053271, 2.081416, 1, 1, 1, 1, 1,
1.227093, 0.8284222, -0.3427621, 1, 1, 1, 1, 1,
1.230347, -0.2942636, 2.253411, 1, 1, 1, 1, 1,
1.233969, -0.4153266, 2.010455, 1, 1, 1, 1, 1,
1.262269, -0.03394391, 0.865181, 1, 1, 1, 1, 1,
1.262829, -1.03058, 0.6898993, 1, 1, 1, 1, 1,
1.266419, 0.3643645, -0.4850125, 1, 1, 1, 1, 1,
1.27174, -0.6365878, 1.830841, 1, 1, 1, 1, 1,
1.278735, -0.07900619, 0.1882974, 1, 1, 1, 1, 1,
1.281063, -0.7358832, 1.842236, 1, 1, 1, 1, 1,
1.281661, 1.590341, 0.9678594, 0, 0, 1, 1, 1,
1.301508, -1.667506, -0.9030777, 1, 0, 0, 1, 1,
1.306215, 0.7708752, 1.403275, 1, 0, 0, 1, 1,
1.307542, 0.4406429, 1.797777, 1, 0, 0, 1, 1,
1.320571, 0.6168952, 0.3724702, 1, 0, 0, 1, 1,
1.323037, -0.3069429, 0.9899709, 1, 0, 0, 1, 1,
1.327625, -0.3654282, -1.187292, 0, 0, 0, 1, 1,
1.335133, 0.1697827, 0.728167, 0, 0, 0, 1, 1,
1.352158, 0.9396123, 0.4564753, 0, 0, 0, 1, 1,
1.352668, -0.4113683, 0.9362915, 0, 0, 0, 1, 1,
1.356904, -0.6570185, 3.062449, 0, 0, 0, 1, 1,
1.361046, 0.06977183, 0.5527813, 0, 0, 0, 1, 1,
1.362453, 0.4715627, 0.1332027, 0, 0, 0, 1, 1,
1.3648, 0.8763477, 2.502234, 1, 1, 1, 1, 1,
1.370497, -0.1478954, 3.022798, 1, 1, 1, 1, 1,
1.370692, 0.6466945, 1.203881, 1, 1, 1, 1, 1,
1.373678, -1.865176, 1.29785, 1, 1, 1, 1, 1,
1.373762, 0.7766026, 0.2519966, 1, 1, 1, 1, 1,
1.38662, 1.03281, 2.332662, 1, 1, 1, 1, 1,
1.393626, 1.833082, 1.352598, 1, 1, 1, 1, 1,
1.394286, 0.4435116, 1.997577, 1, 1, 1, 1, 1,
1.405966, -1.095813, 3.233173, 1, 1, 1, 1, 1,
1.406738, -1.084816, 1.630164, 1, 1, 1, 1, 1,
1.420828, 1.838246, 1.337562, 1, 1, 1, 1, 1,
1.423279, 0.1791039, 0.6016498, 1, 1, 1, 1, 1,
1.423946, 0.5169895, 1.844761, 1, 1, 1, 1, 1,
1.43095, -2.646446, 3.842512, 1, 1, 1, 1, 1,
1.441486, -0.8016304, 3.528047, 1, 1, 1, 1, 1,
1.442941, 0.3774432, 0.5081196, 0, 0, 1, 1, 1,
1.446426, 0.4750394, 0.5926276, 1, 0, 0, 1, 1,
1.447746, 0.59855, 0.9557989, 1, 0, 0, 1, 1,
1.450144, -0.2367869, 0.5657781, 1, 0, 0, 1, 1,
1.452566, -0.8705491, 2.806525, 1, 0, 0, 1, 1,
1.461854, -0.7087984, 2.447252, 1, 0, 0, 1, 1,
1.464838, -0.5125337, 2.32495, 0, 0, 0, 1, 1,
1.464846, 1.018993, 1.478361, 0, 0, 0, 1, 1,
1.467476, -1.041374, 2.807462, 0, 0, 0, 1, 1,
1.47105, -0.9698554, 1.866863, 0, 0, 0, 1, 1,
1.474326, -0.8022722, 1.415371, 0, 0, 0, 1, 1,
1.477667, -1.202364, 0.4731705, 0, 0, 0, 1, 1,
1.488265, 0.1637694, 1.763865, 0, 0, 0, 1, 1,
1.490306, -1.415961, 3.217672, 1, 1, 1, 1, 1,
1.495586, -0.256813, 1.155378, 1, 1, 1, 1, 1,
1.505728, -1.220648, 3.568375, 1, 1, 1, 1, 1,
1.518366, 1.899565, 1.487008, 1, 1, 1, 1, 1,
1.518413, 1.111775, 0.01512951, 1, 1, 1, 1, 1,
1.523177, 0.7178636, 1.729703, 1, 1, 1, 1, 1,
1.529714, -1.239229, 3.937951, 1, 1, 1, 1, 1,
1.545423, 0.1845658, 1.948056, 1, 1, 1, 1, 1,
1.554312, -0.5109631, 2.199558, 1, 1, 1, 1, 1,
1.562862, -0.7660196, 2.554157, 1, 1, 1, 1, 1,
1.56386, 0.7396089, 1.163566, 1, 1, 1, 1, 1,
1.564697, -0.8659805, 3.882013, 1, 1, 1, 1, 1,
1.567349, 1.44418, 0.8558796, 1, 1, 1, 1, 1,
1.573112, 0.4181884, 1.045506, 1, 1, 1, 1, 1,
1.580583, -0.2140953, 2.32897, 1, 1, 1, 1, 1,
1.585542, -0.4556945, 3.156727, 0, 0, 1, 1, 1,
1.592054, 0.5309474, -0.6747199, 1, 0, 0, 1, 1,
1.607081, 0.2680102, 0.9118234, 1, 0, 0, 1, 1,
1.64183, -1.705078, 2.723359, 1, 0, 0, 1, 1,
1.659054, 0.5971915, 1.50961, 1, 0, 0, 1, 1,
1.665831, 0.2218795, 1.935924, 1, 0, 0, 1, 1,
1.674511, 0.3290015, 0.5341572, 0, 0, 0, 1, 1,
1.704429, 0.06137539, 0.7671746, 0, 0, 0, 1, 1,
1.719578, -1.176974, 2.763997, 0, 0, 0, 1, 1,
1.720444, -0.8266877, 1.116766, 0, 0, 0, 1, 1,
1.754116, 0.4029556, -1.373219, 0, 0, 0, 1, 1,
1.758255, -1.280657, 2.391117, 0, 0, 0, 1, 1,
1.76845, -0.4237729, 1.6773, 0, 0, 0, 1, 1,
1.776291, 1.260293, 1.316306, 1, 1, 1, 1, 1,
1.820581, -0.5299312, 2.888824, 1, 1, 1, 1, 1,
1.826492, 1.115056, 1.386657, 1, 1, 1, 1, 1,
1.858816, 0.4910852, 1.533095, 1, 1, 1, 1, 1,
1.861537, -0.5007389, 1.704578, 1, 1, 1, 1, 1,
1.862344, 1.017912, 2.679058, 1, 1, 1, 1, 1,
1.87104, 0.2970897, 2.779852, 1, 1, 1, 1, 1,
1.888308, -1.784252, 3.832224, 1, 1, 1, 1, 1,
1.890686, -1.013585, 2.189509, 1, 1, 1, 1, 1,
1.898859, 2.118118, 2.959291, 1, 1, 1, 1, 1,
1.907034, -1.554757, 0.1171663, 1, 1, 1, 1, 1,
1.909292, -1.078247, 1.792695, 1, 1, 1, 1, 1,
1.910795, -1.530898, 2.476571, 1, 1, 1, 1, 1,
1.982653, 1.757338, 0.8874367, 1, 1, 1, 1, 1,
1.98817, 1.114302, 1.760316, 1, 1, 1, 1, 1,
1.988359, 0.1400015, 1.619699, 0, 0, 1, 1, 1,
2.006626, -1.45464, 1.203201, 1, 0, 0, 1, 1,
2.019488, -1.883559, 1.401769, 1, 0, 0, 1, 1,
2.032516, -1.490667, 2.66765, 1, 0, 0, 1, 1,
2.066934, 1.53238, 2.167539, 1, 0, 0, 1, 1,
2.07009, -0.9733713, 2.577685, 1, 0, 0, 1, 1,
2.085378, 0.7566552, 1.486941, 0, 0, 0, 1, 1,
2.099009, -0.1230382, 3.290691, 0, 0, 0, 1, 1,
2.099396, 0.3317771, -0.8867236, 0, 0, 0, 1, 1,
2.116506, 0.1107746, 1.754329, 0, 0, 0, 1, 1,
2.124373, -0.1789573, 2.019861, 0, 0, 0, 1, 1,
2.146749, -1.676891, 3.717571, 0, 0, 0, 1, 1,
2.179563, 1.355887, 1.756647, 0, 0, 0, 1, 1,
2.191582, 0.9019367, 0.4236261, 1, 1, 1, 1, 1,
2.246107, 1.627802, 0.4696221, 1, 1, 1, 1, 1,
2.253896, -0.06088055, 1.14299, 1, 1, 1, 1, 1,
2.282339, 1.24243, 2.633616, 1, 1, 1, 1, 1,
2.464193, 3.340604, 1.329174, 1, 1, 1, 1, 1,
2.507769, 1.336044, 2.003817, 1, 1, 1, 1, 1,
3.130127, 0.4491043, 1.483608, 1, 1, 1, 1, 1
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
var radius = 9.594748;
var distance = 33.70115;
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
mvMatrix.translate( 0.2489135, -0.1568775, 0.2435853 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.70115);
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
