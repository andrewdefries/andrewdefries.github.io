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
-2.889591, 0.9434161, -2.047633, 1, 0, 0, 1,
-2.704293, 0.943313, 0.3096684, 1, 0.007843138, 0, 1,
-2.654439, -1.200094, -2.435923, 1, 0.01176471, 0, 1,
-2.256084, -1.508748, -1.825606, 1, 0.01960784, 0, 1,
-2.23638, 1.441361, -0.2907508, 1, 0.02352941, 0, 1,
-2.213403, 0.948229, -1.387205, 1, 0.03137255, 0, 1,
-2.182078, 0.1278477, -3.153606, 1, 0.03529412, 0, 1,
-2.152925, -0.182018, -1.229815, 1, 0.04313726, 0, 1,
-2.114321, -0.5799374, -2.675504, 1, 0.04705882, 0, 1,
-2.076471, -0.6066768, -2.911987, 1, 0.05490196, 0, 1,
-2.07468, 0.6783464, -2.518883, 1, 0.05882353, 0, 1,
-2.053254, -0.9217326, -1.165013, 1, 0.06666667, 0, 1,
-2.003316, -0.3780137, -1.357976, 1, 0.07058824, 0, 1,
-1.982084, -0.7692878, -2.918779, 1, 0.07843138, 0, 1,
-1.976974, 1.78801, -1.74162, 1, 0.08235294, 0, 1,
-1.950344, 0.9925104, -1.396023, 1, 0.09019608, 0, 1,
-1.937098, -1.962486, -2.990586, 1, 0.09411765, 0, 1,
-1.880349, 1.628469, -1.479381, 1, 0.1019608, 0, 1,
-1.85837, 0.01281154, -2.678795, 1, 0.1098039, 0, 1,
-1.836156, 0.0535656, -3.126817, 1, 0.1137255, 0, 1,
-1.835752, 1.349201, -1.253154, 1, 0.1215686, 0, 1,
-1.831827, -0.4746523, -0.7334987, 1, 0.1254902, 0, 1,
-1.820805, 0.295515, -1.934084, 1, 0.1333333, 0, 1,
-1.820523, -0.2505696, -2.036512, 1, 0.1372549, 0, 1,
-1.81822, 0.9122968, -2.473752, 1, 0.145098, 0, 1,
-1.808685, 0.5720512, -2.870745, 1, 0.1490196, 0, 1,
-1.801754, 1.015341, 1.20597, 1, 0.1568628, 0, 1,
-1.781776, -1.892871, -1.886149, 1, 0.1607843, 0, 1,
-1.763823, -0.2125834, -1.698727, 1, 0.1686275, 0, 1,
-1.76186, 0.07275306, -1.92113, 1, 0.172549, 0, 1,
-1.761152, -0.5954981, -2.446101, 1, 0.1803922, 0, 1,
-1.759989, 2.043012, -1.379586, 1, 0.1843137, 0, 1,
-1.748824, 1.373488, 0.3950612, 1, 0.1921569, 0, 1,
-1.745282, -0.07346955, -1.580712, 1, 0.1960784, 0, 1,
-1.721418, -1.079588, -4.101016, 1, 0.2039216, 0, 1,
-1.706138, -1.237234, 0.0889784, 1, 0.2117647, 0, 1,
-1.690433, -0.7488196, -2.975984, 1, 0.2156863, 0, 1,
-1.683802, -0.8538296, -2.99298, 1, 0.2235294, 0, 1,
-1.679603, -0.1194483, -1.865677, 1, 0.227451, 0, 1,
-1.678175, -1.276265, -1.862107, 1, 0.2352941, 0, 1,
-1.676634, -0.6844213, -2.066174, 1, 0.2392157, 0, 1,
-1.670635, 0.4041026, -2.198253, 1, 0.2470588, 0, 1,
-1.641962, -0.01115424, -1.739234, 1, 0.2509804, 0, 1,
-1.630161, 1.79323, -1.88782, 1, 0.2588235, 0, 1,
-1.61748, 0.6062593, -1.094722, 1, 0.2627451, 0, 1,
-1.612483, -0.1464126, -2.169358, 1, 0.2705882, 0, 1,
-1.594145, -1.034181, -2.42483, 1, 0.2745098, 0, 1,
-1.582365, 1.908847, -0.1422541, 1, 0.282353, 0, 1,
-1.567709, -1.712164, -1.493247, 1, 0.2862745, 0, 1,
-1.546873, 0.2516812, -0.5242326, 1, 0.2941177, 0, 1,
-1.530622, 2.132551, 0.8209763, 1, 0.3019608, 0, 1,
-1.51186, -1.370608, -1.982946, 1, 0.3058824, 0, 1,
-1.510552, 0.2203169, -1.670114, 1, 0.3137255, 0, 1,
-1.507617, 0.4316241, 1.066391, 1, 0.3176471, 0, 1,
-1.500319, 1.287525, -1.112072, 1, 0.3254902, 0, 1,
-1.498857, -0.2800407, -2.457787, 1, 0.3294118, 0, 1,
-1.488995, 0.6851745, -0.6911503, 1, 0.3372549, 0, 1,
-1.48744, -1.789803, -0.5802925, 1, 0.3411765, 0, 1,
-1.473846, -1.304509, -1.344711, 1, 0.3490196, 0, 1,
-1.473682, 0.3502187, -0.5925155, 1, 0.3529412, 0, 1,
-1.465365, -0.7242516, -1.528014, 1, 0.3607843, 0, 1,
-1.457058, 1.168226, -1.702054, 1, 0.3647059, 0, 1,
-1.454726, -1.02222, -1.00726, 1, 0.372549, 0, 1,
-1.454551, -0.08532076, -2.195216, 1, 0.3764706, 0, 1,
-1.451807, -0.1772646, -0.5604218, 1, 0.3843137, 0, 1,
-1.450889, -0.08427613, 0.7995784, 1, 0.3882353, 0, 1,
-1.449772, 0.3015304, -1.205141, 1, 0.3960784, 0, 1,
-1.440668, 1.684249, -1.034049, 1, 0.4039216, 0, 1,
-1.431559, 0.946182, -1.391289, 1, 0.4078431, 0, 1,
-1.427015, -0.5781164, -3.450137, 1, 0.4156863, 0, 1,
-1.42092, 1.047968, 0.2194531, 1, 0.4196078, 0, 1,
-1.414736, 1.695986, -2.139477, 1, 0.427451, 0, 1,
-1.411327, -2.309458, -4.375899, 1, 0.4313726, 0, 1,
-1.39908, -0.03053706, -1.236148, 1, 0.4392157, 0, 1,
-1.398489, -0.02641257, -1.665972, 1, 0.4431373, 0, 1,
-1.398135, 2.443683, -1.022984, 1, 0.4509804, 0, 1,
-1.397441, 1.562666, 1.446309, 1, 0.454902, 0, 1,
-1.386427, -0.003009361, -2.528424, 1, 0.4627451, 0, 1,
-1.377834, 0.3131332, -1.713349, 1, 0.4666667, 0, 1,
-1.365533, 0.5516109, -0.5277088, 1, 0.4745098, 0, 1,
-1.351856, 1.004019, -0.6971148, 1, 0.4784314, 0, 1,
-1.344626, 0.6920683, 0.1099539, 1, 0.4862745, 0, 1,
-1.33724, 0.3930271, -0.5528603, 1, 0.4901961, 0, 1,
-1.329051, 0.9582371, -1.051222, 1, 0.4980392, 0, 1,
-1.316851, -0.7737976, -1.184996, 1, 0.5058824, 0, 1,
-1.311727, -1.154954, -2.505749, 1, 0.509804, 0, 1,
-1.311523, 0.7006685, -0.611176, 1, 0.5176471, 0, 1,
-1.297201, -1.321415, -3.158965, 1, 0.5215687, 0, 1,
-1.29643, -0.07675475, -1.62286, 1, 0.5294118, 0, 1,
-1.29386, 0.1858518, -1.075495, 1, 0.5333334, 0, 1,
-1.281367, -0.2984263, -1.54046, 1, 0.5411765, 0, 1,
-1.267617, 1.887503, -0.3219275, 1, 0.5450981, 0, 1,
-1.252802, -0.7972989, -3.599709, 1, 0.5529412, 0, 1,
-1.252617, -0.3593528, -2.304933, 1, 0.5568628, 0, 1,
-1.246158, 0.9654263, -1.666102, 1, 0.5647059, 0, 1,
-1.242557, -0.2080813, -1.03468, 1, 0.5686275, 0, 1,
-1.240119, 0.8628594, -1.618545, 1, 0.5764706, 0, 1,
-1.239175, 1.547014, -0.9205732, 1, 0.5803922, 0, 1,
-1.238218, 1.15589, -1.671834, 1, 0.5882353, 0, 1,
-1.229212, 0.2853004, -1.725255, 1, 0.5921569, 0, 1,
-1.227175, -0.7851746, -3.421138, 1, 0.6, 0, 1,
-1.218061, 0.1461051, 0.09828016, 1, 0.6078432, 0, 1,
-1.217925, -1.047273, -2.326582, 1, 0.6117647, 0, 1,
-1.217322, 0.003939235, -1.980219, 1, 0.6196079, 0, 1,
-1.216494, 1.572154, 0.6569893, 1, 0.6235294, 0, 1,
-1.215055, -0.3362474, -0.3237424, 1, 0.6313726, 0, 1,
-1.213968, 0.7396501, 0.2094529, 1, 0.6352941, 0, 1,
-1.201999, 0.4918056, -2.718487, 1, 0.6431373, 0, 1,
-1.199708, -0.582263, -2.182176, 1, 0.6470588, 0, 1,
-1.199523, -0.0490657, -1.410944, 1, 0.654902, 0, 1,
-1.182013, -1.291693, -2.443176, 1, 0.6588235, 0, 1,
-1.171359, -1.362152, -4.481772, 1, 0.6666667, 0, 1,
-1.169606, 1.110212, -0.07881321, 1, 0.6705883, 0, 1,
-1.167376, -0.2869791, -1.415093, 1, 0.6784314, 0, 1,
-1.158393, 0.6443956, -0.8258221, 1, 0.682353, 0, 1,
-1.157769, 1.326689, -0.3525001, 1, 0.6901961, 0, 1,
-1.148256, 0.1009509, -1.359549, 1, 0.6941177, 0, 1,
-1.147231, 0.5329615, -2.156718, 1, 0.7019608, 0, 1,
-1.143831, -1.740487, -2.896978, 1, 0.7098039, 0, 1,
-1.142742, 0.706785, -1.255154, 1, 0.7137255, 0, 1,
-1.14162, 0.3376279, -2.755986, 1, 0.7215686, 0, 1,
-1.134358, 0.8998992, 0.1506818, 1, 0.7254902, 0, 1,
-1.129281, 1.173089, -0.3090439, 1, 0.7333333, 0, 1,
-1.115978, 2.293339, -2.601387, 1, 0.7372549, 0, 1,
-1.113522, -1.15536, -3.320102, 1, 0.7450981, 0, 1,
-1.105922, 0.1763227, -0.6472164, 1, 0.7490196, 0, 1,
-1.104726, 1.208128, 0.1807664, 1, 0.7568628, 0, 1,
-1.100295, 1.678788, -0.2563945, 1, 0.7607843, 0, 1,
-1.099339, 1.605873, -0.5229663, 1, 0.7686275, 0, 1,
-1.092898, -0.09397738, -1.728498, 1, 0.772549, 0, 1,
-1.08439, 0.61835, -0.8799056, 1, 0.7803922, 0, 1,
-1.077719, 0.4792931, 1.131662, 1, 0.7843137, 0, 1,
-1.056004, -0.4595876, -3.113401, 1, 0.7921569, 0, 1,
-1.041561, 0.2137298, -1.53857, 1, 0.7960784, 0, 1,
-1.039213, -0.2889698, 0.06802844, 1, 0.8039216, 0, 1,
-1.039033, -1.787979, -2.180121, 1, 0.8117647, 0, 1,
-1.035824, 1.232323, 0.8582586, 1, 0.8156863, 0, 1,
-1.033331, 0.2469772, -0.5785364, 1, 0.8235294, 0, 1,
-1.031805, 0.3281836, -1.24589, 1, 0.827451, 0, 1,
-1.027774, -0.4396101, -2.041697, 1, 0.8352941, 0, 1,
-1.025256, 0.8021337, -0.8785503, 1, 0.8392157, 0, 1,
-1.023098, 0.6900617, 0.7540708, 1, 0.8470588, 0, 1,
-1.018773, -0.06602008, -3.424443, 1, 0.8509804, 0, 1,
-1.018105, -0.876768, -2.657076, 1, 0.8588235, 0, 1,
-1.010613, 3.063462, -0.3670813, 1, 0.8627451, 0, 1,
-1.010498, 1.035078, 0.5666527, 1, 0.8705882, 0, 1,
-1.009239, 1.101017, -0.972766, 1, 0.8745098, 0, 1,
-1.009142, -1.128618, -0.2968208, 1, 0.8823529, 0, 1,
-1.003056, 0.2926602, -2.303529, 1, 0.8862745, 0, 1,
-0.9956468, 1.566042, 1.025713, 1, 0.8941177, 0, 1,
-0.9951196, -0.02119847, -1.16408, 1, 0.8980392, 0, 1,
-0.9927899, 0.2277125, -2.639063, 1, 0.9058824, 0, 1,
-0.9850369, -0.1805916, -2.072135, 1, 0.9137255, 0, 1,
-0.9669614, 0.8803145, -0.09591042, 1, 0.9176471, 0, 1,
-0.966342, -0.5903541, -3.505068, 1, 0.9254902, 0, 1,
-0.9657888, 1.031592, -0.1722608, 1, 0.9294118, 0, 1,
-0.9636143, 0.1197084, -1.178866, 1, 0.9372549, 0, 1,
-0.9592239, -0.1708842, -1.678027, 1, 0.9411765, 0, 1,
-0.9457206, 0.6219291, -1.695716, 1, 0.9490196, 0, 1,
-0.943786, -0.4112617, -1.899749, 1, 0.9529412, 0, 1,
-0.9434333, 1.851395, 1.408395, 1, 0.9607843, 0, 1,
-0.941071, 0.3453452, -2.7361, 1, 0.9647059, 0, 1,
-0.938157, 0.9268862, 0.1236069, 1, 0.972549, 0, 1,
-0.9341198, -2.281931, -2.378036, 1, 0.9764706, 0, 1,
-0.9300358, 0.8404936, -0.1734031, 1, 0.9843137, 0, 1,
-0.9292461, -0.2709407, -1.324755, 1, 0.9882353, 0, 1,
-0.9292112, -0.4608968, -1.614704, 1, 0.9960784, 0, 1,
-0.9266312, 1.478474, -1.145642, 0.9960784, 1, 0, 1,
-0.9221976, -1.930752, -4.159861, 0.9921569, 1, 0, 1,
-0.9095572, -1.099643, -2.016282, 0.9843137, 1, 0, 1,
-0.9095109, 0.3897779, 0.2905415, 0.9803922, 1, 0, 1,
-0.9051707, -1.135511, -1.344641, 0.972549, 1, 0, 1,
-0.9045216, 1.053414, 0.004287138, 0.9686275, 1, 0, 1,
-0.9023007, 0.7429132, 0.4278381, 0.9607843, 1, 0, 1,
-0.8942008, 0.09710691, -2.237525, 0.9568627, 1, 0, 1,
-0.8932371, -0.06061883, -2.273975, 0.9490196, 1, 0, 1,
-0.8917132, 1.114501, -0.8837783, 0.945098, 1, 0, 1,
-0.8856785, -1.822803, -3.299585, 0.9372549, 1, 0, 1,
-0.8844873, -1.192256, -3.254353, 0.9333333, 1, 0, 1,
-0.8796831, 0.1756635, -3.585634, 0.9254902, 1, 0, 1,
-0.8771828, -0.8965046, -1.841399, 0.9215686, 1, 0, 1,
-0.8761346, -1.613532, -2.13784, 0.9137255, 1, 0, 1,
-0.8733343, 0.5216594, -0.00849506, 0.9098039, 1, 0, 1,
-0.8709726, -0.5159658, -2.692619, 0.9019608, 1, 0, 1,
-0.8658236, 0.4935708, -1.417298, 0.8941177, 1, 0, 1,
-0.8517392, 0.9368917, 0.02783223, 0.8901961, 1, 0, 1,
-0.8510098, -0.1573311, -1.40931, 0.8823529, 1, 0, 1,
-0.8509815, -0.2437462, -1.962834, 0.8784314, 1, 0, 1,
-0.8495449, 0.02765111, -0.6562736, 0.8705882, 1, 0, 1,
-0.8426528, -0.1639431, -0.6052902, 0.8666667, 1, 0, 1,
-0.842286, -1.125629, -2.901525, 0.8588235, 1, 0, 1,
-0.8315877, 1.322495, -1.140995, 0.854902, 1, 0, 1,
-0.8292, 0.6908773, -1.206684, 0.8470588, 1, 0, 1,
-0.8097389, -0.1554528, -1.691115, 0.8431373, 1, 0, 1,
-0.8061139, 0.9131628, -1.047928, 0.8352941, 1, 0, 1,
-0.7986708, 0.3465884, -1.157309, 0.8313726, 1, 0, 1,
-0.7985899, 0.6466848, -0.9487141, 0.8235294, 1, 0, 1,
-0.7969407, 0.8576994, -0.8501274, 0.8196079, 1, 0, 1,
-0.7927738, 0.03202358, -2.522267, 0.8117647, 1, 0, 1,
-0.7905802, -0.1174297, -0.8739979, 0.8078431, 1, 0, 1,
-0.7853081, 1.454213, -0.8526804, 0.8, 1, 0, 1,
-0.7833198, 1.746752, -0.8101808, 0.7921569, 1, 0, 1,
-0.7768007, -0.5291058, -2.72015, 0.7882353, 1, 0, 1,
-0.7726439, -0.5727454, -2.218219, 0.7803922, 1, 0, 1,
-0.7687154, 1.230688, -0.1276993, 0.7764706, 1, 0, 1,
-0.7646869, 0.6278263, -1.586177, 0.7686275, 1, 0, 1,
-0.7640275, 1.22299, 1.036748, 0.7647059, 1, 0, 1,
-0.7568327, -0.5370419, -1.557642, 0.7568628, 1, 0, 1,
-0.7523233, -1.227519, -2.289286, 0.7529412, 1, 0, 1,
-0.7499446, -0.0993079, -2.066303, 0.7450981, 1, 0, 1,
-0.7481957, -0.9333227, -2.894502, 0.7411765, 1, 0, 1,
-0.7398097, 0.1204535, -1.057534, 0.7333333, 1, 0, 1,
-0.7394221, 0.2447766, -0.8111063, 0.7294118, 1, 0, 1,
-0.7270792, 0.9128553, 1.813064, 0.7215686, 1, 0, 1,
-0.7234043, -1.027116, -4.882284, 0.7176471, 1, 0, 1,
-0.7232252, -0.3607241, -0.7558156, 0.7098039, 1, 0, 1,
-0.7217514, 0.3605271, -1.293079, 0.7058824, 1, 0, 1,
-0.713053, -1.155954, -4.432034, 0.6980392, 1, 0, 1,
-0.7098652, -0.3765828, -1.358809, 0.6901961, 1, 0, 1,
-0.7070848, -0.6137714, -4.165155, 0.6862745, 1, 0, 1,
-0.7069487, -1.321392, -1.154327, 0.6784314, 1, 0, 1,
-0.7029578, 1.086658, -2.297026, 0.6745098, 1, 0, 1,
-0.6948006, 0.1228426, -2.199614, 0.6666667, 1, 0, 1,
-0.6881615, -0.2198375, -4.953162, 0.6627451, 1, 0, 1,
-0.6874846, -1.92028, -3.145663, 0.654902, 1, 0, 1,
-0.68441, -1.194094, -2.934978, 0.6509804, 1, 0, 1,
-0.6840799, -0.9874004, -3.425495, 0.6431373, 1, 0, 1,
-0.6835666, -0.3431441, -2.559833, 0.6392157, 1, 0, 1,
-0.6829646, 0.299353, 2.281325, 0.6313726, 1, 0, 1,
-0.680829, 0.8914201, 1.202829, 0.627451, 1, 0, 1,
-0.6802147, 0.176699, 0.2063016, 0.6196079, 1, 0, 1,
-0.6772419, -0.1294262, -2.687581, 0.6156863, 1, 0, 1,
-0.6723037, 0.4443282, -0.7470651, 0.6078432, 1, 0, 1,
-0.6702495, 0.8357438, -0.2600088, 0.6039216, 1, 0, 1,
-0.6686519, 0.4254725, -0.07133468, 0.5960785, 1, 0, 1,
-0.6674993, -0.3344735, -4.09628, 0.5882353, 1, 0, 1,
-0.6656678, -0.3982502, -3.953042, 0.5843138, 1, 0, 1,
-0.6656467, -3.320633, -2.994857, 0.5764706, 1, 0, 1,
-0.6640873, -1.087608, -2.015018, 0.572549, 1, 0, 1,
-0.6628155, -1.515405, -2.401212, 0.5647059, 1, 0, 1,
-0.6620093, 0.2401705, -1.528947, 0.5607843, 1, 0, 1,
-0.6561164, -0.702487, -2.863598, 0.5529412, 1, 0, 1,
-0.650436, -0.3972823, -2.118235, 0.5490196, 1, 0, 1,
-0.6494614, -0.1848052, -2.495189, 0.5411765, 1, 0, 1,
-0.6479545, 0.3340102, -1.258419, 0.5372549, 1, 0, 1,
-0.6451872, 1.476565, -0.7523852, 0.5294118, 1, 0, 1,
-0.6429353, 2.775991, -0.02508302, 0.5254902, 1, 0, 1,
-0.6394096, 0.3891701, -0.4945511, 0.5176471, 1, 0, 1,
-0.6370205, -1.218088, -3.254429, 0.5137255, 1, 0, 1,
-0.634356, 0.08215274, -1.740353, 0.5058824, 1, 0, 1,
-0.6325564, 0.1838099, -3.117668, 0.5019608, 1, 0, 1,
-0.6323293, 0.7541682, -2.077115, 0.4941176, 1, 0, 1,
-0.6299527, -1.38817, -2.364163, 0.4862745, 1, 0, 1,
-0.6293806, -0.2677802, -2.124843, 0.4823529, 1, 0, 1,
-0.6173506, -1.436512, -3.565839, 0.4745098, 1, 0, 1,
-0.6077501, -1.001511, -3.412129, 0.4705882, 1, 0, 1,
-0.6020886, -0.2824873, -1.186193, 0.4627451, 1, 0, 1,
-0.6017494, 0.428258, 0.00861889, 0.4588235, 1, 0, 1,
-0.5892125, -0.04960088, -2.165951, 0.4509804, 1, 0, 1,
-0.5846952, 0.2906781, -2.181625, 0.4470588, 1, 0, 1,
-0.5826499, 1.330814, -1.892099, 0.4392157, 1, 0, 1,
-0.5815842, -0.8486397, -2.139266, 0.4352941, 1, 0, 1,
-0.5813791, -0.4609215, -2.335581, 0.427451, 1, 0, 1,
-0.5792332, -1.288036, -0.8394448, 0.4235294, 1, 0, 1,
-0.5766912, -0.09383745, -1.807269, 0.4156863, 1, 0, 1,
-0.5741564, 0.2106751, -0.930011, 0.4117647, 1, 0, 1,
-0.5740954, 2.507714, -0.1456066, 0.4039216, 1, 0, 1,
-0.5695155, 0.03777301, -1.506043, 0.3960784, 1, 0, 1,
-0.5684962, 0.2580154, -1.324413, 0.3921569, 1, 0, 1,
-0.5678694, -1.415271, -2.263073, 0.3843137, 1, 0, 1,
-0.5666724, 0.558643, -1.351365, 0.3803922, 1, 0, 1,
-0.5648222, -1.238955, -2.745231, 0.372549, 1, 0, 1,
-0.5640956, -1.171051, -0.4067479, 0.3686275, 1, 0, 1,
-0.5622203, 0.5357837, -2.480999, 0.3607843, 1, 0, 1,
-0.5592891, -0.5810099, -2.392404, 0.3568628, 1, 0, 1,
-0.5584065, 0.5222861, -1.400675, 0.3490196, 1, 0, 1,
-0.5566141, -0.07732536, -1.430259, 0.345098, 1, 0, 1,
-0.5557222, -0.07053101, -0.2721451, 0.3372549, 1, 0, 1,
-0.5556114, -1.888562, -3.353885, 0.3333333, 1, 0, 1,
-0.5523251, 0.3865166, 0.3576064, 0.3254902, 1, 0, 1,
-0.551864, -0.3584394, -1.212244, 0.3215686, 1, 0, 1,
-0.5491408, -0.5859538, -3.792864, 0.3137255, 1, 0, 1,
-0.5405985, -0.6201121, -2.578635, 0.3098039, 1, 0, 1,
-0.5402121, -1.338555, -2.846542, 0.3019608, 1, 0, 1,
-0.5386957, -0.36167, -2.631988, 0.2941177, 1, 0, 1,
-0.5379162, -1.616037, -3.001014, 0.2901961, 1, 0, 1,
-0.5368159, -0.1329519, -0.4135294, 0.282353, 1, 0, 1,
-0.527638, 0.09365331, -0.1252722, 0.2784314, 1, 0, 1,
-0.5264238, -1.555367, -3.442463, 0.2705882, 1, 0, 1,
-0.5258607, 0.8662386, 0.5426236, 0.2666667, 1, 0, 1,
-0.5250076, -0.6000469, -4.960226, 0.2588235, 1, 0, 1,
-0.5231495, 0.3666288, -0.7010656, 0.254902, 1, 0, 1,
-0.5211416, 1.154652, -0.03539836, 0.2470588, 1, 0, 1,
-0.5207089, -0.5408289, -0.8395096, 0.2431373, 1, 0, 1,
-0.517312, 0.9185215, -0.892265, 0.2352941, 1, 0, 1,
-0.5161909, 1.584365, -1.693245, 0.2313726, 1, 0, 1,
-0.5126489, -1.371374, -1.805334, 0.2235294, 1, 0, 1,
-0.5076619, 0.3612522, -2.237704, 0.2196078, 1, 0, 1,
-0.5064914, 0.8225545, -2.873031, 0.2117647, 1, 0, 1,
-0.5048946, 0.3056898, -1.993946, 0.2078431, 1, 0, 1,
-0.5042714, 0.3874491, -2.99369, 0.2, 1, 0, 1,
-0.504162, -0.2861471, -1.553832, 0.1921569, 1, 0, 1,
-0.4998803, -0.7356688, -2.930428, 0.1882353, 1, 0, 1,
-0.4989329, -0.1446682, -1.386412, 0.1803922, 1, 0, 1,
-0.4987059, 0.4009003, -2.145881, 0.1764706, 1, 0, 1,
-0.4960549, 0.1671895, -0.93937, 0.1686275, 1, 0, 1,
-0.4935967, -1.276038, -2.671216, 0.1647059, 1, 0, 1,
-0.4934246, 0.5981874, -0.4255343, 0.1568628, 1, 0, 1,
-0.4889361, -0.887776, -3.049903, 0.1529412, 1, 0, 1,
-0.4887845, 0.7281463, -0.6444533, 0.145098, 1, 0, 1,
-0.4876173, 0.5662994, -1.300142, 0.1411765, 1, 0, 1,
-0.4858225, 0.6558859, -2.147286, 0.1333333, 1, 0, 1,
-0.4839396, -0.1662558, -1.008189, 0.1294118, 1, 0, 1,
-0.4831941, -1.687088, -3.888781, 0.1215686, 1, 0, 1,
-0.4753819, -2.321208, -1.830427, 0.1176471, 1, 0, 1,
-0.4703032, 0.2959835, -1.018466, 0.1098039, 1, 0, 1,
-0.4631293, -1.589169, -2.127193, 0.1058824, 1, 0, 1,
-0.4595633, 0.2337962, -0.5910535, 0.09803922, 1, 0, 1,
-0.4591363, 0.9353262, -0.1332879, 0.09019608, 1, 0, 1,
-0.456535, 0.6168301, 0.905485, 0.08627451, 1, 0, 1,
-0.45556, -0.472173, -1.93079, 0.07843138, 1, 0, 1,
-0.4461065, -1.35319, -4.597727, 0.07450981, 1, 0, 1,
-0.437595, 0.8030955, -0.2853772, 0.06666667, 1, 0, 1,
-0.4343814, -1.132583, -3.636388, 0.0627451, 1, 0, 1,
-0.4322558, 1.859882, 0.1192562, 0.05490196, 1, 0, 1,
-0.4300867, -0.3826407, -2.521163, 0.05098039, 1, 0, 1,
-0.4266379, 0.04147108, -2.12126, 0.04313726, 1, 0, 1,
-0.4253445, -0.2032185, -1.520468, 0.03921569, 1, 0, 1,
-0.4250765, -0.6000248, -0.8657405, 0.03137255, 1, 0, 1,
-0.420903, -1.332996, -3.427505, 0.02745098, 1, 0, 1,
-0.4205587, 1.186998, -0.2023499, 0.01960784, 1, 0, 1,
-0.4166637, 1.507083, 0.5599822, 0.01568628, 1, 0, 1,
-0.4143547, -1.192828, -3.161965, 0.007843138, 1, 0, 1,
-0.408772, -0.5592172, -2.040384, 0.003921569, 1, 0, 1,
-0.4064636, -1.725424, -2.571382, 0, 1, 0.003921569, 1,
-0.405621, 1.09151, -0.8042813, 0, 1, 0.01176471, 1,
-0.4044226, 1.61072, 1.344735, 0, 1, 0.01568628, 1,
-0.4011356, 2.328261, 2.410227, 0, 1, 0.02352941, 1,
-0.3932214, 0.380922, -1.092921, 0, 1, 0.02745098, 1,
-0.3926905, 0.1034467, -1.002379, 0, 1, 0.03529412, 1,
-0.3925927, 0.3009663, -0.3709786, 0, 1, 0.03921569, 1,
-0.3923539, -0.06754733, -1.165098, 0, 1, 0.04705882, 1,
-0.3899734, -1.075132, -5.028967, 0, 1, 0.05098039, 1,
-0.3898117, -0.3263474, -1.857162, 0, 1, 0.05882353, 1,
-0.3858283, -1.688292, -2.976727, 0, 1, 0.0627451, 1,
-0.3855179, 0.6687813, -0.6167753, 0, 1, 0.07058824, 1,
-0.3809353, -1.31531, -3.191289, 0, 1, 0.07450981, 1,
-0.3791529, 0.6534142, -0.9510299, 0, 1, 0.08235294, 1,
-0.3787576, 1.424695, 1.205648, 0, 1, 0.08627451, 1,
-0.3650548, -0.7732767, -3.849538, 0, 1, 0.09411765, 1,
-0.3635319, -1.47096, -2.883403, 0, 1, 0.1019608, 1,
-0.3615368, -0.4669684, -3.45947, 0, 1, 0.1058824, 1,
-0.3580711, -0.09161667, -3.40646, 0, 1, 0.1137255, 1,
-0.3560674, 0.3084126, -1.422554, 0, 1, 0.1176471, 1,
-0.3522574, 0.04946597, -2.047659, 0, 1, 0.1254902, 1,
-0.3510289, 0.5119038, 0.6584972, 0, 1, 0.1294118, 1,
-0.3467843, 1.046944, 0.1382639, 0, 1, 0.1372549, 1,
-0.3462024, -0.2980435, -4.24074, 0, 1, 0.1411765, 1,
-0.3456635, -1.588885, -2.837971, 0, 1, 0.1490196, 1,
-0.3417074, -1.380462, -1.619759, 0, 1, 0.1529412, 1,
-0.3405582, -0.2443101, -1.9505, 0, 1, 0.1607843, 1,
-0.339288, -2.088452, -3.369295, 0, 1, 0.1647059, 1,
-0.3391335, 0.4391178, -1.136363, 0, 1, 0.172549, 1,
-0.3354201, 1.177938, 0.9726712, 0, 1, 0.1764706, 1,
-0.333581, 1.897108, -0.1531575, 0, 1, 0.1843137, 1,
-0.329562, -0.1362974, -2.912185, 0, 1, 0.1882353, 1,
-0.3291622, 0.9564968, -2.106581, 0, 1, 0.1960784, 1,
-0.3280724, -0.04305351, -0.1644178, 0, 1, 0.2039216, 1,
-0.3273399, 0.7561585, 1.183628, 0, 1, 0.2078431, 1,
-0.3216631, 1.348409, 0.7634856, 0, 1, 0.2156863, 1,
-0.3214158, 0.8183173, -0.7968274, 0, 1, 0.2196078, 1,
-0.3195561, 0.6535348, -1.001021, 0, 1, 0.227451, 1,
-0.3169081, 0.2015657, -1.536471, 0, 1, 0.2313726, 1,
-0.3167101, 0.0519411, -1.585829, 0, 1, 0.2392157, 1,
-0.3159538, -0.3000865, -2.779925, 0, 1, 0.2431373, 1,
-0.3097444, -2.135705, -2.904122, 0, 1, 0.2509804, 1,
-0.3096861, 1.000552, -0.6224683, 0, 1, 0.254902, 1,
-0.3091908, -0.773625, -2.712758, 0, 1, 0.2627451, 1,
-0.3054287, -1.63835, -2.883005, 0, 1, 0.2666667, 1,
-0.3044137, 0.2259108, -0.8278046, 0, 1, 0.2745098, 1,
-0.3031695, 0.7220312, -0.05623164, 0, 1, 0.2784314, 1,
-0.3021534, 0.532684, -0.4116063, 0, 1, 0.2862745, 1,
-0.3021209, -0.03976928, -1.901114, 0, 1, 0.2901961, 1,
-0.3021186, -1.347199, -2.100348, 0, 1, 0.2980392, 1,
-0.3017316, -0.3629441, -1.887494, 0, 1, 0.3058824, 1,
-0.3014841, -0.4456909, -2.637331, 0, 1, 0.3098039, 1,
-0.2918932, 0.7254759, -0.6817117, 0, 1, 0.3176471, 1,
-0.2912853, 0.0425368, -0.8777468, 0, 1, 0.3215686, 1,
-0.2907769, -0.4883136, -2.569004, 0, 1, 0.3294118, 1,
-0.2879028, -0.8446378, -2.725592, 0, 1, 0.3333333, 1,
-0.2842932, -0.04696659, -1.442203, 0, 1, 0.3411765, 1,
-0.2840557, 0.9044981, -1.452655, 0, 1, 0.345098, 1,
-0.2838944, 0.7362479, -1.014539, 0, 1, 0.3529412, 1,
-0.2824331, 1.045256, -0.1060529, 0, 1, 0.3568628, 1,
-0.2817987, -0.5917657, -1.540991, 0, 1, 0.3647059, 1,
-0.2762341, -0.3520138, -1.537193, 0, 1, 0.3686275, 1,
-0.2674446, 0.4478862, 1.384076, 0, 1, 0.3764706, 1,
-0.2665124, 0.2245913, 1.324892, 0, 1, 0.3803922, 1,
-0.265817, -0.2306938, -3.144855, 0, 1, 0.3882353, 1,
-0.2646039, -0.4227428, -1.011937, 0, 1, 0.3921569, 1,
-0.2645129, 0.3403307, -2.889972, 0, 1, 0.4, 1,
-0.2597923, 1.749964, 0.6151842, 0, 1, 0.4078431, 1,
-0.2550543, 1.445206, -1.203911, 0, 1, 0.4117647, 1,
-0.2527258, 0.4641931, -1.015182, 0, 1, 0.4196078, 1,
-0.2521125, -1.830672, -3.709939, 0, 1, 0.4235294, 1,
-0.2514004, -0.1473024, -0.1044794, 0, 1, 0.4313726, 1,
-0.2471528, -0.1267768, -2.405103, 0, 1, 0.4352941, 1,
-0.2413502, 0.5133255, -0.4782971, 0, 1, 0.4431373, 1,
-0.2313163, 0.752069, 1.870973, 0, 1, 0.4470588, 1,
-0.2281382, 0.09236437, -2.456999, 0, 1, 0.454902, 1,
-0.2277796, -1.247301, -3.141188, 0, 1, 0.4588235, 1,
-0.2249773, -1.35669, -2.13117, 0, 1, 0.4666667, 1,
-0.2237244, -0.08726964, -1.758739, 0, 1, 0.4705882, 1,
-0.2224877, 0.03082426, -0.3612577, 0, 1, 0.4784314, 1,
-0.2160043, -0.3896423, -2.843878, 0, 1, 0.4823529, 1,
-0.2101399, 0.2514984, -0.8970856, 0, 1, 0.4901961, 1,
-0.2082228, 0.08052568, -1.108142, 0, 1, 0.4941176, 1,
-0.2050848, 0.3109058, -1.220053, 0, 1, 0.5019608, 1,
-0.1943037, -0.1213743, -4.327385, 0, 1, 0.509804, 1,
-0.1937348, -0.2851235, -3.15957, 0, 1, 0.5137255, 1,
-0.1922445, -1.204318, -2.595912, 0, 1, 0.5215687, 1,
-0.1907541, -0.2654821, -3.402322, 0, 1, 0.5254902, 1,
-0.1872617, 0.3405651, -2.136365, 0, 1, 0.5333334, 1,
-0.1833705, -0.3376281, -1.402992, 0, 1, 0.5372549, 1,
-0.1795507, -0.5891463, -2.635023, 0, 1, 0.5450981, 1,
-0.1765253, -0.7032074, -2.775911, 0, 1, 0.5490196, 1,
-0.1762824, -1.148221, -2.071048, 0, 1, 0.5568628, 1,
-0.1749648, -1.355141, -2.066133, 0, 1, 0.5607843, 1,
-0.1702876, -1.16743, -1.688976, 0, 1, 0.5686275, 1,
-0.1682699, -0.7025276, -2.592026, 0, 1, 0.572549, 1,
-0.163783, 1.55293, 0.05581176, 0, 1, 0.5803922, 1,
-0.1636235, 1.421598, -0.3663343, 0, 1, 0.5843138, 1,
-0.1616759, -0.03035006, -1.120567, 0, 1, 0.5921569, 1,
-0.1540913, -1.457059, -2.096598, 0, 1, 0.5960785, 1,
-0.153851, -1.464689, -4.035004, 0, 1, 0.6039216, 1,
-0.1521178, 0.24288, -1.276305, 0, 1, 0.6117647, 1,
-0.1456752, 0.4229196, 0.1821928, 0, 1, 0.6156863, 1,
-0.1428605, 1.041626, 0.5815511, 0, 1, 0.6235294, 1,
-0.1426218, -1.283957, -2.134555, 0, 1, 0.627451, 1,
-0.1423964, 0.4353841, -0.1842637, 0, 1, 0.6352941, 1,
-0.1422058, 1.818796, 0.4355709, 0, 1, 0.6392157, 1,
-0.1379004, 0.1873778, -1.196866, 0, 1, 0.6470588, 1,
-0.1345968, -0.2456218, -4.821895, 0, 1, 0.6509804, 1,
-0.1233157, 0.7347878, 0.9644125, 0, 1, 0.6588235, 1,
-0.121546, -1.731727, -3.499687, 0, 1, 0.6627451, 1,
-0.1179236, -0.5973455, -1.310753, 0, 1, 0.6705883, 1,
-0.1153091, 1.327232, 1.207933, 0, 1, 0.6745098, 1,
-0.1148503, -1.755288, -2.84393, 0, 1, 0.682353, 1,
-0.1000878, 1.724793, -0.04730354, 0, 1, 0.6862745, 1,
-0.09953916, -0.9098828, -2.003768, 0, 1, 0.6941177, 1,
-0.09825698, -1.238157, -4.753245, 0, 1, 0.7019608, 1,
-0.09764473, -1.043836, -2.469076, 0, 1, 0.7058824, 1,
-0.09752388, 0.8695378, 1.482517, 0, 1, 0.7137255, 1,
-0.08778937, -1.604312, -3.463674, 0, 1, 0.7176471, 1,
-0.08532222, 0.7136448, 0.09826087, 0, 1, 0.7254902, 1,
-0.08346549, -1.576821, -3.73364, 0, 1, 0.7294118, 1,
-0.07969398, 0.5706517, -1.876774, 0, 1, 0.7372549, 1,
-0.07522295, 1.284358, 0.6458711, 0, 1, 0.7411765, 1,
-0.07402011, 0.5000857, 0.4920593, 0, 1, 0.7490196, 1,
-0.06886555, -0.8455164, -3.334335, 0, 1, 0.7529412, 1,
-0.06689378, -1.024651, -1.493906, 0, 1, 0.7607843, 1,
-0.06453347, 0.3190667, 0.5770365, 0, 1, 0.7647059, 1,
-0.0615142, -0.9141155, -4.316408, 0, 1, 0.772549, 1,
-0.05814304, -0.4183181, -2.080641, 0, 1, 0.7764706, 1,
-0.05633726, -0.5574307, -4.519916, 0, 1, 0.7843137, 1,
-0.05352638, -1.508506, -3.20581, 0, 1, 0.7882353, 1,
-0.05046565, 0.1512147, -0.1937103, 0, 1, 0.7960784, 1,
-0.04880334, -0.2174395, -4.139923, 0, 1, 0.8039216, 1,
-0.04502784, -0.8161385, -3.747678, 0, 1, 0.8078431, 1,
-0.04314927, 1.012676, 0.1537631, 0, 1, 0.8156863, 1,
-0.04297462, 0.5117102, 0.4365644, 0, 1, 0.8196079, 1,
-0.04277471, -0.1836284, -2.380953, 0, 1, 0.827451, 1,
-0.04140703, -1.163266, -4.215149, 0, 1, 0.8313726, 1,
-0.04064046, 0.9465237, -0.2662224, 0, 1, 0.8392157, 1,
-0.04018081, 1.693934, -0.4790609, 0, 1, 0.8431373, 1,
-0.03846117, 0.3524044, 0.004920263, 0, 1, 0.8509804, 1,
-0.03694273, -1.276005, -2.034255, 0, 1, 0.854902, 1,
-0.03690139, 0.5829017, -0.401598, 0, 1, 0.8627451, 1,
-0.03030842, 0.3845745, -1.651573, 0, 1, 0.8666667, 1,
-0.02565573, 0.1516028, -1.163136, 0, 1, 0.8745098, 1,
-0.02016901, 0.8120821, -1.804872, 0, 1, 0.8784314, 1,
-0.01888826, 1.185686, -0.7884395, 0, 1, 0.8862745, 1,
-0.0142035, 0.791484, -0.3293118, 0, 1, 0.8901961, 1,
-0.007675488, -0.3970748, -2.356622, 0, 1, 0.8980392, 1,
-0.006700426, 0.9201752, 0.7931711, 0, 1, 0.9058824, 1,
-0.003456754, 0.2698886, 0.6188533, 0, 1, 0.9098039, 1,
0.002577467, -2.475025, 1.659832, 0, 1, 0.9176471, 1,
0.004062307, -0.9798761, 3.247507, 0, 1, 0.9215686, 1,
0.00444163, 1.995551, -1.792215, 0, 1, 0.9294118, 1,
0.005171235, -0.1091961, 3.804976, 0, 1, 0.9333333, 1,
0.00806316, -1.03629, 3.816881, 0, 1, 0.9411765, 1,
0.009268459, -0.3918414, 2.391301, 0, 1, 0.945098, 1,
0.009920579, -0.4176224, 2.766484, 0, 1, 0.9529412, 1,
0.01073332, 1.382665, 0.8776059, 0, 1, 0.9568627, 1,
0.01442192, 0.2626554, 0.9544562, 0, 1, 0.9647059, 1,
0.01453845, 0.7576918, 0.2029518, 0, 1, 0.9686275, 1,
0.02145771, 0.5619884, 0.1957581, 0, 1, 0.9764706, 1,
0.02254149, -1.66207, 4.126952, 0, 1, 0.9803922, 1,
0.02308211, 2.005111, -0.2123737, 0, 1, 0.9882353, 1,
0.02634289, 0.3146631, 1.158707, 0, 1, 0.9921569, 1,
0.02923764, 0.2952788, -0.09390033, 0, 1, 1, 1,
0.03058959, -0.1216553, 3.952303, 0, 0.9921569, 1, 1,
0.03298771, -0.6112799, 3.039735, 0, 0.9882353, 1, 1,
0.03403525, 0.05708251, 0.1334166, 0, 0.9803922, 1, 1,
0.03731649, -2.096485, 2.572966, 0, 0.9764706, 1, 1,
0.0375342, 1.955811, 0.1193103, 0, 0.9686275, 1, 1,
0.03756662, -0.4597369, 4.473965, 0, 0.9647059, 1, 1,
0.03958521, -0.8677895, 4.093924, 0, 0.9568627, 1, 1,
0.04053191, -1.239244, 3.825727, 0, 0.9529412, 1, 1,
0.04526074, -0.2753154, 2.482073, 0, 0.945098, 1, 1,
0.04620185, 0.449099, 0.4337813, 0, 0.9411765, 1, 1,
0.04855921, -1.046119, 2.471992, 0, 0.9333333, 1, 1,
0.05609582, -0.3744093, 2.267515, 0, 0.9294118, 1, 1,
0.05742587, 0.3521722, -0.5393277, 0, 0.9215686, 1, 1,
0.05956725, 0.8930505, 1.294003, 0, 0.9176471, 1, 1,
0.05989937, -0.5634143, 3.733803, 0, 0.9098039, 1, 1,
0.06279514, -0.0007933525, 1.730177, 0, 0.9058824, 1, 1,
0.06451813, 0.6478373, 0.5704194, 0, 0.8980392, 1, 1,
0.066862, -1.292672, 4.226331, 0, 0.8901961, 1, 1,
0.06720234, -0.97346, 3.296134, 0, 0.8862745, 1, 1,
0.07375336, -1.629129, 1.313396, 0, 0.8784314, 1, 1,
0.07537219, -0.7450461, 4.137202, 0, 0.8745098, 1, 1,
0.07682804, 3.008156, -0.8882173, 0, 0.8666667, 1, 1,
0.07729126, 0.6906747, -0.6751313, 0, 0.8627451, 1, 1,
0.0813324, -0.6009047, 3.069043, 0, 0.854902, 1, 1,
0.08411714, -1.811894, 3.320065, 0, 0.8509804, 1, 1,
0.0841191, 0.5569593, 1.074112, 0, 0.8431373, 1, 1,
0.08423542, -2.168263, 2.098223, 0, 0.8392157, 1, 1,
0.08446361, 0.188432, 0.1428234, 0, 0.8313726, 1, 1,
0.08618867, -0.3799032, 1.973439, 0, 0.827451, 1, 1,
0.09001755, -0.653612, 1.241972, 0, 0.8196079, 1, 1,
0.09175399, -1.30603, 2.512126, 0, 0.8156863, 1, 1,
0.09205555, -0.1704745, 2.126957, 0, 0.8078431, 1, 1,
0.09477219, 0.5067608, -1.609845, 0, 0.8039216, 1, 1,
0.0964134, -1.00247, 2.063136, 0, 0.7960784, 1, 1,
0.09834647, 0.1924382, 0.1258826, 0, 0.7882353, 1, 1,
0.1015321, -0.4467541, 3.512922, 0, 0.7843137, 1, 1,
0.10189, -0.8176451, 3.675815, 0, 0.7764706, 1, 1,
0.1025516, -1.02121, 3.094588, 0, 0.772549, 1, 1,
0.1033299, 0.03183191, 0.2286135, 0, 0.7647059, 1, 1,
0.1099484, 0.6259068, -1.150171, 0, 0.7607843, 1, 1,
0.1176678, -0.003941271, 0.3562466, 0, 0.7529412, 1, 1,
0.1272237, 0.02114619, -0.2024486, 0, 0.7490196, 1, 1,
0.1283315, -0.4616823, 2.430536, 0, 0.7411765, 1, 1,
0.1286568, 0.9351122, 1.682031, 0, 0.7372549, 1, 1,
0.1324741, 0.1085875, 0.4031818, 0, 0.7294118, 1, 1,
0.1369157, -0.4784599, 1.875826, 0, 0.7254902, 1, 1,
0.1398334, -1.45214, 2.616723, 0, 0.7176471, 1, 1,
0.1410855, -0.4714384, 3.093901, 0, 0.7137255, 1, 1,
0.1419147, -0.7073991, 4.489461, 0, 0.7058824, 1, 1,
0.1447912, -0.1756569, -0.0118145, 0, 0.6980392, 1, 1,
0.1485803, 1.280845, -1.423286, 0, 0.6941177, 1, 1,
0.1486185, 1.183633, -1.281908, 0, 0.6862745, 1, 1,
0.151613, -0.6287044, 2.670666, 0, 0.682353, 1, 1,
0.1559071, -1.045438, 3.054611, 0, 0.6745098, 1, 1,
0.1600873, 0.3955858, 0.5223036, 0, 0.6705883, 1, 1,
0.1607339, 0.8827044, -0.6376166, 0, 0.6627451, 1, 1,
0.1642639, -0.4048839, 1.791752, 0, 0.6588235, 1, 1,
0.1668082, -1.108092, 1.864445, 0, 0.6509804, 1, 1,
0.1740148, -0.9761395, 2.543156, 0, 0.6470588, 1, 1,
0.1764429, -0.5153819, 1.969961, 0, 0.6392157, 1, 1,
0.1784346, -0.5266589, 2.916831, 0, 0.6352941, 1, 1,
0.1832263, 1.51858, 1.279754, 0, 0.627451, 1, 1,
0.1866121, -2.365197, 1.285757, 0, 0.6235294, 1, 1,
0.1874735, -0.5296457, 4.539306, 0, 0.6156863, 1, 1,
0.1917842, -0.09872475, 3.607965, 0, 0.6117647, 1, 1,
0.1927627, -0.09539147, 2.429451, 0, 0.6039216, 1, 1,
0.1949987, -0.8886064, 3.369022, 0, 0.5960785, 1, 1,
0.1986646, -0.1210282, 3.678874, 0, 0.5921569, 1, 1,
0.201171, 0.4033265, -0.486511, 0, 0.5843138, 1, 1,
0.2050719, 0.2333422, 1.015324, 0, 0.5803922, 1, 1,
0.210211, 0.6183876, -1.021873, 0, 0.572549, 1, 1,
0.2143596, 2.209296, 0.2396325, 0, 0.5686275, 1, 1,
0.216026, 0.6513996, 0.3644163, 0, 0.5607843, 1, 1,
0.2273895, -0.03704925, 0.603717, 0, 0.5568628, 1, 1,
0.229857, 0.05434816, 0.8667422, 0, 0.5490196, 1, 1,
0.2328769, 0.7221273, 0.248806, 0, 0.5450981, 1, 1,
0.2341488, 0.8394037, 0.6151008, 0, 0.5372549, 1, 1,
0.2358436, -0.2470139, 0.6249715, 0, 0.5333334, 1, 1,
0.2363643, 0.6376925, -0.5425641, 0, 0.5254902, 1, 1,
0.2423016, -0.2513936, 2.733479, 0, 0.5215687, 1, 1,
0.2423393, -0.6389271, 2.043708, 0, 0.5137255, 1, 1,
0.2480022, -1.915533, 3.632461, 0, 0.509804, 1, 1,
0.2493021, 0.2599647, 2.420599, 0, 0.5019608, 1, 1,
0.2540781, -0.283458, 2.151848, 0, 0.4941176, 1, 1,
0.2575469, -0.8538135, 2.189702, 0, 0.4901961, 1, 1,
0.2580045, 0.6041004, -0.02048167, 0, 0.4823529, 1, 1,
0.2603848, -0.8491632, 2.432932, 0, 0.4784314, 1, 1,
0.2628599, 1.48125, -0.4022497, 0, 0.4705882, 1, 1,
0.2745331, 0.343067, 0.7031378, 0, 0.4666667, 1, 1,
0.274773, 0.3467371, 0.6894925, 0, 0.4588235, 1, 1,
0.2753105, -0.5671437, 4.328072, 0, 0.454902, 1, 1,
0.2762276, -0.2840782, 2.503304, 0, 0.4470588, 1, 1,
0.2766509, 1.31203, 0.7094067, 0, 0.4431373, 1, 1,
0.2776136, 0.3067507, 0.541577, 0, 0.4352941, 1, 1,
0.2816315, -0.3659307, 2.9956, 0, 0.4313726, 1, 1,
0.2827299, -1.317179, 3.301538, 0, 0.4235294, 1, 1,
0.2844996, -0.3743016, 2.1329, 0, 0.4196078, 1, 1,
0.2850085, 0.14915, -0.9698861, 0, 0.4117647, 1, 1,
0.2874618, 0.3747785, 3.23052, 0, 0.4078431, 1, 1,
0.2890891, -0.5180628, 2.372498, 0, 0.4, 1, 1,
0.2918284, 1.044189, -0.2746396, 0, 0.3921569, 1, 1,
0.2981832, 0.7231451, 0.4090946, 0, 0.3882353, 1, 1,
0.3002496, 0.4502156, 0.4220428, 0, 0.3803922, 1, 1,
0.3039792, -0.3327536, 2.852245, 0, 0.3764706, 1, 1,
0.3067242, 0.2436567, 0.839588, 0, 0.3686275, 1, 1,
0.3073786, -1.005042, 3.258884, 0, 0.3647059, 1, 1,
0.3135073, 0.5796411, 1.098499, 0, 0.3568628, 1, 1,
0.3185838, 0.06140354, 0.2387467, 0, 0.3529412, 1, 1,
0.3207348, -1.028501, 1.820707, 0, 0.345098, 1, 1,
0.3336913, -0.3256926, 2.072675, 0, 0.3411765, 1, 1,
0.3341856, 0.2723091, 1.594298, 0, 0.3333333, 1, 1,
0.3417523, -1.662695, 2.098346, 0, 0.3294118, 1, 1,
0.3470663, -0.1998534, 2.872953, 0, 0.3215686, 1, 1,
0.3495437, -2.366953, 3.405785, 0, 0.3176471, 1, 1,
0.3499109, -0.1766739, 1.219223, 0, 0.3098039, 1, 1,
0.3517728, 1.914793, 1.019318, 0, 0.3058824, 1, 1,
0.3523388, -0.6001247, 4.45113, 0, 0.2980392, 1, 1,
0.3534587, 1.019476, 0.2717084, 0, 0.2901961, 1, 1,
0.3571958, -1.557649, 2.001463, 0, 0.2862745, 1, 1,
0.3576697, 0.2343419, 1.698631, 0, 0.2784314, 1, 1,
0.3600882, 1.260233, -0.02554282, 0, 0.2745098, 1, 1,
0.3641096, -1.058227, 2.797549, 0, 0.2666667, 1, 1,
0.3647945, -0.4575857, 0.6110289, 0, 0.2627451, 1, 1,
0.3666175, -0.7801904, 3.230339, 0, 0.254902, 1, 1,
0.3704332, -0.87505, 2.693687, 0, 0.2509804, 1, 1,
0.3742998, 1.272053, 0.9765952, 0, 0.2431373, 1, 1,
0.374638, 0.4431762, -1.010173, 0, 0.2392157, 1, 1,
0.3765722, 0.5995347, 1.285852, 0, 0.2313726, 1, 1,
0.3787659, -1.453609, 3.010633, 0, 0.227451, 1, 1,
0.380405, 0.7122394, 0.8911674, 0, 0.2196078, 1, 1,
0.3834773, -1.179792, 3.435548, 0, 0.2156863, 1, 1,
0.3878964, 1.773562, 0.1008136, 0, 0.2078431, 1, 1,
0.3899838, 0.6057607, 0.02577892, 0, 0.2039216, 1, 1,
0.3918726, 0.9507014, 0.5631043, 0, 0.1960784, 1, 1,
0.3920415, -0.8355739, 2.866579, 0, 0.1882353, 1, 1,
0.3935043, -1.062145, 4.595383, 0, 0.1843137, 1, 1,
0.3964957, -0.3830366, 1.96984, 0, 0.1764706, 1, 1,
0.3969822, 0.01715908, 1.734556, 0, 0.172549, 1, 1,
0.4046928, -1.784071, 3.448288, 0, 0.1647059, 1, 1,
0.4047673, -0.2002663, 2.388684, 0, 0.1607843, 1, 1,
0.4067937, 0.1103607, 1.799989, 0, 0.1529412, 1, 1,
0.4105928, 0.749898, 0.9575622, 0, 0.1490196, 1, 1,
0.4132469, -2.362112, 1.882143, 0, 0.1411765, 1, 1,
0.4160133, -1.769614, 2.448928, 0, 0.1372549, 1, 1,
0.4215689, 0.01473036, 3.297231, 0, 0.1294118, 1, 1,
0.4235545, -1.076354, 1.195962, 0, 0.1254902, 1, 1,
0.4244745, 0.6405026, 1.078107, 0, 0.1176471, 1, 1,
0.4254732, -0.01844833, 1.950212, 0, 0.1137255, 1, 1,
0.429848, -0.446557, 1.998596, 0, 0.1058824, 1, 1,
0.4327273, 1.148818, 1.649584, 0, 0.09803922, 1, 1,
0.4379649, 1.668648, -1.562547, 0, 0.09411765, 1, 1,
0.4482542, -1.020341, 2.237167, 0, 0.08627451, 1, 1,
0.458957, 0.1867083, 0.2512251, 0, 0.08235294, 1, 1,
0.4594418, 0.5111875, -0.08113176, 0, 0.07450981, 1, 1,
0.4619394, -0.1607127, 1.5811, 0, 0.07058824, 1, 1,
0.4628944, 0.6475494, 2.002337, 0, 0.0627451, 1, 1,
0.4633386, -0.3203439, -0.05203659, 0, 0.05882353, 1, 1,
0.4640267, 1.128042, -0.1752332, 0, 0.05098039, 1, 1,
0.4643074, -1.805896, 2.602655, 0, 0.04705882, 1, 1,
0.4655552, -0.6228694, 2.292936, 0, 0.03921569, 1, 1,
0.4673083, 1.278128, 0.4672092, 0, 0.03529412, 1, 1,
0.4685128, 1.117398, 0.0487767, 0, 0.02745098, 1, 1,
0.4687935, 0.6191536, 0.8175964, 0, 0.02352941, 1, 1,
0.4725408, -0.7774059, 3.894256, 0, 0.01568628, 1, 1,
0.4726657, -0.997209, 5.172241, 0, 0.01176471, 1, 1,
0.4745391, -0.8485221, 2.645543, 0, 0.003921569, 1, 1,
0.4801885, -0.9216812, 2.389841, 0.003921569, 0, 1, 1,
0.482018, 2.621956, -1.130648, 0.007843138, 0, 1, 1,
0.4879308, 0.01587157, 2.534431, 0.01568628, 0, 1, 1,
0.4888986, 1.591805, 0.03777069, 0.01960784, 0, 1, 1,
0.4892438, -0.8837901, 3.369328, 0.02745098, 0, 1, 1,
0.4897881, -0.5421637, 2.276199, 0.03137255, 0, 1, 1,
0.491817, 0.131065, 1.020129, 0.03921569, 0, 1, 1,
0.4952659, 0.3076055, 3.639244, 0.04313726, 0, 1, 1,
0.4981818, -0.7214749, 0.6167948, 0.05098039, 0, 1, 1,
0.4985531, -1.766384, 3.531743, 0.05490196, 0, 1, 1,
0.4990973, 0.4116795, 1.527467, 0.0627451, 0, 1, 1,
0.5002589, 0.3632004, 1.512277, 0.06666667, 0, 1, 1,
0.5005519, -1.946682, 3.421435, 0.07450981, 0, 1, 1,
0.5039563, -0.5881352, 2.052744, 0.07843138, 0, 1, 1,
0.504608, -0.09399013, 0.5374441, 0.08627451, 0, 1, 1,
0.5047636, -1.236951, 4.540044, 0.09019608, 0, 1, 1,
0.5056409, 0.0378984, 1.774812, 0.09803922, 0, 1, 1,
0.5062891, -0.2755032, 2.879885, 0.1058824, 0, 1, 1,
0.5077981, -1.139154, 3.316554, 0.1098039, 0, 1, 1,
0.5097147, -0.5093982, 1.971365, 0.1176471, 0, 1, 1,
0.513078, -1.430116, 2.09997, 0.1215686, 0, 1, 1,
0.514573, -1.255338, 2.537397, 0.1294118, 0, 1, 1,
0.517132, -1.82807, 1.453722, 0.1333333, 0, 1, 1,
0.5219786, -0.3935983, 2.068305, 0.1411765, 0, 1, 1,
0.5223506, 0.09480859, 0.8458883, 0.145098, 0, 1, 1,
0.5256028, -0.5263074, 2.651653, 0.1529412, 0, 1, 1,
0.5273898, 1.841825, 0.8386347, 0.1568628, 0, 1, 1,
0.5277148, 0.2486472, 1.845109, 0.1647059, 0, 1, 1,
0.5324432, 0.7888922, 1.825267, 0.1686275, 0, 1, 1,
0.5440781, -1.365012, 2.812253, 0.1764706, 0, 1, 1,
0.5466815, -0.7552645, 3.052714, 0.1803922, 0, 1, 1,
0.5521712, -0.08870209, 0.04058788, 0.1882353, 0, 1, 1,
0.5556532, 0.622007, 0.2694593, 0.1921569, 0, 1, 1,
0.558512, -0.04545158, 3.05186, 0.2, 0, 1, 1,
0.567673, 1.945736, 0.6310203, 0.2078431, 0, 1, 1,
0.5678658, -2.089491, 3.243588, 0.2117647, 0, 1, 1,
0.5713809, 0.6651578, -0.5816765, 0.2196078, 0, 1, 1,
0.572228, 0.8988599, -0.3642622, 0.2235294, 0, 1, 1,
0.5734574, 0.1947405, 0.05061231, 0.2313726, 0, 1, 1,
0.5738333, -1.370211, 2.900524, 0.2352941, 0, 1, 1,
0.574961, -1.17025, 2.119782, 0.2431373, 0, 1, 1,
0.5751041, -0.5039561, 2.557318, 0.2470588, 0, 1, 1,
0.5798609, -0.6836348, 1.2805, 0.254902, 0, 1, 1,
0.5821174, -0.08454024, 1.824336, 0.2588235, 0, 1, 1,
0.5835616, -0.1676783, 2.33296, 0.2666667, 0, 1, 1,
0.5867896, 1.35331, -0.20115, 0.2705882, 0, 1, 1,
0.5896103, -0.6245194, 0.9479945, 0.2784314, 0, 1, 1,
0.590807, -0.0757159, 2.417184, 0.282353, 0, 1, 1,
0.5921975, 0.3102504, 1.723354, 0.2901961, 0, 1, 1,
0.5956085, 0.00600868, 1.236709, 0.2941177, 0, 1, 1,
0.5969416, -0.5306042, -0.03087098, 0.3019608, 0, 1, 1,
0.5976536, 0.04138803, 0.1082201, 0.3098039, 0, 1, 1,
0.6022412, -0.05395301, 2.488131, 0.3137255, 0, 1, 1,
0.6023997, 1.723103, -0.1246754, 0.3215686, 0, 1, 1,
0.6062502, -1.510004, 2.874648, 0.3254902, 0, 1, 1,
0.6094663, 1.102616, 1.660878, 0.3333333, 0, 1, 1,
0.6110967, -0.6718668, 2.312932, 0.3372549, 0, 1, 1,
0.6137726, -0.1173646, 3.540225, 0.345098, 0, 1, 1,
0.6216104, 0.04496462, 1.35181, 0.3490196, 0, 1, 1,
0.6228772, -0.6605083, 3.341944, 0.3568628, 0, 1, 1,
0.6274396, -0.2587332, 2.496099, 0.3607843, 0, 1, 1,
0.6327992, 0.05097502, 2.030844, 0.3686275, 0, 1, 1,
0.6337876, 0.003394029, 1.824651, 0.372549, 0, 1, 1,
0.6368506, -1.812085, 1.898698, 0.3803922, 0, 1, 1,
0.6412712, -0.4332349, 2.56718, 0.3843137, 0, 1, 1,
0.6464899, -2.149338, 4.625178, 0.3921569, 0, 1, 1,
0.6548486, -0.05896208, 1.386614, 0.3960784, 0, 1, 1,
0.6551852, 0.04837368, -0.2330656, 0.4039216, 0, 1, 1,
0.6616979, 1.234363, 0.3940392, 0.4117647, 0, 1, 1,
0.663379, -0.7994291, 2.757146, 0.4156863, 0, 1, 1,
0.6645098, -1.091243, 0.1736116, 0.4235294, 0, 1, 1,
0.6686661, 0.5933442, 2.958387, 0.427451, 0, 1, 1,
0.6704554, -1.252818, 2.79904, 0.4352941, 0, 1, 1,
0.6741472, -0.4963258, 2.526037, 0.4392157, 0, 1, 1,
0.6787077, 0.4554982, 1.964389, 0.4470588, 0, 1, 1,
0.6827937, 0.6111359, 1.539708, 0.4509804, 0, 1, 1,
0.6837603, 0.1310943, 2.384786, 0.4588235, 0, 1, 1,
0.6856855, 2.592265, 0.941654, 0.4627451, 0, 1, 1,
0.6967242, 0.1647254, 2.792723, 0.4705882, 0, 1, 1,
0.6967387, -0.4311402, 3.350206, 0.4745098, 0, 1, 1,
0.6967835, 0.03343115, 2.026982, 0.4823529, 0, 1, 1,
0.6986243, -1.133957, 3.719943, 0.4862745, 0, 1, 1,
0.7000313, 1.740234, -0.521821, 0.4941176, 0, 1, 1,
0.7015777, -0.1943881, 2.748658, 0.5019608, 0, 1, 1,
0.7022019, -1.116471, 2.871109, 0.5058824, 0, 1, 1,
0.7067653, 0.2960087, 0.1904135, 0.5137255, 0, 1, 1,
0.7101398, 0.2001905, 2.189522, 0.5176471, 0, 1, 1,
0.7113445, 0.1827351, 0.3956918, 0.5254902, 0, 1, 1,
0.7119897, 0.2198164, 1.735898, 0.5294118, 0, 1, 1,
0.7147795, 1.223363, -1.869837, 0.5372549, 0, 1, 1,
0.7148849, -0.2899198, 1.475356, 0.5411765, 0, 1, 1,
0.722934, 0.1867323, 1.722942, 0.5490196, 0, 1, 1,
0.7271696, 1.225329, 1.234304, 0.5529412, 0, 1, 1,
0.7280194, -1.005125, 0.7822269, 0.5607843, 0, 1, 1,
0.7312552, 0.2158459, -0.6754838, 0.5647059, 0, 1, 1,
0.7316267, 1.35683, 0.4771123, 0.572549, 0, 1, 1,
0.7389871, 0.179274, 1.155341, 0.5764706, 0, 1, 1,
0.7399561, 1.701667, -0.5129094, 0.5843138, 0, 1, 1,
0.7400441, 0.002801155, 2.322485, 0.5882353, 0, 1, 1,
0.7403743, -0.1356191, 2.001889, 0.5960785, 0, 1, 1,
0.7405848, -0.8764145, 3.342502, 0.6039216, 0, 1, 1,
0.7425544, -1.621086, 2.101411, 0.6078432, 0, 1, 1,
0.7452252, 0.2631709, 1.311608, 0.6156863, 0, 1, 1,
0.7541504, 0.01391141, 0.9118716, 0.6196079, 0, 1, 1,
0.7648886, -0.4442405, 2.368053, 0.627451, 0, 1, 1,
0.7673432, 0.7381662, 0.3601532, 0.6313726, 0, 1, 1,
0.7720526, -0.1018186, 1.249301, 0.6392157, 0, 1, 1,
0.7722836, -1.252396, 4.169577, 0.6431373, 0, 1, 1,
0.7780616, 1.406949, 1.041519, 0.6509804, 0, 1, 1,
0.7832785, -0.1013587, 0.647839, 0.654902, 0, 1, 1,
0.7950581, 0.1515001, 2.053609, 0.6627451, 0, 1, 1,
0.8018922, 0.3439781, 0.763473, 0.6666667, 0, 1, 1,
0.8072025, 0.1364695, 0.5871315, 0.6745098, 0, 1, 1,
0.8111303, -0.3153343, 2.06344, 0.6784314, 0, 1, 1,
0.8119669, -1.696266, 4.525816, 0.6862745, 0, 1, 1,
0.8137968, 0.3967222, 1.956455, 0.6901961, 0, 1, 1,
0.8178065, -1.012199, 3.841583, 0.6980392, 0, 1, 1,
0.8264902, -0.3621136, 1.038612, 0.7058824, 0, 1, 1,
0.8327699, 1.006445, 2.070319, 0.7098039, 0, 1, 1,
0.8346207, -0.5268048, 3.755717, 0.7176471, 0, 1, 1,
0.8381963, 0.6066254, 0.8354981, 0.7215686, 0, 1, 1,
0.8397742, -1.327852, 3.674945, 0.7294118, 0, 1, 1,
0.8451905, 0.02062409, 2.273205, 0.7333333, 0, 1, 1,
0.8456576, -0.5835947, 3.270527, 0.7411765, 0, 1, 1,
0.8524418, -0.9488172, 3.322072, 0.7450981, 0, 1, 1,
0.8554275, 0.39894, 0.3775609, 0.7529412, 0, 1, 1,
0.858944, -0.9836888, 1.676755, 0.7568628, 0, 1, 1,
0.8613291, 0.9586768, 1.303148, 0.7647059, 0, 1, 1,
0.862381, 0.7682209, 1.520349, 0.7686275, 0, 1, 1,
0.8635158, 1.227682, 1.826622, 0.7764706, 0, 1, 1,
0.8642068, -0.3431901, 4.029296, 0.7803922, 0, 1, 1,
0.8649532, 0.7003828, 1.406846, 0.7882353, 0, 1, 1,
0.8655668, 0.7353948, -0.5569426, 0.7921569, 0, 1, 1,
0.8667747, 1.525424, 1.043276, 0.8, 0, 1, 1,
0.8704903, 1.734009, -0.2149697, 0.8078431, 0, 1, 1,
0.873485, 0.8184185, 0.9855031, 0.8117647, 0, 1, 1,
0.8735278, -0.3074237, 1.129593, 0.8196079, 0, 1, 1,
0.8760473, 0.878679, 0.9702355, 0.8235294, 0, 1, 1,
0.8760614, 1.731631, 1.22964, 0.8313726, 0, 1, 1,
0.8803065, 0.4032282, 1.115942, 0.8352941, 0, 1, 1,
0.8820769, 0.7961147, 1.832915, 0.8431373, 0, 1, 1,
0.884083, 0.5639817, -0.6471115, 0.8470588, 0, 1, 1,
0.8854417, 0.5461579, 2.470962, 0.854902, 0, 1, 1,
0.8887082, -0.7118979, 2.446302, 0.8588235, 0, 1, 1,
0.8937907, 0.9609078, 0.7324359, 0.8666667, 0, 1, 1,
0.8945427, -0.6949391, 0.4239849, 0.8705882, 0, 1, 1,
0.8962694, 1.966766, 1.090208, 0.8784314, 0, 1, 1,
0.9056982, -0.7580295, 1.735352, 0.8823529, 0, 1, 1,
0.9069177, -0.6771259, 1.696838, 0.8901961, 0, 1, 1,
0.9085563, -0.4904588, 3.064289, 0.8941177, 0, 1, 1,
0.9164983, 1.997082, 0.8271475, 0.9019608, 0, 1, 1,
0.9181482, 0.2086276, -0.03702107, 0.9098039, 0, 1, 1,
0.922558, -1.37858, 0.1822242, 0.9137255, 0, 1, 1,
0.9319136, 0.5302175, 0.9290311, 0.9215686, 0, 1, 1,
0.9354504, -0.2937503, 1.895028, 0.9254902, 0, 1, 1,
0.9376009, -0.9071254, 1.893331, 0.9333333, 0, 1, 1,
0.9458419, 0.006194809, 1.942643, 0.9372549, 0, 1, 1,
0.9471936, -0.28363, 0.4082105, 0.945098, 0, 1, 1,
0.9518093, 2.099261, -0.4239019, 0.9490196, 0, 1, 1,
0.9527906, -1.217585, 2.801014, 0.9568627, 0, 1, 1,
0.9553333, -0.9711401, 4.883789, 0.9607843, 0, 1, 1,
0.9613222, 0.7536103, 1.117225, 0.9686275, 0, 1, 1,
0.9618872, -0.8345643, 3.933334, 0.972549, 0, 1, 1,
0.9641584, 1.952654, 0.1909626, 0.9803922, 0, 1, 1,
0.9650399, 0.1155198, 1.264714, 0.9843137, 0, 1, 1,
0.9707071, 0.42472, 1.533775, 0.9921569, 0, 1, 1,
0.9718606, 0.9802556, 2.118925, 0.9960784, 0, 1, 1,
0.9828526, 0.391115, 0.414082, 1, 0, 0.9960784, 1,
0.9846476, -0.6691539, 3.416801, 1, 0, 0.9882353, 1,
0.9879247, 0.3154789, 2.603299, 1, 0, 0.9843137, 1,
0.9934596, -1.568982, 1.352985, 1, 0, 0.9764706, 1,
0.994623, -0.5211404, 0.6448513, 1, 0, 0.972549, 1,
0.9953375, 0.4290521, 1.354443, 1, 0, 0.9647059, 1,
1.000722, -1.397425, 2.756115, 1, 0, 0.9607843, 1,
1.005303, 1.581284, 0.491578, 1, 0, 0.9529412, 1,
1.006845, -0.8697783, 2.222074, 1, 0, 0.9490196, 1,
1.009712, 0.08735217, 1.517738, 1, 0, 0.9411765, 1,
1.014167, 1.047706, 0.5395458, 1, 0, 0.9372549, 1,
1.016982, -0.04689439, 0.9461232, 1, 0, 0.9294118, 1,
1.021707, -0.9803345, 2.281506, 1, 0, 0.9254902, 1,
1.027273, -2.212228, 3.392379, 1, 0, 0.9176471, 1,
1.032316, -0.7015041, 2.867311, 1, 0, 0.9137255, 1,
1.033769, 0.2459712, 1.697144, 1, 0, 0.9058824, 1,
1.040244, 1.711846, 1.30519, 1, 0, 0.9019608, 1,
1.042463, -0.6658719, 3.892642, 1, 0, 0.8941177, 1,
1.046224, -0.5091, 3.625326, 1, 0, 0.8862745, 1,
1.052389, -0.4658278, 2.264163, 1, 0, 0.8823529, 1,
1.057556, -1.590472, 2.967718, 1, 0, 0.8745098, 1,
1.08516, 1.869664, 0.002025311, 1, 0, 0.8705882, 1,
1.096805, -0.1858586, 1.020223, 1, 0, 0.8627451, 1,
1.098149, -1.496246, 2.422485, 1, 0, 0.8588235, 1,
1.11111, 1.172866, -0.08920073, 1, 0, 0.8509804, 1,
1.111148, 1.54375, -1.205023, 1, 0, 0.8470588, 1,
1.11274, -2.318413, 3.778792, 1, 0, 0.8392157, 1,
1.113615, 0.6626675, -1.778641, 1, 0, 0.8352941, 1,
1.116189, -1.597441, 3.151909, 1, 0, 0.827451, 1,
1.119978, 0.8971477, 2.282181, 1, 0, 0.8235294, 1,
1.130702, -2.421417, 1.5652, 1, 0, 0.8156863, 1,
1.137542, -0.922842, 0.5688921, 1, 0, 0.8117647, 1,
1.138638, -0.08409231, 1.992932, 1, 0, 0.8039216, 1,
1.139167, 0.8264661, 0.4484961, 1, 0, 0.7960784, 1,
1.144129, -0.3651181, 1.558779, 1, 0, 0.7921569, 1,
1.14573, 1.047096, 2.508028, 1, 0, 0.7843137, 1,
1.154563, -0.2035358, 2.269782, 1, 0, 0.7803922, 1,
1.167173, 1.287803, 1.799, 1, 0, 0.772549, 1,
1.167953, 0.1372921, 1.754255, 1, 0, 0.7686275, 1,
1.168708, 1.183312, -0.3394885, 1, 0, 0.7607843, 1,
1.169772, -0.4718889, 2.476238, 1, 0, 0.7568628, 1,
1.170129, -0.2185951, 2.604274, 1, 0, 0.7490196, 1,
1.173015, 0.3617487, 2.272483, 1, 0, 0.7450981, 1,
1.177513, -0.5602417, 2.239873, 1, 0, 0.7372549, 1,
1.178363, 0.8867084, -0.6063735, 1, 0, 0.7333333, 1,
1.18636, -1.332504, 1.725272, 1, 0, 0.7254902, 1,
1.190465, 1.494106, 0.194322, 1, 0, 0.7215686, 1,
1.197049, -0.850342, 2.173165, 1, 0, 0.7137255, 1,
1.198526, -0.7464712, 2.078588, 1, 0, 0.7098039, 1,
1.208012, 2.480372, 0.8045551, 1, 0, 0.7019608, 1,
1.209892, -0.1969685, 2.970105, 1, 0, 0.6941177, 1,
1.215888, -0.5329627, 2.155005, 1, 0, 0.6901961, 1,
1.218001, -1.367893, 2.305594, 1, 0, 0.682353, 1,
1.224051, 1.037347, 0.3227491, 1, 0, 0.6784314, 1,
1.22981, 0.1891048, 2.028332, 1, 0, 0.6705883, 1,
1.242813, 1.050411, 2.110846, 1, 0, 0.6666667, 1,
1.259816, 0.9775717, 0.6957798, 1, 0, 0.6588235, 1,
1.272592, 1.472075, -0.1866622, 1, 0, 0.654902, 1,
1.277958, 0.1279768, 1.152696, 1, 0, 0.6470588, 1,
1.280168, -0.1531208, -0.3246768, 1, 0, 0.6431373, 1,
1.281611, 0.4807749, 1.044276, 1, 0, 0.6352941, 1,
1.290874, -0.969725, 1.204516, 1, 0, 0.6313726, 1,
1.294732, 0.5110036, -1.087178, 1, 0, 0.6235294, 1,
1.307796, -0.8340595, 1.86501, 1, 0, 0.6196079, 1,
1.307825, -0.6996054, 1.239294, 1, 0, 0.6117647, 1,
1.308022, -1.710597, 3.283914, 1, 0, 0.6078432, 1,
1.312197, -0.2984177, 0.5749828, 1, 0, 0.6, 1,
1.316465, 0.1844204, 2.362829, 1, 0, 0.5921569, 1,
1.31887, 2.626153, 1.787272, 1, 0, 0.5882353, 1,
1.322138, -0.04375096, 4.572431, 1, 0, 0.5803922, 1,
1.325173, -0.2017006, 2.862473, 1, 0, 0.5764706, 1,
1.334438, -0.001226334, 0.2597331, 1, 0, 0.5686275, 1,
1.335895, 0.04397728, 2.599353, 1, 0, 0.5647059, 1,
1.337025, 1.141193, 0.963039, 1, 0, 0.5568628, 1,
1.339447, -2.011207, 2.721176, 1, 0, 0.5529412, 1,
1.350185, -0.8365951, 2.028669, 1, 0, 0.5450981, 1,
1.356017, 0.6412188, 1.578248, 1, 0, 0.5411765, 1,
1.356764, 1.210622, 0.4496989, 1, 0, 0.5333334, 1,
1.377234, 0.04620485, 2.391014, 1, 0, 0.5294118, 1,
1.378841, 1.223941, 0.3752808, 1, 0, 0.5215687, 1,
1.38022, 0.5517601, 1.359707, 1, 0, 0.5176471, 1,
1.385981, 0.9590343, 1.94086, 1, 0, 0.509804, 1,
1.39287, -0.3914983, 1.970984, 1, 0, 0.5058824, 1,
1.400384, -0.253471, 2.132867, 1, 0, 0.4980392, 1,
1.409179, 0.2237475, 0.7181622, 1, 0, 0.4901961, 1,
1.413358, -0.4505686, -0.2762392, 1, 0, 0.4862745, 1,
1.421939, -1.332502, 2.947283, 1, 0, 0.4784314, 1,
1.441442, 0.8639066, 1.663062, 1, 0, 0.4745098, 1,
1.454534, -0.7078042, 1.156401, 1, 0, 0.4666667, 1,
1.459051, 0.350432, 1.866501, 1, 0, 0.4627451, 1,
1.462155, -0.3249436, 1.847957, 1, 0, 0.454902, 1,
1.469272, -1.378505, 1.697769, 1, 0, 0.4509804, 1,
1.469522, 0.6214696, 2.522448, 1, 0, 0.4431373, 1,
1.473534, 0.5745645, -0.4926157, 1, 0, 0.4392157, 1,
1.501429, -2.224829, 2.979201, 1, 0, 0.4313726, 1,
1.509838, 0.5131918, 1.369946, 1, 0, 0.427451, 1,
1.511189, 0.2615427, 3.00863, 1, 0, 0.4196078, 1,
1.518987, 0.6537816, -0.3360462, 1, 0, 0.4156863, 1,
1.525961, 0.02336047, 1.342655, 1, 0, 0.4078431, 1,
1.526304, 0.2136252, -0.06725796, 1, 0, 0.4039216, 1,
1.529128, 0.02440093, 1.30915, 1, 0, 0.3960784, 1,
1.541667, -0.7411786, 3.196137, 1, 0, 0.3882353, 1,
1.541732, 0.5144932, 1.481566, 1, 0, 0.3843137, 1,
1.545965, -1.42683, 1.947266, 1, 0, 0.3764706, 1,
1.54812, -0.4099623, 1.887365, 1, 0, 0.372549, 1,
1.557807, 1.31537, -0.4451928, 1, 0, 0.3647059, 1,
1.569368, 0.06665267, 1.736662, 1, 0, 0.3607843, 1,
1.571631, 0.3467354, 2.550115, 1, 0, 0.3529412, 1,
1.587912, 1.180303, 1.898368, 1, 0, 0.3490196, 1,
1.594921, -0.04480883, 1.445089, 1, 0, 0.3411765, 1,
1.596839, 1.344688, -0.5070902, 1, 0, 0.3372549, 1,
1.599487, 0.7675273, 2.053666, 1, 0, 0.3294118, 1,
1.606805, 0.08756533, 3.036717, 1, 0, 0.3254902, 1,
1.607275, 0.9616777, 0.6767835, 1, 0, 0.3176471, 1,
1.617197, 2.163969, 1.578846, 1, 0, 0.3137255, 1,
1.629186, -0.3166972, 2.335381, 1, 0, 0.3058824, 1,
1.648263, -0.621491, 2.248834, 1, 0, 0.2980392, 1,
1.65612, -0.1263291, 0.1388475, 1, 0, 0.2941177, 1,
1.656506, 0.1845818, 1.247954, 1, 0, 0.2862745, 1,
1.659353, -0.439971, 1.445835, 1, 0, 0.282353, 1,
1.661613, 0.8707553, 1.911806, 1, 0, 0.2745098, 1,
1.662315, -0.769209, 2.70809, 1, 0, 0.2705882, 1,
1.667327, -0.1338892, 2.113436, 1, 0, 0.2627451, 1,
1.694875, -0.7234744, 2.530916, 1, 0, 0.2588235, 1,
1.697544, -1.699936, 2.059777, 1, 0, 0.2509804, 1,
1.73431, 0.8678237, 1.572469, 1, 0, 0.2470588, 1,
1.741411, 1.972694, 2.49832, 1, 0, 0.2392157, 1,
1.7511, -0.1764915, 0.8876459, 1, 0, 0.2352941, 1,
1.776882, 0.07565062, -0.1094571, 1, 0, 0.227451, 1,
1.78083, 0.324255, 0.312972, 1, 0, 0.2235294, 1,
1.79985, 0.6360456, -0.1532881, 1, 0, 0.2156863, 1,
1.811499, 2.781148, 0.3177538, 1, 0, 0.2117647, 1,
1.821236, 0.03144228, 2.209219, 1, 0, 0.2039216, 1,
1.862948, -0.5523556, 2.051412, 1, 0, 0.1960784, 1,
1.866728, -1.481537, 3.940576, 1, 0, 0.1921569, 1,
1.873026, -0.1985631, 1.78819, 1, 0, 0.1843137, 1,
1.876843, 0.01897425, 2.625232, 1, 0, 0.1803922, 1,
1.891001, 1.149921, 2.727084, 1, 0, 0.172549, 1,
1.918352, -0.9762568, 2.789868, 1, 0, 0.1686275, 1,
1.919878, -1.243797, 3.957328, 1, 0, 0.1607843, 1,
1.92395, -1.869354, 1.371832, 1, 0, 0.1568628, 1,
1.954309, -0.3227703, 2.691818, 1, 0, 0.1490196, 1,
1.967116, 0.1272164, 3.054207, 1, 0, 0.145098, 1,
1.992355, 1.383263, 0.1799606, 1, 0, 0.1372549, 1,
2.025361, 0.1333815, 1.003758, 1, 0, 0.1333333, 1,
2.060405, -1.237641, 1.828056, 1, 0, 0.1254902, 1,
2.075217, 0.5469945, 1.266082, 1, 0, 0.1215686, 1,
2.077789, -0.5695181, -0.1990948, 1, 0, 0.1137255, 1,
2.081828, 0.9058025, 0.004764698, 1, 0, 0.1098039, 1,
2.105044, -0.9734938, 4.593427, 1, 0, 0.1019608, 1,
2.110988, 0.2176096, 2.860284, 1, 0, 0.09411765, 1,
2.148345, -0.4921168, 1.185505, 1, 0, 0.09019608, 1,
2.165129, 0.09321445, 0.9980007, 1, 0, 0.08235294, 1,
2.169936, 0.8580301, 0.1814641, 1, 0, 0.07843138, 1,
2.211521, 0.7880207, 1.346295, 1, 0, 0.07058824, 1,
2.230636, 0.04950646, 1.061463, 1, 0, 0.06666667, 1,
2.23351, 0.007707985, 1.739288, 1, 0, 0.05882353, 1,
2.280725, -0.8383997, 1.759612, 1, 0, 0.05490196, 1,
2.299262, -0.7453246, 2.207379, 1, 0, 0.04705882, 1,
2.366883, 0.1538933, 2.309436, 1, 0, 0.04313726, 1,
2.371958, 0.2978677, 0.7367106, 1, 0, 0.03529412, 1,
2.431998, 0.1531373, -0.9316236, 1, 0, 0.03137255, 1,
2.467751, -1.72472, 3.729402, 1, 0, 0.02352941, 1,
2.505301, -1.459178, 0.8758507, 1, 0, 0.01960784, 1,
2.770914, -0.1629214, 1.507173, 1, 0, 0.01176471, 1,
3.174617, -1.073168, 2.167928, 1, 0, 0.007843138, 1
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
0.142513, -4.402737, -6.758072, 0, -0.5, 0.5, 0.5,
0.142513, -4.402737, -6.758072, 1, -0.5, 0.5, 0.5,
0.142513, -4.402737, -6.758072, 1, 1.5, 0.5, 0.5,
0.142513, -4.402737, -6.758072, 0, 1.5, 0.5, 0.5
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
-3.917474, -0.1285856, -6.758072, 0, -0.5, 0.5, 0.5,
-3.917474, -0.1285856, -6.758072, 1, -0.5, 0.5, 0.5,
-3.917474, -0.1285856, -6.758072, 1, 1.5, 0.5, 0.5,
-3.917474, -0.1285856, -6.758072, 0, 1.5, 0.5, 0.5
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
-3.917474, -4.402737, 0.07163668, 0, -0.5, 0.5, 0.5,
-3.917474, -4.402737, 0.07163668, 1, -0.5, 0.5, 0.5,
-3.917474, -4.402737, 0.07163668, 1, 1.5, 0.5, 0.5,
-3.917474, -4.402737, 0.07163668, 0, 1.5, 0.5, 0.5
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
-2, -3.416394, -5.181985,
3, -3.416394, -5.181985,
-2, -3.416394, -5.181985,
-2, -3.580785, -5.444666,
-1, -3.416394, -5.181985,
-1, -3.580785, -5.444666,
0, -3.416394, -5.181985,
0, -3.580785, -5.444666,
1, -3.416394, -5.181985,
1, -3.580785, -5.444666,
2, -3.416394, -5.181985,
2, -3.580785, -5.444666,
3, -3.416394, -5.181985,
3, -3.580785, -5.444666
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
-2, -3.909565, -5.970029, 0, -0.5, 0.5, 0.5,
-2, -3.909565, -5.970029, 1, -0.5, 0.5, 0.5,
-2, -3.909565, -5.970029, 1, 1.5, 0.5, 0.5,
-2, -3.909565, -5.970029, 0, 1.5, 0.5, 0.5,
-1, -3.909565, -5.970029, 0, -0.5, 0.5, 0.5,
-1, -3.909565, -5.970029, 1, -0.5, 0.5, 0.5,
-1, -3.909565, -5.970029, 1, 1.5, 0.5, 0.5,
-1, -3.909565, -5.970029, 0, 1.5, 0.5, 0.5,
0, -3.909565, -5.970029, 0, -0.5, 0.5, 0.5,
0, -3.909565, -5.970029, 1, -0.5, 0.5, 0.5,
0, -3.909565, -5.970029, 1, 1.5, 0.5, 0.5,
0, -3.909565, -5.970029, 0, 1.5, 0.5, 0.5,
1, -3.909565, -5.970029, 0, -0.5, 0.5, 0.5,
1, -3.909565, -5.970029, 1, -0.5, 0.5, 0.5,
1, -3.909565, -5.970029, 1, 1.5, 0.5, 0.5,
1, -3.909565, -5.970029, 0, 1.5, 0.5, 0.5,
2, -3.909565, -5.970029, 0, -0.5, 0.5, 0.5,
2, -3.909565, -5.970029, 1, -0.5, 0.5, 0.5,
2, -3.909565, -5.970029, 1, 1.5, 0.5, 0.5,
2, -3.909565, -5.970029, 0, 1.5, 0.5, 0.5,
3, -3.909565, -5.970029, 0, -0.5, 0.5, 0.5,
3, -3.909565, -5.970029, 1, -0.5, 0.5, 0.5,
3, -3.909565, -5.970029, 1, 1.5, 0.5, 0.5,
3, -3.909565, -5.970029, 0, 1.5, 0.5, 0.5
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
-2.980554, -3, -5.181985,
-2.980554, 3, -5.181985,
-2.980554, -3, -5.181985,
-3.136707, -3, -5.444666,
-2.980554, -2, -5.181985,
-3.136707, -2, -5.444666,
-2.980554, -1, -5.181985,
-3.136707, -1, -5.444666,
-2.980554, 0, -5.181985,
-3.136707, 0, -5.444666,
-2.980554, 1, -5.181985,
-3.136707, 1, -5.444666,
-2.980554, 2, -5.181985,
-3.136707, 2, -5.444666,
-2.980554, 3, -5.181985,
-3.136707, 3, -5.444666
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
-3.449014, -3, -5.970029, 0, -0.5, 0.5, 0.5,
-3.449014, -3, -5.970029, 1, -0.5, 0.5, 0.5,
-3.449014, -3, -5.970029, 1, 1.5, 0.5, 0.5,
-3.449014, -3, -5.970029, 0, 1.5, 0.5, 0.5,
-3.449014, -2, -5.970029, 0, -0.5, 0.5, 0.5,
-3.449014, -2, -5.970029, 1, -0.5, 0.5, 0.5,
-3.449014, -2, -5.970029, 1, 1.5, 0.5, 0.5,
-3.449014, -2, -5.970029, 0, 1.5, 0.5, 0.5,
-3.449014, -1, -5.970029, 0, -0.5, 0.5, 0.5,
-3.449014, -1, -5.970029, 1, -0.5, 0.5, 0.5,
-3.449014, -1, -5.970029, 1, 1.5, 0.5, 0.5,
-3.449014, -1, -5.970029, 0, 1.5, 0.5, 0.5,
-3.449014, 0, -5.970029, 0, -0.5, 0.5, 0.5,
-3.449014, 0, -5.970029, 1, -0.5, 0.5, 0.5,
-3.449014, 0, -5.970029, 1, 1.5, 0.5, 0.5,
-3.449014, 0, -5.970029, 0, 1.5, 0.5, 0.5,
-3.449014, 1, -5.970029, 0, -0.5, 0.5, 0.5,
-3.449014, 1, -5.970029, 1, -0.5, 0.5, 0.5,
-3.449014, 1, -5.970029, 1, 1.5, 0.5, 0.5,
-3.449014, 1, -5.970029, 0, 1.5, 0.5, 0.5,
-3.449014, 2, -5.970029, 0, -0.5, 0.5, 0.5,
-3.449014, 2, -5.970029, 1, -0.5, 0.5, 0.5,
-3.449014, 2, -5.970029, 1, 1.5, 0.5, 0.5,
-3.449014, 2, -5.970029, 0, 1.5, 0.5, 0.5,
-3.449014, 3, -5.970029, 0, -0.5, 0.5, 0.5,
-3.449014, 3, -5.970029, 1, -0.5, 0.5, 0.5,
-3.449014, 3, -5.970029, 1, 1.5, 0.5, 0.5,
-3.449014, 3, -5.970029, 0, 1.5, 0.5, 0.5
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
-2.980554, -3.416394, -4,
-2.980554, -3.416394, 4,
-2.980554, -3.416394, -4,
-3.136707, -3.580785, -4,
-2.980554, -3.416394, -2,
-3.136707, -3.580785, -2,
-2.980554, -3.416394, 0,
-3.136707, -3.580785, 0,
-2.980554, -3.416394, 2,
-3.136707, -3.580785, 2,
-2.980554, -3.416394, 4,
-3.136707, -3.580785, 4
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
-3.449014, -3.909565, -4, 0, -0.5, 0.5, 0.5,
-3.449014, -3.909565, -4, 1, -0.5, 0.5, 0.5,
-3.449014, -3.909565, -4, 1, 1.5, 0.5, 0.5,
-3.449014, -3.909565, -4, 0, 1.5, 0.5, 0.5,
-3.449014, -3.909565, -2, 0, -0.5, 0.5, 0.5,
-3.449014, -3.909565, -2, 1, -0.5, 0.5, 0.5,
-3.449014, -3.909565, -2, 1, 1.5, 0.5, 0.5,
-3.449014, -3.909565, -2, 0, 1.5, 0.5, 0.5,
-3.449014, -3.909565, 0, 0, -0.5, 0.5, 0.5,
-3.449014, -3.909565, 0, 1, -0.5, 0.5, 0.5,
-3.449014, -3.909565, 0, 1, 1.5, 0.5, 0.5,
-3.449014, -3.909565, 0, 0, 1.5, 0.5, 0.5,
-3.449014, -3.909565, 2, 0, -0.5, 0.5, 0.5,
-3.449014, -3.909565, 2, 1, -0.5, 0.5, 0.5,
-3.449014, -3.909565, 2, 1, 1.5, 0.5, 0.5,
-3.449014, -3.909565, 2, 0, 1.5, 0.5, 0.5,
-3.449014, -3.909565, 4, 0, -0.5, 0.5, 0.5,
-3.449014, -3.909565, 4, 1, -0.5, 0.5, 0.5,
-3.449014, -3.909565, 4, 1, 1.5, 0.5, 0.5,
-3.449014, -3.909565, 4, 0, 1.5, 0.5, 0.5
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
-2.980554, -3.416394, -5.181985,
-2.980554, 3.159223, -5.181985,
-2.980554, -3.416394, 5.325259,
-2.980554, 3.159223, 5.325259,
-2.980554, -3.416394, -5.181985,
-2.980554, -3.416394, 5.325259,
-2.980554, 3.159223, -5.181985,
-2.980554, 3.159223, 5.325259,
-2.980554, -3.416394, -5.181985,
3.26558, -3.416394, -5.181985,
-2.980554, -3.416394, 5.325259,
3.26558, -3.416394, 5.325259,
-2.980554, 3.159223, -5.181985,
3.26558, 3.159223, -5.181985,
-2.980554, 3.159223, 5.325259,
3.26558, 3.159223, 5.325259,
3.26558, -3.416394, -5.181985,
3.26558, 3.159223, -5.181985,
3.26558, -3.416394, 5.325259,
3.26558, 3.159223, 5.325259,
3.26558, -3.416394, -5.181985,
3.26558, -3.416394, 5.325259,
3.26558, 3.159223, -5.181985,
3.26558, 3.159223, 5.325259
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
var radius = 7.411664;
var distance = 32.97533;
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
mvMatrix.translate( -0.142513, 0.1285856, -0.07163668 );
mvMatrix.scale( 1.282976, 1.21869, 0.7626773 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.97533);
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
Methiocarb<-read.table("Methiocarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methiocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methiocarb' not found
```

```r
y<-Methiocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methiocarb' not found
```

```r
z<-Methiocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methiocarb' not found
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
-2.889591, 0.9434161, -2.047633, 0, 0, 1, 1, 1,
-2.704293, 0.943313, 0.3096684, 1, 0, 0, 1, 1,
-2.654439, -1.200094, -2.435923, 1, 0, 0, 1, 1,
-2.256084, -1.508748, -1.825606, 1, 0, 0, 1, 1,
-2.23638, 1.441361, -0.2907508, 1, 0, 0, 1, 1,
-2.213403, 0.948229, -1.387205, 1, 0, 0, 1, 1,
-2.182078, 0.1278477, -3.153606, 0, 0, 0, 1, 1,
-2.152925, -0.182018, -1.229815, 0, 0, 0, 1, 1,
-2.114321, -0.5799374, -2.675504, 0, 0, 0, 1, 1,
-2.076471, -0.6066768, -2.911987, 0, 0, 0, 1, 1,
-2.07468, 0.6783464, -2.518883, 0, 0, 0, 1, 1,
-2.053254, -0.9217326, -1.165013, 0, 0, 0, 1, 1,
-2.003316, -0.3780137, -1.357976, 0, 0, 0, 1, 1,
-1.982084, -0.7692878, -2.918779, 1, 1, 1, 1, 1,
-1.976974, 1.78801, -1.74162, 1, 1, 1, 1, 1,
-1.950344, 0.9925104, -1.396023, 1, 1, 1, 1, 1,
-1.937098, -1.962486, -2.990586, 1, 1, 1, 1, 1,
-1.880349, 1.628469, -1.479381, 1, 1, 1, 1, 1,
-1.85837, 0.01281154, -2.678795, 1, 1, 1, 1, 1,
-1.836156, 0.0535656, -3.126817, 1, 1, 1, 1, 1,
-1.835752, 1.349201, -1.253154, 1, 1, 1, 1, 1,
-1.831827, -0.4746523, -0.7334987, 1, 1, 1, 1, 1,
-1.820805, 0.295515, -1.934084, 1, 1, 1, 1, 1,
-1.820523, -0.2505696, -2.036512, 1, 1, 1, 1, 1,
-1.81822, 0.9122968, -2.473752, 1, 1, 1, 1, 1,
-1.808685, 0.5720512, -2.870745, 1, 1, 1, 1, 1,
-1.801754, 1.015341, 1.20597, 1, 1, 1, 1, 1,
-1.781776, -1.892871, -1.886149, 1, 1, 1, 1, 1,
-1.763823, -0.2125834, -1.698727, 0, 0, 1, 1, 1,
-1.76186, 0.07275306, -1.92113, 1, 0, 0, 1, 1,
-1.761152, -0.5954981, -2.446101, 1, 0, 0, 1, 1,
-1.759989, 2.043012, -1.379586, 1, 0, 0, 1, 1,
-1.748824, 1.373488, 0.3950612, 1, 0, 0, 1, 1,
-1.745282, -0.07346955, -1.580712, 1, 0, 0, 1, 1,
-1.721418, -1.079588, -4.101016, 0, 0, 0, 1, 1,
-1.706138, -1.237234, 0.0889784, 0, 0, 0, 1, 1,
-1.690433, -0.7488196, -2.975984, 0, 0, 0, 1, 1,
-1.683802, -0.8538296, -2.99298, 0, 0, 0, 1, 1,
-1.679603, -0.1194483, -1.865677, 0, 0, 0, 1, 1,
-1.678175, -1.276265, -1.862107, 0, 0, 0, 1, 1,
-1.676634, -0.6844213, -2.066174, 0, 0, 0, 1, 1,
-1.670635, 0.4041026, -2.198253, 1, 1, 1, 1, 1,
-1.641962, -0.01115424, -1.739234, 1, 1, 1, 1, 1,
-1.630161, 1.79323, -1.88782, 1, 1, 1, 1, 1,
-1.61748, 0.6062593, -1.094722, 1, 1, 1, 1, 1,
-1.612483, -0.1464126, -2.169358, 1, 1, 1, 1, 1,
-1.594145, -1.034181, -2.42483, 1, 1, 1, 1, 1,
-1.582365, 1.908847, -0.1422541, 1, 1, 1, 1, 1,
-1.567709, -1.712164, -1.493247, 1, 1, 1, 1, 1,
-1.546873, 0.2516812, -0.5242326, 1, 1, 1, 1, 1,
-1.530622, 2.132551, 0.8209763, 1, 1, 1, 1, 1,
-1.51186, -1.370608, -1.982946, 1, 1, 1, 1, 1,
-1.510552, 0.2203169, -1.670114, 1, 1, 1, 1, 1,
-1.507617, 0.4316241, 1.066391, 1, 1, 1, 1, 1,
-1.500319, 1.287525, -1.112072, 1, 1, 1, 1, 1,
-1.498857, -0.2800407, -2.457787, 1, 1, 1, 1, 1,
-1.488995, 0.6851745, -0.6911503, 0, 0, 1, 1, 1,
-1.48744, -1.789803, -0.5802925, 1, 0, 0, 1, 1,
-1.473846, -1.304509, -1.344711, 1, 0, 0, 1, 1,
-1.473682, 0.3502187, -0.5925155, 1, 0, 0, 1, 1,
-1.465365, -0.7242516, -1.528014, 1, 0, 0, 1, 1,
-1.457058, 1.168226, -1.702054, 1, 0, 0, 1, 1,
-1.454726, -1.02222, -1.00726, 0, 0, 0, 1, 1,
-1.454551, -0.08532076, -2.195216, 0, 0, 0, 1, 1,
-1.451807, -0.1772646, -0.5604218, 0, 0, 0, 1, 1,
-1.450889, -0.08427613, 0.7995784, 0, 0, 0, 1, 1,
-1.449772, 0.3015304, -1.205141, 0, 0, 0, 1, 1,
-1.440668, 1.684249, -1.034049, 0, 0, 0, 1, 1,
-1.431559, 0.946182, -1.391289, 0, 0, 0, 1, 1,
-1.427015, -0.5781164, -3.450137, 1, 1, 1, 1, 1,
-1.42092, 1.047968, 0.2194531, 1, 1, 1, 1, 1,
-1.414736, 1.695986, -2.139477, 1, 1, 1, 1, 1,
-1.411327, -2.309458, -4.375899, 1, 1, 1, 1, 1,
-1.39908, -0.03053706, -1.236148, 1, 1, 1, 1, 1,
-1.398489, -0.02641257, -1.665972, 1, 1, 1, 1, 1,
-1.398135, 2.443683, -1.022984, 1, 1, 1, 1, 1,
-1.397441, 1.562666, 1.446309, 1, 1, 1, 1, 1,
-1.386427, -0.003009361, -2.528424, 1, 1, 1, 1, 1,
-1.377834, 0.3131332, -1.713349, 1, 1, 1, 1, 1,
-1.365533, 0.5516109, -0.5277088, 1, 1, 1, 1, 1,
-1.351856, 1.004019, -0.6971148, 1, 1, 1, 1, 1,
-1.344626, 0.6920683, 0.1099539, 1, 1, 1, 1, 1,
-1.33724, 0.3930271, -0.5528603, 1, 1, 1, 1, 1,
-1.329051, 0.9582371, -1.051222, 1, 1, 1, 1, 1,
-1.316851, -0.7737976, -1.184996, 0, 0, 1, 1, 1,
-1.311727, -1.154954, -2.505749, 1, 0, 0, 1, 1,
-1.311523, 0.7006685, -0.611176, 1, 0, 0, 1, 1,
-1.297201, -1.321415, -3.158965, 1, 0, 0, 1, 1,
-1.29643, -0.07675475, -1.62286, 1, 0, 0, 1, 1,
-1.29386, 0.1858518, -1.075495, 1, 0, 0, 1, 1,
-1.281367, -0.2984263, -1.54046, 0, 0, 0, 1, 1,
-1.267617, 1.887503, -0.3219275, 0, 0, 0, 1, 1,
-1.252802, -0.7972989, -3.599709, 0, 0, 0, 1, 1,
-1.252617, -0.3593528, -2.304933, 0, 0, 0, 1, 1,
-1.246158, 0.9654263, -1.666102, 0, 0, 0, 1, 1,
-1.242557, -0.2080813, -1.03468, 0, 0, 0, 1, 1,
-1.240119, 0.8628594, -1.618545, 0, 0, 0, 1, 1,
-1.239175, 1.547014, -0.9205732, 1, 1, 1, 1, 1,
-1.238218, 1.15589, -1.671834, 1, 1, 1, 1, 1,
-1.229212, 0.2853004, -1.725255, 1, 1, 1, 1, 1,
-1.227175, -0.7851746, -3.421138, 1, 1, 1, 1, 1,
-1.218061, 0.1461051, 0.09828016, 1, 1, 1, 1, 1,
-1.217925, -1.047273, -2.326582, 1, 1, 1, 1, 1,
-1.217322, 0.003939235, -1.980219, 1, 1, 1, 1, 1,
-1.216494, 1.572154, 0.6569893, 1, 1, 1, 1, 1,
-1.215055, -0.3362474, -0.3237424, 1, 1, 1, 1, 1,
-1.213968, 0.7396501, 0.2094529, 1, 1, 1, 1, 1,
-1.201999, 0.4918056, -2.718487, 1, 1, 1, 1, 1,
-1.199708, -0.582263, -2.182176, 1, 1, 1, 1, 1,
-1.199523, -0.0490657, -1.410944, 1, 1, 1, 1, 1,
-1.182013, -1.291693, -2.443176, 1, 1, 1, 1, 1,
-1.171359, -1.362152, -4.481772, 1, 1, 1, 1, 1,
-1.169606, 1.110212, -0.07881321, 0, 0, 1, 1, 1,
-1.167376, -0.2869791, -1.415093, 1, 0, 0, 1, 1,
-1.158393, 0.6443956, -0.8258221, 1, 0, 0, 1, 1,
-1.157769, 1.326689, -0.3525001, 1, 0, 0, 1, 1,
-1.148256, 0.1009509, -1.359549, 1, 0, 0, 1, 1,
-1.147231, 0.5329615, -2.156718, 1, 0, 0, 1, 1,
-1.143831, -1.740487, -2.896978, 0, 0, 0, 1, 1,
-1.142742, 0.706785, -1.255154, 0, 0, 0, 1, 1,
-1.14162, 0.3376279, -2.755986, 0, 0, 0, 1, 1,
-1.134358, 0.8998992, 0.1506818, 0, 0, 0, 1, 1,
-1.129281, 1.173089, -0.3090439, 0, 0, 0, 1, 1,
-1.115978, 2.293339, -2.601387, 0, 0, 0, 1, 1,
-1.113522, -1.15536, -3.320102, 0, 0, 0, 1, 1,
-1.105922, 0.1763227, -0.6472164, 1, 1, 1, 1, 1,
-1.104726, 1.208128, 0.1807664, 1, 1, 1, 1, 1,
-1.100295, 1.678788, -0.2563945, 1, 1, 1, 1, 1,
-1.099339, 1.605873, -0.5229663, 1, 1, 1, 1, 1,
-1.092898, -0.09397738, -1.728498, 1, 1, 1, 1, 1,
-1.08439, 0.61835, -0.8799056, 1, 1, 1, 1, 1,
-1.077719, 0.4792931, 1.131662, 1, 1, 1, 1, 1,
-1.056004, -0.4595876, -3.113401, 1, 1, 1, 1, 1,
-1.041561, 0.2137298, -1.53857, 1, 1, 1, 1, 1,
-1.039213, -0.2889698, 0.06802844, 1, 1, 1, 1, 1,
-1.039033, -1.787979, -2.180121, 1, 1, 1, 1, 1,
-1.035824, 1.232323, 0.8582586, 1, 1, 1, 1, 1,
-1.033331, 0.2469772, -0.5785364, 1, 1, 1, 1, 1,
-1.031805, 0.3281836, -1.24589, 1, 1, 1, 1, 1,
-1.027774, -0.4396101, -2.041697, 1, 1, 1, 1, 1,
-1.025256, 0.8021337, -0.8785503, 0, 0, 1, 1, 1,
-1.023098, 0.6900617, 0.7540708, 1, 0, 0, 1, 1,
-1.018773, -0.06602008, -3.424443, 1, 0, 0, 1, 1,
-1.018105, -0.876768, -2.657076, 1, 0, 0, 1, 1,
-1.010613, 3.063462, -0.3670813, 1, 0, 0, 1, 1,
-1.010498, 1.035078, 0.5666527, 1, 0, 0, 1, 1,
-1.009239, 1.101017, -0.972766, 0, 0, 0, 1, 1,
-1.009142, -1.128618, -0.2968208, 0, 0, 0, 1, 1,
-1.003056, 0.2926602, -2.303529, 0, 0, 0, 1, 1,
-0.9956468, 1.566042, 1.025713, 0, 0, 0, 1, 1,
-0.9951196, -0.02119847, -1.16408, 0, 0, 0, 1, 1,
-0.9927899, 0.2277125, -2.639063, 0, 0, 0, 1, 1,
-0.9850369, -0.1805916, -2.072135, 0, 0, 0, 1, 1,
-0.9669614, 0.8803145, -0.09591042, 1, 1, 1, 1, 1,
-0.966342, -0.5903541, -3.505068, 1, 1, 1, 1, 1,
-0.9657888, 1.031592, -0.1722608, 1, 1, 1, 1, 1,
-0.9636143, 0.1197084, -1.178866, 1, 1, 1, 1, 1,
-0.9592239, -0.1708842, -1.678027, 1, 1, 1, 1, 1,
-0.9457206, 0.6219291, -1.695716, 1, 1, 1, 1, 1,
-0.943786, -0.4112617, -1.899749, 1, 1, 1, 1, 1,
-0.9434333, 1.851395, 1.408395, 1, 1, 1, 1, 1,
-0.941071, 0.3453452, -2.7361, 1, 1, 1, 1, 1,
-0.938157, 0.9268862, 0.1236069, 1, 1, 1, 1, 1,
-0.9341198, -2.281931, -2.378036, 1, 1, 1, 1, 1,
-0.9300358, 0.8404936, -0.1734031, 1, 1, 1, 1, 1,
-0.9292461, -0.2709407, -1.324755, 1, 1, 1, 1, 1,
-0.9292112, -0.4608968, -1.614704, 1, 1, 1, 1, 1,
-0.9266312, 1.478474, -1.145642, 1, 1, 1, 1, 1,
-0.9221976, -1.930752, -4.159861, 0, 0, 1, 1, 1,
-0.9095572, -1.099643, -2.016282, 1, 0, 0, 1, 1,
-0.9095109, 0.3897779, 0.2905415, 1, 0, 0, 1, 1,
-0.9051707, -1.135511, -1.344641, 1, 0, 0, 1, 1,
-0.9045216, 1.053414, 0.004287138, 1, 0, 0, 1, 1,
-0.9023007, 0.7429132, 0.4278381, 1, 0, 0, 1, 1,
-0.8942008, 0.09710691, -2.237525, 0, 0, 0, 1, 1,
-0.8932371, -0.06061883, -2.273975, 0, 0, 0, 1, 1,
-0.8917132, 1.114501, -0.8837783, 0, 0, 0, 1, 1,
-0.8856785, -1.822803, -3.299585, 0, 0, 0, 1, 1,
-0.8844873, -1.192256, -3.254353, 0, 0, 0, 1, 1,
-0.8796831, 0.1756635, -3.585634, 0, 0, 0, 1, 1,
-0.8771828, -0.8965046, -1.841399, 0, 0, 0, 1, 1,
-0.8761346, -1.613532, -2.13784, 1, 1, 1, 1, 1,
-0.8733343, 0.5216594, -0.00849506, 1, 1, 1, 1, 1,
-0.8709726, -0.5159658, -2.692619, 1, 1, 1, 1, 1,
-0.8658236, 0.4935708, -1.417298, 1, 1, 1, 1, 1,
-0.8517392, 0.9368917, 0.02783223, 1, 1, 1, 1, 1,
-0.8510098, -0.1573311, -1.40931, 1, 1, 1, 1, 1,
-0.8509815, -0.2437462, -1.962834, 1, 1, 1, 1, 1,
-0.8495449, 0.02765111, -0.6562736, 1, 1, 1, 1, 1,
-0.8426528, -0.1639431, -0.6052902, 1, 1, 1, 1, 1,
-0.842286, -1.125629, -2.901525, 1, 1, 1, 1, 1,
-0.8315877, 1.322495, -1.140995, 1, 1, 1, 1, 1,
-0.8292, 0.6908773, -1.206684, 1, 1, 1, 1, 1,
-0.8097389, -0.1554528, -1.691115, 1, 1, 1, 1, 1,
-0.8061139, 0.9131628, -1.047928, 1, 1, 1, 1, 1,
-0.7986708, 0.3465884, -1.157309, 1, 1, 1, 1, 1,
-0.7985899, 0.6466848, -0.9487141, 0, 0, 1, 1, 1,
-0.7969407, 0.8576994, -0.8501274, 1, 0, 0, 1, 1,
-0.7927738, 0.03202358, -2.522267, 1, 0, 0, 1, 1,
-0.7905802, -0.1174297, -0.8739979, 1, 0, 0, 1, 1,
-0.7853081, 1.454213, -0.8526804, 1, 0, 0, 1, 1,
-0.7833198, 1.746752, -0.8101808, 1, 0, 0, 1, 1,
-0.7768007, -0.5291058, -2.72015, 0, 0, 0, 1, 1,
-0.7726439, -0.5727454, -2.218219, 0, 0, 0, 1, 1,
-0.7687154, 1.230688, -0.1276993, 0, 0, 0, 1, 1,
-0.7646869, 0.6278263, -1.586177, 0, 0, 0, 1, 1,
-0.7640275, 1.22299, 1.036748, 0, 0, 0, 1, 1,
-0.7568327, -0.5370419, -1.557642, 0, 0, 0, 1, 1,
-0.7523233, -1.227519, -2.289286, 0, 0, 0, 1, 1,
-0.7499446, -0.0993079, -2.066303, 1, 1, 1, 1, 1,
-0.7481957, -0.9333227, -2.894502, 1, 1, 1, 1, 1,
-0.7398097, 0.1204535, -1.057534, 1, 1, 1, 1, 1,
-0.7394221, 0.2447766, -0.8111063, 1, 1, 1, 1, 1,
-0.7270792, 0.9128553, 1.813064, 1, 1, 1, 1, 1,
-0.7234043, -1.027116, -4.882284, 1, 1, 1, 1, 1,
-0.7232252, -0.3607241, -0.7558156, 1, 1, 1, 1, 1,
-0.7217514, 0.3605271, -1.293079, 1, 1, 1, 1, 1,
-0.713053, -1.155954, -4.432034, 1, 1, 1, 1, 1,
-0.7098652, -0.3765828, -1.358809, 1, 1, 1, 1, 1,
-0.7070848, -0.6137714, -4.165155, 1, 1, 1, 1, 1,
-0.7069487, -1.321392, -1.154327, 1, 1, 1, 1, 1,
-0.7029578, 1.086658, -2.297026, 1, 1, 1, 1, 1,
-0.6948006, 0.1228426, -2.199614, 1, 1, 1, 1, 1,
-0.6881615, -0.2198375, -4.953162, 1, 1, 1, 1, 1,
-0.6874846, -1.92028, -3.145663, 0, 0, 1, 1, 1,
-0.68441, -1.194094, -2.934978, 1, 0, 0, 1, 1,
-0.6840799, -0.9874004, -3.425495, 1, 0, 0, 1, 1,
-0.6835666, -0.3431441, -2.559833, 1, 0, 0, 1, 1,
-0.6829646, 0.299353, 2.281325, 1, 0, 0, 1, 1,
-0.680829, 0.8914201, 1.202829, 1, 0, 0, 1, 1,
-0.6802147, 0.176699, 0.2063016, 0, 0, 0, 1, 1,
-0.6772419, -0.1294262, -2.687581, 0, 0, 0, 1, 1,
-0.6723037, 0.4443282, -0.7470651, 0, 0, 0, 1, 1,
-0.6702495, 0.8357438, -0.2600088, 0, 0, 0, 1, 1,
-0.6686519, 0.4254725, -0.07133468, 0, 0, 0, 1, 1,
-0.6674993, -0.3344735, -4.09628, 0, 0, 0, 1, 1,
-0.6656678, -0.3982502, -3.953042, 0, 0, 0, 1, 1,
-0.6656467, -3.320633, -2.994857, 1, 1, 1, 1, 1,
-0.6640873, -1.087608, -2.015018, 1, 1, 1, 1, 1,
-0.6628155, -1.515405, -2.401212, 1, 1, 1, 1, 1,
-0.6620093, 0.2401705, -1.528947, 1, 1, 1, 1, 1,
-0.6561164, -0.702487, -2.863598, 1, 1, 1, 1, 1,
-0.650436, -0.3972823, -2.118235, 1, 1, 1, 1, 1,
-0.6494614, -0.1848052, -2.495189, 1, 1, 1, 1, 1,
-0.6479545, 0.3340102, -1.258419, 1, 1, 1, 1, 1,
-0.6451872, 1.476565, -0.7523852, 1, 1, 1, 1, 1,
-0.6429353, 2.775991, -0.02508302, 1, 1, 1, 1, 1,
-0.6394096, 0.3891701, -0.4945511, 1, 1, 1, 1, 1,
-0.6370205, -1.218088, -3.254429, 1, 1, 1, 1, 1,
-0.634356, 0.08215274, -1.740353, 1, 1, 1, 1, 1,
-0.6325564, 0.1838099, -3.117668, 1, 1, 1, 1, 1,
-0.6323293, 0.7541682, -2.077115, 1, 1, 1, 1, 1,
-0.6299527, -1.38817, -2.364163, 0, 0, 1, 1, 1,
-0.6293806, -0.2677802, -2.124843, 1, 0, 0, 1, 1,
-0.6173506, -1.436512, -3.565839, 1, 0, 0, 1, 1,
-0.6077501, -1.001511, -3.412129, 1, 0, 0, 1, 1,
-0.6020886, -0.2824873, -1.186193, 1, 0, 0, 1, 1,
-0.6017494, 0.428258, 0.00861889, 1, 0, 0, 1, 1,
-0.5892125, -0.04960088, -2.165951, 0, 0, 0, 1, 1,
-0.5846952, 0.2906781, -2.181625, 0, 0, 0, 1, 1,
-0.5826499, 1.330814, -1.892099, 0, 0, 0, 1, 1,
-0.5815842, -0.8486397, -2.139266, 0, 0, 0, 1, 1,
-0.5813791, -0.4609215, -2.335581, 0, 0, 0, 1, 1,
-0.5792332, -1.288036, -0.8394448, 0, 0, 0, 1, 1,
-0.5766912, -0.09383745, -1.807269, 0, 0, 0, 1, 1,
-0.5741564, 0.2106751, -0.930011, 1, 1, 1, 1, 1,
-0.5740954, 2.507714, -0.1456066, 1, 1, 1, 1, 1,
-0.5695155, 0.03777301, -1.506043, 1, 1, 1, 1, 1,
-0.5684962, 0.2580154, -1.324413, 1, 1, 1, 1, 1,
-0.5678694, -1.415271, -2.263073, 1, 1, 1, 1, 1,
-0.5666724, 0.558643, -1.351365, 1, 1, 1, 1, 1,
-0.5648222, -1.238955, -2.745231, 1, 1, 1, 1, 1,
-0.5640956, -1.171051, -0.4067479, 1, 1, 1, 1, 1,
-0.5622203, 0.5357837, -2.480999, 1, 1, 1, 1, 1,
-0.5592891, -0.5810099, -2.392404, 1, 1, 1, 1, 1,
-0.5584065, 0.5222861, -1.400675, 1, 1, 1, 1, 1,
-0.5566141, -0.07732536, -1.430259, 1, 1, 1, 1, 1,
-0.5557222, -0.07053101, -0.2721451, 1, 1, 1, 1, 1,
-0.5556114, -1.888562, -3.353885, 1, 1, 1, 1, 1,
-0.5523251, 0.3865166, 0.3576064, 1, 1, 1, 1, 1,
-0.551864, -0.3584394, -1.212244, 0, 0, 1, 1, 1,
-0.5491408, -0.5859538, -3.792864, 1, 0, 0, 1, 1,
-0.5405985, -0.6201121, -2.578635, 1, 0, 0, 1, 1,
-0.5402121, -1.338555, -2.846542, 1, 0, 0, 1, 1,
-0.5386957, -0.36167, -2.631988, 1, 0, 0, 1, 1,
-0.5379162, -1.616037, -3.001014, 1, 0, 0, 1, 1,
-0.5368159, -0.1329519, -0.4135294, 0, 0, 0, 1, 1,
-0.527638, 0.09365331, -0.1252722, 0, 0, 0, 1, 1,
-0.5264238, -1.555367, -3.442463, 0, 0, 0, 1, 1,
-0.5258607, 0.8662386, 0.5426236, 0, 0, 0, 1, 1,
-0.5250076, -0.6000469, -4.960226, 0, 0, 0, 1, 1,
-0.5231495, 0.3666288, -0.7010656, 0, 0, 0, 1, 1,
-0.5211416, 1.154652, -0.03539836, 0, 0, 0, 1, 1,
-0.5207089, -0.5408289, -0.8395096, 1, 1, 1, 1, 1,
-0.517312, 0.9185215, -0.892265, 1, 1, 1, 1, 1,
-0.5161909, 1.584365, -1.693245, 1, 1, 1, 1, 1,
-0.5126489, -1.371374, -1.805334, 1, 1, 1, 1, 1,
-0.5076619, 0.3612522, -2.237704, 1, 1, 1, 1, 1,
-0.5064914, 0.8225545, -2.873031, 1, 1, 1, 1, 1,
-0.5048946, 0.3056898, -1.993946, 1, 1, 1, 1, 1,
-0.5042714, 0.3874491, -2.99369, 1, 1, 1, 1, 1,
-0.504162, -0.2861471, -1.553832, 1, 1, 1, 1, 1,
-0.4998803, -0.7356688, -2.930428, 1, 1, 1, 1, 1,
-0.4989329, -0.1446682, -1.386412, 1, 1, 1, 1, 1,
-0.4987059, 0.4009003, -2.145881, 1, 1, 1, 1, 1,
-0.4960549, 0.1671895, -0.93937, 1, 1, 1, 1, 1,
-0.4935967, -1.276038, -2.671216, 1, 1, 1, 1, 1,
-0.4934246, 0.5981874, -0.4255343, 1, 1, 1, 1, 1,
-0.4889361, -0.887776, -3.049903, 0, 0, 1, 1, 1,
-0.4887845, 0.7281463, -0.6444533, 1, 0, 0, 1, 1,
-0.4876173, 0.5662994, -1.300142, 1, 0, 0, 1, 1,
-0.4858225, 0.6558859, -2.147286, 1, 0, 0, 1, 1,
-0.4839396, -0.1662558, -1.008189, 1, 0, 0, 1, 1,
-0.4831941, -1.687088, -3.888781, 1, 0, 0, 1, 1,
-0.4753819, -2.321208, -1.830427, 0, 0, 0, 1, 1,
-0.4703032, 0.2959835, -1.018466, 0, 0, 0, 1, 1,
-0.4631293, -1.589169, -2.127193, 0, 0, 0, 1, 1,
-0.4595633, 0.2337962, -0.5910535, 0, 0, 0, 1, 1,
-0.4591363, 0.9353262, -0.1332879, 0, 0, 0, 1, 1,
-0.456535, 0.6168301, 0.905485, 0, 0, 0, 1, 1,
-0.45556, -0.472173, -1.93079, 0, 0, 0, 1, 1,
-0.4461065, -1.35319, -4.597727, 1, 1, 1, 1, 1,
-0.437595, 0.8030955, -0.2853772, 1, 1, 1, 1, 1,
-0.4343814, -1.132583, -3.636388, 1, 1, 1, 1, 1,
-0.4322558, 1.859882, 0.1192562, 1, 1, 1, 1, 1,
-0.4300867, -0.3826407, -2.521163, 1, 1, 1, 1, 1,
-0.4266379, 0.04147108, -2.12126, 1, 1, 1, 1, 1,
-0.4253445, -0.2032185, -1.520468, 1, 1, 1, 1, 1,
-0.4250765, -0.6000248, -0.8657405, 1, 1, 1, 1, 1,
-0.420903, -1.332996, -3.427505, 1, 1, 1, 1, 1,
-0.4205587, 1.186998, -0.2023499, 1, 1, 1, 1, 1,
-0.4166637, 1.507083, 0.5599822, 1, 1, 1, 1, 1,
-0.4143547, -1.192828, -3.161965, 1, 1, 1, 1, 1,
-0.408772, -0.5592172, -2.040384, 1, 1, 1, 1, 1,
-0.4064636, -1.725424, -2.571382, 1, 1, 1, 1, 1,
-0.405621, 1.09151, -0.8042813, 1, 1, 1, 1, 1,
-0.4044226, 1.61072, 1.344735, 0, 0, 1, 1, 1,
-0.4011356, 2.328261, 2.410227, 1, 0, 0, 1, 1,
-0.3932214, 0.380922, -1.092921, 1, 0, 0, 1, 1,
-0.3926905, 0.1034467, -1.002379, 1, 0, 0, 1, 1,
-0.3925927, 0.3009663, -0.3709786, 1, 0, 0, 1, 1,
-0.3923539, -0.06754733, -1.165098, 1, 0, 0, 1, 1,
-0.3899734, -1.075132, -5.028967, 0, 0, 0, 1, 1,
-0.3898117, -0.3263474, -1.857162, 0, 0, 0, 1, 1,
-0.3858283, -1.688292, -2.976727, 0, 0, 0, 1, 1,
-0.3855179, 0.6687813, -0.6167753, 0, 0, 0, 1, 1,
-0.3809353, -1.31531, -3.191289, 0, 0, 0, 1, 1,
-0.3791529, 0.6534142, -0.9510299, 0, 0, 0, 1, 1,
-0.3787576, 1.424695, 1.205648, 0, 0, 0, 1, 1,
-0.3650548, -0.7732767, -3.849538, 1, 1, 1, 1, 1,
-0.3635319, -1.47096, -2.883403, 1, 1, 1, 1, 1,
-0.3615368, -0.4669684, -3.45947, 1, 1, 1, 1, 1,
-0.3580711, -0.09161667, -3.40646, 1, 1, 1, 1, 1,
-0.3560674, 0.3084126, -1.422554, 1, 1, 1, 1, 1,
-0.3522574, 0.04946597, -2.047659, 1, 1, 1, 1, 1,
-0.3510289, 0.5119038, 0.6584972, 1, 1, 1, 1, 1,
-0.3467843, 1.046944, 0.1382639, 1, 1, 1, 1, 1,
-0.3462024, -0.2980435, -4.24074, 1, 1, 1, 1, 1,
-0.3456635, -1.588885, -2.837971, 1, 1, 1, 1, 1,
-0.3417074, -1.380462, -1.619759, 1, 1, 1, 1, 1,
-0.3405582, -0.2443101, -1.9505, 1, 1, 1, 1, 1,
-0.339288, -2.088452, -3.369295, 1, 1, 1, 1, 1,
-0.3391335, 0.4391178, -1.136363, 1, 1, 1, 1, 1,
-0.3354201, 1.177938, 0.9726712, 1, 1, 1, 1, 1,
-0.333581, 1.897108, -0.1531575, 0, 0, 1, 1, 1,
-0.329562, -0.1362974, -2.912185, 1, 0, 0, 1, 1,
-0.3291622, 0.9564968, -2.106581, 1, 0, 0, 1, 1,
-0.3280724, -0.04305351, -0.1644178, 1, 0, 0, 1, 1,
-0.3273399, 0.7561585, 1.183628, 1, 0, 0, 1, 1,
-0.3216631, 1.348409, 0.7634856, 1, 0, 0, 1, 1,
-0.3214158, 0.8183173, -0.7968274, 0, 0, 0, 1, 1,
-0.3195561, 0.6535348, -1.001021, 0, 0, 0, 1, 1,
-0.3169081, 0.2015657, -1.536471, 0, 0, 0, 1, 1,
-0.3167101, 0.0519411, -1.585829, 0, 0, 0, 1, 1,
-0.3159538, -0.3000865, -2.779925, 0, 0, 0, 1, 1,
-0.3097444, -2.135705, -2.904122, 0, 0, 0, 1, 1,
-0.3096861, 1.000552, -0.6224683, 0, 0, 0, 1, 1,
-0.3091908, -0.773625, -2.712758, 1, 1, 1, 1, 1,
-0.3054287, -1.63835, -2.883005, 1, 1, 1, 1, 1,
-0.3044137, 0.2259108, -0.8278046, 1, 1, 1, 1, 1,
-0.3031695, 0.7220312, -0.05623164, 1, 1, 1, 1, 1,
-0.3021534, 0.532684, -0.4116063, 1, 1, 1, 1, 1,
-0.3021209, -0.03976928, -1.901114, 1, 1, 1, 1, 1,
-0.3021186, -1.347199, -2.100348, 1, 1, 1, 1, 1,
-0.3017316, -0.3629441, -1.887494, 1, 1, 1, 1, 1,
-0.3014841, -0.4456909, -2.637331, 1, 1, 1, 1, 1,
-0.2918932, 0.7254759, -0.6817117, 1, 1, 1, 1, 1,
-0.2912853, 0.0425368, -0.8777468, 1, 1, 1, 1, 1,
-0.2907769, -0.4883136, -2.569004, 1, 1, 1, 1, 1,
-0.2879028, -0.8446378, -2.725592, 1, 1, 1, 1, 1,
-0.2842932, -0.04696659, -1.442203, 1, 1, 1, 1, 1,
-0.2840557, 0.9044981, -1.452655, 1, 1, 1, 1, 1,
-0.2838944, 0.7362479, -1.014539, 0, 0, 1, 1, 1,
-0.2824331, 1.045256, -0.1060529, 1, 0, 0, 1, 1,
-0.2817987, -0.5917657, -1.540991, 1, 0, 0, 1, 1,
-0.2762341, -0.3520138, -1.537193, 1, 0, 0, 1, 1,
-0.2674446, 0.4478862, 1.384076, 1, 0, 0, 1, 1,
-0.2665124, 0.2245913, 1.324892, 1, 0, 0, 1, 1,
-0.265817, -0.2306938, -3.144855, 0, 0, 0, 1, 1,
-0.2646039, -0.4227428, -1.011937, 0, 0, 0, 1, 1,
-0.2645129, 0.3403307, -2.889972, 0, 0, 0, 1, 1,
-0.2597923, 1.749964, 0.6151842, 0, 0, 0, 1, 1,
-0.2550543, 1.445206, -1.203911, 0, 0, 0, 1, 1,
-0.2527258, 0.4641931, -1.015182, 0, 0, 0, 1, 1,
-0.2521125, -1.830672, -3.709939, 0, 0, 0, 1, 1,
-0.2514004, -0.1473024, -0.1044794, 1, 1, 1, 1, 1,
-0.2471528, -0.1267768, -2.405103, 1, 1, 1, 1, 1,
-0.2413502, 0.5133255, -0.4782971, 1, 1, 1, 1, 1,
-0.2313163, 0.752069, 1.870973, 1, 1, 1, 1, 1,
-0.2281382, 0.09236437, -2.456999, 1, 1, 1, 1, 1,
-0.2277796, -1.247301, -3.141188, 1, 1, 1, 1, 1,
-0.2249773, -1.35669, -2.13117, 1, 1, 1, 1, 1,
-0.2237244, -0.08726964, -1.758739, 1, 1, 1, 1, 1,
-0.2224877, 0.03082426, -0.3612577, 1, 1, 1, 1, 1,
-0.2160043, -0.3896423, -2.843878, 1, 1, 1, 1, 1,
-0.2101399, 0.2514984, -0.8970856, 1, 1, 1, 1, 1,
-0.2082228, 0.08052568, -1.108142, 1, 1, 1, 1, 1,
-0.2050848, 0.3109058, -1.220053, 1, 1, 1, 1, 1,
-0.1943037, -0.1213743, -4.327385, 1, 1, 1, 1, 1,
-0.1937348, -0.2851235, -3.15957, 1, 1, 1, 1, 1,
-0.1922445, -1.204318, -2.595912, 0, 0, 1, 1, 1,
-0.1907541, -0.2654821, -3.402322, 1, 0, 0, 1, 1,
-0.1872617, 0.3405651, -2.136365, 1, 0, 0, 1, 1,
-0.1833705, -0.3376281, -1.402992, 1, 0, 0, 1, 1,
-0.1795507, -0.5891463, -2.635023, 1, 0, 0, 1, 1,
-0.1765253, -0.7032074, -2.775911, 1, 0, 0, 1, 1,
-0.1762824, -1.148221, -2.071048, 0, 0, 0, 1, 1,
-0.1749648, -1.355141, -2.066133, 0, 0, 0, 1, 1,
-0.1702876, -1.16743, -1.688976, 0, 0, 0, 1, 1,
-0.1682699, -0.7025276, -2.592026, 0, 0, 0, 1, 1,
-0.163783, 1.55293, 0.05581176, 0, 0, 0, 1, 1,
-0.1636235, 1.421598, -0.3663343, 0, 0, 0, 1, 1,
-0.1616759, -0.03035006, -1.120567, 0, 0, 0, 1, 1,
-0.1540913, -1.457059, -2.096598, 1, 1, 1, 1, 1,
-0.153851, -1.464689, -4.035004, 1, 1, 1, 1, 1,
-0.1521178, 0.24288, -1.276305, 1, 1, 1, 1, 1,
-0.1456752, 0.4229196, 0.1821928, 1, 1, 1, 1, 1,
-0.1428605, 1.041626, 0.5815511, 1, 1, 1, 1, 1,
-0.1426218, -1.283957, -2.134555, 1, 1, 1, 1, 1,
-0.1423964, 0.4353841, -0.1842637, 1, 1, 1, 1, 1,
-0.1422058, 1.818796, 0.4355709, 1, 1, 1, 1, 1,
-0.1379004, 0.1873778, -1.196866, 1, 1, 1, 1, 1,
-0.1345968, -0.2456218, -4.821895, 1, 1, 1, 1, 1,
-0.1233157, 0.7347878, 0.9644125, 1, 1, 1, 1, 1,
-0.121546, -1.731727, -3.499687, 1, 1, 1, 1, 1,
-0.1179236, -0.5973455, -1.310753, 1, 1, 1, 1, 1,
-0.1153091, 1.327232, 1.207933, 1, 1, 1, 1, 1,
-0.1148503, -1.755288, -2.84393, 1, 1, 1, 1, 1,
-0.1000878, 1.724793, -0.04730354, 0, 0, 1, 1, 1,
-0.09953916, -0.9098828, -2.003768, 1, 0, 0, 1, 1,
-0.09825698, -1.238157, -4.753245, 1, 0, 0, 1, 1,
-0.09764473, -1.043836, -2.469076, 1, 0, 0, 1, 1,
-0.09752388, 0.8695378, 1.482517, 1, 0, 0, 1, 1,
-0.08778937, -1.604312, -3.463674, 1, 0, 0, 1, 1,
-0.08532222, 0.7136448, 0.09826087, 0, 0, 0, 1, 1,
-0.08346549, -1.576821, -3.73364, 0, 0, 0, 1, 1,
-0.07969398, 0.5706517, -1.876774, 0, 0, 0, 1, 1,
-0.07522295, 1.284358, 0.6458711, 0, 0, 0, 1, 1,
-0.07402011, 0.5000857, 0.4920593, 0, 0, 0, 1, 1,
-0.06886555, -0.8455164, -3.334335, 0, 0, 0, 1, 1,
-0.06689378, -1.024651, -1.493906, 0, 0, 0, 1, 1,
-0.06453347, 0.3190667, 0.5770365, 1, 1, 1, 1, 1,
-0.0615142, -0.9141155, -4.316408, 1, 1, 1, 1, 1,
-0.05814304, -0.4183181, -2.080641, 1, 1, 1, 1, 1,
-0.05633726, -0.5574307, -4.519916, 1, 1, 1, 1, 1,
-0.05352638, -1.508506, -3.20581, 1, 1, 1, 1, 1,
-0.05046565, 0.1512147, -0.1937103, 1, 1, 1, 1, 1,
-0.04880334, -0.2174395, -4.139923, 1, 1, 1, 1, 1,
-0.04502784, -0.8161385, -3.747678, 1, 1, 1, 1, 1,
-0.04314927, 1.012676, 0.1537631, 1, 1, 1, 1, 1,
-0.04297462, 0.5117102, 0.4365644, 1, 1, 1, 1, 1,
-0.04277471, -0.1836284, -2.380953, 1, 1, 1, 1, 1,
-0.04140703, -1.163266, -4.215149, 1, 1, 1, 1, 1,
-0.04064046, 0.9465237, -0.2662224, 1, 1, 1, 1, 1,
-0.04018081, 1.693934, -0.4790609, 1, 1, 1, 1, 1,
-0.03846117, 0.3524044, 0.004920263, 1, 1, 1, 1, 1,
-0.03694273, -1.276005, -2.034255, 0, 0, 1, 1, 1,
-0.03690139, 0.5829017, -0.401598, 1, 0, 0, 1, 1,
-0.03030842, 0.3845745, -1.651573, 1, 0, 0, 1, 1,
-0.02565573, 0.1516028, -1.163136, 1, 0, 0, 1, 1,
-0.02016901, 0.8120821, -1.804872, 1, 0, 0, 1, 1,
-0.01888826, 1.185686, -0.7884395, 1, 0, 0, 1, 1,
-0.0142035, 0.791484, -0.3293118, 0, 0, 0, 1, 1,
-0.007675488, -0.3970748, -2.356622, 0, 0, 0, 1, 1,
-0.006700426, 0.9201752, 0.7931711, 0, 0, 0, 1, 1,
-0.003456754, 0.2698886, 0.6188533, 0, 0, 0, 1, 1,
0.002577467, -2.475025, 1.659832, 0, 0, 0, 1, 1,
0.004062307, -0.9798761, 3.247507, 0, 0, 0, 1, 1,
0.00444163, 1.995551, -1.792215, 0, 0, 0, 1, 1,
0.005171235, -0.1091961, 3.804976, 1, 1, 1, 1, 1,
0.00806316, -1.03629, 3.816881, 1, 1, 1, 1, 1,
0.009268459, -0.3918414, 2.391301, 1, 1, 1, 1, 1,
0.009920579, -0.4176224, 2.766484, 1, 1, 1, 1, 1,
0.01073332, 1.382665, 0.8776059, 1, 1, 1, 1, 1,
0.01442192, 0.2626554, 0.9544562, 1, 1, 1, 1, 1,
0.01453845, 0.7576918, 0.2029518, 1, 1, 1, 1, 1,
0.02145771, 0.5619884, 0.1957581, 1, 1, 1, 1, 1,
0.02254149, -1.66207, 4.126952, 1, 1, 1, 1, 1,
0.02308211, 2.005111, -0.2123737, 1, 1, 1, 1, 1,
0.02634289, 0.3146631, 1.158707, 1, 1, 1, 1, 1,
0.02923764, 0.2952788, -0.09390033, 1, 1, 1, 1, 1,
0.03058959, -0.1216553, 3.952303, 1, 1, 1, 1, 1,
0.03298771, -0.6112799, 3.039735, 1, 1, 1, 1, 1,
0.03403525, 0.05708251, 0.1334166, 1, 1, 1, 1, 1,
0.03731649, -2.096485, 2.572966, 0, 0, 1, 1, 1,
0.0375342, 1.955811, 0.1193103, 1, 0, 0, 1, 1,
0.03756662, -0.4597369, 4.473965, 1, 0, 0, 1, 1,
0.03958521, -0.8677895, 4.093924, 1, 0, 0, 1, 1,
0.04053191, -1.239244, 3.825727, 1, 0, 0, 1, 1,
0.04526074, -0.2753154, 2.482073, 1, 0, 0, 1, 1,
0.04620185, 0.449099, 0.4337813, 0, 0, 0, 1, 1,
0.04855921, -1.046119, 2.471992, 0, 0, 0, 1, 1,
0.05609582, -0.3744093, 2.267515, 0, 0, 0, 1, 1,
0.05742587, 0.3521722, -0.5393277, 0, 0, 0, 1, 1,
0.05956725, 0.8930505, 1.294003, 0, 0, 0, 1, 1,
0.05989937, -0.5634143, 3.733803, 0, 0, 0, 1, 1,
0.06279514, -0.0007933525, 1.730177, 0, 0, 0, 1, 1,
0.06451813, 0.6478373, 0.5704194, 1, 1, 1, 1, 1,
0.066862, -1.292672, 4.226331, 1, 1, 1, 1, 1,
0.06720234, -0.97346, 3.296134, 1, 1, 1, 1, 1,
0.07375336, -1.629129, 1.313396, 1, 1, 1, 1, 1,
0.07537219, -0.7450461, 4.137202, 1, 1, 1, 1, 1,
0.07682804, 3.008156, -0.8882173, 1, 1, 1, 1, 1,
0.07729126, 0.6906747, -0.6751313, 1, 1, 1, 1, 1,
0.0813324, -0.6009047, 3.069043, 1, 1, 1, 1, 1,
0.08411714, -1.811894, 3.320065, 1, 1, 1, 1, 1,
0.0841191, 0.5569593, 1.074112, 1, 1, 1, 1, 1,
0.08423542, -2.168263, 2.098223, 1, 1, 1, 1, 1,
0.08446361, 0.188432, 0.1428234, 1, 1, 1, 1, 1,
0.08618867, -0.3799032, 1.973439, 1, 1, 1, 1, 1,
0.09001755, -0.653612, 1.241972, 1, 1, 1, 1, 1,
0.09175399, -1.30603, 2.512126, 1, 1, 1, 1, 1,
0.09205555, -0.1704745, 2.126957, 0, 0, 1, 1, 1,
0.09477219, 0.5067608, -1.609845, 1, 0, 0, 1, 1,
0.0964134, -1.00247, 2.063136, 1, 0, 0, 1, 1,
0.09834647, 0.1924382, 0.1258826, 1, 0, 0, 1, 1,
0.1015321, -0.4467541, 3.512922, 1, 0, 0, 1, 1,
0.10189, -0.8176451, 3.675815, 1, 0, 0, 1, 1,
0.1025516, -1.02121, 3.094588, 0, 0, 0, 1, 1,
0.1033299, 0.03183191, 0.2286135, 0, 0, 0, 1, 1,
0.1099484, 0.6259068, -1.150171, 0, 0, 0, 1, 1,
0.1176678, -0.003941271, 0.3562466, 0, 0, 0, 1, 1,
0.1272237, 0.02114619, -0.2024486, 0, 0, 0, 1, 1,
0.1283315, -0.4616823, 2.430536, 0, 0, 0, 1, 1,
0.1286568, 0.9351122, 1.682031, 0, 0, 0, 1, 1,
0.1324741, 0.1085875, 0.4031818, 1, 1, 1, 1, 1,
0.1369157, -0.4784599, 1.875826, 1, 1, 1, 1, 1,
0.1398334, -1.45214, 2.616723, 1, 1, 1, 1, 1,
0.1410855, -0.4714384, 3.093901, 1, 1, 1, 1, 1,
0.1419147, -0.7073991, 4.489461, 1, 1, 1, 1, 1,
0.1447912, -0.1756569, -0.0118145, 1, 1, 1, 1, 1,
0.1485803, 1.280845, -1.423286, 1, 1, 1, 1, 1,
0.1486185, 1.183633, -1.281908, 1, 1, 1, 1, 1,
0.151613, -0.6287044, 2.670666, 1, 1, 1, 1, 1,
0.1559071, -1.045438, 3.054611, 1, 1, 1, 1, 1,
0.1600873, 0.3955858, 0.5223036, 1, 1, 1, 1, 1,
0.1607339, 0.8827044, -0.6376166, 1, 1, 1, 1, 1,
0.1642639, -0.4048839, 1.791752, 1, 1, 1, 1, 1,
0.1668082, -1.108092, 1.864445, 1, 1, 1, 1, 1,
0.1740148, -0.9761395, 2.543156, 1, 1, 1, 1, 1,
0.1764429, -0.5153819, 1.969961, 0, 0, 1, 1, 1,
0.1784346, -0.5266589, 2.916831, 1, 0, 0, 1, 1,
0.1832263, 1.51858, 1.279754, 1, 0, 0, 1, 1,
0.1866121, -2.365197, 1.285757, 1, 0, 0, 1, 1,
0.1874735, -0.5296457, 4.539306, 1, 0, 0, 1, 1,
0.1917842, -0.09872475, 3.607965, 1, 0, 0, 1, 1,
0.1927627, -0.09539147, 2.429451, 0, 0, 0, 1, 1,
0.1949987, -0.8886064, 3.369022, 0, 0, 0, 1, 1,
0.1986646, -0.1210282, 3.678874, 0, 0, 0, 1, 1,
0.201171, 0.4033265, -0.486511, 0, 0, 0, 1, 1,
0.2050719, 0.2333422, 1.015324, 0, 0, 0, 1, 1,
0.210211, 0.6183876, -1.021873, 0, 0, 0, 1, 1,
0.2143596, 2.209296, 0.2396325, 0, 0, 0, 1, 1,
0.216026, 0.6513996, 0.3644163, 1, 1, 1, 1, 1,
0.2273895, -0.03704925, 0.603717, 1, 1, 1, 1, 1,
0.229857, 0.05434816, 0.8667422, 1, 1, 1, 1, 1,
0.2328769, 0.7221273, 0.248806, 1, 1, 1, 1, 1,
0.2341488, 0.8394037, 0.6151008, 1, 1, 1, 1, 1,
0.2358436, -0.2470139, 0.6249715, 1, 1, 1, 1, 1,
0.2363643, 0.6376925, -0.5425641, 1, 1, 1, 1, 1,
0.2423016, -0.2513936, 2.733479, 1, 1, 1, 1, 1,
0.2423393, -0.6389271, 2.043708, 1, 1, 1, 1, 1,
0.2480022, -1.915533, 3.632461, 1, 1, 1, 1, 1,
0.2493021, 0.2599647, 2.420599, 1, 1, 1, 1, 1,
0.2540781, -0.283458, 2.151848, 1, 1, 1, 1, 1,
0.2575469, -0.8538135, 2.189702, 1, 1, 1, 1, 1,
0.2580045, 0.6041004, -0.02048167, 1, 1, 1, 1, 1,
0.2603848, -0.8491632, 2.432932, 1, 1, 1, 1, 1,
0.2628599, 1.48125, -0.4022497, 0, 0, 1, 1, 1,
0.2745331, 0.343067, 0.7031378, 1, 0, 0, 1, 1,
0.274773, 0.3467371, 0.6894925, 1, 0, 0, 1, 1,
0.2753105, -0.5671437, 4.328072, 1, 0, 0, 1, 1,
0.2762276, -0.2840782, 2.503304, 1, 0, 0, 1, 1,
0.2766509, 1.31203, 0.7094067, 1, 0, 0, 1, 1,
0.2776136, 0.3067507, 0.541577, 0, 0, 0, 1, 1,
0.2816315, -0.3659307, 2.9956, 0, 0, 0, 1, 1,
0.2827299, -1.317179, 3.301538, 0, 0, 0, 1, 1,
0.2844996, -0.3743016, 2.1329, 0, 0, 0, 1, 1,
0.2850085, 0.14915, -0.9698861, 0, 0, 0, 1, 1,
0.2874618, 0.3747785, 3.23052, 0, 0, 0, 1, 1,
0.2890891, -0.5180628, 2.372498, 0, 0, 0, 1, 1,
0.2918284, 1.044189, -0.2746396, 1, 1, 1, 1, 1,
0.2981832, 0.7231451, 0.4090946, 1, 1, 1, 1, 1,
0.3002496, 0.4502156, 0.4220428, 1, 1, 1, 1, 1,
0.3039792, -0.3327536, 2.852245, 1, 1, 1, 1, 1,
0.3067242, 0.2436567, 0.839588, 1, 1, 1, 1, 1,
0.3073786, -1.005042, 3.258884, 1, 1, 1, 1, 1,
0.3135073, 0.5796411, 1.098499, 1, 1, 1, 1, 1,
0.3185838, 0.06140354, 0.2387467, 1, 1, 1, 1, 1,
0.3207348, -1.028501, 1.820707, 1, 1, 1, 1, 1,
0.3336913, -0.3256926, 2.072675, 1, 1, 1, 1, 1,
0.3341856, 0.2723091, 1.594298, 1, 1, 1, 1, 1,
0.3417523, -1.662695, 2.098346, 1, 1, 1, 1, 1,
0.3470663, -0.1998534, 2.872953, 1, 1, 1, 1, 1,
0.3495437, -2.366953, 3.405785, 1, 1, 1, 1, 1,
0.3499109, -0.1766739, 1.219223, 1, 1, 1, 1, 1,
0.3517728, 1.914793, 1.019318, 0, 0, 1, 1, 1,
0.3523388, -0.6001247, 4.45113, 1, 0, 0, 1, 1,
0.3534587, 1.019476, 0.2717084, 1, 0, 0, 1, 1,
0.3571958, -1.557649, 2.001463, 1, 0, 0, 1, 1,
0.3576697, 0.2343419, 1.698631, 1, 0, 0, 1, 1,
0.3600882, 1.260233, -0.02554282, 1, 0, 0, 1, 1,
0.3641096, -1.058227, 2.797549, 0, 0, 0, 1, 1,
0.3647945, -0.4575857, 0.6110289, 0, 0, 0, 1, 1,
0.3666175, -0.7801904, 3.230339, 0, 0, 0, 1, 1,
0.3704332, -0.87505, 2.693687, 0, 0, 0, 1, 1,
0.3742998, 1.272053, 0.9765952, 0, 0, 0, 1, 1,
0.374638, 0.4431762, -1.010173, 0, 0, 0, 1, 1,
0.3765722, 0.5995347, 1.285852, 0, 0, 0, 1, 1,
0.3787659, -1.453609, 3.010633, 1, 1, 1, 1, 1,
0.380405, 0.7122394, 0.8911674, 1, 1, 1, 1, 1,
0.3834773, -1.179792, 3.435548, 1, 1, 1, 1, 1,
0.3878964, 1.773562, 0.1008136, 1, 1, 1, 1, 1,
0.3899838, 0.6057607, 0.02577892, 1, 1, 1, 1, 1,
0.3918726, 0.9507014, 0.5631043, 1, 1, 1, 1, 1,
0.3920415, -0.8355739, 2.866579, 1, 1, 1, 1, 1,
0.3935043, -1.062145, 4.595383, 1, 1, 1, 1, 1,
0.3964957, -0.3830366, 1.96984, 1, 1, 1, 1, 1,
0.3969822, 0.01715908, 1.734556, 1, 1, 1, 1, 1,
0.4046928, -1.784071, 3.448288, 1, 1, 1, 1, 1,
0.4047673, -0.2002663, 2.388684, 1, 1, 1, 1, 1,
0.4067937, 0.1103607, 1.799989, 1, 1, 1, 1, 1,
0.4105928, 0.749898, 0.9575622, 1, 1, 1, 1, 1,
0.4132469, -2.362112, 1.882143, 1, 1, 1, 1, 1,
0.4160133, -1.769614, 2.448928, 0, 0, 1, 1, 1,
0.4215689, 0.01473036, 3.297231, 1, 0, 0, 1, 1,
0.4235545, -1.076354, 1.195962, 1, 0, 0, 1, 1,
0.4244745, 0.6405026, 1.078107, 1, 0, 0, 1, 1,
0.4254732, -0.01844833, 1.950212, 1, 0, 0, 1, 1,
0.429848, -0.446557, 1.998596, 1, 0, 0, 1, 1,
0.4327273, 1.148818, 1.649584, 0, 0, 0, 1, 1,
0.4379649, 1.668648, -1.562547, 0, 0, 0, 1, 1,
0.4482542, -1.020341, 2.237167, 0, 0, 0, 1, 1,
0.458957, 0.1867083, 0.2512251, 0, 0, 0, 1, 1,
0.4594418, 0.5111875, -0.08113176, 0, 0, 0, 1, 1,
0.4619394, -0.1607127, 1.5811, 0, 0, 0, 1, 1,
0.4628944, 0.6475494, 2.002337, 0, 0, 0, 1, 1,
0.4633386, -0.3203439, -0.05203659, 1, 1, 1, 1, 1,
0.4640267, 1.128042, -0.1752332, 1, 1, 1, 1, 1,
0.4643074, -1.805896, 2.602655, 1, 1, 1, 1, 1,
0.4655552, -0.6228694, 2.292936, 1, 1, 1, 1, 1,
0.4673083, 1.278128, 0.4672092, 1, 1, 1, 1, 1,
0.4685128, 1.117398, 0.0487767, 1, 1, 1, 1, 1,
0.4687935, 0.6191536, 0.8175964, 1, 1, 1, 1, 1,
0.4725408, -0.7774059, 3.894256, 1, 1, 1, 1, 1,
0.4726657, -0.997209, 5.172241, 1, 1, 1, 1, 1,
0.4745391, -0.8485221, 2.645543, 1, 1, 1, 1, 1,
0.4801885, -0.9216812, 2.389841, 1, 1, 1, 1, 1,
0.482018, 2.621956, -1.130648, 1, 1, 1, 1, 1,
0.4879308, 0.01587157, 2.534431, 1, 1, 1, 1, 1,
0.4888986, 1.591805, 0.03777069, 1, 1, 1, 1, 1,
0.4892438, -0.8837901, 3.369328, 1, 1, 1, 1, 1,
0.4897881, -0.5421637, 2.276199, 0, 0, 1, 1, 1,
0.491817, 0.131065, 1.020129, 1, 0, 0, 1, 1,
0.4952659, 0.3076055, 3.639244, 1, 0, 0, 1, 1,
0.4981818, -0.7214749, 0.6167948, 1, 0, 0, 1, 1,
0.4985531, -1.766384, 3.531743, 1, 0, 0, 1, 1,
0.4990973, 0.4116795, 1.527467, 1, 0, 0, 1, 1,
0.5002589, 0.3632004, 1.512277, 0, 0, 0, 1, 1,
0.5005519, -1.946682, 3.421435, 0, 0, 0, 1, 1,
0.5039563, -0.5881352, 2.052744, 0, 0, 0, 1, 1,
0.504608, -0.09399013, 0.5374441, 0, 0, 0, 1, 1,
0.5047636, -1.236951, 4.540044, 0, 0, 0, 1, 1,
0.5056409, 0.0378984, 1.774812, 0, 0, 0, 1, 1,
0.5062891, -0.2755032, 2.879885, 0, 0, 0, 1, 1,
0.5077981, -1.139154, 3.316554, 1, 1, 1, 1, 1,
0.5097147, -0.5093982, 1.971365, 1, 1, 1, 1, 1,
0.513078, -1.430116, 2.09997, 1, 1, 1, 1, 1,
0.514573, -1.255338, 2.537397, 1, 1, 1, 1, 1,
0.517132, -1.82807, 1.453722, 1, 1, 1, 1, 1,
0.5219786, -0.3935983, 2.068305, 1, 1, 1, 1, 1,
0.5223506, 0.09480859, 0.8458883, 1, 1, 1, 1, 1,
0.5256028, -0.5263074, 2.651653, 1, 1, 1, 1, 1,
0.5273898, 1.841825, 0.8386347, 1, 1, 1, 1, 1,
0.5277148, 0.2486472, 1.845109, 1, 1, 1, 1, 1,
0.5324432, 0.7888922, 1.825267, 1, 1, 1, 1, 1,
0.5440781, -1.365012, 2.812253, 1, 1, 1, 1, 1,
0.5466815, -0.7552645, 3.052714, 1, 1, 1, 1, 1,
0.5521712, -0.08870209, 0.04058788, 1, 1, 1, 1, 1,
0.5556532, 0.622007, 0.2694593, 1, 1, 1, 1, 1,
0.558512, -0.04545158, 3.05186, 0, 0, 1, 1, 1,
0.567673, 1.945736, 0.6310203, 1, 0, 0, 1, 1,
0.5678658, -2.089491, 3.243588, 1, 0, 0, 1, 1,
0.5713809, 0.6651578, -0.5816765, 1, 0, 0, 1, 1,
0.572228, 0.8988599, -0.3642622, 1, 0, 0, 1, 1,
0.5734574, 0.1947405, 0.05061231, 1, 0, 0, 1, 1,
0.5738333, -1.370211, 2.900524, 0, 0, 0, 1, 1,
0.574961, -1.17025, 2.119782, 0, 0, 0, 1, 1,
0.5751041, -0.5039561, 2.557318, 0, 0, 0, 1, 1,
0.5798609, -0.6836348, 1.2805, 0, 0, 0, 1, 1,
0.5821174, -0.08454024, 1.824336, 0, 0, 0, 1, 1,
0.5835616, -0.1676783, 2.33296, 0, 0, 0, 1, 1,
0.5867896, 1.35331, -0.20115, 0, 0, 0, 1, 1,
0.5896103, -0.6245194, 0.9479945, 1, 1, 1, 1, 1,
0.590807, -0.0757159, 2.417184, 1, 1, 1, 1, 1,
0.5921975, 0.3102504, 1.723354, 1, 1, 1, 1, 1,
0.5956085, 0.00600868, 1.236709, 1, 1, 1, 1, 1,
0.5969416, -0.5306042, -0.03087098, 1, 1, 1, 1, 1,
0.5976536, 0.04138803, 0.1082201, 1, 1, 1, 1, 1,
0.6022412, -0.05395301, 2.488131, 1, 1, 1, 1, 1,
0.6023997, 1.723103, -0.1246754, 1, 1, 1, 1, 1,
0.6062502, -1.510004, 2.874648, 1, 1, 1, 1, 1,
0.6094663, 1.102616, 1.660878, 1, 1, 1, 1, 1,
0.6110967, -0.6718668, 2.312932, 1, 1, 1, 1, 1,
0.6137726, -0.1173646, 3.540225, 1, 1, 1, 1, 1,
0.6216104, 0.04496462, 1.35181, 1, 1, 1, 1, 1,
0.6228772, -0.6605083, 3.341944, 1, 1, 1, 1, 1,
0.6274396, -0.2587332, 2.496099, 1, 1, 1, 1, 1,
0.6327992, 0.05097502, 2.030844, 0, 0, 1, 1, 1,
0.6337876, 0.003394029, 1.824651, 1, 0, 0, 1, 1,
0.6368506, -1.812085, 1.898698, 1, 0, 0, 1, 1,
0.6412712, -0.4332349, 2.56718, 1, 0, 0, 1, 1,
0.6464899, -2.149338, 4.625178, 1, 0, 0, 1, 1,
0.6548486, -0.05896208, 1.386614, 1, 0, 0, 1, 1,
0.6551852, 0.04837368, -0.2330656, 0, 0, 0, 1, 1,
0.6616979, 1.234363, 0.3940392, 0, 0, 0, 1, 1,
0.663379, -0.7994291, 2.757146, 0, 0, 0, 1, 1,
0.6645098, -1.091243, 0.1736116, 0, 0, 0, 1, 1,
0.6686661, 0.5933442, 2.958387, 0, 0, 0, 1, 1,
0.6704554, -1.252818, 2.79904, 0, 0, 0, 1, 1,
0.6741472, -0.4963258, 2.526037, 0, 0, 0, 1, 1,
0.6787077, 0.4554982, 1.964389, 1, 1, 1, 1, 1,
0.6827937, 0.6111359, 1.539708, 1, 1, 1, 1, 1,
0.6837603, 0.1310943, 2.384786, 1, 1, 1, 1, 1,
0.6856855, 2.592265, 0.941654, 1, 1, 1, 1, 1,
0.6967242, 0.1647254, 2.792723, 1, 1, 1, 1, 1,
0.6967387, -0.4311402, 3.350206, 1, 1, 1, 1, 1,
0.6967835, 0.03343115, 2.026982, 1, 1, 1, 1, 1,
0.6986243, -1.133957, 3.719943, 1, 1, 1, 1, 1,
0.7000313, 1.740234, -0.521821, 1, 1, 1, 1, 1,
0.7015777, -0.1943881, 2.748658, 1, 1, 1, 1, 1,
0.7022019, -1.116471, 2.871109, 1, 1, 1, 1, 1,
0.7067653, 0.2960087, 0.1904135, 1, 1, 1, 1, 1,
0.7101398, 0.2001905, 2.189522, 1, 1, 1, 1, 1,
0.7113445, 0.1827351, 0.3956918, 1, 1, 1, 1, 1,
0.7119897, 0.2198164, 1.735898, 1, 1, 1, 1, 1,
0.7147795, 1.223363, -1.869837, 0, 0, 1, 1, 1,
0.7148849, -0.2899198, 1.475356, 1, 0, 0, 1, 1,
0.722934, 0.1867323, 1.722942, 1, 0, 0, 1, 1,
0.7271696, 1.225329, 1.234304, 1, 0, 0, 1, 1,
0.7280194, -1.005125, 0.7822269, 1, 0, 0, 1, 1,
0.7312552, 0.2158459, -0.6754838, 1, 0, 0, 1, 1,
0.7316267, 1.35683, 0.4771123, 0, 0, 0, 1, 1,
0.7389871, 0.179274, 1.155341, 0, 0, 0, 1, 1,
0.7399561, 1.701667, -0.5129094, 0, 0, 0, 1, 1,
0.7400441, 0.002801155, 2.322485, 0, 0, 0, 1, 1,
0.7403743, -0.1356191, 2.001889, 0, 0, 0, 1, 1,
0.7405848, -0.8764145, 3.342502, 0, 0, 0, 1, 1,
0.7425544, -1.621086, 2.101411, 0, 0, 0, 1, 1,
0.7452252, 0.2631709, 1.311608, 1, 1, 1, 1, 1,
0.7541504, 0.01391141, 0.9118716, 1, 1, 1, 1, 1,
0.7648886, -0.4442405, 2.368053, 1, 1, 1, 1, 1,
0.7673432, 0.7381662, 0.3601532, 1, 1, 1, 1, 1,
0.7720526, -0.1018186, 1.249301, 1, 1, 1, 1, 1,
0.7722836, -1.252396, 4.169577, 1, 1, 1, 1, 1,
0.7780616, 1.406949, 1.041519, 1, 1, 1, 1, 1,
0.7832785, -0.1013587, 0.647839, 1, 1, 1, 1, 1,
0.7950581, 0.1515001, 2.053609, 1, 1, 1, 1, 1,
0.8018922, 0.3439781, 0.763473, 1, 1, 1, 1, 1,
0.8072025, 0.1364695, 0.5871315, 1, 1, 1, 1, 1,
0.8111303, -0.3153343, 2.06344, 1, 1, 1, 1, 1,
0.8119669, -1.696266, 4.525816, 1, 1, 1, 1, 1,
0.8137968, 0.3967222, 1.956455, 1, 1, 1, 1, 1,
0.8178065, -1.012199, 3.841583, 1, 1, 1, 1, 1,
0.8264902, -0.3621136, 1.038612, 0, 0, 1, 1, 1,
0.8327699, 1.006445, 2.070319, 1, 0, 0, 1, 1,
0.8346207, -0.5268048, 3.755717, 1, 0, 0, 1, 1,
0.8381963, 0.6066254, 0.8354981, 1, 0, 0, 1, 1,
0.8397742, -1.327852, 3.674945, 1, 0, 0, 1, 1,
0.8451905, 0.02062409, 2.273205, 1, 0, 0, 1, 1,
0.8456576, -0.5835947, 3.270527, 0, 0, 0, 1, 1,
0.8524418, -0.9488172, 3.322072, 0, 0, 0, 1, 1,
0.8554275, 0.39894, 0.3775609, 0, 0, 0, 1, 1,
0.858944, -0.9836888, 1.676755, 0, 0, 0, 1, 1,
0.8613291, 0.9586768, 1.303148, 0, 0, 0, 1, 1,
0.862381, 0.7682209, 1.520349, 0, 0, 0, 1, 1,
0.8635158, 1.227682, 1.826622, 0, 0, 0, 1, 1,
0.8642068, -0.3431901, 4.029296, 1, 1, 1, 1, 1,
0.8649532, 0.7003828, 1.406846, 1, 1, 1, 1, 1,
0.8655668, 0.7353948, -0.5569426, 1, 1, 1, 1, 1,
0.8667747, 1.525424, 1.043276, 1, 1, 1, 1, 1,
0.8704903, 1.734009, -0.2149697, 1, 1, 1, 1, 1,
0.873485, 0.8184185, 0.9855031, 1, 1, 1, 1, 1,
0.8735278, -0.3074237, 1.129593, 1, 1, 1, 1, 1,
0.8760473, 0.878679, 0.9702355, 1, 1, 1, 1, 1,
0.8760614, 1.731631, 1.22964, 1, 1, 1, 1, 1,
0.8803065, 0.4032282, 1.115942, 1, 1, 1, 1, 1,
0.8820769, 0.7961147, 1.832915, 1, 1, 1, 1, 1,
0.884083, 0.5639817, -0.6471115, 1, 1, 1, 1, 1,
0.8854417, 0.5461579, 2.470962, 1, 1, 1, 1, 1,
0.8887082, -0.7118979, 2.446302, 1, 1, 1, 1, 1,
0.8937907, 0.9609078, 0.7324359, 1, 1, 1, 1, 1,
0.8945427, -0.6949391, 0.4239849, 0, 0, 1, 1, 1,
0.8962694, 1.966766, 1.090208, 1, 0, 0, 1, 1,
0.9056982, -0.7580295, 1.735352, 1, 0, 0, 1, 1,
0.9069177, -0.6771259, 1.696838, 1, 0, 0, 1, 1,
0.9085563, -0.4904588, 3.064289, 1, 0, 0, 1, 1,
0.9164983, 1.997082, 0.8271475, 1, 0, 0, 1, 1,
0.9181482, 0.2086276, -0.03702107, 0, 0, 0, 1, 1,
0.922558, -1.37858, 0.1822242, 0, 0, 0, 1, 1,
0.9319136, 0.5302175, 0.9290311, 0, 0, 0, 1, 1,
0.9354504, -0.2937503, 1.895028, 0, 0, 0, 1, 1,
0.9376009, -0.9071254, 1.893331, 0, 0, 0, 1, 1,
0.9458419, 0.006194809, 1.942643, 0, 0, 0, 1, 1,
0.9471936, -0.28363, 0.4082105, 0, 0, 0, 1, 1,
0.9518093, 2.099261, -0.4239019, 1, 1, 1, 1, 1,
0.9527906, -1.217585, 2.801014, 1, 1, 1, 1, 1,
0.9553333, -0.9711401, 4.883789, 1, 1, 1, 1, 1,
0.9613222, 0.7536103, 1.117225, 1, 1, 1, 1, 1,
0.9618872, -0.8345643, 3.933334, 1, 1, 1, 1, 1,
0.9641584, 1.952654, 0.1909626, 1, 1, 1, 1, 1,
0.9650399, 0.1155198, 1.264714, 1, 1, 1, 1, 1,
0.9707071, 0.42472, 1.533775, 1, 1, 1, 1, 1,
0.9718606, 0.9802556, 2.118925, 1, 1, 1, 1, 1,
0.9828526, 0.391115, 0.414082, 1, 1, 1, 1, 1,
0.9846476, -0.6691539, 3.416801, 1, 1, 1, 1, 1,
0.9879247, 0.3154789, 2.603299, 1, 1, 1, 1, 1,
0.9934596, -1.568982, 1.352985, 1, 1, 1, 1, 1,
0.994623, -0.5211404, 0.6448513, 1, 1, 1, 1, 1,
0.9953375, 0.4290521, 1.354443, 1, 1, 1, 1, 1,
1.000722, -1.397425, 2.756115, 0, 0, 1, 1, 1,
1.005303, 1.581284, 0.491578, 1, 0, 0, 1, 1,
1.006845, -0.8697783, 2.222074, 1, 0, 0, 1, 1,
1.009712, 0.08735217, 1.517738, 1, 0, 0, 1, 1,
1.014167, 1.047706, 0.5395458, 1, 0, 0, 1, 1,
1.016982, -0.04689439, 0.9461232, 1, 0, 0, 1, 1,
1.021707, -0.9803345, 2.281506, 0, 0, 0, 1, 1,
1.027273, -2.212228, 3.392379, 0, 0, 0, 1, 1,
1.032316, -0.7015041, 2.867311, 0, 0, 0, 1, 1,
1.033769, 0.2459712, 1.697144, 0, 0, 0, 1, 1,
1.040244, 1.711846, 1.30519, 0, 0, 0, 1, 1,
1.042463, -0.6658719, 3.892642, 0, 0, 0, 1, 1,
1.046224, -0.5091, 3.625326, 0, 0, 0, 1, 1,
1.052389, -0.4658278, 2.264163, 1, 1, 1, 1, 1,
1.057556, -1.590472, 2.967718, 1, 1, 1, 1, 1,
1.08516, 1.869664, 0.002025311, 1, 1, 1, 1, 1,
1.096805, -0.1858586, 1.020223, 1, 1, 1, 1, 1,
1.098149, -1.496246, 2.422485, 1, 1, 1, 1, 1,
1.11111, 1.172866, -0.08920073, 1, 1, 1, 1, 1,
1.111148, 1.54375, -1.205023, 1, 1, 1, 1, 1,
1.11274, -2.318413, 3.778792, 1, 1, 1, 1, 1,
1.113615, 0.6626675, -1.778641, 1, 1, 1, 1, 1,
1.116189, -1.597441, 3.151909, 1, 1, 1, 1, 1,
1.119978, 0.8971477, 2.282181, 1, 1, 1, 1, 1,
1.130702, -2.421417, 1.5652, 1, 1, 1, 1, 1,
1.137542, -0.922842, 0.5688921, 1, 1, 1, 1, 1,
1.138638, -0.08409231, 1.992932, 1, 1, 1, 1, 1,
1.139167, 0.8264661, 0.4484961, 1, 1, 1, 1, 1,
1.144129, -0.3651181, 1.558779, 0, 0, 1, 1, 1,
1.14573, 1.047096, 2.508028, 1, 0, 0, 1, 1,
1.154563, -0.2035358, 2.269782, 1, 0, 0, 1, 1,
1.167173, 1.287803, 1.799, 1, 0, 0, 1, 1,
1.167953, 0.1372921, 1.754255, 1, 0, 0, 1, 1,
1.168708, 1.183312, -0.3394885, 1, 0, 0, 1, 1,
1.169772, -0.4718889, 2.476238, 0, 0, 0, 1, 1,
1.170129, -0.2185951, 2.604274, 0, 0, 0, 1, 1,
1.173015, 0.3617487, 2.272483, 0, 0, 0, 1, 1,
1.177513, -0.5602417, 2.239873, 0, 0, 0, 1, 1,
1.178363, 0.8867084, -0.6063735, 0, 0, 0, 1, 1,
1.18636, -1.332504, 1.725272, 0, 0, 0, 1, 1,
1.190465, 1.494106, 0.194322, 0, 0, 0, 1, 1,
1.197049, -0.850342, 2.173165, 1, 1, 1, 1, 1,
1.198526, -0.7464712, 2.078588, 1, 1, 1, 1, 1,
1.208012, 2.480372, 0.8045551, 1, 1, 1, 1, 1,
1.209892, -0.1969685, 2.970105, 1, 1, 1, 1, 1,
1.215888, -0.5329627, 2.155005, 1, 1, 1, 1, 1,
1.218001, -1.367893, 2.305594, 1, 1, 1, 1, 1,
1.224051, 1.037347, 0.3227491, 1, 1, 1, 1, 1,
1.22981, 0.1891048, 2.028332, 1, 1, 1, 1, 1,
1.242813, 1.050411, 2.110846, 1, 1, 1, 1, 1,
1.259816, 0.9775717, 0.6957798, 1, 1, 1, 1, 1,
1.272592, 1.472075, -0.1866622, 1, 1, 1, 1, 1,
1.277958, 0.1279768, 1.152696, 1, 1, 1, 1, 1,
1.280168, -0.1531208, -0.3246768, 1, 1, 1, 1, 1,
1.281611, 0.4807749, 1.044276, 1, 1, 1, 1, 1,
1.290874, -0.969725, 1.204516, 1, 1, 1, 1, 1,
1.294732, 0.5110036, -1.087178, 0, 0, 1, 1, 1,
1.307796, -0.8340595, 1.86501, 1, 0, 0, 1, 1,
1.307825, -0.6996054, 1.239294, 1, 0, 0, 1, 1,
1.308022, -1.710597, 3.283914, 1, 0, 0, 1, 1,
1.312197, -0.2984177, 0.5749828, 1, 0, 0, 1, 1,
1.316465, 0.1844204, 2.362829, 1, 0, 0, 1, 1,
1.31887, 2.626153, 1.787272, 0, 0, 0, 1, 1,
1.322138, -0.04375096, 4.572431, 0, 0, 0, 1, 1,
1.325173, -0.2017006, 2.862473, 0, 0, 0, 1, 1,
1.334438, -0.001226334, 0.2597331, 0, 0, 0, 1, 1,
1.335895, 0.04397728, 2.599353, 0, 0, 0, 1, 1,
1.337025, 1.141193, 0.963039, 0, 0, 0, 1, 1,
1.339447, -2.011207, 2.721176, 0, 0, 0, 1, 1,
1.350185, -0.8365951, 2.028669, 1, 1, 1, 1, 1,
1.356017, 0.6412188, 1.578248, 1, 1, 1, 1, 1,
1.356764, 1.210622, 0.4496989, 1, 1, 1, 1, 1,
1.377234, 0.04620485, 2.391014, 1, 1, 1, 1, 1,
1.378841, 1.223941, 0.3752808, 1, 1, 1, 1, 1,
1.38022, 0.5517601, 1.359707, 1, 1, 1, 1, 1,
1.385981, 0.9590343, 1.94086, 1, 1, 1, 1, 1,
1.39287, -0.3914983, 1.970984, 1, 1, 1, 1, 1,
1.400384, -0.253471, 2.132867, 1, 1, 1, 1, 1,
1.409179, 0.2237475, 0.7181622, 1, 1, 1, 1, 1,
1.413358, -0.4505686, -0.2762392, 1, 1, 1, 1, 1,
1.421939, -1.332502, 2.947283, 1, 1, 1, 1, 1,
1.441442, 0.8639066, 1.663062, 1, 1, 1, 1, 1,
1.454534, -0.7078042, 1.156401, 1, 1, 1, 1, 1,
1.459051, 0.350432, 1.866501, 1, 1, 1, 1, 1,
1.462155, -0.3249436, 1.847957, 0, 0, 1, 1, 1,
1.469272, -1.378505, 1.697769, 1, 0, 0, 1, 1,
1.469522, 0.6214696, 2.522448, 1, 0, 0, 1, 1,
1.473534, 0.5745645, -0.4926157, 1, 0, 0, 1, 1,
1.501429, -2.224829, 2.979201, 1, 0, 0, 1, 1,
1.509838, 0.5131918, 1.369946, 1, 0, 0, 1, 1,
1.511189, 0.2615427, 3.00863, 0, 0, 0, 1, 1,
1.518987, 0.6537816, -0.3360462, 0, 0, 0, 1, 1,
1.525961, 0.02336047, 1.342655, 0, 0, 0, 1, 1,
1.526304, 0.2136252, -0.06725796, 0, 0, 0, 1, 1,
1.529128, 0.02440093, 1.30915, 0, 0, 0, 1, 1,
1.541667, -0.7411786, 3.196137, 0, 0, 0, 1, 1,
1.541732, 0.5144932, 1.481566, 0, 0, 0, 1, 1,
1.545965, -1.42683, 1.947266, 1, 1, 1, 1, 1,
1.54812, -0.4099623, 1.887365, 1, 1, 1, 1, 1,
1.557807, 1.31537, -0.4451928, 1, 1, 1, 1, 1,
1.569368, 0.06665267, 1.736662, 1, 1, 1, 1, 1,
1.571631, 0.3467354, 2.550115, 1, 1, 1, 1, 1,
1.587912, 1.180303, 1.898368, 1, 1, 1, 1, 1,
1.594921, -0.04480883, 1.445089, 1, 1, 1, 1, 1,
1.596839, 1.344688, -0.5070902, 1, 1, 1, 1, 1,
1.599487, 0.7675273, 2.053666, 1, 1, 1, 1, 1,
1.606805, 0.08756533, 3.036717, 1, 1, 1, 1, 1,
1.607275, 0.9616777, 0.6767835, 1, 1, 1, 1, 1,
1.617197, 2.163969, 1.578846, 1, 1, 1, 1, 1,
1.629186, -0.3166972, 2.335381, 1, 1, 1, 1, 1,
1.648263, -0.621491, 2.248834, 1, 1, 1, 1, 1,
1.65612, -0.1263291, 0.1388475, 1, 1, 1, 1, 1,
1.656506, 0.1845818, 1.247954, 0, 0, 1, 1, 1,
1.659353, -0.439971, 1.445835, 1, 0, 0, 1, 1,
1.661613, 0.8707553, 1.911806, 1, 0, 0, 1, 1,
1.662315, -0.769209, 2.70809, 1, 0, 0, 1, 1,
1.667327, -0.1338892, 2.113436, 1, 0, 0, 1, 1,
1.694875, -0.7234744, 2.530916, 1, 0, 0, 1, 1,
1.697544, -1.699936, 2.059777, 0, 0, 0, 1, 1,
1.73431, 0.8678237, 1.572469, 0, 0, 0, 1, 1,
1.741411, 1.972694, 2.49832, 0, 0, 0, 1, 1,
1.7511, -0.1764915, 0.8876459, 0, 0, 0, 1, 1,
1.776882, 0.07565062, -0.1094571, 0, 0, 0, 1, 1,
1.78083, 0.324255, 0.312972, 0, 0, 0, 1, 1,
1.79985, 0.6360456, -0.1532881, 0, 0, 0, 1, 1,
1.811499, 2.781148, 0.3177538, 1, 1, 1, 1, 1,
1.821236, 0.03144228, 2.209219, 1, 1, 1, 1, 1,
1.862948, -0.5523556, 2.051412, 1, 1, 1, 1, 1,
1.866728, -1.481537, 3.940576, 1, 1, 1, 1, 1,
1.873026, -0.1985631, 1.78819, 1, 1, 1, 1, 1,
1.876843, 0.01897425, 2.625232, 1, 1, 1, 1, 1,
1.891001, 1.149921, 2.727084, 1, 1, 1, 1, 1,
1.918352, -0.9762568, 2.789868, 1, 1, 1, 1, 1,
1.919878, -1.243797, 3.957328, 1, 1, 1, 1, 1,
1.92395, -1.869354, 1.371832, 1, 1, 1, 1, 1,
1.954309, -0.3227703, 2.691818, 1, 1, 1, 1, 1,
1.967116, 0.1272164, 3.054207, 1, 1, 1, 1, 1,
1.992355, 1.383263, 0.1799606, 1, 1, 1, 1, 1,
2.025361, 0.1333815, 1.003758, 1, 1, 1, 1, 1,
2.060405, -1.237641, 1.828056, 1, 1, 1, 1, 1,
2.075217, 0.5469945, 1.266082, 0, 0, 1, 1, 1,
2.077789, -0.5695181, -0.1990948, 1, 0, 0, 1, 1,
2.081828, 0.9058025, 0.004764698, 1, 0, 0, 1, 1,
2.105044, -0.9734938, 4.593427, 1, 0, 0, 1, 1,
2.110988, 0.2176096, 2.860284, 1, 0, 0, 1, 1,
2.148345, -0.4921168, 1.185505, 1, 0, 0, 1, 1,
2.165129, 0.09321445, 0.9980007, 0, 0, 0, 1, 1,
2.169936, 0.8580301, 0.1814641, 0, 0, 0, 1, 1,
2.211521, 0.7880207, 1.346295, 0, 0, 0, 1, 1,
2.230636, 0.04950646, 1.061463, 0, 0, 0, 1, 1,
2.23351, 0.007707985, 1.739288, 0, 0, 0, 1, 1,
2.280725, -0.8383997, 1.759612, 0, 0, 0, 1, 1,
2.299262, -0.7453246, 2.207379, 0, 0, 0, 1, 1,
2.366883, 0.1538933, 2.309436, 1, 1, 1, 1, 1,
2.371958, 0.2978677, 0.7367106, 1, 1, 1, 1, 1,
2.431998, 0.1531373, -0.9316236, 1, 1, 1, 1, 1,
2.467751, -1.72472, 3.729402, 1, 1, 1, 1, 1,
2.505301, -1.459178, 0.8758507, 1, 1, 1, 1, 1,
2.770914, -0.1629214, 1.507173, 1, 1, 1, 1, 1,
3.174617, -1.073168, 2.167928, 1, 1, 1, 1, 1
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
var radius = 9.271929;
var distance = 32.56726;
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
mvMatrix.translate( -0.1425132, 0.1285858, -0.07163668 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.56726);
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
